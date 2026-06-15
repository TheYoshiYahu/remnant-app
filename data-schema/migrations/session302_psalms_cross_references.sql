-- =====================================================================
-- Session 302 — Psalms FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session302_psalms_cross_references.sql
-- =====================================================================

\echo 'session302 — Psalms cross-references starting...'
BEGIN;

-- ----- fragment: minion_psalms_1.sql (Psalm 1) -----
-- Chapter: Psalm 1 — THE GATEWAY PSALM, THE TWO WAYS (the doorway of the whole Psalter): *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful. But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (1:1-2) — the blessed man is the Torah-meditator, NOT the lawless. *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (1:3). *The ungodly are not so: but are like the chaff which the wind driveth away* (1:4). *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (1:6) — the TWO WAYS, the seed-war read by conduct, not ethnicity.
-- Tag: ps001   Temp view: _s302_ps001_lookup
-- Sort band: base 22000, step 3 -> threads at 22000, 22003, 22006, 22009 (4 threads)
-- Source of EVERY row: 'canon','psalms',1,v
--
-- Psalm 1 coverage:
--   ★★ v.1-2 (Blessed is the man that walketh not in the counsel of the ungodly... But his delight is in the law of Yahuah; and in his law doth he meditate day and night)
--        NT:     none warranted distinct (the Torah-delight keystone is carried laterally by Psalm 119 and forward only diffusely; the NT "blessed" forward-weave belongs to the tree/two-ways threads — not forced here)
--        Extras: Sirach 39:1 (he that gives his mind to the law of the Most High, and is occupied in the meditation thereof) — THREAD 1 (the meditator on the Law of the Most High)
--        Tanakh: ★ Psalm 119:1 (Blessed are the undefiled in the way, who walk in the law of Yahuah); Psalm 119:97 (O how love I thy law! it is my meditation all the day) — THREAD 1 (load-bearing: the Torah-delight refrain that the whole Psalter sings; Red Line #6)
--   ★★ v.3 (he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither)
--        NT:     Revelation 22:2 (the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations) — THREAD 2 (the tree by the river of life consummated)
--        Extras: none warranted distinct (the tree-by-water image is carried fully by the Tanakh laterals Jeremiah/Ezekiel and forward by Revelation; no clean extras witness closer)
--        Tanakh: ★ Jeremiah 17:7-8 (Blessed is the man that trusteth in Yahuah... he shall be as a tree planted by the waters... her leaf shall be green... neither shall cease from yielding fruit); Ezekiel 47:12 (shall grow all trees for meat, whose leaf shall not fade... because their waters they issued out of the sanctuary) — THREAD 2 (load-bearing: the trusting man as the watered tree; the trees by the sanctuary river)
--   ★ v.4-5 (The ungodly are not so: but are like the chaff which the wind driveth away. Therefore the ungodly shall not stand in the judgment)
--        NT:     Matthew 3:12 (he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire) — THREAD 3 (the judgment-winnowing: wheat and chaff)
--        Extras: none warranted distinct (the winnowing-chaff image is carried by the Matthew forward-weave; no clean extras witness warranted)
--        Tanakh: none warranted distinct (the chaff figure is the wicked's portion carried forward to the floor-purging at THREAD 3; no closer Tanakh lateral than the threshing-floor language belonging to its own context)
--   ★★ v.6 (For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish)
--        NT:     Matthew 7:13-14 (wide is the gate, and broad is the way, that leadeth to destruction... strait is the gate, and narrow is the way, which leadeth unto life) — THREAD 4 (the two gates / two ways)
--        Extras: none warranted distinct (the two-ways doctrine is carried by Deuteronomy 30 and Matthew 7; Sirach 15:1/19:20 weighed for THREAD 1 instead)
--        Tanakh: ★ Deuteronomy 30:15,19 (See, I have set before thee this day life and good, and death and evil... therefore choose life) — THREAD 4 (load-bearing: the two ways set before the covenant people; life and death by conduct, not lineage alone)
--
-- Threads (slug — target libraries):
--   1. psalm-1-blessed-is-the-man-his-delight-is-in-the-law — Tanakh (Psalm 119) + Extras (Sirach) [extras] (★★ Torah-as-delight keystone; the meditator blessed, not the lawless)
--   2. psalm-1-a-tree-planted-by-the-rivers-of-water — Tanakh (Jeremiah, Ezekiel) + NT (Revelation) [free] (★★ the watered tree bearing fruit; trust in Yahuah; the river of life)
--   3. psalm-1-the-chaff-the-wind-driveth-away — NT (Matthew) [free] (the judgment-winnowing: wheat and chaff)
--   4. psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous — Tanakh (Deuteronomy) + NT (Matthew) [free] (★★ the two ways; life and death set before them; the seed-war by conduct)
--
-- Framing notes:
--   ★★ TORAH-AS-DELIGHT KEYSTONE (THREAD 1): *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (1:2). This is the gate of the whole Psalter, and the framework (Red Line #6: Torah is the inheritance, never the curse; 1 John 2:3-4 the filter) reads the blessed man as the Torah-MEDITATOR, never the lawless. Psalm 119 sings the same delight entire — *Blessed are the undefiled in the way, who walk in the law of Yahuah* (119:1), *O how love I thy law! it is my meditation all the day* (119:97). The restored witness keeps it: *he that gives his mind to the law of the Most High, and is occupied in the meditation thereof* (Sirach 39:1). The Law is the delight, not the burden; the meditation is the blessing, not bondage.
--   ★★ THE WATERED TREE (THREAD 2): *he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (1:3). Jeremiah names the man so planted as the one who TRUSTS: *Blessed is the man that trusteth in Yahuah... he shall be as a tree planted by the waters... her leaf shall be green... neither shall cease from yielding fruit* (Jeremiah 17:7-8). Ezekiel sees the trees by the sanctuary river — *whose leaf shall not fade, neither shall the fruit thereof be consumed... because their waters they issued out of the sanctuary* (Ezekiel 47:12) — and Revelation brings it to consummation in *the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The Torah-delighting man is the tree by the living water, fruitful and unwithering.
--   ★ THE CHAFF (THREAD 3): *The ungodly are not so: but are like the chaff which the wind driveth away* (1:4). The wicked have no root, no water, no fruit — only the wind. Yochanan (John) names the winnowing the chaff is driven toward: *he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). The judgment separates wheat from chaff; the rootless are blown away from the congregation of the righteous (1:5).
--   ★★ THE TWO WAYS (THREAD 4): *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (1:6). This is the seed-war read by CONDUCT — two ways, two ends, never two ethnicities. Moshe (Moses) set the same two ways before the covenant people: *I have set before thee this day life and good, and death and evil... therefore choose life* (Deuteronomy 30:15,19). And Yahusha (Jesus) names the two gates: *wide is the gate, and broad is the way, that leadeth to destruction... strait is the gate, and narrow is the way, which leadeth unto life* (Matthew 7:13-14). Two ways are set before every man; Yahuah knows the one and the other perishes.
--   EXTRAS: Sirach 39:1 (clean parse) carries the meditator on the Law of the Most High — a fit witness for the Torah-delight thread; Sirach DOUBLE-WRITTEN edition 'apocrypha' + book 'ecclesiasticus'. Sirach 15:1 and 19:20 (the fear of Yahuah and the performance of the law) weighed but not forced. No Jubilees/Jasher/Enoch witness warranted for a wisdom-poem opening the Psalter.
--   VERSES WITH NO STANDALONE THREAD: v.5 (Therefore the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous) is carried within THREAD 3 (the chaff blown from the floor = blown from the congregation) and THREAD 4 (the way that perishes) rather than given its own thread.

CREATE TEMP VIEW _s302_ps001_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Blessed is the man — his delight is in the law (the Torah-delight keystone)
    ('canon','psalms',1,2,'canon','psalms',119,1,'free',
      E'*Blessed are the undefiled in the way, who walk in the law of Yahuah (LORD)* (Psalm 119:1). The gate of the Psalter — *Blessed is the man... his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2) — is sung again at the head of the great Torah-psalm: the blessed are *the undefiled in the way, who walk in the law of Yahuah*. The blessing and the walking-in-the-law are one thing; the delight of Psalm 1 is the walk of Psalm 119.'),
    ('canon','psalms',1,2,'canon','psalms',119,97,'free',
      E'*O how love I thy law! it is my meditation all the day* (Psalm 119:97). The *meditate day and night* of *in his law doth he meditate day and night* (Psalm 1:2) is the very cry of the psalmist who loves the law — *O how love I thy law! it is my meditation all the day*. The Torah is not the burden the blessed man bears but the delight he meditates upon without ceasing; love of the law IS the meditation.'),
    ('canon','psalms',1,2,'apocrypha','ecclesiasticus',39,1,'extras',
      E'*But he that gives his mind to the law of the Most High, and is occupied in the meditation thereof, will seek out the wisdom of all the ancient, and be occupied in prophecies* (Sirach 39:1). The restored witness keeps the same blessed posture as *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2): the man who *gives his mind to the law of the Most High, and is occupied in the meditation thereof*. The meditation on the Law is the path of wisdom, not a yoke laid aside.'),

    -- THREAD 2: A tree planted by the rivers of water (the watered tree; trust in Yahuah; the river of life)
    ('canon','psalms',1,3,'canon','jeremiah',17,7,'free',
      E'*Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is* (Jeremiah 17:7). Jeremiah names WHO the watered tree of *he shall be like a tree planted by the rivers of water* (Psalm 1:3) is: *Blessed is the man that trusteth in Yahuah*. The same blessing opens both — the man rooted by the water is the man whose hope is Yahuah Himself, not flesh nor the counsel of the ungodly.'),
    ('canon','psalms',1,3,'canon','jeremiah',17,8,'free',
      E'*For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river, and shall not see when heat cometh, but her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit* (Jeremiah 17:8). This is *a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3) carried whole: the trusting man *as a tree planted by the waters... her leaf shall be green... neither shall cease from yielding fruit*. Rooted by the river, he does not fear the drought; the fruit comes in every season.'),
    ('canon','psalms',1,3,'canon','ezekiel',47,12,'free',
      E'*And by the river upon the bank thereof, on this side and on that side, shall grow all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed: it shall bring forth new fruit according to his months, because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12). The single tree by the water of *his leaf also shall not wither* (Psalm 1:3) becomes a whole grove by the sanctuary river — *whose leaf shall not fade, neither shall the fruit thereof be consumed... because their waters they issued out of the sanctuary*. The source of the unwithering life is the water from Yahuah''s house.'),
    ('canon','psalms',1,3,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The tree by the rivers of water — *that bringeth forth his fruit in his season; his leaf also shall not wither* (Psalm 1:3) — is brought to its consummation as *the tree of life... and the leaves of the tree were for the healing of the nations*. The fruit in season and the unwithering leaf of the blessed man foreshadow the tree of life by the river of the throne.'),

    -- THREAD 3: The chaff the wind driveth away (the judgment-winnowing)
    ('canon','psalms',1,4,'canon','matthew',3,12,'free',
      E'*Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). The wicked of *the ungodly... are like the chaff which the wind driveth away* (Psalm 1:4) are the chaff of the threshing-floor: *he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff*. The rootless, fruitless, waterless ungodly are winnowed from the wheat — driven away by the wind, burned in the judgment.'),

    -- THREAD 4: The two ways — Yahuah knoweth the way of the righteous (life and death set before them)
    ('canon','psalms',1,6,'canon','deuteronomy',30,15,'free',
      E'*See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). The two ways of *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) are the two Moshe (Moses) set before the covenant people: *life and good, and death and evil*. The psalm opens the Psalter on the same fork the Torah set in the plains of Moab — two ways, two ends, the choosing put before every man.'),
    ('canon','psalms',1,6,'canon','deuteronomy',30,19,'free',
      E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The way that lives and the way that perishes of Psalm 1:6 is the very charge — *I have set before you life and death, blessing and cursing: therefore choose life*. The righteous walk the way Yahuah knows; the ungodly the way that perishes; and the call is to *choose life, that both thou and thy seed may live* — the way of the covenant, by conduct, that the seed may live.'),
    ('canon','psalms',1,6,'canon','matthew',7,13,'free',
      E'*Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13). Yahusha (Jesus) names the two ways of *the way of the ungodly shall perish* (Psalm 1:6) as two gates: *wide is the gate, and broad is the way, that leadeth to destruction*. The broad way of the many is the way that perishes; the strait gate is the way Yahuah knows. The gateway psalm and the Sermon set the same fork before the hearer.'),
    ('canon','psalms',1,6,'canon','matthew',7,14,'free',
      E'*Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). The way of the righteous that *Yahuah (LORD) knoweth* (Psalm 1:6) is the narrow way: *strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it*. The few who walk it are the blessed man of verse one who walks not in the counsel of the ungodly; the way to life is known and narrow, the way that perishes broad.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps001_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps001_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-1-blessed-is-the-man-his-delight-is-in-the-law',
       E'Blessed is the man — his delight is in the law of Yahuah',
       E'The whole Psalter opens on a blessing, and the blessing is for the man of the Torah: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful. But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2). The blessed man is not the lawless but the meditator — the Law is his delight, the thing he turns over *day and night*. This is the gate of the framework: the Torah is the covenant inheritance, never the curse; the new heart is the Torah written within, not the Torah set aside. The great Torah-psalm sings the same blessing at its own head — *Blessed are the undefiled in the way, who walk in the law of Yahuah (LORD)* (Psalm 119:1) — and pours out the delight without bound: *O how love I thy law! it is my meditation all the day* (Psalm 119:97). The blessing and the walking-in-the-law are one; the meditation is the love, not the burden. The restored witness keeps the same posture: *he that gives his mind to the law of the Most High, and is occupied in the meditation thereof, will seek out the wisdom of all the ancient* (Sirach 39:1) — the meditation on the Law of the Most High is the very path of wisdom. From the first word of the Psalter, blessedness is bound to delight in the Law, never to its abandonment.',
       sv.verse_id, ev.verse_id, 'extras', 22000
  FROM _s302_ps001_lookup sv, _s302_ps001_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-1-a-tree-planted-by-the-rivers-of-water',
       E'A tree planted by the rivers of water — the fruitful, unwithering man',
       E'The blessed man is given a figure that runs the whole length of the canon: *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper* (Psalm 1:3). Rooted by the water, fruitful in season, the leaf never withering. Jeremiah names exactly who this tree is — the man of trust: *Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is* (Jeremiah 17:7), *For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river... her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit* (Jeremiah 17:8). The one rooted by the river does not fear the drought. Ezekiel sees the single tree become a grove by the sanctuary river — *all trees for meat, whose leaf shall not fade, neither shall the fruit thereof be consumed... because their waters they issued out of the sanctuary: and the fruit thereof shall be for meat, and the leaf thereof for medicine* (Ezekiel 47:12). The source of the unwithering life is the water from Yahuah''s own house. And the figure comes to its consummation at the end of all things: *In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The fruit in season and the leaf that does not wither, first sung of the Torah-delighting man, opens at last into the tree of life by the river of the throne.',
       sv.verse_id, ev.verse_id, 'free', 22003
  FROM _s302_ps001_lookup sv, _s302_ps001_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-1-the-chaff-the-wind-driveth-away',
       E'The chaff the wind driveth away — the judgment-winnowing',
       E'Against the watered tree stands its opposite, rootless and weightless: *The ungodly are not so: but are like the chaff which the wind driveth away. Therefore the ungodly shall not stand in the judgment, nor sinners in the congregation of the righteous* (Psalm 1:4-5). The wicked have no root, no water, no fruit — only the husk that the wind takes. Yochanan (John) the Immerser names the winnowing the chaff is driven toward: *Whose fan is in his hand, and he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12). The threshing-floor is purged: the wheat gathered, the chaff burned. The ungodly who *shall not stand in the judgment, nor sinners in the congregation of the righteous* are the chaff blown from the floor — separated from the wheat, driven from the gathering of the righteous, given to the fire. The two destinies of the psalm are the two heaps of the threshing-floor.',
       sv.verse_id, ev.verse_id, 'free', 22006
  FROM _s302_ps001_lookup sv, _s302_ps001_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous',
       E'The two ways — Yahuah knoweth the way of the righteous',
       E'The psalm closes on the fork that opens the whole Psalter: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Two ways, two ends — the one known and kept by Yahuah, the other perishing. This is the seed-war read by conduct, never by ethnicity: not two bloodlines set against each other, but two walks set before every man. Moshe (Moses) set the same two ways before the covenant people in the plains of Moab: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The choosing is the covenant''s own demand — *choose life, that both thou and thy seed may live*. And Yahusha (Jesus) sets the identical fork at the close of the Sermon: *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13); *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). The broad way of the many is the way that perishes; the narrow way is the way Yahuah knows — the way of the blessed man who walks not in the counsel of the ungodly. From Torah to Psalter to Sermon, the two ways are set before every hearer, and the call is to walk the one that lives.',
       sv.verse_id, ev.verse_id, 'free', 22009
  FROM _s302_ps001_lookup sv, _s302_ps001_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Blessed are the undefiled in the way, who walk in the law of Yahuah (LORD)* (Psalm 119:1) — the Torah-blessing of 1:1-2 sung again at the head of the great Torah-psalm; the blessing and the walk are one.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-blessed-is-the-man-his-delight-is-in-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*O how love I thy law! it is my meditation all the day* (Psalm 119:97) — the *meditate day and night* of 1:2 is the cry of love for the law; the meditation IS the delight.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=97
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-blessed-is-the-man-his-delight-is-in-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he that gives his mind to the law of the Most High, and is occupied in the meditation thereof* (Sirach 39:1) — the restored witness keeps the blessed posture of 1:2; meditation on the Law is the path of wisdom, not a yoke laid aside.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=39 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-blessed-is-the-man-his-delight-is-in-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is* (Jeremiah 17:7) — Jeremiah names the watered tree of 1:3 as the man of trust; the same blessing opens both.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-a-tree-planted-by-the-rivers-of-water'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall be as a tree planted by the waters... her leaf shall be green... neither shall cease from yielding fruit* (Jeremiah 17:8) — the tree of 1:3 carried whole; rooted by the river, he fears not the drought.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-a-tree-planted-by-the-rivers-of-water'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all trees for meat, whose leaf shall not fade... because their waters they issued out of the sanctuary* (Ezekiel 47:12) — the single tree of 1:3 becomes a grove by the sanctuary river; the unwithering life is fed from Yahuah''s house.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-a-tree-planted-by-the-rivers-of-water'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the tree of life, which bare twelve manner of fruits... and the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the fruit-in-season, unwithering leaf of 1:3 brought to its consummation: the tree of life by the river of the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-a-tree-planted-by-the-rivers-of-water'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he will throughly purge his floor, and gather his wheat into the garner; but he will burn up the chaff with unquenchable fire* (Matthew 3:12) — the chaff of 1:4 winnowed at the judgment; the rootless ungodly blown from the floor and given to the fire.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-the-chaff-the-wind-driveth-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15) — the two ways of 1:6 set before the covenant people in the plains of Moab; the fork the psalm opens the Psalter upon.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19) — the way that lives and the way that perishes of 1:6; the choosing is the covenant''s demand, that the seed may live.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat* (Matthew 7:13) — the way of the ungodly that perishes (1:6) named as the broad gate of the many.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14) — the way of the righteous that Yahuah knoweth (1:6) named as the narrow gate to life; the few are the blessed man of verse one.'
  FROM cross_reference_threads t
  JOIN _s302_ps001_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s302_ps001_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-1-the-two-ways-yahuah-knoweth-the-way-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_2.sql (Psalm 2) -----
-- Chapter: Psalm 2 — THE KEYSTONE MESSIANIC ROYAL PSALM (the most-quoted-in-the-NT royal psalm): the heathen rage and the kings of the earth set themselves against Yahuah and against his anointed (Messiah); He that sitteth in the heavens shall laugh; "Yet have I set my king upon my holy hill of Zion"; the decree — "Thou art my Son; this day have I begotten thee"; "Ask of me, and I shall give thee the heathen for thine inheritance"; "Thou shalt break them with a rod of iron"; the kings warned — "Serve Yahuah with fear... Kiss the Son, lest he be angry... Blessed are all they that put their trust in him."
-- Tag: ps002   Temp view: _s302_ps002_lookup
-- Sort band: base 22025, step 3 -> threads at 22025, 22028, 22031, 22034, 22037, 22040 (6 threads)
-- Source of EVERY row: 'canon','psalms',2,v
--
-- Psalm 2 coverage:
--   ★ v.1-3 (Why do the heathen rage... The kings of the earth set themselves, and the rulers take counsel together, against Yahuah, and against his anointed... Let us break their bands asunder)
--        NT:     Acts 4:25-27 (Why did the heathen rage... The kings of the earth stood up... against Yahuah, and against his Messiah... against thy holy child Yahusha, whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar'el) — THREAD 1 (load-bearing: the raging nations fulfilled at the cross)
--        Extras: 1 Enoch 48:8 (In these days shall the kings and the mighty who possess the earth implore Him); 1 Enoch 62:9-10 (he shall put down the kings from their thrones) — woven at THREAD 4 (the kings dismayed before the Chosen One), not here (apocalyptic outcome belongs to the inheritance/judgment movement)
--        Tanakh: none warranted distinct (the raging-kings movement is carried FORWARD by Acts; Psalm 110:5-6 the day-of-wrath sits at THREAD 2)
--   ★ v.4-5 (He that sitteth in the heavens shall laugh... Then shall he speak unto them in his wrath)
--        NT:     none warranted distinct (the derision/wrath is carried by THREAD 1's Acts frame and THREAD 4's judgment)
--        Extras: none warranted distinct here
--        Tanakh: none warranted distinct (held within THREAD 1)
--   ★ v.6 (Yet have I set my king upon my holy hill of Zion)
--        NT:     Hebrews 12:22 (ye are come unto mount Sion... the city of the living Elohim, the heavenly Jerusalem) — THREAD 2 (the enthronement on Zion fulfilled)
--        Extras: none warranted distinct (the Zion-enthronement is canon-carried; no clean extras add)
--        Tanakh: ★ Psalm 110:1-2 (Yahuah said unto my Lord, Sit thou at my right hand... the rod of thy strength out of Zion); Isaiah 2:3 (out of Zion shall go forth the law); Micah 4:7 (Yahuah shall reign over them in mount Zion) — THREAD 2 (the King set on Zion, the law from Zion, the reign in Zion)
--   ★★ v.7 (I will declare the decree: Yahuah hath said unto me, Thou art my Son; this day have I begotten thee)
--        NT:     Acts 13:33 (raised up Yahusha again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee); Hebrews 1:5 (unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee?); Hebrews 5:5 (Messiah glorified not himself to be made an high priest; but he that said, Thou art my Son, to day have I begotten thee) — THREAD 3 (★★ THE BEGOTTEN SON — Formed-and-Formless, Red Line #4)
--        Extras: 1 Enoch 48:3,6 (before the sun and the signs were created... His name was named before Yahuah of Spirits... chosen and hidden before Him, Before the creation of the world) — THREAD 3 (the eternally-Formed Son named before creation, enthroned in the decree)
--        Tanakh: none warranted distinct (the Sonship decree is the keystone the NT quotes by name; the Davidic-king frame is at THREAD 2)
--   ★ v.8 (Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession)
--        NT:     Revelation 11:15 (The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah; and he shall reign for ever and ever) — THREAD 4 (the nations given to the Son)
--        Extras: 1 Enoch 62:1,6 (named the Elect One, And seated him on the throne of His glory); 1 Enoch 62:9-10 (this Son of Adam... shall raise up the kings and the mighty from their seats... put down the kings from their thrones); 1 Enoch 48:8 (the kings and the mighty... implore Him) — THREAD 4 (★ the Chosen One enthroned, the kings dismayed before him)
--        Tanakh: ★ Daniel 7:14 (there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him); Psalm 72:8,11 (He shall have dominion also from sea to sea... all nations shall serve him) — THREAD 4 (dominion given to the Son of Adam; all nations serve the King)
--   ★★ v.9 (Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter's vessel)
--        NT:     Revelation 2:27 (he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers); Revelation 12:5 (a man child, who was to rule all nations with a rod of iron); Revelation 19:15 (out of his mouth goeth a sharp sword... and he shall rule them with a rod of iron) — THREAD 5 (★★ the rod of iron — the man child to rule the nations)
--        Extras: 1 Enoch 62:9 carried at THREAD 4 (break the teeth of the sinners) — not duplicated here
--        Tanakh: none warranted distinct (the rod-of-iron is quoted forward verbatim by Revelation)
--   ★ v.10-11 (Be wise now therefore, O ye kings... Serve Yahuah with fear, and rejoice with trembling)
--        NT:     none warranted distinct (the serve-Yahuah-with-the-Son honor is carried into THREAD 6's trust antithesis)
--        Extras: none warranted distinct
--        Tanakh: none warranted distinct (held within THREAD 6 — the Formed and the Formless served together)
--   ★★ v.12 (Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him)
--        NT:     John 3:36 (He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of Elohim abideth on him) — THREAD 6 (★★ trust in the Son = the blessing; the wrath/trust antithesis)
--        Extras: none warranted distinct (the trust-or-perish is canon-carried)
--        Tanakh: none warranted distinct (held within THREAD 6)
--
-- Threads (slug — target libraries):
--   1. psalm-2-why-do-the-heathen-rage-the-kings-against-his-anointed — NT (Acts) [free] (★ the raging nations vs Yahuah's Messiah, fulfilled at the cross)
--   2. psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion — NT (Hebrews) + Tanakh (Psalm 110, Isaiah 2, Micah 4) [free] (the enthronement on Zion; the King set, not voted)
--   3. psalm-2-thou-art-my-son-this-day-have-i-begotten-thee — NT (Acts, Hebrews) + Extras (1 Enoch) [extras] (★★ THE BEGOTTEN SON — Formed-and-Formless)
--   4. psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance — NT (Revelation) + Tanakh (Daniel 7, Psalm 72) + Extras (1 Enoch) [extras] (★ the nations gathered to the Son; the Chosen One enthroned, the kings dismayed)
--   5. psalm-2-thou-shalt-break-them-with-a-rod-of-iron — NT (Revelation) [free] (★★ the rod of iron — the man child to rule the nations)
--   6. psalm-2-kiss-the-son-blessed-are-all-they-that-put-their-trust-in-him — NT (John) [free] (★★ trust in the Son = the blessing; the Formed and the Formless served together)
--
-- Framing notes:
--   ★ THE RAGING NATIONS (THREAD 1): *Why do the heathen rage... The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (2:1-2). Acts 4:25-27 names the fulfillment outright, quoting this psalm and then identifying the kings: *against thy holy child Yahusha (Jesus), whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar'el (Israel), were gathered together*. The raging is conduct against the Anointed, never against a people — VICTIMS-NOT-ENEMIES holds: Herod and Pilate and the gathered rulers are the system arrayed against the Messiah, and the very gathering only does *whatsoever thy hand and thy counsel determined before to be done* (Acts 4:28).
--   ★★ THE BEGOTTEN SON — FORMED-AND-FORMLESS (THREAD 3, KEYSTONE): *Thou art my Son; this day have I begotten thee* (2:7). This is the most-quoted royal-psalm verse in all the NT. Framed STRICTLY through Red Line #4: the begotten Son is the FORMED Son drawn from the Formless Father — He IS Yahuah and HAS a Father. NO co-equal-persons trinitarian grammar; NO modalist collapse. Acts 13:33 ties the *this day* to the resurrection-enthronement: *he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee*. Hebrews 1:5 sets the Son above every angel by this decree; Hebrews 5:5 grounds His priesthood in it. The *this day* is the decree/declaration of the eternally-Formed Son enthroned — 1 Enoch 48:3,6 keeps the same eternal naming: *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits... chosen and hidden before Him, Before the creation of the world* — the Son named before creation, declared in time.
--   v.11/v.12 (THREAD 6): *Serve Yahuah (LORD) with fear* (2:11) AND *Kiss the Son* (2:12) stand together — the Formed and the Formless honored in one breath without collapsing them. *Blessed are all they that put their trust in him* (2:12) is the blessing; John 3:36 sets the wrath/trust antithesis: *He that believeth on the Son hath everlasting life... but the wrath of Elohim (God) abideth on him*. Trust in the Son IS the blessing — never trust set against the commandments (1 John 2:3-4 filter holds the whole psalm: to honor the King is to keep His word).
--   EXTRAS: 1 Enoch 48 and 62 (the Parables) carry the Chosen One / Son of Adam enthroned: *named the Elect One, And seated him on the throne of His glory* (62:1,6), the kings dismayed before him (48:8; 62:9-10), and named *before the creation of the world* (48:6). Clean parse under edition 'enoch'/book '1-enoch'. AVOIDED as a member: 1 Enoch 62:5 (carries a "(Note: ...)" Charles-apparatus parenthetical inside the verse) — used 62:1, 62:6, 62:9, 62:10 instead, all clean. NOT double-written (enoch edition slug differs from book slug 1-enoch). Psalms of Solomon: NOT in the available edition set — none warranted (recorded, not forced).
--   VERSES WITH NO ADD: v.3 (Let us break their bands asunder — the rebel speech inside the v.1-2 movement, carried by THREAD 1); v.4-5 (the derision and wrath, carried by THREAD 1 and the judgment of THREAD 4); v.10 (Be wise now therefore, O ye kings — the address that opens THREAD 6's warning). No verse left unweighed; the chapter is dense and every verse sits within a thread's prose.

CREATE TEMP VIEW _s302_ps002_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Why do the heathen rage — the kings against his anointed (fulfilled at the cross)
    ('canon','psalms',2,1,'canon','acts',4,25,'free',
      E'*Who by the mouth of thy servant David hast said, Why did the heathen rage, and the people imagine vain things?* (Acts 4:25). The gathered believers pray the second psalm back to Yahuah, quoting it by David''s mouth — *Why did the heathen rage, and the people imagine vain things?* — the very opening of *Why do the heathen rage, and the people imagine a vain thing?* (Psalm 2:1). The psalm is not a far-off poem but the word the assembly recognizes is being fulfilled in their own hour.'),
    ('canon','psalms',2,2,'canon','acts',4,26,'free',
      E'*The kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:26). This is *The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2) carried over almost word for word — the anointed of the psalm is named *his Messiah*. The kings setting themselves against Yahuah''s anointed is the same rebellion the assembly sees gathered in Jerusalem.'),
    ('canon','psalms',2,2,'canon','acts',4,27,'free',
      E'*For of a truth against thy holy child Yahusha (Jesus), whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel), were gathered together* (Acts 4:27). Here the *anointed* of *against Yahuah (LORD), and against his anointed* (Psalm 2:2) is named outright — *thy holy child Yahusha, whom thou hast anointed* — and the raging kings are named: Herod, Pilate, the nations, gathered against the Messiah. The psalm''s heathen-rage is fulfilled at the cross; the rulers array themselves against the One Yahuah set, never against a people but against His Anointed.'),

    -- THREAD 2: Yet have I set my king upon my holy hill of Zion (the King enthroned on Zion)
    ('canon','psalms',2,6,'canon','psalms',110,1,'free',
      E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The King set on Zion — *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) — is the same Lord enthroned at Yahuah''s right hand in Psalm 110, the throne not won by the rebel kings'' consent but given: *Sit thou at my right hand*. The enemies who rage in Psalm 2 are made the footstool here; the enthroned King and the subdued nations are one vision across the two royal psalms.'),
    ('canon','psalms',2,6,'canon','psalms',110,2,'free',
      E'*Yahuah (LORD) shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies* (Psalm 110:2). The holy hill of *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) is the Zion from which the King''s rule goes forth — *the rod of thy strength out of Zion: rule thou in the midst of thine enemies*. The same rod that breaks the nations in Psalm 2:9 is sent out of Zion; the King set on the hill rules from it in the midst of the very enemies who raged against him.'),
    ('canon','psalms',2,6,'canon','isaiah',2,3,'free',
      E'*And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). The King set *upon my holy hill of Zion* (Psalm 2:6) reigns from the same mountain whence *out of Zion shall go forth the law* — the Torah is not abolished from the King''s throne but flows out of it; the enthroned King and the law going forth from Zion are one rule, the nations streaming up to be taught His ways.'),
    ('canon','psalms',2,6,'canon','micah',4,7,'free',
      E'*And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7). The setting of the King *upon my holy hill of Zion* (Psalm 2:6) is the reign Micah sings — *Yahuah shall reign... in mount Zion... for ever* — and it gathers the two houses: *her that halteth* and *her that was cast far off* made one strong nation. The King on Zion reigns over the regathered, the scattered brought home under the throne set on the holy hill.'),
    ('canon','psalms',2,6,'canon','hebrews',12,22,'free',
      E'*But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels* (Hebrews 12:22). The holy hill of *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) opens to its fullness — *ye are come unto mount Sion... the city of the living Elohim, the heavenly Jerusalem*. The King set on Zion gathers His people to the very mount where He reigns; the throne on the holy hill is the city of the living Elohim, and to it the redeemed are come.'),

    -- THREAD 3 (★★): Thou art my Son; this day have I begotten thee (THE BEGOTTEN SON — Formed-and-Formless)
    ('canon','psalms',2,7,'canon','acts',13,33,'free',
      E'*Elohim (God) hath fulfilled the same unto us their children, in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:33). The decree — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — is quoted by name as *the second psalm* and tied to the resurrection-enthronement: *he hath raised up Yahusha again... Thou art my Son, this day have I begotten thee*. The *this day* is the declaration of the eternally-Formed Son enthroned — the Formed Son drawn from the Formless Father, who IS Yahuah and HAS a Father, raised up and set as King.'),
    ('canon','psalms',2,7,'canon','hebrews',1,5,'free',
      E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The decree of *Thou art my Son; this day have I begotten thee* (Psalm 2:7) is set above every angel — *unto which of the angels said he at any time, Thou art my Son*. The Son is no creature and no angel but the Formed Son begotten of the Father; *I will be to him a Father, and he shall be to me a Son* keeps the Father and the Son distinct without two co-equal persons and without collapse — He IS Yahuah and HAS a Father.'),
    ('canon','psalms',2,7,'canon','hebrews',5,5,'free',
      E'*So also Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The same decree — *Thou art my Son; this day have I begotten thee* (Psalm 2:7) — grounds the Son''s priesthood: the Son did not seize the office but was appointed by the Father who said *Thou art my Son*. The begotten Son enthroned in Psalm 2 is the priest after the order of Melek Tsadiq (Melchizedek), made high priest by the Father''s own word, not by His own glory-taking.'),
    ('canon','psalms',2,7,'enoch','1-enoch',48,3,'extras',
      E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). The decree *Thou art my Son; this day have I begotten thee* (Psalm 2:7) declares in time the Son named before time — *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits*. The *this day* of the enthronement does not begin the Son; it proclaims the eternally-Formed Son, whose name stood before the creation, now seated as King.'),
    ('canon','psalms',2,7,'enoch','1-enoch',48,6,'extras',
      E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6). The begotten Son of *Thou art my Son; this day have I begotten thee* (Psalm 2:7) is the One *chosen and hidden before Him, Before the creation of the world and for evermore* — the Formed Son drawn from the Formless, hidden before creation and revealed in the decree. The enthronement declares what was true before the world: the Son named, chosen, and now set upon the holy hill.'),

    -- THREAD 4: Ask of me, and I shall give thee the heathen for thine inheritance (the nations given to the Son)
    ('canon','psalms',2,8,'canon','daniel',7,14,'free',
      E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The word *Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:8) is answered in Daniel''s vision: to the One like the Son of Adam *was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him*. The nations asked for in the psalm are the everlasting inheritance given to the Son of Adam — the same King, the same heathen-for-inheritance.'),
    ('canon','psalms',2,8,'canon','psalms',72,11,'free',
      E'*Yea, all kings shall fall down before him: all nations shall serve him* (Psalm 72:11). The inheritance of *I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8) is the dominion of the royal son in Psalm 72 — *all kings shall fall down before him: all nations shall serve him*. The kings who raged in Psalm 2:2 fall down before the King in Psalm 72; the nations given as inheritance become the nations that serve him from sea to sea.'),
    ('canon','psalms',2,8,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The asking of *I shall give thee the heathen for thine inheritance* (Psalm 2:8) reaches its end when *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah; and he shall reign for ever and ever*. The heathen given as inheritance become the kingdoms made the Messiah''s — the possession of the uttermost parts of the earth fulfilled in the everlasting reign.'),
    ('canon','psalms',2,8,'enoch','1-enoch',62,1,'extras',
      E'*And thus Yahuah (God) of Spirits named the Elect One, And seated him on the throne of His glory, And he shall judge all the works of the holy in heaven above* (1 Enoch 62:1). The King who asks and receives the nations — *Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:8) — is the Elect One enthroned: *named the Elect One, And seated him on the throne of His glory*. The Chosen One seated on the throne of glory is the same begotten King to whom the inheritance of the nations is given.'),
    ('canon','psalms',2,8,'enoch','1-enoch',62,9,'extras',
      E'*And this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And shall loosen the reins of the strong, And break the teeth of the sinners* (1 Enoch 62:9). The inheritance of *the heathen for thine inheritance* (Psalm 2:8) carries the judgment of the raging kings: the Son of Adam *shall raise up the kings and the mighty from their seats... And break the teeth of the sinners*. The kings who set themselves against the Anointed in Psalm 2:2 are put down before the enthroned Son of Adam; the nations given as inheritance are taken from the hand of the rebel kings.'),
    ('canon','psalms',2,1,'enoch','1-enoch',48,8,'extras',
      E'*In these days shall the kings and the mighty who possess the earth implore (Him) To grant them a little respite from His angels of punishment To whom they were delivered* (1 Enoch 48:8). The raging kings of *Why do the heathen rage... The kings of the earth set themselves* (Psalm 2:1-2) come to their end here: *the kings and the mighty who possess the earth implore (Him)* — the very kings who set themselves against the Anointed are brought to implore before the enthroned Chosen One. He that sitteth in the heavens laughs (Psalm 2:4); the kings who raged are delivered to judgment.'),

    -- THREAD 5 (★★): Thou shalt break them with a rod of iron (the rod of iron, the man child to rule the nations)
    ('canon','psalms',2,9,'canon','revelation',2,27,'free',
      E'*And he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:27). The word *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9) is quoted forward almost verbatim — *rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers* — and the Son shares the rule with the overcomers: *even as I received of my Father*. The rod given to the begotten Son in the psalm is the rod He grants to those who keep His works unto the end.'),
    ('canon','psalms',2,9,'canon','revelation',12,5,'free',
      E'*And she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5). The breaking *with a rod of iron* (Psalm 2:9) names the man child of Revelation — *a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim, and to his throne*. The begotten Son of Psalm 2:7, set to break the nations with the rod, is the man child caught up to the throne, the seed of the woman of Genesis 3:15 brought to His reign.'),
    ('canon','psalms',2,9,'canon','revelation',19,15,'free',
      E'*And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God)* (Revelation 19:15). The rod of *Thou shalt break them with a rod of iron* (Psalm 2:9) is the King''s at His coming — *out of his mouth goeth a sharp sword... and he shall rule them with a rod of iron*. The raging nations of Psalm 2:1 are smitten by the word of His mouth; the rod of iron and the sharp sword are the rule of the enthroned Son over the kingdoms become His.'),

    -- THREAD 6 (★★): Kiss the Son — Blessed are all they that put their trust in him (trust in the Son = the blessing)
    ('canon','psalms',2,12,'canon','john',3,36,'free',
      E'*He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of Elohim (God) abideth on him* (John 3:36). The blessing and the warning of *Kiss the Son, lest he be angry... Blessed are all they that put their trust in him* (Psalm 2:12) are set out plainly: *He that believeth on the Son hath everlasting life... but the wrath of Elohim abideth on him*. To kiss the Son — to put trust in him — is the everlasting blessing; to refuse him is to abide under the wrath. The Son who is served with Yahuah (LORD) in fear (Psalm 2:11) is the Son in whom trust is the blessing — the Formed and the Formless honored together.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps002_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps002_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-why-do-the-heathen-rage-the-kings-against-his-anointed',
       E'Why do the heathen rage — the kings of the earth against his anointed',
       E'The psalm opens with the whole rebellion of the nations against Yahuah''s King: *Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed, saying, Let us break their bands asunder, and cast away their cords from us* (Psalm 2:1-3). The kings band together not against a man only but *against Yahuah, and against his anointed* — the Messiah. And the assembly of believers, threatened by the same rulers, prays this very psalm back to Yahuah and names its fulfillment: *Who by the mouth of thy servant David hast said, Why did the heathen rage, and the people imagine vain things? The kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:25-26). Then they name the kings: *For of a truth against thy holy child Yahusha (Jesus), whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel), were gathered together* (Acts 4:27). The raging of Psalm 2 is fulfilled at the cross — Herod, Pilate, the nations arrayed against the Anointed One. This is the system set against the Messiah, never an attack on a people; and even the gathering does only *whatsoever thy hand and thy counsel determined before to be done* (Acts 4:28). He that sitteth in the heavens shall laugh (Psalm 2:4): the rebellion of the kings is already overruled.',
       sv.verse_id, ev.verse_id, 'free', 22025
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion',
       E'Yet have I set my king upon my holy hill of Zion — the enthronement on Zion',
       E'Against all the raging of the kings, Yahuah answers with a single sovereign word: *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). The King is SET, not voted; enthroned by the Most High on the holy hill, not raised by the consent of the nations. The companion royal psalm declares the same throne: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1), and *Yahuah (LORD) shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies* (Psalm 110:2) — the rod that breaks the nations in Psalm 2:9 goes forth from this same Zion. From the holy hill the Torah flows out: *out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3) — the King''s reign is not the abolishing of the law but its going-forth, the nations streaming up to be taught His ways. Micah sings the reign and the regathering together: *Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7), gathering *her that halteth* and *her that was cast far off* into one strong nation — the two houses brought home under the throne on the holy hill. And the letter to the Hebrews opens Zion to its fullness: *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22). The King set on Zion gathers His people to the very mount where He reigns.',
       sv.verse_id, ev.verse_id, 'free', 22028
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-thou-art-my-son-this-day-have-i-begotten-thee',
       E'Thou art my Son; this day have I begotten thee — the begotten Son enthroned',
       E'At the heart of the psalm stands the decree the New Testament quotes more than any other royal word: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). This is read strictly through the Formed and the Formless: the begotten Son is the FORMED Son drawn from the Formless Father — He IS Yahuah and HAS a Father. There is no co-equal-persons grammar here and no collapse of the two into one; the Father declares, the Son is begotten. Sha''ul (Paul) ties the *this day* to the resurrection-enthronement: *he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:33) — the *this day* is the day the eternally-Formed Son is declared and enthroned, not the day He began. Hebrews sets Him above every angel by this same word: *unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5) — Father and Son distinct, never two equal persons, never one folded into the other. And the Son''s priesthood rests on it: *Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The restored witness keeps the eternal naming the decree declares in time: *before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3), *chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6). The Son was named before creation and declared in time — the Formed Son, hidden before the world, set as King on the holy hill.',
       sv.verse_id, ev.verse_id, 'extras', 22031
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance',
       E'Ask of me, and I shall give thee the heathen for thine inheritance — the nations gathered to the Son',
       E'To the begotten Son the Father says: *Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8). The nations that raged are given to the Son as His inheritance. Daniel sees the same handing-over to the One like the Son of Adam: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The royal psalm sings it as accomplished worship: *all kings shall fall down before him: all nations shall serve him* (Psalm 72:11) — the kings who set themselves against the Anointed in verse 2 now fall down before Him. And the end is the kingdoms themselves made His: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The restored witness shows the Chosen One on the throne to whom the nations come: *named the Elect One, And seated him on the throne of His glory* (1 Enoch 62:1), and the rebel kings put down before Him — *this Son of Adam whom thou hast seen Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9), while *the kings and the mighty who possess the earth implore (Him)* for respite (1 Enoch 48:8). The heathen asked for and given become the inheritance of the enthroned Son of Adam; the raging kings of verse 1 are brought to implore before His throne.',
       sv.verse_id, ev.verse_id, 'extras', 22034
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-thou-shalt-break-them-with-a-rod-of-iron',
       E'Thou shalt break them with a rod of iron — the man child to rule the nations',
       E'The inheritance of the nations comes with the rule that subdues all rebellion: *Thou shalt break them with a rod of iron; thou shalt dash them in pieces like a potter''s vessel* (Psalm 2:9). Revelation quotes this rod forward three times. To the overcomers the Son grants His own rule: *he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:27). The man child born of the woman is the One destined to wield it: *she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5) — the begotten Son of Psalm 2:7, the seed of the woman of Genesis 3:15, caught up to the throne. And at His coming the rod and the sword of His mouth smite the raging nations: *out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron* (Revelation 19:15). The nations that raged against the Anointed in verse 1 are ruled and broken by the King set on Zion — the rod of iron is the strength of His everlasting reign.',
       sv.verse_id, ev.verse_id, 'free', 22037
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-2-kiss-the-son-blessed-are-all-they-that-put-their-trust-in-him',
       E'Kiss the Son — Blessed are all they that put their trust in him',
       E'The psalm ends not with the doom of the kings but with a summons to the wise: *Be wise now therefore, O ye kings: be instructed, ye judges of the earth. Serve Yahuah (LORD) with fear, and rejoice with trembling* (Psalm 2:10-11). And then the two are honored together in one breath: *Kiss the Son, lest he be angry, and ye perish from the way, when his wrath is kindled but a little. Blessed are all they that put their trust in him* (Psalm 2:12). To serve Yahuah with fear AND to kiss the Son — the Formed and the Formless honored together, never collapsed, never set as two equal persons, but the Son served WITH the Father. The blessing and the warning are laid out plainly in the Gospel: *He that believeth on the Son hath everlasting life: and he that believeth not the Son shall not see life; but the wrath of Elohim (God) abideth on him* (John 3:36). To kiss the Son — to put trust in him — IS the everlasting blessing; to refuse him is to abide under the wrath that *is kindled but a little*. And the trust that blesses is never trust set against His commandments: to honor the King is to keep His word. *Blessed are all they that put their trust in him* — the raging kings are called home to the very Son they set themselves against.',
       sv.verse_id, ev.verse_id, 'free', 22040
  FROM _s302_ps002_lookup sv, _s302_ps002_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Why did the heathen rage, and the people imagine vain things?* (Acts 4:25) — the assembly prays the opening of *Why do the heathen rage* (2:1) back to Yahuah, by David''s mouth.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-why-do-the-heathen-rage-the-kings-against-his-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The kings of the earth stood up... against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:26) — *the kings of the earth set themselves... against Yahuah, and against his anointed* (2:2) carried over word for word; the anointed = his Messiah.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-why-do-the-heathen-rage-the-kings-against-his-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*against thy holy child Yahusha (Jesus), whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel)* (Acts 4:27) — the anointed of 2:2 named outright; the raging fulfilled at the cross, the system against the Messiah, not a people.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-why-do-the-heathen-rage-the-kings-against-his-anointed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the King set on Zion (2:6) is the Lord enthroned at Yahuah''s right hand; the raging enemies made the footstool.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) shall send the rod of thy strength out of Zion: rule thou in the midst of thine enemies* (Psalm 110:2) — the holy hill of 2:6 is the Zion from which the King''s rule and the rod (2:9) go forth.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3) — the King set on Zion (2:6) reigns where the Torah flows out; the throne and the law going forth are one rule, not the law abolished.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7) — the reign of the King on the holy hill (2:6), gathering the two houses (*her that halteth*, *her that was cast far off*) home under the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22) — the holy hill of 2:6 opened to its fullness; the King set on Zion gathers His people to the mount where He reigns.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-yet-have-i-set-my-king-upon-my-holy-hill-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as it is also written in the second psalm, Thou art my Son, this day have I begotten thee* (Acts 13:33) — the decree of 2:7 quoted by name and tied to the resurrection-enthronement; the *this day* declares the Formed Son enthroned.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-art-my-son-this-day-have-i-begotten-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee?* (Hebrews 1:5) — the decree of 2:7 sets the Son above every angel; Father and Son distinct, no co-equal persons, no collapse.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-art-my-son-this-day-have-i-begotten-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5) — the decree of 2:7 grounds the Son''s priesthood; appointed by the Father, not self-glorified.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-art-my-son-this-day-have-i-begotten-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3) — the decree of 2:7 declares in time the Son named before time; the *this day* proclaims the eternally-Formed Son, not His beginning.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-art-my-son-this-day-have-i-begotten-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6) — the begotten Son of 2:7 is the Formed Son hidden before creation and revealed in the decree.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-art-my-son-this-day-have-i-begotten-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14) — the nations asked for in 2:8 given to the One like the Son of Adam, an everlasting dominion.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all kings shall fall down before him: all nations shall serve him* (Psalm 72:11) — the inheritance of 2:8 is the royal son''s dominion; the kings who raged (2:2) fall down before the King.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the asking of 2:8 reaches its end; the heathen-inheritance become the Messiah''s everlasting reign.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*named the Elect One, And seated him on the throne of His glory* (1 Enoch 62:1) — the King who receives the nations (2:8) is the Chosen One enthroned on the throne of glory.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*this Son of Adam... Shall raise up the kings and the mighty from their seats... And break the teeth of the sinners* (1 Enoch 62:9) — the inheritance of 2:8 carries the judgment of the raging kings (2:2) before the enthroned Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the kings and the mighty who possess the earth implore (Him) To grant them a little respite* (1 Enoch 48:8) — the raging kings of 2:1-2 brought to implore before the Chosen One; He that sitteth in the heavens laughs (2:4).'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-ask-of-me-and-i-shall-give-thee-the-heathen-for-thine-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he shall rule them with a rod of iron; as the vessels of a potter shall they be broken to shivers: even as I received of my Father* (Revelation 2:27) — the rod of 2:9 quoted forward; the Son grants His rule to the overcomers.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-shalt-break-them-with-a-rod-of-iron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*she brought forth a man child, who was to rule all nations with a rod of iron: and her child was caught up unto Elohim (God), and to his throne* (Revelation 12:5) — the rod of 2:9 wielded by the man child, the begotten Son of 2:7, caught up to the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-shalt-break-them-with-a-rod-of-iron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*out of his mouth goeth a sharp sword... and he shall rule them with a rod of iron* (Revelation 19:15) — the rod of 2:9 at His coming; the raging nations (2:1) smitten by the word of His mouth.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-thou-shalt-break-them-with-a-rod-of-iron'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He that believeth on the Son hath everlasting life... but the wrath of Elohim (God) abideth on him* (John 3:36) — the trust/wrath antithesis of *Kiss the Son... Blessed are all they that put their trust in him* (2:12); to trust the Son IS the blessing.'
  FROM cross_reference_threads t
  JOIN _s302_ps002_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s302_ps002_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-2-kiss-the-son-blessed-are-all-they-that-put-their-trust-in-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_8.sql (Psalm 8) -----
-- Chapter: Psalm 8 — THE SON OF ADAM CROWNED WITH GLORY (a keystone of the Psalms): the Name exalted
--   above the heavens framed by the inclusio "O Yahuah our Lord, how excellent is thy name in all the
--   earth!" (v.1,9); out of the mouth of babes and sucklings strength is ordained (v.2); the heavens the
--   work of Yahuah's fingers, the moon and the stars (v.3); and at the heart the great question — "What
--   is man, that thou art mindful of him? and the son of Adam, that thou visitest him?" — answered with
--   the Adamic crowning: "made a little lower than the angels... crowned with glory and honour... dominion
--   over the works of thy hands... all things under his feet" (v.4-8). The dominion lost by the first Adam
--   (Genesis 1:26-28) restored in the last Adam, the Formed Son who took flesh (Hebrews 2).
-- Tag: ps008   Temp view: _s302_ps008_lookup
-- Sort band: base 22175, step 3 -> threads at 22175, 22178, 22181, 22184 (4 threads)
-- Source of EVERY row: 'canon','psalms',8,v
--
-- NOTE on "son of Adam": the parse reads Psalm 8:4 "and the son of Adam, that thou visitest him?" — the
--   seed-of-Adam weight. NO Daniel-7 kaph carve-out applies in the Psalms (no "like" / "one like"); the
--   text is quoted exactly as dump_canon returns it. Hebrews 2:6 quotes the parse identically ("the son of
--   Adam, that thou visitest him?") and reads it of Yahusha.
--
-- Psalm 8 coverage:
--   v.1,9 (O Yahuah our Lord, how excellent is thy name in all the earth! who hast set thy glory above the heavens — the INCLUSIO, the Name exalted)
--        NT:     none warranted distinct (the Name-praise forward-weave is carried by the babes-and-sucklings quote at THREAD 1; the inclusio frames v.1 within THREAD 1's prose, anchored v.1->v.9)
--        Extras: none warranted (no clean parallel; the Name-above-the-heavens is held in THREAD 1 prose)
--        Tanakh: none warranted distinct as a member (the inclusio is the frame of the chapter; Psalm 19:1 the heavens declare sits at THREAD 3)
--   ★ v.2 (Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger)
--        NT:     Matthew 21:16 (have ye never read, Out of the mouth of babes and sucklings thou hast perfected praise? — Yahusha quotes it of the children crying Hosanna in the temple) — THREAD 1 (load-bearing: the Name praised by babes)
--        Extras: none warranted
--        Tanakh: none warranted distinct (the verse is carried forward by Matthew)
--   ★★ v.4-6 (What is man, that thou art mindful of him? and the son of Adam, that thou visitest him? ... made him a little lower than the angels, and hast crowned him with glory and honour... dominion over the works of thy hands; thou hast put all things under his feet)
--        NT:     Hebrews 2:6-8 (quotes Psalm 8 in full — What is man... the son of Adam... a little lower than the angels... crowned with glory and honour... all things in subjection under his feet... but now we see not yet all things put under him); Hebrews 2:9 (But we see Yahusha, who was made a little lower than the angels for the suffering of death, crowned with glory and honour); 1 Corinthians 15:27 (For he hath put all things under his feet); Ephesians 1:22 (And hath put all things under his feet, and gave him to be the head over all things) — THREAD 2 (load-bearing KEYSTONE: the last Adam crowned)
--        Extras: Wisdom of Solomon 9:2 (ordained man through your wisdom, that he should have dominion over the creatures which you have made — the Adamic dominion mandate); Wisdom of Solomon 2:23 (Yahuah created man to be immortal, and made him to be an image of his own eternity — man in the image) — THREAD 2
--        Tanakh: ★ Genesis 1:26 (Let us make man in our image... and let them have dominion over the fish of the sea, and over the fowl of the air... and over every creeping thing); Genesis 1:28 (have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth) — THREAD 2 (the original Adamic dominion ROOT; Psalm 8 sings it back, Hebrews restores it in the last Adam)
--   v.3 (When I consider thy heavens, the work of thy fingers, the moon and the stars, which thou hast ordained)
--        NT:     none warranted distinct (no clean "the heavens the work of the Word" NT member in clear scope; the creation-by-the-Word weave is kept light, framed in THREAD 3 prose)
--        Extras: none warranted clean
--        Tanakh: ★ Psalm 19:1 (The heavens declare the glory of Elohim; and the firmament sheweth his handywork — the lateral psalm of the speaking heavens) — THREAD 3
--   v.7-8 (All sheep and oxen... the fowl of the air, and the fish of the sea — the catalogue of the dominion)
--        NT:     none warranted   Extras: none warranted   Tanakh: none warranted (the catalogue unfolds the "all things under his feet" of v.6, carried within THREAD 2; not separately threaded)
--
-- Threads (slug — target libraries):
--   1. psalm-8-out-of-the-mouth-of-babes-and-sucklings — NT (Matthew) [free] (★ the Name praised by babes; the inclusio v.1,9 framed in the summary)
--   2. psalm-8-what-is-man-the-son-of-adam-crowned-with-glory — NT (Hebrews, 1 Corinthians, Ephesians) + Tanakh (Genesis 1) + Extras (Wisdom of Solomon) [extras] (★★ KEYSTONE: the son of Adam crowned, dominion lost in the first Adam restored in the last)
--   3. psalm-8-when-i-consider-thy-heavens-the-work-of-thy-fingers — Tanakh (Psalm 19) [free] (the work of thy fingers, the speaking heavens)
--
-- Framing notes:
--   ★ THE NAME + THE BABES (THREAD 1): the inclusio *O Yahuah (LORD) our Lord, how excellent is thy name
--     in all the earth!* (8:1,9) frames the whole psalm — the Name exalted above the heavens, yet sung by
--     the least. *Out of the mouth of babes and sucklings hast thou ordained strength* (8:2) is the verse
--     Yahusha (Jesus) Himself takes up in the temple when the children cry Hosanna: *have ye never read, Out
--     of the mouth of babes and sucklings thou hast perfected praise?* (Matthew 21:16). The strength
--     ordained against the enemy is the praise of the little ones; the Name excellent in all the earth is
--     confessed first by babes.
--   ★★ THE KEYSTONE — THE SON OF ADAM CROWNED (THREAD 2): *What is man, that thou art mindful of him? and
--     the son of Adam, that thou visitest him?* (8:4). The dominion mandate first given to the first Adam —
--     *Let us make man in our image... and let them have dominion* (Genesis 1:26), *have dominion over the
--     fish of the sea, and over the fowl of the air, and over every living thing* (Genesis 1:28) — is sung
--     back in Psalm 8, then read by Hebrews of the last Adam: the parse of Hebrews 2:6 quotes Psalm 8
--     identically (*the son of Adam, that thou visitest him?*), notes *we see not yet all things put under
--     him* (Hebrews 2:8), then *But we see Yahusha (Jesus), who was made a little lower than the angels for
--     the suffering of death, crowned with glory and honour* (Hebrews 2:9). Framed through the Formed-and-
--     the-Formless: the son of Adam who is the second/last Adam, the Formed Son who took flesh (made a
--     little lower than the angels) and is crowned — the dominion lost by the first Adam restored in the
--     last. 1 Corinthians 15:27 and Ephesians 1:22 carry *he hath put all things under his feet*. Wisdom of
--     Solomon witnesses the Adamic image and dominion (*created man to be immortal, and made him to be an
--     image of his own eternity*, 2:23; *ordained man... that he should have dominion over the creatures*,
--     9:2). Wisdom DOUBLE-WRITTEN as edition 'apocrypha' + book 'the-wisdom-of-solomon'.
--   v.3 (THREAD 3): *When I consider thy heavens, the work of thy fingers, the moon and the stars, which
--     thou hast ordained* (8:3) is laid beside its sister psalm: *The heavens declare the glory of Elohim
--     (God); and the firmament sheweth his handywork* (Psalm 19:1). The creation-by-the-Word weave is kept
--     deliberately light — no forced NT member — letting the two psalms of the speaking heavens answer each
--     other.
--   VERSES WITH NO ADD: v.7-8 (the catalogue of the dominion — sheep and oxen, the fowl, the fish) unfolds
--     the *all things under his feet* of v.6 and is carried within THREAD 2's prose, not separately threaded.

CREATE TEMP VIEW _s302_ps008_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Out of the mouth of babes and sucklings (the Name praised by babes)
    ('canon','psalms',8,2,'canon','matthew',21,16,'free',
      E'*And said unto him, Hearest thou what these say? And Yahusha (Jesus) saith unto them, Yea; have ye never read, Out of the mouth of babes and sucklings thou hast perfected praise?* (Matthew 21:16). When the children cry *Hosanna to the Son of David* in the temple and the chief priests are displeased, Yahusha answers with this very psalm: *Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger* (Psalm 8:2). The strength ordained against the enemy IS the praise of the little ones; the Name *excellent in all the earth* (8:1) is confessed first by babes, and the Formed Son receives that praise as His due in His Father''s house.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps008_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps008_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 2 (★★ KEYSTONE): What is man, the son of Adam, crowned with glory — the last Adam restored to dominion
    ('canon','psalms',8,4,'canon','hebrews',2,6,'free',
      E'*But one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6). The letter to the Hebrews takes up Psalm 8 word for word — *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) — and reads the psalm''s wondering question as the prophecy of the One to come. The son of Adam, the seed of Adam, is the very subject Hebrews will name as Yahusha (Jesus); the psalm sings of man, and Hebrews hears the last Adam.'),
    ('canon','psalms',8,5,'canon','hebrews',2,7,'free',
      E'*Thou madest him a little lower than the angels; thou crownedst him with glory and honour, and didst set him over the works of thy hands* (Hebrews 2:7). This carries *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5) entire. The Formed Son who took flesh was *made a little lower than the angels* — the abasement — and *crowned with glory and honour* — the exaltation; the psalm''s order of lowering-then-crowning is the very path of the One who emptied Himself and was lifted up.'),
    ('canon','psalms',8,6,'canon','hebrews',2,8,'free',
      E'*Thou hast put all things in subjection under his feet. For in that he put all in subjection under him, he left nothing that is not put under him. But now we see not yet all things put under him* (Hebrews 2:8). The dominion of *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:6) is read as the not-yet-fulfilled subjection of all things to the son of Adam — *he left nothing that is not put under him*, yet *we see not yet all things put under him*: the dominion granted and assured, awaiting its consummation in the One the next verse names.'),
    ('canon','psalms',8,5,'canon','hebrews',2,9,'free',
      E'*But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man* (Hebrews 2:9). Here the psalm finds its face: *made him a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5) — *But we see Yahusha*. The Formed Son took the lower place *for the suffering of death* and is *crowned with glory and honour*; the man of whom the psalm wondered is the last Adam who tasted death and wears the crown.'),
    ('canon','psalms',8,6,'canon','1-corinthians',15,27,'free',
      E'*For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him* (1 Corinthians 15:27). Sha''ul (Paul) takes *thou hast put all things under his feet* (Psalm 8:6) and reads it of the reigning Messiah, with the Father excepted who *did put all things under him* — the Formed Son given dominion over all by the Most High, and the Most High Himself not made subject. The Adamic *all things under his feet* is the resurrection-reign of the last Adam, ordered under the Father.'),
    ('canon','psalms',8,6,'canon','ephesians',1,22,'free',
      E'*And hath put all things under his feet, and gave him to be the head over all things to the church* (Ephesians 1:22). The dominion of *thou hast put all things under his feet* (Psalm 8:6) is named again of the risen Messiah set *far above all principality, and power, and might, and dominion* — *all things under his feet*, and He *the head over all things*. The dominion the first Adam forfeited is gathered up and restored in the last Adam, who is made head over all for the sake of His people.'),
    ('canon','psalms',8,6,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth* (Genesis 1:26). The dominion Psalm 8 sings — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:6) — is the original Adamic mandate of the sixth day: man made in the image and given rule over the works. The psalm reaches back to the garden charter and sings it as still standing, the dominion that belongs to the son of Adam.'),
    ('canon','psalms',8,6,'canon','genesis',1,28,'free',
      E'*And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28). The blessing and the charge — *have dominion over the fish of the sea, and over the fowl of the air, and over every living thing* — is the very catalogue Psalm 8 echoes: *All sheep and oxen... The fowl of the air, and the fish of the sea* (Psalm 8:7-8) under *all things under his feet* (8:6). The dominion granted to Adam at creation, lost in the fall, is the dominion restored in the last Adam crowned with glory.'),
    ('canon','psalms',8,4,'apocrypha','the-wisdom-of-solomon',2,23,'extras',
      E'*For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23). The wondering of *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) is answered in this restored witness: man was *created... to be immortal, and made... to be an image of his own eternity* — the Adamic dignity, the image-bearing, the very mindfulness the psalm marvels at, before death entered through the envy of the adversary.'),
    ('canon','psalms',8,6,'apocrypha','the-wisdom-of-solomon',9,2,'extras',
      E'*And ordained man through your wisdom, that he should have dominion over the creatures which you have made* (Wisdom of Solomon 9:2). The restored witness names the same dominion as Psalm 8: *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:6). Man was *ordained... that he should have dominion over the creatures* — the Adamic rule by the wisdom of Yahuah, the charter of the sixth day sung back in the psalm and restored in the last Adam.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps008_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps008_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3: When I consider thy heavens, the work of thy fingers (the speaking heavens)
    ('canon','psalms',8,3,'canon','psalms',19,1,'free',
      E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). The gaze of *When I consider thy heavens, the work of thy fingers, the moon and the stars, which thou hast ordained* (Psalm 8:3) is the same gaze as its sister psalm: *The heavens declare the glory of Elohim; and the firmament sheweth his handywork*. The heavens that are *the work of thy fingers* are the heavens that *declare the glory* — the same testimony of the ordered creation, the moon and the stars set in their courses by the One whose Name is excellent in all the earth.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps008_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps008_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-8-out-of-the-mouth-of-babes-and-sucklings',
       E'Out of the mouth of babes and sucklings — the Name praised by the least',
       E'The psalm opens and closes on the same word, an inclusio that holds the whole: *O Yahuah (LORD) our Lord, how excellent is thy name in all the earth! who hast set thy glory above the heavens* (Psalm 8:1), and again at the end, *O Yahuah (LORD) our Lord, how excellent is thy name in all the earth!* (Psalm 8:9). The Name is exalted above the heavens — and yet it is confessed first by the smallest mouths: *Out of the mouth of babes and sucklings hast thou ordained strength because of thine enemies, that thou mightest still the enemy and the avenger* (Psalm 8:2). The strength ordained against the enemy is the praise of the little ones. Yahusha (Jesus) Himself takes up this very verse in the temple. When the children cry *Hosanna to the Son of David* and the chief priests are *sore displeased* and ask, *Hearest thou what these say?*, He answers: *Yea; have ye never read, Out of the mouth of babes and sucklings thou hast perfected praise?* (Matthew 21:16). The Name *excellent in all the earth* is the Name the babes confess; the Formed Son receives in His Father''s house the praise the psalm ordained, and stills the displeased enemy with the worship of children.',
       sv.verse_id, ev.verse_id, 'free', 22175
  FROM _s302_ps008_lookup sv, _s302_ps008_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-8-what-is-man-the-son-of-adam-crowned-with-glory',
       E'What is man, the son of Adam — crowned with glory, the last Adam restored to dominion',
       E'At the heart of the psalm is the question the whole canon answers: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). And the answer is the crowning of the son of Adam: *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour. Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:5-6). This is the dominion first granted in the garden — *Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air... and over every creeping thing* (Genesis 1:26), *Be fruitful, and multiply... and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth* (Genesis 1:28) — the Adamic charter sung back in the psalm. The restored witness keeps the same dignity: man was *created... to be immortal, and made... to be an image of his own eternity* (Wisdom of Solomon 2:23), *ordained... that he should have dominion over the creatures which you have made* (Wisdom of Solomon 9:2). But the dominion was lost in the first Adam''s fall. The letter to the Hebrews takes the psalm up entire and reads it of the One to come: *What is man... or the son of Adam, that thou visitest him? Thou madest him a little lower than the angels; thou crownedst him with glory and honour... Thou hast put all things in subjection under his feet... But now we see not yet all things put under him* (Hebrews 2:6-8) — and then, *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour* (Hebrews 2:9). The son of Adam is the last Adam. The Formed Son — the One who appeared and spoke in the Tanakh — took flesh, was *made a little lower than the angels for the suffering of death*, tasted death, and is *crowned with glory and honour*. And the dominion is His: *For he hath put all things under his feet* (1 Corinthians 15:27), *And hath put all things under his feet, and gave him to be the head over all things to the church* (Ephesians 1:22) — the Father excepted who *did put all things under him*, the Formed Son set over all by the Most High. The catalogue of the psalm — *All sheep and oxen... The fowl of the air, and the fish of the sea* (Psalm 8:7-8) — is the very dominion of Genesis 1 restored. What the first Adam lost, the last Adam wears.',
       sv.verse_id, ev.verse_id, 'extras', 22178
  FROM _s302_ps008_lookup sv, _s302_ps008_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-8-when-i-consider-thy-heavens-the-work-of-thy-fingers',
       E'When I consider thy heavens, the work of thy fingers — the speaking heavens',
       E'Between the Name above the heavens and the question of man comes the upward gaze: *When I consider thy heavens, the work of thy fingers, the moon and the stars, which thou hast ordained* (Psalm 8:3). It is the smallness of man under the vastness of the ordered heavens that frames the wonder that *thou art mindful of him*. The sister psalm sings the same heavens with the same awe: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). The heavens that are *the work of thy fingers* are the heavens that *declare the glory*; the moon and the stars *which thou hast ordained* are the firmament that *sheweth his handywork* — the wordless testimony of the ordered creation to the One whose Name is *excellent in all the earth* (Psalm 8:1). The two psalms answer each other: the heavens that humble man are the heavens that proclaim their Maker.',
       sv.verse_id, ev.verse_id, 'free', 22181
  FROM _s302_ps008_lookup sv, _s302_ps008_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*have ye never read, Out of the mouth of babes and sucklings thou hast perfected praise?* (Matthew 21:16) — Yahusha quotes 8:2 of the children crying Hosanna in the temple; the Name praised by the least.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-out-of-the-mouth-of-babes-and-sucklings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6) — Hebrews quotes 8:4 word for word and reads the wondering question as prophecy of the One to come.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=4
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou madest him a little lower than the angels; thou crownedst him with glory and honour* (Hebrews 2:7) — carries 8:5 entire; the lowering-then-crowning that is the path of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou hast put all things in subjection under his feet... But now we see not yet all things put under him* (Hebrews 2:8) — the dominion of 8:6 read as the not-yet-fulfilled subjection of all things to the son of Adam.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour* (Hebrews 2:9) — the psalm finds its face: the man of 8:5 is the last Adam who tasted death and wears the crown.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For he hath put all things under his feet* (1 Corinthians 15:27) — 8:6 read of the reigning Messiah, the Father excepted who did put all things under him; the resurrection-reign of the last Adam.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And hath put all things under his feet, and gave him to be the head over all things to the church* (Ephesians 1:22) — 8:6 of the risen Messiah set far above all dominion; the dominion lost in the first Adam restored in the last.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Let us make man in our image... and let them have dominion over the fish of the sea, and over the fowl of the air... and over every creeping thing* (Genesis 1:26) — the original Adamic dominion mandate that 8:6 sings back; the garden charter.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Be fruitful, and multiply... and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth* (Genesis 1:28) — the dominion catalogue of 8:6-8 (sheep and oxen, the fowl, the fish) is the garden dominion restored.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23) — the Adamic image and dignity the question of 8:4 marvels at, before death entered.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=4
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*ordained man through your wisdom, that he should have dominion over the creatures which you have made* (Wisdom of Solomon 9:2) — the same Adamic dominion of 8:6, ordained by the wisdom of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-what-is-man-the-son-of-adam-crowned-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1) — the heavens that are *the work of thy fingers* (8:3) are the heavens that declare the glory; the two psalms of the speaking heavens.'
  FROM cross_reference_threads t
  JOIN _s302_ps008_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s302_ps008_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-8-when-i-consider-thy-heavens-the-work-of-thy-fingers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_16.sql (Psalm 16) -----
-- Chapter: Psalm 16 — THE RESURRECTION PSALM (★★ KEYSTONE MESSIANIC): A Michtam of David, but
--   spoken prophetically of the Messiah — the NT says David could not mean himself, for he died
--   and his sepulchre is with us. *Preserve me, O Elohim (God): for in thee do I put my trust*
--   (v.1); the refusal of the other gods — *their sorrows shall be multiplied that hasten after
--   another god... nor take up their names into my lips* (v.4); *Yahuah is the portion of mine
--   inheritance and of my cup... The lines are fallen unto me in pleasant places* (v.5-6); *I have
--   set Yahuah always before me... my flesh also shall rest in hope. For thou wilt not leave my
--   soul in hell; neither wilt thou suffer thine Holy One to see corruption. Thou wilt shew me the
--   path of life* (v.8-11) → Kepha (Peter) at Shavuot/Pentecost (Acts 2) and Sha'ul (Paul) at
--   Antioch (Acts 13) both quote it as the resurrection of the Messiah who saw no corruption.
-- Tag: ps016   Temp view: _s302_ps016_lookup
-- Sort band: base 22375, step 3 -> threads at 22375, 22378, 22381, 22384 (4 threads)
-- Source of EVERY row: 'canon','psalms',16,v
--
-- Psalm 16 coverage:
--   v.1 (Preserve me, O Elohim: for in thee do I put my trust)
--        NT:     none warranted distinct (the trust-frame opens the psalm; its messianic weight is carried forward by THREAD 3)
--        Extras: none warranted   Tanakh: none warranted distinct
--   v.2-3 (Thou art my Lord... to the saints that are in the earth, and to the excellent, in whom is all my delight)
--        NT:     none warranted   Extras: none warranted   Tanakh: none warranted distinct (delight in the saints; no framework-load-bearing lateral closer than the portion-theme of THREAD 1)
--   ★ v.4 (Their sorrows shall be multiplied that hasten after another god: their drink offerings of blood will I not offer, nor take up their names into my lips)
--        NT:     none warranted distinct (the first-commandment refusal is a Torah-rooted weave, held to the Tanakh lateral)
--        Extras: none warranted (no clean run on the names-of-other-gods refusal)
--        Tanakh: ★ Exodus 23:13 (make no mention of the name of other gods, neither let it be heard out of thy mouth) — THREAD 2 (the first commandment kept: no other gods' names on the lips)
--   ★ v.5-6 (Yahuah is the portion of mine inheritance and of my cup: thou maintainest my lot. The lines are fallen unto me in pleasant places; yea, I have a goodly heritage)
--        NT:     none warranted distinct (the portion/inheritance theme is a Tanakh-Levite weave; the messianic forward-weave is the no-corruption inheritance of THREADS 3-4)
--        Extras: none warranted   Tanakh: ★ Lamentations 3:24 (Yahuah is my portion, saith my soul; therefore will I hope in him); ★ Numbers 18:20 (Thou shalt have no inheritance in their land... I am thy part and thine inheritance among the children of Yashar'el) — THREAD 1 (Yahuah Himself the portion — the Levite's lot, the Messiah's heritage)
--   v.7 (I will bless Yahuah, who hath given me counsel: my reins also instruct me in the night seasons)
--        NT:     none warranted   Extras: none warranted   Tanakh: none warranted distinct
--   ★★ v.8-10 (I have set Yahuah always before me... my flesh also shall rest in hope. For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption)
--        NT:     ★★ Acts 2:25 (For David speaketh concerning him, I foresaw Yahuah always before my face... I should not be moved); Acts 2:27 (Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption); Acts 2:31 (He seeing this before spake of the resurrection of Messiah, that his soul was not left in hell, neither his flesh did see corruption); Acts 13:35 (Thou shalt not suffer thine Holy One to see corruption); Acts 13:37 (But he, whom Elohim raised again, saw no corruption) — THREAD 3 (load-bearing: the Holy One who saw no corruption = the Formed Son raised; David is dead and buried)
--        Extras: none warranted distinct here (the no-corruption resurrection text is the NT proclamation; the immortality-hope is held to THREAD 4)
--        Tanakh: none warranted distinct (the resurrection forward-weave is the NT of THREAD 3)
--   ★ v.10-11 (Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore)
--        NT:     Acts 2:28 (Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance) — THREAD 4 (the path of life = the resurrection life made known)
--        Extras: ★ Wisdom of Solomon 3:1-4 (the souls of the righteous are in the hand of Yahuah... their hope full of immortality) — THREAD 4 (the righteous one's hope is full of immortality — the path of life forward to the resurrection hope)
--        Tanakh: none warranted distinct (the path-of-life forward-weave is carried by Acts + Wisdom)
--
-- Threads (slug — target libraries):
--   1. psalm-16-yahuah-the-portion-of-mine-inheritance-a-goodly-heritage — Tanakh (Lamentations, Numbers) [free] (Yahuah Himself the portion/inheritance — the Levite's lot, the Messiah's heritage)
--   2. psalm-16-nor-take-up-their-names-into-my-lips-no-other-gods — Tanakh (Exodus) [free] (the first commandment kept: the refusal of the other gods' names)
--   3. psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption — NT (Acts 2, Acts 13) [free] (★★ the keystone: the Holy One raised, who saw no corruption — David is dead and buried)
--   4. psalm-16-thou-wilt-shew-me-the-path-of-life-fulness-of-joy — NT (Acts 2) + Extras (Wisdom of Solomon) [extras] (the path of life = the resurrection hope full of immortality)
--
-- Framing notes:
--   ★★ THE KEYSTONE (THREAD 3): *For thou wilt not leave my soul in hell; neither wilt thou suffer
--      thine Holy One to see corruption* (16:10). David wrote it, but at Shavuot/Pentecost Kepha
--      (Peter) declares David could not mean himself — *let me freely speak unto you of the
--      patriarch David, that he is both dead and buried, and his sepulchre is with us unto this
--      day* (Acts 2:29) — *He seeing this before spake of the resurrection of Messiah (Christ),
--      that his soul was not left in hell, neither his flesh did see corruption* (Acts 2:31).
--      Sha'ul (Paul) presses the same at Antioch — *David... saw corruption: But he, whom Elohim
--      (God) raised again, saw no corruption* (Acts 13:36-37). Framed through the Formed-and-the-
--      Formless (Red Line #4): the Holy One who did not see corruption is the Formed Son who took
--      flesh, died, and was raised by the Most High — NO co-equal-persons grammar, NO modalist
--      collapse. This is the resurrection-faith psalm, the Shavuot proclamation text.
--   ★ THE PORTION (THREAD 1): *Yahuah (LORD) is the portion of mine inheritance and of my cup*
--      (16:5). Bound to the Levite's lot — *I am thy part and thine inheritance among the children
--      of Yashar'el (Israel)* (Numbers 18:20) — and to the lament that hopes — *Yahuah (LORD) is my
--      portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). The one whose
--      portion is Yahuah Himself has the goodly heritage that death cannot touch; the portion-theme
--      runs straight into the no-corruption inheritance of THREADS 3-4.
--   ★ NO OTHER GODS (THREAD 2): *their drink offerings of blood will I not offer, nor take up their
--      names into my lips* (16:4) — the first commandment kept, woven to *make no mention of the
--      name of other gods, neither let it be heard out of thy mouth* (Exodus 23:13). The Messiah's
--      psalm opens in perfect covenant-loyalty: no other god named, no other lord owned.
--   EXTRAS: Wisdom of Solomon 3:1-4 (edition 'apocrypha', book 'the-wisdom-of-solomon') carries the
--      righteous one's *hope full of immortality* (clean parse) — a single member on THREAD 4, the
--      path-of-life resurrection hope. Jubilees/Jasher/1 Enoch: none warranted (no clean run on the
--      Davidic resurrection psalm). NO double-write needed (apocrypha edition slug differs from book
--      slug, written as the two distinct columns).
--   VERSES WITH NO ADD: v.1-3 (the trust-frame and delight in the saints — the messianic weight is
--      carried forward by THREAD 3) and v.7 (the counsel in the night seasons) — no framework-bearing
--      target warranted distinct in this pack.

CREATE TEMP VIEW _s302_ps016_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Yahuah is the portion of mine inheritance — a goodly heritage (the Levite's lot, the Messiah's heritage)
    ('canon','psalms',16,5,'canon','lamentations',3,24,'free',
      E'*Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). The very confession of *Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5) is sung again from the ash-heap of the ruined city: *Yahuah is my portion, saith my soul; therefore will I hope in him*. The one whose portion is Yahuah Himself does not despair in death or exile — the portion is the ground of the hope, the heritage that cannot be taken away.'),
    ('canon','psalms',16,5,'canon','numbers',18,20,'free',
      E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). The Levite is given no field, for Yahuah declares *I am thy part and thine inheritance* — the very portion claimed in *Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5). The Messiah''s psalm takes up the priestly lot: not land but Yahuah Himself, the goodly heritage that death cannot consume.'),

    -- THREAD 2: Nor take up their names into my lips — the refusal of the other gods (first commandment kept)
    ('canon','psalms',16,4,'canon','exodus',23,13,'free',
      E'*And in all things that I have said unto you be circumspect: and make no mention of the name of other gods, neither let it be heard out of thy mouth* (Exodus 23:13). The vow of the psalm — *their drink offerings of blood will I not offer, nor take up their names into my lips* (Psalm 16:4) — is the Torah''s own command kept to the letter: *make no mention of the name of other gods, neither let it be heard out of thy mouth*. The Messiah''s song opens in perfect covenant-loyalty; no other god is named, no rival lord owned, the first commandment kept on the lips.'),

    -- THREAD 3 (★★): Thou wilt not leave my soul in hell — thine Holy One shall not see corruption (the resurrection)
    ('canon','psalms',16,8,'canon','acts',2,25,'free',
      E'*For David speaketh concerning him, I foresaw Yahuah (Lord) always before my face, for he is on my right hand, that I should not be moved* (Acts 2:25). At Shavuot (Pentecost) Kepha (Peter) reads *I have set Yahuah (LORD) always before me: because he is at my right hand, I shall not be moved* (Psalm 16:8) as David speaking not of himself but *concerning him* — the Messiah. The psalm is not the king''s autobiography but his prophecy; David foresaw the One who would set Yahuah before His face and not be moved by death.'),
    ('canon','psalms',16,10,'canon','acts',2,27,'free',
      E'*Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27). Kepha (Peter) quotes the keystone verse entire — *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — and then names what David could not have meant of himself: *let me freely speak unto you of the patriarch David, that he is both dead and buried, and his sepulchre is with us unto this day* (Acts 2:29). David''s body saw corruption; the Holy One''s did not.'),
    ('canon','psalms',16,10,'canon','acts',2,31,'free',
      E'*He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption* (Acts 2:31). The whole weight of *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) is declared as resurrection: David, *being a prophet* (Acts 2:30), *spake of the resurrection of Messiah, that his soul was not left in hell, neither his flesh did see corruption*. The Formed Son who took flesh died and was raised by the Most High — the soul not abandoned, the flesh not corrupted.'),
    ('canon','psalms',16,10,'canon','acts',13,35,'free',
      E'*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35). At Antioch Sha''ul (Paul) takes up the same verse — *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — and drives the argument home: *For David, after he had served his own generation by the will of Elohim (God), fell on sleep, and was laid unto his fathers, and saw corruption* (Acts 13:36). The Holy One of the psalm cannot be David, who saw corruption.'),
    ('canon','psalms',16,10,'canon','acts',13,37,'free',
      E'*But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:37). Sha''ul (Paul) closes the proof of *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10): David saw corruption, *but he, whom Elohim (God) raised again, saw no corruption*. The raising is the Most High''s act upon the Formed Son — *he, whom Elohim raised again* — the one Holy One whose flesh the grave could not undo.'),

    -- THREAD 4: Thou wilt shew me the path of life — fulness of joy (the resurrection hope full of immortality)
    ('canon','psalms',16,11,'canon','acts',2,28,'free',
      E'*Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance* (Acts 2:28). Kepha (Peter) carries the psalm''s close — *Thou wilt shew me the path of life: in thy presence is fulness of joy* (Psalm 16:11) — into the Shavuot (Pentecost) proclamation: *Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance*. The path of life is the way out of the grave; the fulness of joy is the risen One in the presence of the Father.'),
    ('canon','psalms',16,10,'apocrypha','the-wisdom-of-solomon',3,4,'extras',
      E'*For though they be punished in the sight of men, yet is their hope full of immortality* (Wisdom of Solomon 3:4). The restored witness names the very hope the psalm reaches for — *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption... thou wilt shew me the path of life* (Psalm 16:10-11): the souls of the righteous are *in the hand of Yahuah (God)* (Wisdom of Solomon 3:1), and though men count them dead, *their hope full of immortality*. The Holy One who saw no corruption is the firstfruits of that immortal hope.'),
    ('canon','psalms',16,11,'apocrypha','the-wisdom-of-solomon',3,1,'extras',
      E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1). The path of life of *Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore* (Psalm 16:11) is the keeping of the soul beyond death: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them*. The right hand of pleasures evermore is the hand of Yahuah in which the righteous are held safe.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps016_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps016_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-16-yahuah-the-portion-of-mine-inheritance-a-goodly-heritage',
       E'Yahuah is the portion of mine inheritance — a goodly heritage',
       E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot. The lines are fallen unto me in pleasant places; yea, I have a goodly heritage* (Psalm 16:5-6). The singer''s wealth is not land or gold but Yahuah Himself — Yahuah is the portion, the cup, the lot. This is the priestly inheritance: *Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). The Levite is given no field, for Yahuah declares *I am thy part and thine inheritance* — and the Messiah''s psalm takes up that lot. And from the ruins of the burned city the same confession is sung in hope: *Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). The one whose portion is Yahuah does not despair in death or exile, for the heritage cannot be taken away — the goodly heritage that runs straight into the no-corruption inheritance of the resurrection, where the soul is not left in the grave.',
       sv.verse_id, ev.verse_id, 'free', 22375
  FROM _s302_ps016_lookup sv, _s302_ps016_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=16 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-16-nor-take-up-their-names-into-my-lips-no-other-gods',
       E'Nor take up their names into my lips — the refusal of the other gods',
       E'*Their sorrows shall be multiplied that hasten after another god: their drink offerings of blood will I not offer, nor take up their names into my lips* (Psalm 16:4). Before the psalm reaches its resurrection-cry it sets the singer''s loyalty plain: he will not pour the idolaters'' drink offerings, and he will not so much as speak the names of the other gods. This is the first commandment kept on the lips — the Torah''s own word: *And in all things that I have said unto you be circumspect: and make no mention of the name of other gods, neither let it be heard out of thy mouth* (Exodus 23:13). The Messiah''s song opens in perfect covenant-loyalty: no rival god is named, no other lord owned, *nor take up their names into my lips*. The faithfulness that will be vindicated in resurrection begins in the refusal of every false god — the One whose soul will not be left in hell is the One who would never lift a strange name to His mouth.',
       sv.verse_id, ev.verse_id, 'free', 22378
  FROM _s302_ps016_lookup sv, _s302_ps016_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption',
       E'Thou wilt not leave my soul in hell — thine Holy One shall not see corruption',
       E'Here the psalm rises to the keystone of the whole Davidic prophecy: *I have set Yahuah (LORD) always before me: because he is at my right hand, I shall not be moved. Therefore my heart is glad, and my glory rejoiceth: my flesh also shall rest in hope. For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:8-10). David wrote it — but at Shavuot (Pentecost) Kepha (Peter) declares David could not have meant himself: *For David speaketh concerning him, I foresaw Yahuah (Lord) always before my face... I should not be moved* (Acts 2:25), and then the verse entire — *Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27) — followed by the plain fact: *let me freely speak unto you of the patriarch David, that he is both dead and buried, and his sepulchre is with us unto this day* (Acts 2:29). David''s body saw corruption; so the Holy One must be another. *He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption* (Acts 2:31). Sha''ul (Paul) presses the identical proof at Antioch: *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35); *For David... fell on sleep, and was laid unto his fathers, and saw corruption: But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:36-37). Read through the Formed-and-the-Formless: the Holy One whose flesh the grave could not undo is the Formed Son who took flesh, died, and was raised by the Most High — *he, whom Elohim raised again*. This is the resurrection-faith psalm, the Shavuot proclamation: the soul not abandoned to sheol, the Holy One not given to corruption.',
       sv.verse_id, ev.verse_id, 'free', 22381
  FROM _s302_ps016_lookup sv, _s302_ps016_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-16-thou-wilt-shew-me-the-path-of-life-fulness-of-joy',
       E'Thou wilt shew me the path of life — fulness of joy at thy right hand',
       E'*Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore* (Psalm 16:11). The psalm ends not at the edge of the grave but past it — the path of life is the way out of sheol, and at its end is the presence of the Father. Kepha (Peter) carries the close into the Shavuot (Pentecost) sermon: *Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance* (Acts 2:28) — the path of life made known is the resurrection, the fulness of joy the risen One before the face of Yahuah. And the restored witness names the hope plainly: *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1), and though men count them dead, *yet is their hope full of immortality* (Wisdom of Solomon 3:4). The right hand of pleasures evermore is the hand of Yahuah in which the righteous are held safe; the Holy One who saw no corruption is the firstfruits of that immortal hope, the One who walked the path of life through death and into the presence where there is fulness of joy.',
       sv.verse_id, ev.verse_id, 'extras', 22384
  FROM _s302_ps016_lookup sv, _s302_ps016_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=16 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24) — the confession of *Yahuah is the portion of mine inheritance* (16:5) sung again from the ruins; the portion is the ground of the hope.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-yahuah-the-portion-of-mine-inheritance-a-goodly-heritage'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20) — the Levite''s lot of *Yahuah is the portion of mine inheritance* (16:5): not land but Yahuah Himself, the heritage death cannot consume.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-yahuah-the-portion-of-mine-inheritance-a-goodly-heritage'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*make no mention of the name of other gods, neither let it be heard out of thy mouth* (Exodus 23:13) — the Torah command kept in *nor take up their names into my lips* (16:4): the first commandment on the lips, no rival god owned.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-nor-take-up-their-names-into-my-lips-no-other-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For David speaketh concerning him, I foresaw Yahuah (Lord) always before my face... I should not be moved* (Acts 2:25) — Kepha (Peter) reads *I have set Yahuah always before me* (16:8) as David prophesying of the Messiah, not himself.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27) — the keystone verse 16:10 quoted entire at Shavuot; David is dead and buried (Acts 2:29), so the Holy One is another.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He seeing this before spake of the resurrection of Messiah (Christ), that his soul was not left in hell, neither his flesh did see corruption* (Acts 2:31) — 16:10 declared as resurrection; David the prophet foresaw the Formed Son raised.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35) — Sha''ul (Paul) takes up 16:10 at Antioch; David saw corruption (Acts 13:36), so the Holy One is another.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*But he, whom Elohim (God) raised again, saw no corruption* (Acts 13:37) — the proof of 16:10 closed: the raising is the Most High''s act upon the Formed Son, the one Holy One the grave could not undo.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-not-leave-my-soul-in-hell-thine-holy-one-shall-not-see-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou hast made known to me the ways of life; thou shalt make me full of joy with thy countenance* (Acts 2:28) — *Thou wilt shew me the path of life* (16:11) in the Shavuot sermon: the path of life made known is the resurrection, the fulness of joy the risen One before the Father.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=11
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-shew-me-the-path-of-life-fulness-of-joy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1) — the path of life of 16:11 is the soul kept beyond death; the right hand of pleasures is the hand of Yahuah holding the righteous safe.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=11
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-shew-me-the-path-of-life-fulness-of-joy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*yet is their hope full of immortality* (Wisdom of Solomon 3:4) — the restored witness names the hope of 16:10-11: though men count the righteous dead, their hope is full of immortality; the Holy One who saw no corruption is its firstfruits.'
  FROM cross_reference_threads t
  JOIN _s302_ps016_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s302_ps016_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-16-thou-wilt-shew-me-the-path-of-life-fulness-of-joy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session302 — Psalms cross-references complete.'
