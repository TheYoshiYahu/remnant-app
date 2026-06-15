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

-- ----- fragment: minion_psalms_19.sql (Psalm 19) -----
-- Chapter: Psalm 19 — THE TWO BOOKS: creation speaks, and the Torah is perfect. Two halves bound by one Author. v.1-6: general revelation — *The heavens declare the glory of Elohim; and the firmament sheweth his handywork... Their line is gone out through all the earth, and their words to the end of the world... the sun... rejoiceth as a strong man to run a race* — the wordless preaching of the luminaries (the appointed-times root of Genesis 1:14, the fingers-work of Psalm 8), whose sound Sha'ul (Paul) takes up for the gospel's reach (Romans 10:18). v.7-11 (★★ THE TORAH-KEYSTONE, Red Line #6): *The law of Yahuah is perfect, converting the soul: the testimony of Yahuah is sure, making wise the simple. The statutes of Yahuah are right, rejoicing the heart: the commandment of Yahuah is pure, enlightening the eyes... More to be desired are they than gold... sweeter also than honey... in keeping of them there is great reward* — the perfect Torah that converts the soul and rewards the keeping, the inheritance never the curse, affirmed (not abolished) in the NT and sung in Psalm 119. v.12-14: the cleansing/redeemer close — *Cleanse thou me from secret faults... Let the words of my mouth, and the meditation of my heart, be acceptable in thy sight, O Yahuah, my strength, and my redeemer.*
-- Tag: ps019   Temp view: _s302_ps019_lookup
-- Sort band: base 22450, step 3 -> threads at 22450, 22453, 22456, 22459 (4 threads)
-- Source of EVERY row: 'canon','psalms',19,v
--
-- Psalm 19 coverage:
--   v.1-6 (The heavens declare the glory of Elohim; the firmament his handywork; their line gone out through all the earth, and their words to the end of the world; a tabernacle for the sun; rejoiceth as a strong man to run a race)
--        NT:     ★ Romans 10:18 (their sound went into all the earth, and their words unto the ends of the world — Sha'ul takes up Ps 19:4 for the gospel's universal reach) — THREAD 1 (load-bearing FORWARD weave)
--        Extras: none warranted (the Sirach/Wisdom witness is the Torah-as-wisdom material, bound to THREAD 3 below; no clean creation-speech extras lateral closer than the luminaries themselves)
--        Tanakh: ★ Genesis 1:14 (lights in the firmament... for signs, and for seasons — the appointed-times root of the speaking heavens); Psalm 8:3 (the moon and the stars, which thou hast ordained — the fingers-work that provokes wonder) — THREAD 1
--   ★★ v.7-9 (The law of Yahuah is perfect, converting the soul; the testimony sure, making wise the simple; the statutes right, rejoicing the heart; the commandment pure, enlightening the eyes; the fear clean; the judgments true and righteous) — THE TORAH-KEYSTONE
--        NT:     ★ Romans 7:12 (the law is holy, and the commandment holy, and just, and good — Sha'ul AFFIRMING Torah); James 1:25 (the perfect law of liberty... a doer of the work, this man shall be blessed) — THREAD 2 (load-bearing: NT never abolishes the perfect Torah)
--        Extras: none warranted distinct here (the wisdom=Torah extras witness is bound to THREAD 3's sweeter-than-honey/inheritance weave)
--        Tanakh: ★ Psalm 1:2 (his delight is in the law of Yahuah; and in his law doth he meditate day and night); Psalm 119:7 (I will praise thee... when I shall have learned thy righteous judgments) — THREAD 2; Jeremiah 31:33 + Ezekiel 36:27 (the perfect Torah written on the heart, the Spirit causing the keeping — the new covenant is Torah-internalized, NOT Torah replaced) — THREAD 2 laterals
--   ★★ v.10-11 (More to be desired are they than gold, yea, than much fine gold: sweeter also than honey and the honeycomb. Moreover by them is thy servant warned: and in keeping of them there is great reward)
--        NT:     none warranted distinct (the keeping-rewarded forward-weave is held by James 1:25 at THREAD 2; not doubled here)
--        Extras: ★ Sirach/Ecclesiasticus 24:20 (my memorial is sweeter than honey, and my inheritance than the honeycomb); 24:23 (All these things are the book of the covenant of the most high Yahuah, even the law which Moses commanded for an heritage) — THREAD 3 (Wisdom=the Torah, sweeter than honey, the inheritance) [edition 'apocrypha' + slug 'ecclesiasticus' — NOT double-written]
--        Tanakh: ★ Psalm 119:103 (How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!); Psalm 119:72 (The law of thy mouth is better unto me than thousands of gold and silver); Psalm 119:97 (O how love I thy law!) — THREAD 3
--   v.12-14 (Who can understand his errors? cleanse thou me from secret faults. Keep back thy servant also from presumptuous sins... Let the words of my mouth, and the meditation of my heart, be acceptable in thy sight, O Yahuah, my strength, and my redeemer)
--        NT:     none warranted (no clean NT lateral closer than the general cleansing/redemption theme; not forced)
--        Extras: none warranted
--        Tanakh: ★ Psalm 119:11 (Thy word have I hid in mine heart, that I might not sin against thee — the Torah kept against secret faults); Psalm 119:133 (Order my steps in thy word: and let not any iniquity have dominion over me — answers "let them not have dominion over me") — THREAD 4
--
-- Threads (slug — target libraries):
--   1. psalm-19-the-heavens-declare-their-words-to-the-end-of-the-world — NT (Romans 10:18) + Tanakh (Genesis 1:14, Psalm 8:3) [free] (the speaking heavens; FORWARD to the gospel's reach; the appointed-times luminary root)
--   2. psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul — NT (Romans 7:12, James 1:25) + Tanakh (Psalm 1:2, Psalm 119:7, Jeremiah 31:33, Ezekiel 36:27) [free] (★★ THE TORAH-KEYSTONE — the perfect Torah affirmed, never abolished, written on the heart)
--   3. psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward — Extras (Sirach 24:20, 24:23) + Tanakh (Psalm 119:103, 119:72, 119:97) [extras] (★★ the Torah more than gold, sweeter than honey, the inheritance, the keeping rewarded)
--   4. psalm-19-cleanse-thou-me-let-the-meditation-of-my-heart-be-acceptable — Tanakh (Psalm 119:11, Psalm 119:133) [free] (the cleansing/redeemer close — the Word hid in the heart against secret faults)
--
-- Framing notes:
--   ★ THE TWO BOOKS (THREAD 1): *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (19:1). The wordless preaching of creation — *There is no speech nor language, where their voice is not heard* (19:3) — is read FORWARD with Sha'ul (Paul), who lifts *Their line is gone out through all the earth, and their words to the end of the world* (19:4) straight into the gospel's reach: *their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18). The luminaries that declare are the same lights set *for signs, and for seasons* (Genesis 1:14) — the appointed-times root (Red Line #3); and the moon and stars are *the work of thy fingers... which thou hast ordained* (Psalm 8:3). The heavens preach what the Torah will speak in words.
--   ★★ THE TORAH-KEYSTONE (THREAD 2): *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (19:7). This is Red Line #6 sung outright — the Torah is the covenant inheritance, never the curse. The framework reads the NT as AFFIRMING this perfect law, never abolishing it: Sha'ul (Paul) — *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12); Ya'aqob (James) — *whoso looketh into the perfect law of liberty, and continueth therein... a doer of the work, this man shall be blessed in his deed* (James 1:25). The new covenant is this same perfect Torah written on the heart — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — Torah internalized by the Spirit, NOT Torah replaced (the 1 John 2:3-4 filter). Psalm 1:2 and Psalm 119 sing the delight of the same perfect law.
--   ★★ SWEETER THAN HONEY (THREAD 3): *More to be desired are they than gold, yea, than much fine gold: sweeter also than honey and the honeycomb. Moreover by them is thy servant warned: and in keeping of them there is great reward* (19:10-11). Psalm 119 echoes it note-for-note — *sweeter than honey to my mouth* (119:103), *better unto me than thousands of gold and silver* (119:72), *O how love I thy law!* (119:97). And the restored wisdom witness binds it to the Torah by name: Wisdom says *my memorial is sweeter than honey, and my inheritance than the honeycomb* (Sirach 24:20), then *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage* (Sirach 24:23) — Wisdom IS the Torah, the inheritance sweeter than honey, the keeping rewarded.
--   THE CLEANSING CLOSE (THREAD 4): *cleanse thou me from secret faults... let them not have dominion over me... be acceptable in thy sight, O Yahuah (LORD), my strength, and my redeemer* (19:12-14). The man who has tasted the perfect law turns it inward against his own hidden sin — *Thy word have I hid in mine heart, that I might not sin against thee* (Psalm 119:11), *Order my steps in thy word: and let not any iniquity have dominion over me* (Psalm 119:133). The Torah delighted in (vv.7-11) becomes the Torah prayed in.
--   EXTRAS: Sirach 24 (edition 'apocrypha', book slug 'ecclesiasticus' — NOT double-written, unlike Jubilees/Jasher) is the clean wisdom=Torah witness; vv.20,23 are the members. Wisdom of Solomon 6:18 (love is the keeping of her laws) weighed but not added — Sirach carries the honey/inheritance tie far more precisely. No Jubilees/Jasher creation-speech or Torah-praise verse warranted closer than the canon laterals.
--   VERSES WITH NO ADD beyond their threads: vv.5-6 (the sun as a bridegroom / strong man to run a race) sit inside THREAD 1's anchor span and prose; v.9b (the judgments true and righteous) inside THREAD 2; no standalone forced member.

CREATE TEMP VIEW _s302_ps019_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The heavens declare — their words to the end of the world (general revelation; FORWARD to the gospel's reach)
    ('canon','psalms',19,4,'canon','romans',10,18,'free',
      E'*But I say, Have they not heard? Yes verily, their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18). Sha''ul (Paul) lifts the psalm''s own words — *Their line is gone out through all the earth, and their words to the end of the world* (Psalm 19:4) — and presses them FORWARD: as the wordless witness of the heavens reaches every place, so the report of the gospel has gone out to the ends of the world. The speaking creation becomes the figure of the message that none can say they never heard.'),
    ('canon','psalms',19,1,'canon','genesis',1,14,'free',
      E'*And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The heavens that *declare the glory of Elohim (God)* and the firmament that *sheweth his handywork* (Psalm 19:1) are the very lights set on the fourth day *for signs, and for seasons* — the appointed-times root. The luminaries do not merely shine; they were ordained to mark Yahuah''s calendar, and so their silent shining is already a declaring.'),
    ('canon','psalms',19,1,'canon','psalms',8,3,'free',
      E'*When I consider thy heavens, the work of thy fingers, the moon and the stars, which thou hast ordained* (Psalm 8:3). The same wonder answers *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1): the firmament is *the work of thy fingers*, the moon and stars *which thou hast ordained*. To consider the handywork is to hear it preach the glory of the One who made it.'),

    -- THREAD 2 (★★): The law of Yahuah is perfect, converting the soul (THE TORAH-KEYSTONE)
    ('canon','psalms',19,7,'canon','romans',7,12,'free',
      E'*Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). Sha''ul (Paul) — so often misread as the Torah''s undoer — says outright what the psalm sings: the commandment is *holy, and just, and good*, matching *The law of Yahuah (LORD) is perfect, converting the soul... the commandment of Yahuah (LORD) is pure* (Psalm 19:7-8). The perfect, soul-converting law is not abolished in the letter to the Romans; it is called holy. The fault is in the flesh that breaks it, never in the law itself.'),
    ('canon','psalms',19,7,'canon','james',1,25,'free',
      E'*But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed* (James 1:25). Ya''aqob (James) names the very thing the psalm names — *the perfect law* — and calls it *the perfect law of liberty*, the law looked into and DONE. *The law of Yahuah (LORD) is perfect, converting the soul* (Psalm 19:7) is the same perfect law whose doer *shall be blessed in his deed*; the blessing is in the keeping, exactly as *in keeping of them there is great reward* (Psalm 19:11).'),
    ('canon','psalms',19,7,'canon','psalms',1,2,'free',
      E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). The Psalter''s opening blessing rhymes with this one: the law that is *perfect, converting the soul* (Psalm 19:7) is the law the blessed man delights in and *meditate[s] day and night*. What Psalm 19 declares about the Torah, Psalm 1 makes the shape of the righteous life — delight, not burden.'),
    ('canon','psalms',19,8,'canon','psalms',119,7,'free',
      E'*I will praise thee with uprightness of heart, when I shall have learned thy righteous judgments* (Psalm 119:7). The great Torah-psalm answers *The statutes of Yahuah (LORD) are right, rejoicing the heart... the judgments of Yahuah (LORD) are true and righteous altogether* (Psalm 19:8-9): the *righteous judgments* learned bring *uprightness of heart* and praise. Psalm 19''s confession that the statutes *rejoic[e] the heart* opens into the whole hundred-and-seventy-six-verse song of the same delight.'),
    ('canon','psalms',19,7,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The perfect Torah that *convert[s] the soul* (Psalm 19:7) is not set aside in the new covenant but written deeper — *I will put my law in their inward parts, and write it in their hearts*. The same law praised here is the law internalized there; the covenant renewed is Torah-on-the-heart, never Torah replaced.'),
    ('canon','psalms',19,8,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The promise binds the Spirit to the very *statutes* and *judgments* the psalm calls *right* and *true and righteous altogether* (Psalm 19:8-9): the Spirit given is the Spirit that *cause[s] you to walk in my statutes*. The Ruach and the Torah are one work — the perfect law kept from within, the keeping that holds *great reward* (Psalm 19:11).'),

    -- THREAD 3 (★★): More to be desired than gold, sweeter than honey, in keeping great reward
    ('canon','psalms',19,10,'canon','psalms',119,103,'free',
      E'*How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103). The Torah-psalm tastes exactly what Psalm 19 tastes: *sweeter also than honey and the honeycomb* (Psalm 19:10). The words of Yahuah are not bitter restraint but sweetness on the tongue — the same delight, twice sung, the law desired and savoured.'),
    ('canon','psalms',19,10,'canon','psalms',119,72,'free',
      E'*The law of thy mouth is better unto me than thousands of gold and silver* (Psalm 119:72). Psalm 19''s scale — *More to be desired are they than gold, yea, than much fine gold* (Psalm 19:10) — is weighed again here: the law *better... than thousands of gold and silver*. The Torah outvalues every treasure; the one who has tasted it would not trade it for fine gold.'),
    ('canon','psalms',19,11,'canon','psalms',119,97,'free',
      E'*O how love I thy law! it is my meditation all the day* (Psalm 119:97). The servant *warned* by the commandments, who finds *in keeping of them there is great reward* (Psalm 19:11), is the very voice of *O how love I thy law!* — the keeping is love, and the love is all-day meditation. The reward of the Torah is the delight of the one who keeps it.'),
    ('canon','psalms',19,10,'apocrypha','ecclesiasticus',24,20,'extras',
      E'*For my memorial is sweeter than honey, and my inheritance than the honeycomb* (Sirach 24:20). Wisdom speaks the psalm''s own words — *sweeter also than honey and the honeycomb* (Psalm 19:10) — and adds *inheritance*: the sweetness is a possession handed down. The restored witness sets Wisdom and the Torah side by side as the one honeyed inheritance, the treasure that is tasted and owned.'),
    ('canon','psalms',19,11,'apocrypha','ecclesiasticus',24,23,'extras',
      E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). Here the restored witness names plainly what Psalm 19 has been praising: the Wisdom sweeter than honey IS *the law which Moses commanded for an heritage*. The Torah whose keeping holds *great reward* (Psalm 19:11) is *the book of the covenant of the most high Yahuah*, the inheritance of the congregations — Red Line #6 spoken outright: the law is the heritage, never the curse.'),

    -- THREAD 4: Cleanse thou me — let the meditation of my heart be acceptable (the cleansing/redeemer close)
    ('canon','psalms',19,12,'canon','psalms',119,11,'free',
      E'*Thy word have I hid in mine heart, that I might not sin against thee* (Psalm 119:11). The prayer *Who can understand his errors? cleanse thou me from secret faults* (Psalm 19:12) is answered by the Word taken inward — *Thy word have I hid in mine heart, that I might not sin against thee*. The perfect law just praised becomes the guard against the hidden sin; the cleansing is the Torah laid up in the heart.'),
    ('canon','psalms',19,13,'canon','psalms',119,133,'free',
      E'*Order my steps in thy word: and let not any iniquity have dominion over me* (Psalm 119:133). Psalm 19''s plea — *Keep back thy servant also from presumptuous sins; let them not have dominion over me* (Psalm 19:13) — is prayed again almost word for word: *let not any iniquity have dominion over me*. The steps ordered in the Word are the steps kept from the dominion of sin; the Torah delighted in is the Torah that keeps the servant upright.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps019_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps019_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-19-the-heavens-declare-their-words-to-the-end-of-the-world',
       E'The heavens declare — their words to the end of the world',
       E'*The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1). The first half of the psalm is the wordless sermon of creation: *Day unto day uttereth speech, and night unto night sheweth knowledge. There is no speech nor language, where their voice is not heard* (Psalm 19:2-3). It is a voice without words, heard in every tongue. And the reach is total — *Their line is gone out through all the earth, and their words to the end of the world* (Psalm 19:4) — the sun set like *a bridegroom coming out of his chamber, and rejoiceth as a strong man to run a race* (Psalm 19:5), nothing *hid from the heat thereof* (Psalm 19:6). These are the same lights Yahuah set on the fourth day: *Let there be lights in the firmament of the heaven... and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — the appointed-times root, the luminaries ordained to mark His calendar. And the psalmist''s wonder is the wonder of *When I consider thy heavens, the work of thy fingers, the moon and the stars, which thou hast ordained* (Psalm 8:3). Then Sha''ul (Paul) takes the psalm''s own line and presses it FORWARD to the gospel: *But I say, Have they not heard? Yes verily, their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18). As the heavens'' wordless witness reaches every place, so the report of salvation has gone out — the speaking creation a figure of the message none can say they never heard.',
       sv.verse_id, ev.verse_id, 'free', 22450
  FROM _s302_ps019_lookup sv, _s302_ps019_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=19 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul',
       E'The law of Yahuah is perfect, converting the soul',
       E'The psalm turns from the book of the heavens to the book of the Torah, and the praise is unbroken: *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple. The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes. The fear of Yahuah (LORD) is clean, enduring for ever: the judgments of Yahuah (LORD) are true and righteous altogether* (Psalm 19:7-9). This is the Torah-keystone of the Psalter — the law is the covenant inheritance, never the curse; it is *perfect*, it *convert[s] the soul*, it *enduring for ever*. The default Christian reading hears "Old Testament law, now done away" — but the New Testament itself will not say it. Sha''ul (Paul), so often pressed into Torah''s undoing, says plainly: *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). Ya''aqob (James) calls it *the perfect law of liberty*, and the blessing is in the doing: *whoso looketh into the perfect law of liberty, and continueth therein... a doer of the work, this man shall be blessed in his deed* (James 1:25). And the Psalter itself frames the whole life of the righteous around it — *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2), *I will praise thee with uprightness of heart, when I shall have learned thy righteous judgments* (Psalm 119:7). Where does this perfect law go in the new covenant? Not away, but inward: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33), *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Ruach (Spirit) and the Torah are one work; the perfect law that converts the soul is the perfect law written on the heart.',
       sv.verse_id, ev.verse_id, 'free', 22453
  FROM _s302_ps019_lookup sv, _s302_ps019_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward',
       E'Sweeter than honey — in keeping of them there is great reward',
       E'The praise of the Torah crests into the language of treasure and taste: *More to be desired are they than gold, yea, than much fine gold: sweeter also than honey and the honeycomb. Moreover by them is thy servant warned: and in keeping of them there is great reward* (Psalm 19:10-11). The law outvalues fine gold and outsweetens the honeycomb — and the keeping of it carries *great reward*. The great Torah-psalm sings the very same notes: *How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103), *The law of thy mouth is better unto me than thousands of gold and silver* (Psalm 119:72), *O how love I thy law! it is my meditation all the day* (Psalm 119:97). And the restored wisdom witness binds the honey and the gold to the Torah by name. Wisdom speaks: *For my memorial is sweeter than honey, and my inheritance than the honeycomb* (Sirach 24:20) — and then she is named outright: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). The Wisdom sweeter than honey IS the Torah, the heritage of the congregations. Red Line #6 spoken plainly: the law is the inheritance, the treasure tasted and owned and kept — never the curse, never the burden, but the sweetness whose keeping holds the reward.',
       sv.verse_id, ev.verse_id, 'extras', 22456
  FROM _s302_ps019_lookup sv, _s302_ps019_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=19 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-19-cleanse-thou-me-let-the-meditation-of-my-heart-be-acceptable',
       E'Cleanse thou me — let the meditation of my heart be acceptable',
       E'Having tasted the perfect law, the psalmist turns it inward against his own hidden sin: *Who can understand his errors? cleanse thou me from secret faults. Keep back thy servant also from presumptuous sins; let them not have dominion over me: then shall I be upright, and I shall be innocent from the great transgression* (Psalm 19:12-13). And he ends with the prayer that the whole inner man be made fit for Yahuah: *Let the words of my mouth, and the meditation of my heart, be acceptable in thy sight, O Yahuah (LORD), my strength, and my redeemer* (Psalm 19:14). The Torah delighted in becomes the Torah prayed in. The great Torah-psalm answers both pleas: against the secret faults — *Thy word have I hid in mine heart, that I might not sin against thee* (Psalm 119:11); against the dominion of sin — *Order my steps in thy word: and let not any iniquity have dominion over me* (Psalm 119:133). The perfect law that converts the soul is the law hidden in the heart that guards it; the steps ordered in the Word are the steps kept upright. The psalm of the two books — creation''s wordless preaching and the Torah''s sure word — closes with the heart that has heard both, asking to be cleansed and kept by its strength and redeemer.',
       sv.verse_id, ev.verse_id, 'free', 22459
  FROM _s302_ps019_lookup sv, _s302_ps019_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=19 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*their sound went into all the earth, and their words unto the ends of the world* (Romans 10:18) — Sha''ul (Paul) lifts *their words to the end of the world* (19:4) FORWARD to the gospel''s universal reach.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-heavens-declare-their-words-to-the-end-of-the-world'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) — the heavens that *declare the glory of Elohim* (19:1) are the appointed-times luminaries, ordained to mark Yahuah''s calendar.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-heavens-declare-their-words-to-the-end-of-the-world'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the work of thy fingers, the moon and the stars, which thou hast ordained* (Psalm 8:3) — the same wonder at *his handywork* (19:1); to consider the firmament is to hear it preach the glory of its Maker.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-heavens-declare-their-words-to-the-end-of-the-world'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12) — Sha''ul (Paul) AFFIRMS the perfect, soul-converting law of 19:7; it is not abolished but called holy.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=7
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the perfect law of liberty... a doer of the work, this man shall be blessed in his deed* (James 1:25) — the same *perfect* law of 19:7, the blessing in the keeping (cf. *in keeping of them there is great reward*, 19:11).'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=7
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*his delight is in the law of Yahuah; and in his law doth he meditate day and night* (Psalm 1:2) — the perfect law of 19:7 is the Psalter''s delight, the shape of the righteous life.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=7
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will praise thee with uprightness of heart, when I shall have learned thy righteous judgments* (Psalm 119:7) — the *true and righteous* judgments of 19:8-9 learned, bringing uprightness and praise.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=8
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the perfect law that *convert[s] the soul* (19:7) written deeper in the new covenant, NOT replaced.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=7
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the Spirit bound to the *statutes* and *judgments* of 19:8-9; the Ruach and the Torah are one work.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=8
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-the-law-of-yahuah-is-perfect-converting-the-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*How sweet are thy words unto my taste! yea, sweeter than honey to my mouth!* (Psalm 119:103) — the Torah-psalm tastes what 19:10 tastes: *sweeter also than honey and the honeycomb*.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=103
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The law of thy mouth is better unto me than thousands of gold and silver* (Psalm 119:72) — the law outvalues fine gold, as in *More to be desired are they than gold* (19:10).'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=72
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*O how love I thy law! it is my meditation all the day* (Psalm 119:97) — the keeping that holds *great reward* (19:11) is love; the reward is the delight of the one who keeps it.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=11
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=97
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For my memorial is sweeter than honey, and my inheritance than the honeycomb* (Sirach 24:20) — Wisdom speaks the psalm''s *sweeter... than honey and the honeycomb* (19:10) and adds *inheritance*: the sweetness is a possession handed down.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage* (Sirach 24:23) — the Wisdom sweeter than honey IS the Torah, the inheritance whose keeping holds *great reward* (19:11). Red Line #6 outright.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=11
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-sweeter-than-honey-in-keeping-of-them-great-reward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thy word have I hid in mine heart, that I might not sin against thee* (Psalm 119:11) — the Word taken inward answers *cleanse thou me from secret faults* (19:12); the perfect law is the guard against hidden sin.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=12
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-cleanse-thou-me-let-the-meditation-of-my-heart-be-acceptable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Order my steps in thy word: and let not any iniquity have dominion over me* (Psalm 119:133) — prayed almost word for word with *let them not have dominion over me* (19:13); the steps ordered in the Word kept from the dominion of sin.'
  FROM cross_reference_threads t
  JOIN _s302_ps019_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s302_ps019_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=133
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-19-cleanse-thou-me-let-the-meditation-of-my-heart-be-acceptable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_22.sql (Psalm 22) -----
-- Chapter: Psalm 22 — THE GREAT CRUCIFIXION PSALM, the single most-fulfilled-at-the-cross psalm in all the Tanakh. The suffering one cries *My Elohim, my Elohim, why hast thou forsaken me?* (the very words Yahusha cried from the tree); the mockers shoot out the lip and shake the head — *He trusted on Yahuah that he would deliver him: let him deliver him*; the body poured out like water, bones out of joint, tongue cleaving to the jaws, brought into the dust of death; *they pierced my hands and my feet*; *they part my garments among them, and cast lots upon my vesture*. Then the great turn — heard, vindicated, raised: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (the risen One to the brethren); and the ingathering — *All the ends of the world shall remember and turn unto Yahuah... and all the kindreds of the nations shall worship before thee... A seed shall serve him... they shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this.*
-- Tag: ps022   Temp view: _s302_ps022_lookup
-- Sort band: base 22525, step 3 -> threads at 22525, 22528, 22531, 22534, 22537, 22540, 22543 (7 threads)
-- Source of EVERY row: 'canon','psalms',22,v
--
-- Psalm 22 coverage:
--   ★★ v.1 (My Elohim, my Elohim, why hast thou forsaken me?)
--        NT:     Matthew 27:46 (Eli, Eli, lama sabachthani... My Elohim, my Elohim, why hast thou forsaken me?); Mark 15:34 (Eloi, Eloi, lama sabachthani) — THREAD 1 (load-bearing: the Formed Son cries the very words from the tree)
--        Extras: none warranted (no clean restored-witness parallel to the dereliction-cry; Psalm 22 is a Davidic crucifixion psalm with no Jubilees/Jasher/Enoch counterpart)
--        Tanakh: none warranted distinct (the cry is carried forward to its NT fulfillment; the psalm IS the lateral the gospels reach back to)
--   ★★ v.7-8 (All they that see me laugh me to scorn: they shoot out the lip, they shake the head... He trusted on Yahuah that he would deliver him: let him deliver him)
--        NT:     Matthew 27:39 (they that passed by reviled him, wagging their heads); Matthew 27:43 (He trusted in Elohim; let him deliver him now, if he will have him) — THREAD 2 (load-bearing: the mockers' very words foretold); Mark 15:29 (railed on him, wagging their heads) — THREAD 2
--        Extras: none warranted
--        Tanakh: none warranted distinct
--   v.14-15 (I am poured out like water... my strength is dried up like a potsherd; my tongue cleaveth to my jaws; brought into the dust of death)
--        NT:     John 19:28 (Yahusha... saith, I thirst) — THREAD 3 (the physical agony of the cross, the dried strength and thirst)
--        Extras: none warranted   Tanakh: none warranted distinct
--   ★★ v.16 (For dogs have compassed me: the assembly of the wicked have inclosed me: they pierced my hands and my feet)
--        NT:     John 19:37 (They shall look on him whom they pierced — paired with John 19:34 spear); John 20:25 (Except I shall see in his hands the print of the nails); John 20:27 (Reach hither thy finger, and behold my hands); Luke 24:39 (Behold my hands and my feet) — THREAD 4 (load-bearing: the pierced hands and feet, the nail-prints shown)
--        Extras: none warranted
--        Tanakh: ★ Zechariah 12:10 (they shall look upon me whom they have pierced... mourn for him, as one mourneth for his only son) — THREAD 4 (the lateral the gospel quotes alongside)
--   ★★ v.18 (They part my garments among them, and cast lots upon my vesture)
--        NT:     John 19:23-24 (the soldiers... took his garments, and made four parts... and also his coat... let us not rend it, but cast lots for it... that the scripture might be fulfilled... They parted my raiment among them, and for my vesture they did cast lots); Matthew 27:35 (parted his garments, casting lots... They parted my garments among them, and upon my vesture did they cast lots) — THREAD 5 (load-bearing: quoted as fulfillment by name)
--        Extras: none warranted   Tanakh: none warranted distinct
--   ★★ v.22 (I will declare thy name unto my brethren: in the midst of the congregation will I praise thee)
--        NT:     Hebrews 2:12 (I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee); Hebrews 2:11 (he is not ashamed to call them brethren); John 20:17 (go to my brethren... I ascend unto my Father, and your Father) — THREAD 6 (load-bearing: the risen One declaring the Name to the brethren; suffering turned to the gathered congregation)
--        Extras: none warranted   Tanakh: none warranted distinct (v.23 the seed of Jacob / seed of Yashar'el carries the two-house weight in-psalm; held to THREAD 6/7 prose)
--   ★ v.27-31 (All the ends of the world shall remember and turn unto Yahuah... all the kindreds of the nations shall worship before thee... A seed shall serve him... they shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this)
--        NT:     Luke 24:46-47 (it behoved Messiah to suffer, and to rise from the dead the third day: And that repentance and remission of sins should be preached in his name among all nations) — THREAD 7 (load-bearing: the resurrection-vindication preached to the nations, the gospel-RESULT of the suffering); Luke 24:26 (Ought not Messiah to have suffered these things, and to enter into his glory?) — THREAD 7
--        Extras: none warranted
--        Tanakh: none warranted distinct here (the ingathering of the nations and the seed that serves is carried forward to its NT preaching; the two-house/seed weight woven in THREAD 7 prose: a seed shall serve him + all the kindreds of the nations gathered = covenant-gathering, NEVER false-inclusion)
--   v.2-6, v.9-13, v.17, v.19-21, v.23-26 (the daytime cry unheard; the worm and reproach; the womb-trust; the bulls of Bashan and the lion's mouth; the bones told and stared upon; the prayer for nearness; the praise-vow in the great congregation)
--        NT:     none warranted distinct (the suffering-and-vindication frame is carried by THREADS 1-7; these verses are the body of the lament that those threads anchor)
--        Extras: none warranted   Tanakh: none warranted distinct (v.23 seed-of-Jacob/seed-of-Yashar'el woven in THREAD 6 prose as the two-house congregation)
--
-- EXTRAS NOTE: none warranted across the whole psalm. Psalm 22 is a Davidic crucifixion/vindication psalm; the restored extra-canonical library (1 Enoch, Jubilees, Jasher, Apocrypha, Pseudepigrapha) carries no clean verse that parallels the dereliction-cry, the piercing, the parted garments, or the declaring-of-the-Name. Weighed and deliberately declined — NOT forced. Every thread here is canon-only (NT fulfillment + one Zechariah 12:10 Tanakh lateral), so EVERY thread tier_required = 'free'.
--
-- Threads (slug — target libraries):
--   1. psalm-22-my-elohim-my-elohim-why-hast-thou-forsaken-me — NT (Matthew, Mark) [free] (★★ the Formed Son cries the very words from the tree)
--   2. psalm-22-they-shoot-out-the-lip-let-him-deliver-him — NT (Matthew, Mark) [free] (★★ the mockers' very words foretold)
--   3. psalm-22-poured-out-like-water-the-dust-of-death — NT (John) [free] (the physical agony; I thirst)
--   4. psalm-22-they-pierced-my-hands-and-my-feet — NT (John, Luke) + Tanakh (Zechariah 12:10) [free] (★★ the pierced hands and feet, the nail-prints shown)
--   5. psalm-22-they-part-my-garments-and-cast-lots — NT (John, Matthew) [free] (★★ quoted as fulfillment by name)
--   6. psalm-22-i-will-declare-thy-name-unto-my-brethren — NT (Hebrews, John) [free] (★★ the risen One declaring the Name to the brethren; the turn to the congregation)
--   7. psalm-22-the-ends-of-the-world-shall-turn-a-seed-shall-serve-him — NT (Luke) [free] (★ the ingathering of the nations and the seed that serves; the gospel-result preached)
--
-- Framing notes:
--   ★★ THE DERELICTION-CRY (THREAD 1) — Formed-and-Formless lens (Red Line #4): *My Elohim (God), my Elohim (God), why hast thou forsaken me?* (22:1) is the verse Yahusha cries from the tree — *Eli, Eli, lama sabachthani... My Elohim, my Elohim, why hast thou forsaken me?* (Matthew 27:46). Framed strictly: the FORMED Son in the flesh cries to the Father. He IS Yahuah and HAS a Father; the forsaking is real suffering in the body, NOT a rupture of the one Elohim into co-equal persons, NOT a tearing of the Godhead. The Son who appeared and spoke in the Tanakh took flesh and, in that flesh, knew the dust of death and cried the psalm.
--   ★★ THE MOCKERS' WORDS (THREAD 2): *they shoot out the lip, they shake the head, saying, He trusted on Yahuah (LORD) that he would deliver him: let him deliver him* (22:7-8) — foretold a thousand years before, then spoken almost verbatim at the cross: *they that passed by reviled him, wagging their heads* (Matthew 27:39) and *He trusted in Elohim (God); let him deliver him now* (Matthew 27:43). VICTIMS-NOT-ENEMIES (Red Line #7): the mockery is the conduct foretold, the reproach the suffering one bears — not a charge laid against a people; the psalm's "I" is the despised and afflicted one heard at the last.
--   ★★ THE PIERCING (THREAD 4): *they pierced my hands and my feet* (22:16), paired with the Tanakh lateral *they shall look upon me whom they have pierced... mourn for him, as one mourneth for his only son* (Zechariah 12:10) — the same piercing the gospel names: *They shall look on him whom they pierced* (John 19:37), the nail-prints shown to Thomas (John 20:25-27), *Behold my hands and my feet* (Luke 24:39-40).
--   ★★ THE DECLARED NAME (THREAD 6): the great turn from suffering to the gathered congregation — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (22:22) — taken up of the RISEN One: *he is not ashamed to call them brethren, Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:11-12); *go to my brethren* (John 20:17). The psalm's "seed of Jacob... seed of Yashar'el (Israel)" (22:23) is the two-house congregation in whose midst the Name is declared.
--   ★ THE INGATHERING (THREAD 7): the gospel-RESULT of the suffering — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee... A seed shall serve him... they shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this* (22:27-31). The resurrection-vindication preached: *thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day: And that repentance and remission of sins should be preached in his name among all nations* (Luke 24:46-47). TWO-HOUSE/SEED WEIGHT woven but kept covenant-gathering, NEVER false-inclusion (Red Line #2): *a seed shall serve him* and *all the kindreds of the nations* are gathered IN to worship the One who *hath done this* — the families of the earth drawn to the covenant, not the covenant dissolved into the nations.
--   VERSES WITH NO ADD: v.2-6, v.9-13, v.17, v.19-21, v.23-26 — the body of the lament (the unheard daytime cry, the worm and reproach, the womb-trust, the bulls of Bashan and the lion's mouth, the bones told and stared upon, the prayer for nearness, the praise-vow). No distinct framework-bearing target warranted; these are the verses the seven threads anchor and unfold. EXTRAS: none warranted anywhere in the psalm (weighed and declined).

CREATE TEMP VIEW _s302_ps022_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): My Elohim, my Elohim, why hast thou forsaken me? (the Formed Son cries the very words from the tree)
    ('canon','psalms',22,1,'canon','matthew',27,46,'free',
      E'*And about the ninth hour Yahusha (Jesus) cried with a loud voice, saying, Eli, Eli, lama sabachthani? that is to say, My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Matthew 27:46). The psalm''s opening cry — *My Elohim (God), my Elohim (God), why hast thou forsaken me? why art thou so far from helping me* (Psalm 22:1) — is the very word Yahusha cries from the tree, a thousand years foretold and spoken almost letter for letter. Read through the Formed-and-the-Formless: the Formed Son in the flesh cries to the Father; He is Yahuah and has a Father, and the forsaking is real suffering borne in the body — never a tearing of the one Elohim into co-equal persons.'),
    ('canon','psalms',22,1,'canon','mark',15,34,'free',
      E'*And at the ninth hour Yahusha (Jesus) cried with a loud voice, saying, Eloi, Eloi, lama sabachthani? which is, being interpreted, My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Mark 15:34). The second gospel carries the same dereliction-cry, naming Psalm 22:1 from the cross — *My Elohim, my Elohim, why hast thou forsaken me?* The suffering one of the psalm and the suffering Son on the tree speak with one voice; the Formed Son took flesh and, in that flesh, cried the words David sang of the afflicted who is heard at the last.'),

    -- THREAD 2 (★★): They shoot out the lip, they shake the head — let him deliver him (the mockers' very words foretold)
    ('canon','psalms',22,7,'canon','matthew',27,39,'free',
      E'*And they that passed by reviled him, wagging their heads* (Matthew 27:39). The psalm foretold the very scorn — *All they that see me laugh me to scorn: they shoot out the lip, they shake the head* (Psalm 22:7) — and at the cross *they that passed by reviled him, wagging their heads*. The shaking of the head David saw in the spirit is the head wagged at Golgotha; the mockery is the conduct foretold, the reproach the afflicted one bears.'),
    ('canon','psalms',22,8,'canon','matthew',27,43,'free',
      E'*He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43). The mockers'' very taunt was written before they spoke it: *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him* (Psalm 22:8). The chief priests at the cross sneer the words of the psalm almost unaltered — *let him deliver him now* — the foretold scorn fulfilled out of their own mouths.'),
    ('canon','psalms',22,7,'canon','mark',15,29,'free',
      E'*And they that passed by railed on him, wagging their heads, and saying, Ah, thou that destroyest the temple, and buildest it in three days* (Mark 15:29). The second gospel keeps the same picture of *they shake the head* (Psalm 22:7): *they that passed by railed on him, wagging their heads*. The head-wagging scorn the psalm sang of the despised one is the scorn poured on the Son at the tree, the reproach of men and despised of the people made plain.'),

    -- THREAD 3: I am poured out like water — the dust of death (the physical agony; I thirst)
    ('canon','psalms',22,15,'canon','john',19,28,'free',
      E'*After this, Yahusha (Jesus) knowing that all things were now accomplished, that the scripture might be fulfilled, saith, I thirst* (John 19:28). The psalm''s bodily agony — *My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death* (Psalm 22:15) — is the thirst of the cross: the dried-up strength, the tongue cleaving to the jaws, answered in the single word *I thirst*, spoken that the scripture might be fulfilled. The suffering David sang in figure the Son endured in the flesh, brought to the dust of death.'),

    -- THREAD 4 (★★): They pierced my hands and my feet (the pierced hands and feet, the nail-prints shown)
    ('canon','psalms',22,16,'canon','john',19,37,'free',
      E'*And again another scripture saith, They shall look on him whom they pierced* (John 19:37). The psalm''s wound — *they pierced my hands and my feet* (Psalm 22:16) — is the piercing the gospel names at the cross: *They shall look on him whom they pierced*. The hands and feet bored through in the psalm are the hands and feet nailed to the tree; the scripture of the pierced one is read as fulfilled before the watching eyes.'),
    ('canon','psalms',22,16,'canon','zechariah',12,10,'free',
      E'*And I will pour upon the house of David, and upon the inhabitants of Jerusalem, the spirit of grace and of supplications: and they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn* (Zechariah 12:10). The Tanakh itself doubles the wound of *they pierced my hands and my feet* (Psalm 22:16): the prophet sees the day Yahuah''s own people *look upon me whom they have pierced* and mourn *as one mourneth for his only son*. The pierced One of the psalm is the pierced One of Zechariah — the two houses of David and Jerusalem brought to look and grieve over the One they thrust through.'),
    ('canon','psalms',22,16,'canon','john',20,25,'free',
      E'*The other disciples therefore said unto him, We have seen Yahuah (Lord). But he said unto them, Except I shall see in his hands the print of the nails, and put my finger into the print of the nails, and thrust my hand into his side, I will not believe* (John 20:25). After the rising, the pierced hands still bear the mark of *they pierced my hands and my feet* (Psalm 22:16): T''oma (Thomas) asks for *the print of the nails*, the very piercing of the psalm now risen with the body, the wounds carried through death into life.'),
    ('canon','psalms',22,16,'canon','john',20,27,'free',
      E'*Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing* (John 20:27). The risen One offers the pierced hands of *they pierced my hands and my feet* (Psalm 22:16) to be handled — *behold my hands... thrust it into my side*. The nail-prints the psalm foretold are shown as proof; the One who came up from the dust of death keeps the marks of the piercing.'),
    ('canon','psalms',22,16,'canon','luke',24,39,'free',
      E'*Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have* (Luke 24:39). The risen Yahusha points to the very members of *they pierced my hands and my feet* (Psalm 22:16): *Behold my hands and my feet*. The pierced hands and feet of the psalm are shown to the gathered ones as the sign of who He is — flesh and bone, the same body that bore the wounds, raised.'),

    -- THREAD 5 (★★): They part my garments among them, and cast lots upon my vesture (quoted as fulfillment by name)
    ('canon','psalms',22,18,'canon','john',19,24,'free',
      E'*They said therefore among themselves, Let us not rend it, but cast lots for it, whose it shall be: that the scripture might be fulfilled, which saith, They parted my raiment among them, and for my vesture they did cast lots. These things therefore the soldiers did* (John 19:24). The gospel quotes Psalm 22:18 by name as fulfilled at the cross — *They part my garments among them, and cast lots upon my vesture* (Psalm 22:18). The soldiers part the garments and, over the seamless coat, *cast lots for it... that the scripture might be fulfilled*: the psalm''s words become the soldiers'' deed, line for line.'),
    ('canon','psalms',22,18,'canon','matthew',27,35,'free',
      E'*And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots* (Matthew 27:35). The first gospel too names Psalm 22:18 as fulfilled — *They part my garments among them, and cast lots upon my vesture* (Psalm 22:18) — *that it might be fulfilled which was spoken by the prophet*. The dividing of the clothes and the lot cast over the vesture, sung by David, is done at the foot of the cross.'),

    -- THREAD 6 (★★): I will declare thy name unto my brethren (the risen One to the brethren; the turn to the congregation)
    ('canon','psalms',22,22,'canon','hebrews',2,12,'free',
      E'*Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12). The great turn of the psalm — from the dust of death to the gathered praise — is put in the mouth of the risen Son: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). Hebrews takes the verse whole as His own word; the One who cried *why hast thou forsaken me* is heard, and now stands in the midst of the congregation to declare the Name.'),
    ('canon','psalms',22,22,'canon','hebrews',2,11,'free',
      E'*For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren* (Hebrews 2:11). The setting of *I will declare thy name unto my brethren* (Psalm 22:22) is named here: *he is not ashamed to call them brethren*. The suffering One of the psalm, raised, owns the sanctified as His brethren — *all of one* — and in their midst declares the Name; the turn from affliction to the congregation is the turn from the cross to the gathered people.'),
    ('canon','psalms',22,22,'canon','john',20,17,'free',
      E'*Yahusha (Jesus) saith unto her, Touch me not; for I am not yet ascended to my Father: but go to my brethren, and say unto them, I ascend unto my Father, and your Father; and to my Elohim (God), and your Elohim (God)* (John 20:17). The risen Yahusha does the very thing of *I will declare thy name unto my brethren* (Psalm 22:22): on the first morning He sends word *to my brethren* and names the Father — *my Father, and your Father... my Elohim, and your Elohim*. The declaring of the Name to the brethren begins at the empty tomb, the psalm''s vindication breaking into the dawn.'),

    -- THREAD 7 (★): All the ends of the world shall turn — a seed shall serve him (the ingathering; the gospel-result preached)
    ('canon','psalms',22,27,'canon','luke',24,47,'free',
      E'*And that repentance and remission of sins should be preached in his name among all nations, beginning at Jerusalem* (Luke 24:47). The psalm''s ingathering — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee* (Psalm 22:27) — is the gospel-result of the suffering: the Name preached *among all nations, beginning at Jerusalem*, the kindreds of the nations turned to worship. The families of the earth are drawn IN to the One who *hath done this* — covenant-gathering, the nations brought to the covenant, never the covenant dissolved into them.'),
    ('canon','psalms',22,31,'canon','luke',24,46,'free',
      E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). The psalm''s closing word — *they shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this* (Psalm 22:31) — is the risen Messiah''s own reading of the suffering-and-rising: *it behoved Messiah to suffer, and to rise from the dead the third day*. The "he hath done this" the psalm declares to the people yet to be born is the finished work the gospel carries: the suffering ended, the vindication preached, the righteousness declared.'),
    ('canon','psalms',22,26,'canon','luke',24,26,'free',
      E'*Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26). The psalm''s turn to the satisfied and the living — *The meek shall eat and be satisfied: they shall praise Yahuah (LORD) that seek him: your heart shall live for ever* (Psalm 22:26) — follows the suffering into glory, exactly as the risen One opens the scriptures: *Ought not Messiah to have suffered these things, and to enter into his glory?* The afflicted who is heard becomes the One in whose vindication the meek eat and the heart lives for ever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps022_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps022_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-my-elohim-my-elohim-why-hast-thou-forsaken-me',
       E'My Elohim, my Elohim, why hast thou forsaken me — the cry from the tree',
       E'Psalm 22 opens with the loneliest words in all the Scriptures: *My Elohim (God), my Elohim (God), why hast thou forsaken me? why art thou so far from helping me, and from the words of my roaring?* (Psalm 22:1). David sings the cry of the afflicted one who feels the silence of heaven — *O my Elohim (God), I cry in the daytime, but thou hearest not* (Psalm 22:2) — yet holds fast: *But thou art holy, O thou that inhabitest the praises of Yashar''el (Israel)* (Psalm 22:3). A thousand years later the same cry breaks from the cross, almost letter for letter: *And about the ninth hour Yahusha (Jesus) cried with a loud voice, saying, Eli, Eli, lama sabachthani? that is to say, My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Matthew 27:46), and *Eloi, Eloi, lama sabachthani... My Elohim, my Elohim, why hast thou forsaken me?* (Mark 15:34). This is the great crucifixion psalm, and the framework reads the cry through the Formed-and-the-Formless: the FORMED Son, the One who appeared and spoke and led Yashar''el in the Tanakh, took on flesh, and in that flesh — at the dust of death — cried to the Father. He IS Yahuah and HAS a Father; the forsaking is real suffering borne in the body, the afflicted one feeling the far silence — NOT a rupture of the one Elohim into co-equal persons, NOT a tearing of the Godhead in two. The psalm that opens with the cry of dereliction ends with the cry HEARD (Psalm 22:24); the Son who cried *why hast thou forsaken me* is the Son raised and vindicated, the whole psalm spanning the tree and the empty tomb.',
       sv.verse_id, ev.verse_id, 'free', 22525
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-they-shoot-out-the-lip-let-him-deliver-him',
       E'They shoot out the lip, let him deliver him — the mockers'' words foretold',
       E'The psalm sees the scorn of the cross before there was a cross: *But I am a worm, and no man; a reproach of men, and despised of the people. All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying, He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him* (Psalm 22:6-8). The shaking head, the curled lip, the sneer that dares Yahuah to rescue — all written a thousand years before, then spoken almost unaltered at Golgotha. *And they that passed by reviled him, wagging their heads* (Matthew 27:39), and the chief priests sneered the psalm''s own taunt: *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43) — *let him deliver him now*, the very words of Psalm 22:8 out of their own mouths. The second gospel keeps the same picture: *they that passed by railed on him, wagging their heads* (Mark 15:29). Victims, not enemies: the mockery is the conduct the psalm foretold, the reproach the despised one bears — not a charge laid against a people, but the suffering of the afflicted one who is heard at the last. The mockers thought to expose a failed trust; they were reciting prophecy, fulfilling the psalm even as they jeered it.',
       sv.verse_id, ev.verse_id, 'free', 22528
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-poured-out-like-water-the-dust-of-death',
       E'I am poured out like water — brought into the dust of death',
       E'The psalm pours out the very physiology of crucifixion centuries before the Romans made it a craft: *I am poured out like water, and all my bones are out of joint: my heart is like wax; it is melted in the midst of my bowels. My strength is dried up like a potsherd; and my tongue cleaveth to my jaws; and thou hast brought me into the dust of death* (Psalm 22:14-15). The body hung and stretched until the bones pull from joint, the heart failing, the strength baked dry as a broken shard, the tongue stuck to the jaws for thirst. At the cross the dried strength of the psalm finds its single word: *After this, Yahusha (Jesus) knowing that all things were now accomplished, that the scripture might be fulfilled, saith, I thirst* (John 19:28). The tongue that cleaved to the jaws speaks the thirst; the One brought *into the dust of death* tastes death for every man. David sang the agony in figure; the Formed Son endured it in the flesh — poured out like water, and on the third day raised from the dust.',
       sv.verse_id, ev.verse_id, 'free', 22531
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-they-pierced-my-hands-and-my-feet',
       E'They pierced my hands and my feet — the wound foretold and the nail-prints shown',
       E'The psalm names the wound with terrible precision: *For dogs have compassed me: the assembly of the wicked have inclosed me: they pierced my hands and my feet* (Psalm 22:16). Hands and feet bored through — the very form of the death the Son would die. The Tanakh itself doubles the prophecy: *they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son, and shall be in bitterness for him, as one that is in bitterness for his firstborn* (Zechariah 12:10) — the pierced One the two houses of David and Jerusalem are brought at last to look upon and grieve. The gospel quotes the piercing as fulfilled: *And again another scripture saith, They shall look on him whom they pierced* (John 19:37). And the wound survives the grave: the risen One still bears the marks — *Except I shall see in his hands the print of the nails... I will not believe* (John 20:25), and He answers, *Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side* (John 20:27), and to the gathered ones, *Behold my hands and my feet, that it is I myself: handle me, and see* (Luke 24:39). The hands and feet pierced in the psalm are the hands and feet shown after the rising — the nail-prints carried through death into life, the proof of who He is. What was bored through on the tree is what is beheld at the resurrection.',
       sv.verse_id, ev.verse_id, 'free', 22534
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-they-part-my-garments-and-cast-lots',
       E'They part my garments and cast lots upon my vesture — fulfilled at the cross',
       E'Among the bones told and the body stared upon — *I may tell all my bones: they look and stare upon me* (Psalm 22:17) — the psalm sees even the soldiers'' gambling: *They part my garments among them, and cast lots upon my vesture* (Psalm 22:18). The garments divided, and over the one seamless piece a lot cast. Both gospels name this verse by name as fulfilled at the foot of the cross. John watches it happen to the seamless coat: *Then the soldiers, when they had crucified Yahusha (Jesus), took his garments, and made four parts, to every soldier a part; and also his coat: now the coat was without seam, woven from the top throughout. They said therefore among themselves, Let us not rend it, but cast lots for it, whose it shall be: that the scripture might be fulfilled, which saith, They parted my raiment among them, and for my vesture they did cast lots* (John 19:23-24). And Matthew: *And they crucified him, and parted his garments, casting lots: that it might be fulfilled which was spoken by the prophet, They parted my garments among them, and upon my vesture did they cast lots* (Matthew 27:35). The detail is so exact that the gospel writers simply lay the psalm beside the deed: David''s words and the soldiers'' dice are the same line. The mockers stripped Him and gambled for the cloth, and in doing so wrote their names into the prophecy.',
       sv.verse_id, ev.verse_id, 'free', 22537
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-i-will-declare-thy-name-unto-my-brethren',
       E'I will declare thy name unto my brethren — the risen One in the midst of the congregation',
       E'At verse 22 the psalm turns. The cry of dereliction is answered — *For he hath not despised nor abhorred the affliction of the afflicted; neither hath he hid his face from him; but when he cried unto him, he heard* (Psalm 22:24) — and the suffering one, vindicated, stands up in the gathered people: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). This is the hinge of the whole psalm: from the dust of death to the declared Name, from the lone cry to the praise in the great congregation. The letter to the Hebrews puts the verse in the mouth of the RISEN Son: *For both he that sanctifieth and they who are sanctified are all of one: for which cause he is not ashamed to call them brethren, Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:11-12). The One who tasted death is not ashamed to call the sanctified His brethren, and in their midst declares the Name. The declaring begins at the empty tomb itself: *go to my brethren, and say unto them, I ascend unto my Father, and your Father; and to my Elohim (God), and your Elohim (God)* (John 20:17). And the congregation is named in the psalm — *all ye the seed of Jacob... all ye the seed of Yashar''el (Israel)* (Psalm 22:23): the two-house people in whose midst the risen One declares the Name He bore through the dust of death.',
       sv.verse_id, ev.verse_id, 'free', 22540
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-22-the-ends-of-the-world-shall-turn-a-seed-shall-serve-him',
       E'All the ends of the world shall turn — a seed shall serve him',
       E'The psalm that began in the dust of death ends in the ingathering of the earth — the gospel-RESULT of the suffering. *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee. For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:27-28). The afflicted one heard becomes the One before whom the families of the earth bow; *A seed shall serve him; it shall be accounted to Yahuah (Lord) for a generation. They shall come, and shall declare his righteousness unto a people that shall be born, that he hath done this* (Psalm 22:30-31). The seed that serves, the people yet to be born, the righteousness declared — this is the harvest of the cross, and the risen Messiah reads it so: *Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day: And that repentance and remission of sins should be preached in his name among all nations, beginning at Jerusalem* (Luke 24:46-47), for *Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26). The two-house and seed weight is woven but kept covenant-gathering, never false-inclusion: *a seed shall serve him* and *all the kindreds of the nations* are drawn IN to worship the One who *hath done this* — the families of the earth brought to the covenant, beginning at Jerusalem, not the covenant dissolved into the nations. The psalm spans the whole arc: the forsaken cry, the pierced hands, the parted garments, the Name declared to the brethren, and at last the ends of the world turning to the One who has done it.',
       sv.verse_id, ev.verse_id, 'free', 22543
  FROM _s302_ps022_lookup sv, _s302_ps022_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=22 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Eli, Eli, lama sabachthani... My Elohim (God), my Elohim (God), why hast thou forsaken me?* (Matthew 27:46) — Yahusha cries Psalm 22:1 from the tree; the Formed Son in the flesh cries to the Father, real suffering, not a torn Godhead.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=1
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-my-elohim-my-elohim-why-hast-thou-forsaken-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Eloi, Eloi, lama sabachthani... My Elohim, my Elohim, why hast thou forsaken me?* (Mark 15:34) — the second gospel carries the same dereliction-cry of 22:1; one voice, the suffering one of the psalm and the suffering Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=1
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=15 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-my-elohim-my-elohim-why-hast-thou-forsaken-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they that passed by reviled him, wagging their heads* (Matthew 27:39) — the shaking head of *they shake the head* (22:7) at the cross; the foretold scorn fulfilled.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=7
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-shoot-out-the-lip-let-him-deliver-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He trusted in Elohim (God); let him deliver him now, if he will have him* (Matthew 27:43) — the chief priests sneer the very taunt of *let him deliver him* (22:8) out of their own mouths.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-shoot-out-the-lip-let-him-deliver-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they that passed by railed on him, wagging their heads* (Mark 15:29) — the head-wagging scorn of *they shake the head* (22:7) kept in the second gospel.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=7
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-shoot-out-the-lip-let-him-deliver-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahusha (Jesus)... saith, I thirst* (John 19:28) — the dried strength and tongue cleaving to the jaws of *brought me into the dust of death* (22:15) answered in one word at the cross.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=15
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-poured-out-like-water-the-dust-of-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*They shall look on him whom they pierced* (John 19:37) — the wound of *they pierced my hands and my feet* (22:16) named as fulfilled at the cross.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-pierced-my-hands-and-my-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall look upon me whom they have pierced... mourn for him, as one mourneth for his only son* (Zechariah 12:10) — the Tanakh lateral doubling *they pierced my hands and my feet* (22:16); the two houses brought to look on the pierced One.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-pierced-my-hands-and-my-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Except I shall see in his hands the print of the nails... I will not believe* (John 20:25) — the pierced hands of 22:16 still marked after the rising; T''oma (Thomas) asks for the nail-prints.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-pierced-my-hands-and-my-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*behold my hands; and reach hither thy hand, and thrust it into my side* (John 20:27) — the risen One offers the pierced hands of 22:16 to be handled, the nail-prints shown as proof.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-pierced-my-hands-and-my-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Behold my hands and my feet, that it is I myself: handle me, and see* (Luke 24:39) — the pierced hands AND feet of 22:16 shown to the gathered ones as the sign of who He is, raised.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-pierced-my-hands-and-my-feet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Let us not rend it, but cast lots for it... that the scripture might be fulfilled... They parted my raiment among them, and for my vesture they did cast lots* (John 19:24) — Psalm 22:18 quoted by name; the soldiers'' deed and David''s words one line.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-part-my-garments-and-cast-lots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*parted his garments, casting lots: that it might be fulfilled... They parted my garments among them, and upon my vesture did they cast lots* (Matthew 27:35) — the first gospel too names 22:18 as fulfilled at the cross.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-they-part-my-garments-and-cast-lots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12) — Psalm 22:22 put in the mouth of the risen Son; the cry heard, the Name declared in the midst of the congregation.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-i-will-declare-thy-name-unto-my-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he is not ashamed to call them brethren* (Hebrews 2:11) — the setting of *unto my brethren* (22:22); the raised One owns the sanctified as His own, all of one.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-i-will-declare-thy-name-unto-my-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*go to my brethren... I ascend unto my Father, and your Father; and to my Elohim (God), and your Elohim (God)* (John 20:17) — the declaring of the Name to the brethren of 22:22 begins at the empty tomb.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-i-will-declare-thy-name-unto-my-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*repentance and remission of sins should be preached in his name among all nations, beginning at Jerusalem* (Luke 24:47) — the ingathering of *all the kindreds of the nations shall worship* (22:27) preached; covenant-gathering, never false-inclusion.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=27
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-the-ends-of-the-world-shall-turn-a-seed-shall-serve-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46) — the closing *he hath done this* (22:31) read by the risen Messiah; the finished work declared to the people yet to be born.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=31
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-the-ends-of-the-world-shall-turn-a-seed-shall-serve-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ought not Messiah (Christ) to have suffered these things, and to enter into his glory?* (Luke 24:26) — the meek satisfied and the heart living for ever (22:26) follows the suffering into glory.'
  FROM cross_reference_threads t
  JOIN _s302_ps022_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=22 AND sv.verse_number=26
  JOIN _s302_ps022_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-22-the-ends-of-the-world-shall-turn-a-seed-shall-serve-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_23.sql (Psalm 23) -----
-- Chapter: Psalm 23 — THE SHEPHERD PSALM (Yahuah my shepherd → the Formed Son the good shepherd): *Yahuah Ra'ah (The LORD is my shepherd); I shall not want* — He maketh me lie down in green pastures, leadeth beside still waters, restoreth my soul, leadeth in the paths of righteousness for His name's sake; through the valley of the shadow of death *thou art with me*; a table prepared in the presence of enemies, the head anointed, the cup running over; *goodness and mercy shall follow me all the days of my life: and I will dwell in the house of Yahuah (LORD) for ever*. Read Yahuah-the-shepherd FORWARD to the Formed Son who took flesh, laid down His life for the sheep, and shepherds the regathered two-house flock.
-- Tag: ps023   Temp view: _s302_ps023_lookup
-- Sort band: base 22550, step 3 -> threads at 22550, 22553, 22556, 22559, 22562 (5 threads)
-- Source of EVERY row: 'canon','psalms',23,v
--
-- Psalm 23 coverage:
--   ★★ v.1 (Yahuah Ra'ah / The LORD is my shepherd; I shall not want)
--        NT:     John 10:11 (I am the good shepherd: the good shepherd giveth his life for the sheep), John 10:14 (I am the good shepherd, and know my sheep), John 10:16 (other sheep I have... one fold, and one shepherd — the two-house ingathering), Hebrews 13:20 (that great shepherd of the sheep), 1 Peter 2:25 (the Shepherd and Bishop of your souls), 1 Peter 5:4 (the chief Shepherd) — THREAD 1 (load-bearing: Yahuah-the-shepherd = the Formed Son)
--        Extras: none warranted (the shepherd-fulfillment weave is NT + Tanakh prophets; no extra-canonical witness adds to the shepherd type cleanly here)
--        Tanakh: ★ Ezekiel 34:11-12 (I, even I, will both search my sheep, and seek them out), Ezekiel 34:23 (I will set up one shepherd over them... even my servant David), Isaiah 40:11 (He shall feed his flock like a shepherd) — THREAD 1 (Yahuah-the-shepherd Himself comes to gather, and sets up the one David-shepherd = the two-house regathering)
--   v.2-3 (He maketh me to lie down in green pastures... He restoreth my soul: he leadeth me in the paths of righteousness for his name's sake)
--        NT:     Revelation 7:17 (the Lamb... shall feed them, and shall lead them unto living fountains of waters) — THREAD 2 (the Lamb-shepherd leads to the living waters; the still waters consummated)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 34:14-15 (I will feed them in a good pasture... there shall they lie in a good fold... I will cause them to lie down) — THREAD 2 (the same shepherd makes the flock lie down in good pasture)
--   v.4 (Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me)
--        NT:     Hebrews 13:5 (I will never leave thee, nor forsake thee), Hebrews 13:6 (Yahuah is my helper, and I will not fear what man shall do unto me) — THREAD 3 (the presence in death = the Immanuel comfort; I will not fear)
--        Extras: none warranted
--        Tanakh: none warranted distinct (the *thou art with me* presence is carried forward by Hebrews; Isaiah 41:10 fear-not sits in its own pack)
--   v.5 (Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over)
--        NT:     Revelation 7:16 (They shall hunger no more, neither thirst any more), Revelation 7:17 (the Lamb... shall feed them) — THREAD 4 (the prepared table consummated: the flock fed and satisfied before the throne)
--        Extras: none warranted
--        Tanakh: none warranted distinct (the table/anointing forward-weave is the throne-feast of Rev 7; no closer Tanakh lateral than the shepherd-feeds of Ezek 34, already at THREADS 1-2)
--   ★ v.6 (Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of Yahuah for ever)
--        NT:     Revelation 21:3 (the tabernacle of Elohim is with men, and he will dwell with them), Revelation 22:3-4 (his servants shall serve him: And they shall see his face) — THREAD 5 (the house of Yahuah for ever = the dwelling-with-Yahuah consummated, the everlasting habitation)
--        Extras: none warranted
--        Tanakh: none warranted distinct (the dwell-for-ever forward-weave is the New Jerusalem dwelling of Rev 21-22)
--
-- Threads (slug — target libraries):
--   1. psalm-23-yahuah-is-my-shepherd-the-good-shepherd — NT (John, Hebrews, 1 Peter) + Tanakh (Ezekiel, Isaiah) [free] (★★ Yahuah-the-shepherd = the Formed Son; one-shepherd-over-the-regathered-flock = two-house ingathering)
--   2. psalm-23-green-pastures-still-waters-he-restoreth-my-soul — NT (Revelation) + Tanakh (Ezekiel) [free] (the lie-down-in-good-pasture / lead-to-living-waters consummation)
--   3. psalm-23-the-valley-of-the-shadow-of-death-thou-art-with-me — NT (Hebrews) [free] (the presence in death = Immanuel comfort; I will not fear)
--   4. psalm-23-thou-preparest-a-table-before-me-my-cup-runneth-over — NT (Revelation) [free] (the prepared table consummated: hunger no more before the throne)
--   5. psalm-23-i-will-dwell-in-the-house-of-yahuah-for-ever — NT (Revelation) [free] (★ the house of Yahuah for ever = the everlasting dwelling-with-Yahuah)
--
-- Framing notes:
--   ★★ YAHUAH THE SHEPHERD = THE FORMED SON (THREAD 1): *Yahuah Ra'ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). Read through the Formed-and-the-Formless (lens #4): the Yahuah who shepherds in the psalm is the Formed Son who took flesh and said *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the same One, now in flesh, laying down His life. NOT a co-equal-persons grammar, NOT a modalist collapse: the Formed Son is Yahuah and has a Father. Hebrews names Him *that great shepherd of the sheep* (13:20); Kepha (Peter) *the Shepherd and Bishop of your souls* (1 Peter 2:25) and *the chief Shepherd* (5:4). And the two-house weight: Ezekiel 34 has Yahuah Himself come to *search my sheep, and seek them out* (34:11) and *set up one shepherd over them, even my servant David* (34:23) — the scattered flock gathered and the one David-shepherd over them, which John 10:16 names *other sheep I have, which are not of this fold: them also I must bring... one fold, and one shepherd* — the regathering of the scattered house of Yashar'el (Israel) into one flock under one shepherd. Isaiah 40:11 sings the same coming One: *He shall feed his flock like a shepherd*.
--   GREEN PASTURES / LIVING WATERS (THREAD 2): *He maketh me to lie down in green pastures... He restoreth my soul* (Psalm 23:2-3). Ezekiel's shepherd-Yahuah does the very thing — *I will feed them in a good pasture... there shall they lie in a good fold* (34:14) — and Revelation consummates it: *the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters* (7:17). The still waters the shepherd leads beside become the living fountains the Lamb leads to.
--   THE VALLEY / THOU ART WITH ME (THREAD 3): *though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me* (Psalm 23:4). The comfort is the PRESENCE — Immanuel, Yahuah-with-us, even in death. Hebrews quotes the covenant word *I will never leave thee, nor forsake thee* (13:5) and draws the same fearlessness: *Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (13:6). The rod and staff comfort because the Shepherd Himself is in the valley.
--   THE PREPARED TABLE (THREAD 4): *Thou preparest a table before me in the presence of mine enemies... my cup runneth over* (Psalm 23:5). The shepherd-host spreads the feast; Revelation shows it consummated before the throne — *They shall hunger no more, neither thirst any more* (7:16), *the Lamb... shall feed them* (7:17). The table set in the enemies' presence becomes the throne-feast where every want is filled.
--   ★ THE HOUSE FOR EVER (THREAD 5): *I will dwell in the house of Yahuah (LORD) for ever* (Psalm 23:6). The shepherd-psalm ends in the everlasting dwelling — and Revelation names it: *the tabernacle of Elohim (God) is with men, and he will dwell with them* (21:3), *his servants shall serve him: And they shall see his face* (22:3-4). The house of Yahuah for ever is the New Jerusalem dwelling-with-Yahuah, the flock home with the Shepherd at the last.
--   EXTRAS: NONE WARRANTED anywhere in Psalm 23. The shepherd type's fulfillment is carried entirely by the NT (John 10, Hebrews 13, 1 Peter, Revelation 7/21/22) and the Tanakh shepherd-prophets (Ezekiel 34, Isaiah 40). No clean extra-canonical witness (1 Enoch, Jubilees, Jasher, the Apocrypha, the Pseudepigrapha) adds to the shepherd/table/house weave here; recorded deliberately, not forced. ALL FIVE THREADS ARE 'free' (every member is canon Tanakh or NT).
--   VERSES WITH NO STANDALONE THREAD: none — every verse-block (v.1; v.2-3; v.4; v.5; v.6) carries a thread.

CREATE TEMP VIEW _s302_ps023_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Yahuah is my shepherd — the Formed good shepherd; the one-shepherd-over-the-regathered-flock
    ('canon','psalms',23,1,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). When the psalm sings *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1), the Yahuah who shepherds is the Formed Son who took flesh and said *I am the good shepherd*. Read through the Formed-and-the-Formless: the One who shepherded Yashar''el (Israel) in the Tanakh is the One who *giveth his life for the sheep* — Yahuah the Shepherd, and He has a Father; not two co-equal persons, not a collapse, but the Formed Son who is the Shepherd of the psalm now laying down His life.'),
    ('canon','psalms',23,1,'canon','john',10,14,'free',
      E'*I am the good shepherd, and know my sheep, and am known of mine* (John 10:14). The trust of *I shall not want* (Psalm 23:1) rests on being KNOWN by the Shepherd — *I am the good shepherd, and know my sheep, and am known of mine*. The sheep that lacks nothing is the sheep the Shepherd knows by name; the Formed Son who is Yahuah-my-shepherd knows His own and is known of them.'),
    ('canon','psalms',23,1,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The shepherd of *Yahuah is my shepherd* (Psalm 23:1) is the Shepherd who gathers the scattered into ONE flock — *other sheep I have, which are not of this fold... one fold, and one shepherd*. This is the two-house ingathering: the scattered house of Yashar''el (Israel) and the house of Yahudah (Judah) brought back under one Shepherd, the divided flock made one.'),
    ('canon','psalms',23,1,'canon','hebrews',13,20,'free',
      E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). The Shepherd of *Yahuah is my shepherd* (Psalm 23:1) is named in the letter as *that great shepherd of the sheep*, raised from the dead *through the blood of the everlasting covenant* — the Good Shepherd who laid down His life for the flock and was brought again, the living Shepherd the psalm trusts.'),
    ('canon','psalms',23,1,'canon','1-peter',2,25,'free',
      E'*For ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25). The flock of *Yahuah is my shepherd* (Psalm 23:1) is the flock that strayed and is brought home — *ye were as sheep going astray; but are now returned unto the Shepherd and Bishop of your souls*. The Shepherd who keeps so that the sheep *shall not want* is the One the straying are RETURNED to; the regathering of the lost sheep is His own work.'),
    ('canon','psalms',23,1,'canon','1-peter',5,4,'free',
      E'*And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4). The Shepherd of *Yahuah is my shepherd* (Psalm 23:1) is *the chief Shepherd* whose appearing crowns the flock — the under-shepherds feed Elohim''s heritage, but He is the Chief over them all, the One the whole psalm leans upon for the want that never comes.'),
    ('canon','psalms',23,1,'canon','ezekiel',34,11,'free',
      E'*For thus saith Adonai Yahuah (the Lord GOD); Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11). The confession *Yahuah is my shepherd* (Psalm 23:1) is the promise Ezekiel makes plain: Yahuah Himself will not leave the flock to hirelings — *I, even I, will both search my sheep, and seek them out*. The Shepherd of the psalm is the Shepherd who comes in person to gather the scattered sheep.'),
    ('canon','psalms',23,1,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The single Shepherd of *Yahuah is my shepherd* (Psalm 23:1) is the ONE shepherd Yahuah promises to set over the regathered flock — *one shepherd over them... even my servant David*. The scattered two houses are gathered under one David-shepherd; the Good Shepherd of John 10 is this promised One, root and offspring of David, over one flock.'),
    ('canon','psalms',23,1,'canon','isaiah',40,11,'free',
      E'*He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young* (Isaiah 40:11). Isaiah sings the coming One in the very tenderness of *Yahuah is my shepherd; I shall not want* (Psalm 23:1) — *He shall feed his flock like a shepherd... carry them in his bosom, and shall gently lead*. The Yahuah who comes with strong hand (40:10) is the Shepherd who carries the lambs in His bosom; might and gentleness are one in Him.'),

    -- THREAD 2: Green pastures, still waters, He restoreth my soul (the good-pasture lie-down; the living-waters consummation)
    ('canon','psalms',23,2,'canon','ezekiel',34,14,'free',
      E'*I will feed them in a good pasture, and upon the high mountains of Yashar''el (Israel) shall their fold be: there shall they lie in a good fold, and in a fat pasture shall they feed upon the mountains of Yashar''el (Israel)* (Ezekiel 34:14). The shepherd who *maketh me to lie down in green pastures* (Psalm 23:2) is the shepherd-Yahuah of Ezekiel who *will feed them in a good pasture... there shall they lie in a good fold*. The green pasture of the psalm is the good fold of the regathered flock on the mountains of Yashar''el (Israel) — the gathered sheep made to lie down in plenty.'),
    ('canon','psalms',23,3,'canon','ezekiel',34,15,'free',
      E'*I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 34:15). The restoring, leading shepherd of *He restoreth my soul: he leadeth me in the paths of righteousness for his name''s sake* (Psalm 23:3) is the Yahuah who declares *I will feed my flock, and I will cause them to lie down*. The leading-in-righteousness of the psalm is the shepherd''s own act — He feeds, He restores, He causes the flock to rest, for His name''s sake.'),
    ('canon','psalms',23,2,'canon','revelation',7,17,'free',
      E'*For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). The shepherd who *leadeth me beside the still waters* (Psalm 23:2) is consummated in the Lamb-Shepherd who *shall feed them, and shall lead them unto living fountains of waters*. The still waters the Shepherd leads beside become the living fountains the Lamb leads to — the same Shepherd, the same flock, the leading brought to its end.'),

    -- THREAD 3: The valley of the shadow of death — thou art with me (the Immanuel comfort)
    ('canon','psalms',23,4,'canon','hebrews',13,5,'free',
      E'*Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). The comfort of *thou art with me* (Psalm 23:4) is the covenant word Hebrews quotes: *I will never leave thee, nor forsake thee*. The fearlessness in the valley of the shadow of death is not the sheep''s courage but the Shepherd''s presence — He who promised never to leave is the *thou* who is WITH us in the dark valley.'),
    ('canon','psalms',23,4,'canon','hebrews',13,6,'free',
      E'*So that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6). The *I will fear no evil* of the valley (Psalm 23:4) is the very boldness Hebrews draws: *Yahuah (Lord) is my helper, and I will not fear what man shall do unto me*. Because the Shepherd is with us — *thy rod and thy staff they comfort me* — there is no evil in the shadow of death to dread; the presence answers the fear.'),

    -- THREAD 4: Thou preparest a table before me — my cup runneth over (the throne-feast consummated)
    ('canon','psalms',23,5,'canon','revelation',7,16,'free',
      E'*They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* (Revelation 7:16). The table prepared by the shepherd-host — *Thou preparest a table before me in the presence of mine enemies... my cup runneth over* (Psalm 23:5) — is consummated where the flock *shall hunger no more, neither thirst any more*. The cup that runs over in the enemies'' presence becomes the never-thirst of the throne; every want of the gathered sheep is filled.'),
    ('canon','psalms',23,5,'canon','revelation',7,17,'free',
      E'*For the Lamb which is in the midst of the throne shall feed them... and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). The shepherd-host who *preparest a table before me... thou anointest my head with oil; my cup runneth over* (Psalm 23:5) is the Lamb who *shall feed them* before the throne and wipe away all tears. The table spread in the presence of enemies becomes the throne-feast where the Shepherd Himself is the host and the flock wants for nothing.'),

    -- THREAD 5 (★): I will dwell in the house of Yahuah for ever (the everlasting dwelling-with-Yahuah)
    ('canon','psalms',23,6,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The psalm''s last word — *I will dwell in the house of Yahuah (LORD) for ever* (Psalm 23:6) — is consummated where *the tabernacle of Elohim (God) is with men, and he will dwell with them*. The house of Yahuah for ever is the New Jerusalem dwelling: the flock home with the Shepherd, Yahuah dwelling with His people without end.'),
    ('canon','psalms',23,6,'canon','revelation',22,3,'free',
      E'*And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3). The dwelling of *I will dwell in the house of Yahuah (LORD) for ever* (Psalm 23:6) is the house where *the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* — no more curse, the everlasting habitation where the sheep dwell with the Shepherd and serve Him for ever.'),
    ('canon','psalms',23,6,'canon','revelation',22,4,'free',
      E'*And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4). The forever-dwelling of *I will dwell in the house of Yahuah (LORD) for ever* (Psalm 23:6) is the place where *they shall see his face; and his name shall be in their foreheads*. The goodness and mercy that followed all the days of life end in this: the flock face to face with the Shepherd in His house, marked with His name, at home for ever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps023_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps023_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-23-yahuah-is-my-shepherd-the-good-shepherd',
       E'Yahuah is my shepherd — the Formed Son the good shepherd, one flock under one shepherd',
       E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). The whole psalm rests on this: the Most High is the Shepherd, and the sheep under Him lacks nothing. Read through the Formed-and-the-Formless: the Yahuah who shepherded Yashar''el (Israel) in the Tanakh is the Formed Son who took flesh and said *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11), *I am the good shepherd, and know my sheep, and am known of mine* (John 10:14). He is Yahuah the Shepherd, and He has a Father — not two co-equal persons, not a collapse into one, but the Formed Son who is the Shepherd of the psalm now laying down His life for the flock. The letter names Him *that great shepherd of the sheep* brought again from the dead *through the blood of the everlasting covenant* (Hebrews 13:20); Kepha (Peter) names Him *the Shepherd and Bishop of your souls* to whom the straying are *returned* (1 Peter 2:25), and *the chief Shepherd* whose appearing crowns the flock (1 Peter 5:4). And the two-house weight is written into the shepherd-promise itself: *Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11) — Yahuah comes in person — *And I will set up one shepherd over them... even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The scattered flock is gathered under ONE David-shepherd; and the Good Shepherd names it Himself: *other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16) — the house of Yashar''el (Israel) scattered among the nations and the house of Yahudah (Judah) brought back into one flock under one Shepherd, the divided sticks made one. Isaiah sings the same coming One: *He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom* (Isaiah 40:11). The Shepherd of the psalm is the Shepherd who comes, who dies, who gathers, and who is known of His own.',
       sv.verse_id, ev.verse_id, 'free', 22550
  FROM _s302_ps023_lookup sv, _s302_ps023_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=23 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-23-green-pastures-still-waters-he-restoreth-my-soul',
       E'Green pastures and still waters — He restoreth my soul, the good fold and the living fountains',
       E'*He maketh me to lie down in green pastures: he leadeth me beside the still waters. He restoreth my soul: he leadeth me in the paths of righteousness for his name''s sake* (Psalm 23:2-3). The Shepherd does the leading and the resting and the restoring — the sheep is made to lie down, led to water, restored, guided in right paths, and all of it *for his name''s sake*. The same shepherd-Yahuah of Ezekiel does the very thing for the regathered flock: *I will feed them in a good pasture... there shall they lie in a good fold, and in a fat pasture shall they feed upon the mountains of Yashar''el (Israel)* (Ezekiel 34:14), *I will feed my flock, and I will cause them to lie down, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 34:15). The green pasture of the psalm is the good fold of the gathered sheep on the mountains of Yashar''el (Israel). And Revelation carries the still-waters leading to its consummation: *the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). The still waters the Shepherd leads beside in the psalm become the living fountains the Lamb leads to at the last — the same Shepherd, the same leading, brought home.',
       sv.verse_id, ev.verse_id, 'free', 22553
  FROM _s302_ps023_lookup sv, _s302_ps023_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-23-the-valley-of-the-shadow-of-death-thou-art-with-me',
       E'The valley of the shadow of death — thou art with me (the Shepherd''s presence, the fearless walk)',
       E'*Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me* (Psalm 23:4). The deepest comfort of the psalm is not a place but a PRESENCE — *thou art with me*. Through the darkest valley the sheep fears no evil, not by its own courage but because the Shepherd Himself walks in the dark with it, His rod and staff at hand. The letter to the Hebrews names the ground of that fearlessness in the covenant word: *for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5), and draws the very boldness of the psalm: *So that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6). The *I will fear no evil* of the valley and the *I will not fear what man shall do unto me* of the letter are one confidence — the Shepherd who promised never to leave is the *thou* who is WITH the flock in the shadow of death. This is the Immanuel comfort: Yahuah-with-us, even in the dark.',
       sv.verse_id, ev.verse_id, 'free', 22556
  FROM _s302_ps023_lookup sv, _s302_ps023_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-23-thou-preparest-a-table-before-me-my-cup-runneth-over',
       E'Thou preparest a table before me — my cup runneth over (the throne-feast consummated)',
       E'*Thou preparest a table before me in the presence of mine enemies: thou anointest my head with oil; my cup runneth over* (Psalm 23:5). The Shepherd turns Host: a table spread, the head anointed, the cup overflowing — and all of it set out *in the presence of mine enemies*, the flock fed in safety while the foe looks on. Revelation shows that table consummated before the throne. *They shall hunger no more, neither thirst any more; neither shall the sun light on them, nor any heat* (Revelation 7:16) — the cup that runs over becomes the thirst that never returns. *For the Lamb which is in the midst of the throne shall feed them... and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17) — the same Shepherd-Host who prepared the table in the enemies'' presence is the Lamb who feeds the flock at the throne, where every want is filled and every tear wiped. The overflowing cup of the psalm is the foretaste of the throne-feast where the gathered sheep hunger and thirst no more.',
       sv.verse_id, ev.verse_id, 'free', 22559
  FROM _s302_ps023_lookup sv, _s302_ps023_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=23 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-23-i-will-dwell-in-the-house-of-yahuah-for-ever',
       E'I will dwell in the house of Yahuah for ever — the everlasting dwelling with the Shepherd',
       E'*Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of Yahuah (LORD) for ever* (Psalm 23:6). The shepherd-psalm ends not in the pasture but in the HOUSE — goodness and mercy at the heels all the days of life, and then the everlasting dwelling with Yahuah. Revelation names that house. *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3) — the dwelling-with-Yahuah made forever. *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3) — the house where the flock serves the Shepherd without end. *And they shall see his face; and his name shall be in their foreheads* (Revelation 22:4) — the sheep at last face to face with the Shepherd, marked with His name. The house of Yahuah for ever is the New Jerusalem: the flock home with the One who shepherded them through the green pastures, the dark valley, and the spread table — dwelling with Yahuah, and wanting for nothing, world without end.',
       sv.verse_id, ev.verse_id, 'free', 22562
  FROM _s302_ps023_lookup sv, _s302_ps023_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — Yahuah-my-shepherd (23:1) is the Formed Son in flesh, laying down His life for the flock.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the good shepherd, and know my sheep, and am known of mine* (John 10:14) — the *I shall not want* (23:1) of the sheep the Shepherd knows by name.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*other sheep I have, which are not of this fold... one fold, and one shepherd* (John 10:16) — the one Shepherd of 23:1 gathers the scattered two houses into one flock.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20) — the Shepherd of 23:1 raised from the dead, the living Good Shepherd.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*are now returned unto the Shepherd and Bishop of your souls* (1 Peter 2:25) — the straying sheep brought home to the Shepherd of 23:1; the regathering of the lost.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*when the chief Shepherd shall appear, ye shall receive a crown of glory* (1 Peter 5:4) — the Shepherd of 23:1 is the chief Shepherd over all, the One the psalm leans upon.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11) — the Shepherd of 23:1 comes in person to gather the scattered flock.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I will set up one shepherd over them... even my servant David* (Ezekiel 34:23) — the one Shepherd of 23:1 is the David-shepherd over the regathered two-house flock.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*He shall feed his flock like a shepherd... carry them in his bosom* (Isaiah 40:11) — the coming One sung in the tenderness of *Yahuah is my shepherd; I shall not want* (23:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-yahuah-is-my-shepherd-the-good-shepherd'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will feed them in a good pasture... there shall they lie in a good fold* (Ezekiel 34:14) — the green pastures of 23:2 = the good fold of the regathered flock on the mountains of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-green-pastures-still-waters-he-restoreth-my-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will feed my flock, and I will cause them to lie down* (Ezekiel 34:15) — the restoring, leading shepherd of 23:3 is Yahuah''s own act for His flock.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-green-pastures-still-waters-he-restoreth-my-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Lamb... shall feed them, and shall lead them unto living fountains of waters* (Revelation 7:17) — the still waters of 23:2 consummated in the living fountains the Lamb leads to.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-green-pastures-still-waters-he-restoreth-my-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will never leave thee, nor forsake thee* (Hebrews 13:5) — the ground of *thou art with me* (23:4): the Shepherd''s covenant promise of presence in the valley.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-the-valley-of-the-shadow-of-death-thou-art-with-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6) — the same boldness as *I will fear no evil* (23:4); the presence answers the fear.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-the-valley-of-the-shadow-of-death-thou-art-with-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*They shall hunger no more, neither thirst any more* (Revelation 7:16) — the overflowing cup of 23:5 becomes the never-thirst of the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-thou-preparest-a-table-before-me-my-cup-runneth-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the Lamb... shall feed them... and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17) — the prepared table of 23:5 consummated: the Shepherd-Host feeds the flock at the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-thou-preparest-a-table-before-me-my-cup-runneth-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the house of Yahuah for ever (23:6) = the New Jerusalem dwelling-with-Yahuah.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-i-will-dwell-in-the-house-of-yahuah-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3) — the house of 23:6 where the flock serves the Shepherd without end.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-i-will-dwell-in-the-house-of-yahuah-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they shall see his face; and his name shall be in their foreheads* (Revelation 22:4) — the forever-dwelling of 23:6: the flock face to face with the Shepherd, marked with His name.'
  FROM cross_reference_threads t
  JOIN _s302_ps023_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s302_ps023_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-23-i-will-dwell-in-the-house-of-yahuah-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_psalms_24.sql (Psalm 24) -----
-- Chapter: Psalm 24 — THE EARTH IS YAHUAH'S; THE CLEAN HANDS ASCEND THE HILL; THE KING OF GLORY ENTERS (a processional/enthronement psalm): "The earth is the LORD'S, and the fulness thereof... For he hath founded it upon the seas"; "Who shall ascend into the hill of Yahuah? ... He that hath clean hands, and a pure heart"; "This is the generation of them that seek him"; "Lift up your heads, O ye gates... and the King of glory shall come in. Who is this King of glory? Yahuah strong and mighty, Yahuah mighty in battle... Yahuah Tseva'ot (LORD of hosts), he is the King of glory."
-- Tag: ps024   Temp view: _s302_ps024_lookup
-- Sort band: base 22575, step 3 -> threads at 22575, 22578, 22581 (3 threads)
-- Source of EVERY row: 'canon','psalms',24,v
--
-- Psalm 24 coverage:
--   ★ v.1-2 (The earth is the LORD'S, and the fulness thereof; the world, and they that dwell therein. For he hath founded it upon the seas, and established it upon the floods)
--        NT:     ★ 1 Corinthians 10:26 (For the earth is Yahuah's, and the fulness thereof) — Sha'ul (Paul) quotes Psalm 24:1 verbatim; 1 Corinthians 10:28 (repeats the quote: for the earth is Yahuah's, and the fulness thereof) — THREAD 1 (load-bearing: the apostle hands the psalm forward as the ground of liberty)
--        Extras: none warranted (no clean creation-by-the-Word parallel in the extras set tied to this verse-block; the founding-on-the-seas is carried by the Genesis lateral)
--        Tanakh: ★ Genesis 1:9-10 (let the waters under the heaven be gathered together... and the gathering together of the waters called he Seas) — the founding of the earth UPON the seas, the Formed Son the agent of the founding word — THREAD 1
--   ★ v.3-6 (Who shall ascend into the hill of Yahuah? or who shall stand in his holy place? He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully... This is the generation of them that seek him)
--        NT:     ★ Matthew 5:8 (Blessed are the pure in heart: for they shall see Elohim) — the pure heart that ascends shall SEE Elohim; the conduct-keeping that ascends, never lawless — THREAD 2 (load-bearing NT forward)
--        Extras: none warranted (no clean ascend-the-hill conduct parallel in the extras set)
--        Tanakh: ★ Psalm 15:1-2 (Yahuah, who shall abide in thy tabernacle? who shall dwell in thy holy hill? He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart) — the close twin psalm, the entrance liturgy of the holy hill — THREAD 2
--   ★★ v.7-10 (Lift up your heads, O ye gates... and the King of glory shall come in. Who is this King of glory? Yahuah strong and mighty, Yahuah mighty in battle... Yahuah Tseva'ot (LORD of hosts), he is the King of glory)
--        NT:     ★ 1 Corinthians 2:8 (they would not have crucified Yahuah (Lord) of glory) — the King of glory = the Lord of glory, the Formed Son; Acts 1:9-11 (he was taken up; and a cloud received him out of their sight... shall so come in like manner) — the ascension/enthronement of the King of glory through the everlasting doors — THREAD 3 (load-bearing: King of glory entering = the Formed Son ascended, who is Yahuah of hosts)
--        Extras: none warranted (no clean Zion-entry / enthronement parallel in the extras set warranted here)
--        Tanakh: ★ Psalm 68:18 (Thou hast ascended on high, thou hast led captivity captive... that Yahuah Elohim might dwell among them) — the lateral ascent-to-the-holy-hill, Yahuah going up to His dwelling (the text Ephesians 4:8 quotes, kept here as its own Tanakh lateral) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. psalm-24-the-earth-is-the-lords-and-the-fulness-thereof — NT (1 Corinthians 10:26, 10:28) + Tanakh (Genesis 1:9-10) [free] (★ Paul quotes the psalm; the earth founded by the Word)
--   2. psalm-24-who-shall-ascend-the-clean-hands-and-pure-heart — NT (Matthew 5:8) + Tanakh (Psalm 15:1-2) [free] (★ the conduct that ascends the holy hill; the pure heart shall see Elohim)
--   3. psalm-24-the-king-of-glory-shall-come-in — NT (1 Corinthians 2:8, Acts 1:9, 1:11) + Tanakh (Psalm 68:18) [free] (★★ the King of glory = Yahuah of hosts = the Formed Son ascended/enthroned)
--
-- Framing notes:
--   ★ THE EARTH IS YAHUAH'S (THREAD 1): *The earth is the LORD'S, and the fulness thereof* (24:1). Sha'ul (Paul) lifts it verbatim into the dispute over meat: *For the earth is Yahuah's (Lord's), and the fulness thereof* (1 Corinthians 10:26, repeated 10:28). The psalm grounds the apostle: all is the Creator's, made by His word. *For he hath founded it upon the seas, and established it upon the floods* (24:2) reaches back to Genesis 1, where the Formed Son speaks the dry land out of the waters: *let the waters under the heaven be gathered together unto one place, and let the dry land appear* (Genesis 1:9). The founding is by the Word — the Formed agent of the Most High's creating speech — never a co-equal-persons grammar; the One who spoke the seas into their place is the One the psalm sings as owner of all.
--   ★ WHO SHALL ASCEND (THREAD 2): *Who shall ascend into the hill of Yahuah? ... He that hath clean hands, and a pure heart* (24:3-4). This is the entrance liturgy of the holy hill, and Psalm 15 is its close twin: *Yahuah, who shall abide in thy tabernacle? ... He that walketh uprightly, and worketh righteousness* (Psalm 15:1-2). The ascent is conduct-bound — clean hands, a pure heart, no vanity, no deceit — never lawless ascent. Yahusha (Jesus) carries the pure-heart requirement forward whole: *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8). The generation that seeks Yahuah is the generation that keeps clean hands; the seeing of Elohim is for the pure heart that ascends.
--   ★★ THE KING OF GLORY (THREAD 3): *Lift up your heads, O ye gates... and the King of glory shall come in. Who is this King of glory? Yahuah (LORD) strong and mighty, Yahuah (LORD) mighty in battle* (24:7-8), *Yahuah Tseva'ot (LORD of hosts), he is the King of glory* (24:10). Read through the Formed-and-the-Formless: the King of glory who enters the everlasting doors is the Formed Son, who IS Yahuah of hosts and is mighty in the seed-war battle — *they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). The entering through the gates is the ascension and enthronement: *he was taken up; and a cloud received him out of their sight... this same Yahusha (Jesus)... shall so come in like manner* (Acts 1:9,11). The lateral Tanakh ascent: *Thou hast ascended on high, thou hast led captivity captive... that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18) — Yahuah going up to His holy hill. King-of-glory = Yahuah strong and mighty = the Formed Son: no co-equal-persons grammar, no modalist collapse; the One mighty in battle who took flesh, ascended, and is enthroned.
--   EXTRAS: none warranted for this chapter. No clean creation-by-the-Word, ascend-the-hill, or Zion-entry/enthronement parallel in the restored extras set (1 Enoch, Jubilees, Jasher, the Apocrypha, the Pseudepigrapha, Adam-Eve, etc.) was found to bear this processional psalm without forcing — recorded as deliberately weighed and declined, not silently skipped. All three threads are therefore [free] (every member canon).
--   VERSES WITH NO ADD: none as a distinct gap — every verse-block (v.1-2, v.3-6, v.7-10) is carried by a thread. v.5-6 (He shall receive the blessing from Yahuah... This is the generation of them that seek him) and v.9 (the second Lift-up-your-heads refrain) are folded into THREADS 2 and 3 respectively, not given separate threads.

CREATE TEMP VIEW _s302_ps024_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: The earth is the LORD'S, and the fulness thereof (Paul quotes the psalm; the earth founded by the Word)
    ('canon','psalms',24,1,'canon','1-corinthians',10,26,'free',
      E'*For the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:26). Sha''ul (Paul) lifts the opening of the psalm word-for-word — *The earth is the LORD''S, and the fulness thereof; the world, and they that dwell therein* (Psalm 24:1) — and makes it the ground of the believer''s liberty at the table: all that is sold in the market is the Creator''s, for the whole earth and its fulness belong to Yahuah. The psalm''s confession becomes the apostle''s settled rule.'),
    ('canon','psalms',24,1,'canon','1-corinthians',10,28,'free',
      E'*But if any man say unto you, This is offered in sacrifice unto idols, eat not for his sake that shewed it, and for conscience sake: for the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:28). Sha''ul (Paul) repeats the psalm a second time as the reason behind the conscience-rule — *for the earth is Yahuah''s, and the fulness thereof* — driving home *The earth is the LORD''S, and the fulness thereof* (Psalm 24:1): because all is the Creator''s, nothing is unclean of itself, yet love yields for the brother''s sake.'),
    ('canon','psalms',24,2,'canon','genesis',1,9,'free',
      E'*And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9). The psalm''s *For he hath founded it upon the seas, and established it upon the floods* (Psalm 24:2) reaches straight back to the third day, when the dry land was spoken up out of the waters. The earth is the Maker''s because His word founded it upon the seas — the Formed who spoke is the agent of the founding.'),
    ('canon','psalms',24,2,'canon','genesis',1,10,'free',
      E'*And Elohim (God) called the dry land Earth; and the gathering together of the waters called he Seas: and Elohim (God) saw that it was good* (Genesis 1:10). The very *seas* and *floods* the psalm names — *he hath founded it upon the seas, and established it upon the floods* (Psalm 24:2) — are the Seas gathered and named at creation. The earth set firm above the waters is the work of the creating Word, the ground of the psalm''s claim that the whole earth is Yahuah''s.'),

    -- THREAD 2: Who shall ascend the hill — clean hands and a pure heart (the conduct that ascends; the pure heart shall see Elohim)
    ('canon','psalms',24,4,'canon','matthew',5,8,'free',
      E'*Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8). The psalm asks who may ascend and answers *He that hath clean hands, and a pure heart* (Psalm 24:4); Yahusha (Jesus) carries the pure heart forward to its end — the pure in heart *shall see Elohim*. The conduct that ascends the holy hill is the conduct that beholds the Most High; the requirement is not loosened in the kingdom but fulfilled — clean hands and a pure heart, never lawless ascent.'),
    ('canon','psalms',24,3,'canon','psalms',15,1,'free',
      E'*Yahuah (LORD), who shall abide in thy tabernacle? who shall dwell in thy holy hill?* (Psalm 15:1). The twin psalm asks the same question as *Who shall ascend into the hill of Yahuah? or who shall stand in his holy place?* (Psalm 24:3) — the entrance liturgy of the holy hill, the gate-question put to all who would draw near to Yahuah''s dwelling.'),
    ('canon','psalms',24,4,'canon','psalms',15,2,'free',
      E'*He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart* (Psalm 15:2). Psalm 15 answers the ascent-question exactly as Psalm 24 does — *He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully* (Psalm 24:4): the one who walks uprightly and speaks truth in his heart. The two psalms together are one liturgy of the clean conduct that abides in the holy hill; the seeking of Yahuah and the keeping of His way are one walk.'),

    -- THREAD 3 (★★): The King of glory shall come in (the King of glory = Yahuah of hosts = the Formed Son ascended/enthroned)
    ('canon','psalms',24,7,'canon','1-corinthians',2,8,'free',
      E'*Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). The King who enters the everlasting doors — *the King of glory shall come in* (Psalm 24:7) — is the *Yahuah (Lord) of glory* Sha''ul (Paul) names: the Formed Son who is Yahuah strong and mighty, the One the rulers crucified not knowing the glory they handled. The King of glory of the psalm and the Lord of glory of the gospel are one.'),
    ('canon','psalms',24,7,'canon','acts',1,9,'free',
      E'*And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight* (Acts 1:9). The cry *Lift up your heads, O ye gates... and the King of glory shall come in* (Psalm 24:7) is the ascension: the Formed Son taken up, the cloud receiving him, the everlasting doors opening for the King of glory to enter and be enthroned. The processional of the psalm is the going-up of the risen One to His holy hill.'),
    ('canon','psalms',24,7,'canon','acts',1,11,'free',
      E'*Which also said, Ye men of Galilee, why stand ye gazing up into heaven? this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11). The King of glory who enters the gates — *the King of glory shall come in* (Psalm 24:7) — is *this same Yahusha (Jesus)* taken up, who *shall so come in like manner*. The same One who ascends through the everlasting doors will descend again the same way; the enthronement of the psalm and the promised return are bound in the one Formed Son.'),
    ('canon','psalms',24,8,'canon','psalms',68,18,'free',
      E'*Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men; yea, for the rebellious also, that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18). The King of glory who is *Yahuah (LORD) strong and mighty, Yahuah (LORD) mighty in battle* (Psalm 24:8) is the One who has *ascended on high* to His holy hill, leading captivity captive. The lateral psalm sings the same ascent the gates fling open for — Yahuah going up to dwell among His people, the mighty-in-battle One enthroned.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps024_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps024_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-24-the-earth-is-the-lords-and-the-fulness-thereof',
       E'The earth is the LORD''S, and the fulness thereof — founded upon the seas',
       E'The psalm opens with a confession of the whole creation: *The earth is the LORD''S, and the fulness thereof; the world, and they that dwell therein* (Psalm 24:1), *For he hath founded it upon the seas, and established it upon the floods* (Psalm 24:2). All is the Creator''s — the ground of the whole psalm''s claim of His kingship. Sha''ul (Paul) takes the line up verbatim and makes it the rule of the believer''s liberty at the table: *For the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:26), and again *eat not for his sake that shewed it, and for conscience sake: for the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:28) — because all is the Maker''s, nothing is unclean of itself, yet love yields for the brother. And the founding *upon the seas* reaches back to the third day of creation, when the dry land was spoken up out of the waters: *Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9), *and the gathering together of the waters called he Seas: and Elohim (God) saw that it was good* (Genesis 1:10). The earth set firm above the floods is the work of the creating Word — the Formed who spoke, the agent of the Most High''s founding speech, never a co-equal-persons grammar. The One who set the seas in their place owns the earth and its fulness.',
       sv.verse_id, ev.verse_id, 'free', 22575
  FROM _s302_ps024_lookup sv, _s302_ps024_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=24 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-24-who-shall-ascend-the-clean-hands-and-pure-heart',
       E'Who shall ascend the hill — clean hands and a pure heart',
       E'The processional turns to the gate-question: *Who shall ascend into the hill of Yahuah (LORD)? or who shall stand in his holy place?* (Psalm 24:3). And the answer is conduct, not confession alone: *He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully* (Psalm 24:4). The one who ascends *shall receive the blessing from Yahuah (LORD), and righteousness from the Elohim (God) of his salvation* (Psalm 24:5) — *This is the generation of them that seek him* (Psalm 24:6). The seeking and the clean hands are one walk; the ascent is bound to the keeping. Psalm 15 is the close twin, the same entrance liturgy of the holy hill: *Yahuah (LORD), who shall abide in thy tabernacle? who shall dwell in thy holy hill?* (Psalm 15:1) — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart* (Psalm 15:2). And Yahusha (Jesus) carries the pure-heart requirement forward to its end, never loosening it but fulfilling it: *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8). The conduct that ascends the holy hill is the conduct that beholds the Most High; the generation that seeks Yahuah with clean hands is the generation that shall see Him. This is never lawless ascent — the pure heart and the clean hands are the very gate.',
       sv.verse_id, ev.verse_id, 'free', 22578
  FROM _s302_ps024_lookup sv, _s302_ps024_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=24 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-24-the-king-of-glory-shall-come-in',
       E'Lift up your heads, O ye gates — the King of glory shall come in',
       E'The psalm climbs to its great cry, the gates flung open for the One who comes: *Lift up your heads, O ye gates; and be ye lift up, ye everlasting doors; and the King of glory shall come in* (Psalm 24:7). And the question is asked and answered twice: *Who is this King of glory? Yahuah (LORD) strong and mighty, Yahuah (LORD) mighty in battle* (Psalm 24:8), *Yahuah Tseva''ot (LORD of hosts), he is the King of glory* (Psalm 24:10). Read through the Formed-and-the-Formless: the King of glory who enters the everlasting doors is the Formed Son, who IS Yahuah of hosts and is mighty in the seed-war battle — and Sha''ul (Paul) names him by this very title: *they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). The King of glory of the psalm and the Lord of glory of the gospel are one. The entering through the gates is the ascension and enthronement: *while they beheld, he was taken up; and a cloud received him out of their sight* (Acts 1:9) — *this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11): the One who ascends through the everlasting doors will descend the same way. And the lateral psalm sings the same ascent the gates open for: *Thou hast ascended on high, thou hast led captivity captive... that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18) — Yahuah going up to His holy hill to dwell with His people. King-of-glory = Yahuah strong and mighty = the Formed Son: no co-equal-persons grammar, no modalist collapse; the One mighty in battle who took flesh, ascended, and is enthroned the King of glory.',
       sv.verse_id, ev.verse_id, 'free', 22581
  FROM _s302_ps024_lookup sv, _s302_ps024_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=24 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *For the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:26) — Sha''ul (Paul) quotes Psalm 24:1 verbatim as the ground of the believer''s liberty: all is the Creator''s.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=1
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-earth-is-the-lords-and-the-fulness-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*eat not... for the earth is Yahuah''s (Lord''s), and the fulness thereof* (1 Corinthians 10:28) — Paul repeats Psalm 24:1 a second time as the reason behind the conscience-rule; love yields, yet all is the Maker''s.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=1
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-earth-is-the-lords-and-the-fulness-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Let the waters under the heaven be gathered together... and let the dry land appear* (Genesis 1:9) — the founding *upon the seas* of 24:2 is the third-day word; the Formed who spoke is the agent of the founding.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-earth-is-the-lords-and-the-fulness-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the gathering together of the waters called he Seas: and Elohim (God) saw that it was good* (Genesis 1:10) — the *seas* and *floods* of 24:2 are the Seas named at creation; the earth set firm above the waters is the creating Word''s work.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-earth-is-the-lords-and-the-fulness-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8) — the *pure heart* that ascends (24:4) is the heart that shall see Elohim; the requirement fulfilled, never loosened.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=4
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-who-shall-ascend-the-clean-hands-and-pure-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD), who shall abide in thy tabernacle? who shall dwell in thy holy hill?* (Psalm 15:1) — the twin psalm asks the same gate-question as *Who shall ascend into the hill of Yahuah?* (24:3).'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-who-shall-ascend-the-clean-hands-and-pure-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart* (Psalm 15:2) — Psalm 15 answers the ascent-question exactly as *clean hands, and a pure heart* (24:4); one liturgy of the clean conduct.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=4
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-who-shall-ascend-the-clean-hands-and-pure-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8) — the King of glory who comes in (24:7) is the Lord of glory, the Formed Son; Paul names him by the psalm''s own title.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=7
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-king-of-glory-shall-come-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he was taken up; and a cloud received him out of their sight* (Acts 1:9) — the everlasting doors opening for *the King of glory* to come in (24:7) is the ascension of the Formed Son to His holy hill.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=7
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-king-of-glory-shall-come-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*this same Yahusha (Jesus), which is taken up... shall so come in like manner* (Acts 1:11) — the King who enters the gates (24:7) is the One taken up who shall return the same way; enthronement and promised return in the one Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=7
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-king-of-glory-shall-come-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou hast ascended on high, thou hast led captivity captive... that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18) — the lateral ascent of *Yahuah strong and mighty* (24:8); Yahuah going up to His holy hill to dwell with His people.'
  FROM cross_reference_threads t
  JOIN _s302_ps024_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s302_ps024_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-24-the-king-of-glory-shall-come-in'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session302 — Psalms cross-references complete.'
