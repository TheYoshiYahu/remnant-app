-- ----- fragment: minion_psalms_127.sql (Psalm 127) -----
-- Chapter: Psalm 127 — A SONG OF ASCENTS OF SOLOMON (5 verses): the house and the heritage.
-- The pilgrim psalm divides cleanly in two. vv.1-2 declare that nothing stands but what Yahuah
-- (LORD) builds — *Except Yahuah (LORD) build the house, they labour in vain that build it: except
-- Yahuah (LORD) keep the city, the watchman waketh but in vain* (v.1) — and that anxious toil is
-- vain against the rest He gives His beloved (v.2). The Builder and the Keeper are read through the
-- Formed Son who builds the assembly and keeps Yashar'el (Israel). vv.3-5 turn to the seed of
-- promise: *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward*
-- (v.3) — the paternal heritage line, the strong seed like arrows in a mighty man's hand (vv.4-5),
-- the quiver full that shall not be ashamed but speak with the enemies in the gate.
-- Tag: ps127   Temp view: _s302_ps127_lookup
-- Sort band: base 25150, step 3 -> threads at 25150,25153,25156,25159 (4 threads)
-- Source of EVERY row: 'canon','psalms',127,v
-- ⚠ SLUG PREFIX SINGULAR: psalm-127- (NOT psalms-)
--
-- Psalm 127 coverage:
--   ★★ v.1 (Except Yahuah build the house... except Yahuah keep the city, the watchman waketh in vain)
--        NT:     ★ Hebrews 3:4 (he that built all things is Elohim), ★ Matthew 16:18 (upon this rock
--                I will build my church), 1 Corinthians 3:9-11 (ye are Elohim's building... other
--                foundation can no man lay) — THREAD 1
--        Extras: none warranted (the Builder/Keeper weave carried by NT + Tanakh through the Formed Son)
--        Tanakh: ★ Zechariah 4:6 (not by might, nor by power, but by my spirit), ★ Psalm 121:4 (he that
--                keepeth Yashar'el shall neither slumber nor sleep) — THREAD 1
--   v.2 (It is vain for you to rise up early... to eat the bread of sorrows: for so he giveth his beloved sleep)
--        NT:     ★ Matthew 6:25 (Take no thought for your life), Matthew 6:33-34 (seek ye first... take
--                no thought for the morrow) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Psalm 3:5 (I laid me down and slept; I awaked; for Yahuah sustained me),
--                ★ Proverbs 10:22 (the blessing of Yahuah maketh rich, and he addeth no sorrow) — THREAD 2
--   ★★ v.3 (Lo, children are an heritage of Yahuah: and the fruit of the womb is his reward)
--        NT:     none warranted (the heritage/seed-of-promise weave is a Torah/Tanakh covenant line)
--        Extras: none warranted
--        Tanakh: ★ Genesis 33:5 (the children which Elohim hath graciously given thy servant),
--                ★ Psalm 113:9 (he maketh the barren woman... a joyful mother of children),
--                Psalm 112:2 (his seed shall be mighty upon earth),
--                Psalm 128:3-4 (thy children like olive plants round about thy table) — THREAD 3
--   vv.4-5 (As arrows are in the hand of a mighty man... Happy is the man that hath his quiver full of them...
--          they shall speak with the enemies in the gate)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Genesis 22:17 (thy seed shall possess the gate of his enemies),
--                ★ Psalm 144:12 (that our sons may be as plants grown up in their youth),
--                Psalm 128:3 (thy children like olive plants) — THREAD 4

CREATE TEMP VIEW _s302_ps127_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Except Yahuah build the house, except Yahuah keep the city
    ('canon','psalms',127,1,'canon','hebrews',3,4,'free',
      E'*For every house is builded by some man; but he that built all things is Elohim (God)* (Hebrews 3:4). *Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1): the psalm and the letter speak as one — every house has its builder, but behind every builder stands the One who built all things; the labour of men is vain unless it is Yahuah who builds, the Formed Son through whom all things were made.'),
    ('canon','psalms',127,1,'canon','matthew',16,18,'free',
      E'*And I say also unto thee, That thou art Peter, and upon this rock I will build my church; and the gates of hell shall not prevail against it* (Matthew 16:18). *Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1): the house that stands is the one Yahusha (Jesus) Himself builds — *I will build* — the Formed Son raising His assembly upon the rock; what He builds the gates of the grave cannot overthrow, while every house built without Him is raised in vain.'),
    ('canon','psalms',127,1,'canon','1-corinthians',3,9,'free',
      E'*For we are labourers together with Elohim (God): ye are Elohim''s (God''s) husbandry, ye are Elohim''s (God''s) building* (1 Corinthians 3:9). *Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1): the builders are labourers TOGETHER WITH Elohim — the building is His, not theirs; Paul names what the psalm declares, that the work is vain unless Yahuah is the true Builder of the house.'),
    ('canon','psalms',127,1,'canon','1-corinthians',3,11,'free',
      E'*For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11). *Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1): the only foundation that does not fail is the Formed Son Himself — no man can lay another; the house built on Him stands, and every wall raised on another footing is the vain labour the psalm warns against.'),
    ('canon','psalms',127,1,'canon','zechariah',4,6,'free',
      E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). *Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1): Zechariah names the same truth over the rebuilding of the temple — the house rises not by human might nor power but by the Spirit of Yahuah; the labour of the watchman and the builder is vain unless His Spirit raises the work.'),
    ('canon','psalms',127,1,'canon','psalms',121,4,'free',
      E'*Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). *Except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1): the human watchman keeps watch in vain, for the true Keeper of the city is the Keeper of Yashar''el (Israel) who never slumbers — the sleepless Guardian of His people, beside whom every mortal watch is needless toil.'),

    -- THREAD 2 (★): He giveth his beloved sleep — rest against anxious toil
    ('canon','psalms',127,2,'canon','matthew',6,25,'free',
      E'*Therefore I say unto you, Take no thought for your life, what ye shall eat, or what ye shall drink; nor yet for your body, what ye shall put on. Is not the life more than meat, and the body than raiment?* (Matthew 6:25). *It is vain for you to rise up early, to sit up late, to eat the bread of sorrows: for so he giveth his beloved sleep* (Psalm 127:2): the anxious toil of the psalm is the very care Yahusha (Jesus) forbids — rising early and sitting late to eat the bread of sorrows is taking thought for the life; the beloved is given rest instead, freed from the worry that gains nothing.'),
    ('canon','psalms',127,2,'canon','matthew',6,33,'free',
      E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). *It is vain for you to rise up early, to sit up late, to eat the bread of sorrows: for so he giveth his beloved sleep* (Psalm 127:2): the cure for vain toil is to seek first the kingdom — what the anxious cannot wring from their labour is ADDED to the one who trusts; so the beloved sleeps, his provision the gift of Yahuah, not the wage of his sleepless striving.'),
    ('canon','psalms',127,2,'canon','psalms',3,5,'free',
      E'*I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5). *for so he giveth his beloved sleep* (Psalm 127:2): the sleep of the beloved is the sleep of trust — David lies down in the midst of his enemies and wakes, for Yahuah sustains him through the night; the rest that the anxious cannot find is the gift of the One who keeps His own while they sleep.'),
    ('canon','psalms',127,2,'canon','proverbs',10,22,'free',
      E'*The blessing of Yahuah (LORD), it maketh rich, and he addeth no sorrow with it* (Proverbs 10:22). *It is vain for you to rise up early, to sit up late, to eat the bread of sorrows: for so he giveth his beloved sleep* (Psalm 127:2): the bread of sorrows is the harvest of toil apart from Yahuah; but the blessing of Yahuah makes rich and adds NO sorrow — what He gives carries no anxious grief, so the beloved eats and sleeps in peace.'),

    -- THREAD 3 (★★): Children are an heritage of Yahuah, the fruit of the womb his reward
    ('canon','psalms',127,3,'canon','genesis',33,5,'free',
      E'*And he lifted up his eyes, and saw the women and the children; and said, Who are those with thee? And he said, The children which Elohim (God) hath graciously given thy servant* (Genesis 33:5). *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3): Jacob names his children exactly as the psalm does — not his own achievement but *graciously given* by Elohim; the seed of the patriarch, the carriers of the promise, are the heritage and reward of Yahuah, the paternal covenant line bestowed by grace.'),
    ('canon','psalms',127,3,'canon','psalms',113,9,'free',
      E'*He maketh the barren woman to keep house, and to be a joyful mother of children. Praise ye Yahuah (LORD)* (Psalm 113:9). *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3): the fruit of the womb is Yahuah''s to give — He opens the barren and makes her a joyful mother, as He did for Sarah and Rachel and Hannah; the heritage of children is His reward, the seed of promise He alone bestows.'),
    ('canon','psalms',127,3,'canon','psalms',112,2,'free',
      E'*His seed shall be mighty upon earth: the generation of the upright shall be blessed* (Psalm 112:2). *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3): the heritage of children is the covenant blessing on the seed — the mighty seed of the upright that 112 sings is the very reward 127 names; the line of the righteous, blessed and made strong upon the earth, is Yahuah''s heritage to His servant.'),
    ('canon','psalms',127,3,'canon','psalms',128,3,'free',
      E'*Thy wife shall be as a fruitful vine by the sides of thine house: thy children like olive plants round about thy table* (Psalm 128:3). *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3): the next song of ascents continues the same heritage — the fruitful vine and the olive plants round the table are the fruit of the womb of 127; the children Yahuah gives fill the house of the man who fears Him, the heritage made visible at his table.'),

    -- THREAD 4 (★): As arrows in the hand of a mighty man — the strong seed at the gate
    ('canon','psalms',127,4,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). *As arrows are in the hand of a mighty man; so are children of the youth* (Psalm 127:4): the strong seed of the psalm is the multiplied seed of the Abrahamic oath — children like arrows in the warrior''s hand, the seed that *shall possess the gate of his enemies*; the very gate-victory of v.5 (*they shall speak with the enemies in the gate*) is the promise sworn to Abraham.'),
    ('canon','psalms',127,5,'canon','genesis',22,17,'free',
      E'*and thy seed shall possess the gate of his enemies* (Genesis 22:17). *Happy is the man that hath his quiver full of them: they shall not be ashamed, but they shall speak with the enemies in the gate* (Psalm 127:5): the gate where the seed prevails is the gate of Abraham''s oath — the man with a full quiver shall not be put to shame but stands and speaks with the enemies in the gate, for his seed possesses that gate by the covenant promise.'),
    ('canon','psalms',127,4,'canon','psalms',144,12,'free',
      E'*That our sons may be as plants grown up in their youth; that our daughters may be as corner stones, polished after the similitude of a palace* (Psalm 144:12). *As arrows are in the hand of a mighty man; so are children of the youth* (Psalm 144:12)... *so are children of the youth* (Psalm 127:4): the children of the youth, the strong seed, are the sons grown up like sturdy plants and the daughters like polished corner stones — the heritage of a flourishing house, the covenant blessing on the next generation that David prays over Yashar''el (Israel).'),
    ('canon','psalms',127,5,'canon','psalms',128,3,'free',
      E'*Thy wife shall be as a fruitful vine by the sides of thine house: thy children like olive plants round about thy table* (Psalm 128:3). *Happy is the man that hath his quiver full of them: they shall not be ashamed, but they shall speak with the enemies in the gate* (Psalm 127:5): the happy man with the full quiver is the man whose table is ringed with olive-plant children — the two songs of ascents sing one blessing, the household full of the seed Yahuah gives, unashamed and strong in the gate.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps127_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps127_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

-- THREAD 1 (★★): Except Yahuah build the house (v.1)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-127-except-yahuah-build-the-house-they-labour-in-vain',
       E'Except Yahuah Build the House — the Formed Son Builds and Keeps',
       E'Solomon''s song of ascents opens with the foundation of everything: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1). Nothing stands but what Yahuah builds, and nothing is safe but what Yahuah keeps. Hebrews names the Builder behind every builder: *For every house is builded by some man; but he that built all things is Elohim (God)* (Hebrews 3:4). The house that endures is the one the Formed Son raises Himself — *upon this rock I will build my church; and the gates of hell shall not prevail against it* (Matthew 16:18) — built on the only foundation that cannot fail: *other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11), for *ye are Elohim''s (God''s) building* (1 Corinthians 3:9). And the work rises not by human strength: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The watchman who keeps the city wakes in vain, for the true Keeper never sleeps: *Behold, he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4). The Builder who builds and the Keeper who guards are the Formed Son, beside whom every labour and every watch apart from Him is vain.',
       sv.verse_id, ev.verse_id, 'free', 25150
  FROM _s302_ps127_lookup sv, _s302_ps127_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=127 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★): He giveth his beloved sleep (v.2)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-127-he-giveth-his-beloved-sleep',
       E'He Giveth His Beloved Sleep — Rest Against Anxious Toil',
       E'*It is vain for you to rise up early, to sit up late, to eat the bread of sorrows: for so he giveth his beloved sleep* (Psalm 127:2). The anxious striving that rises early and sits late, eating the bread of sorrows, is the very care the Formed Son forbids: *Take no thought for your life, what ye shall eat, or what ye shall drink; nor yet for your body, what ye shall put on* (Matthew 6:25). The cure is to trust the Provider — *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33) — what the sleepless cannot wring from their labour is added to the one who rests in Yahuah. So the beloved lies down in peace: *I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5). And the bread he eats carries no grief, for *the blessing of Yahuah (LORD), it maketh rich, and he addeth no sorrow with it* (Proverbs 10:22). The beloved is given sleep — provision that is gift, not the bitter wage of striving.',
       sv.verse_id, ev.verse_id, 'free', 25153
  FROM _s302_ps127_lookup sv, _s302_ps127_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=127 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★): Children are an heritage of Yahuah (v.3)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-127-children-are-an-heritage-of-yahuah',
       E'Children Are an Heritage of Yahuah — the Seed of Promise',
       E'*Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3). The seed is not a man''s achievement but Yahuah''s gift and reward — the paternal covenant line bestowed by grace. Jacob names his children in the same breath: *The children which Elohim (God) hath graciously given thy servant* (Genesis 33:5) — the seed of the patriarch, carriers of the promise, *graciously given*. The fruit of the womb is His to open: *He maketh the barren woman to keep house, and to be a joyful mother of children* (Psalm 113:9), as He did for Sarah and Hannah. This heritage is the covenant blessing on the seed — *His seed shall be mighty upon earth: the generation of the upright shall be blessed* (Psalm 112:2) — made visible at the table of the man who fears Yahuah: *thy children like olive plants round about thy table* (Psalm 128:3). The children are an heritage, the seed of promise, Yahuah''s reward to His servant.',
       sv.verse_id, ev.verse_id, 'free', 25156
  FROM _s302_ps127_lookup sv, _s302_ps127_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=127 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★): As arrows in the hand of a mighty man (vv.4-5)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-127-as-arrows-in-the-hand-of-a-mighty-man',
       E'As Arrows in the Hand of a Mighty Man — the Strong Seed in the Gate',
       E'*As arrows are in the hand of a mighty man; so are children of the youth. Happy is the man that hath his quiver full of them: they shall not be ashamed, but they shall speak with the enemies in the gate* (Psalm 127:4-5). The strong seed, like arrows in a warrior''s hand, is the multiplied seed of the oath sworn to Abraham: *in multiplying I will multiply thy seed as the stars of the heaven... and thy seed shall possess the gate of his enemies* (Genesis 22:17). The very gate where the full quiver prevails is the gate of that covenant promise — the seed that *shall possess the gate of his enemies*. This is the flourishing household David prays over Yashar''el (Israel): *That our sons may be as plants grown up in their youth; that our daughters may be as corner stones, polished after the similitude of a palace* (Psalm 144:12), the table ringed with the seed: *thy children like olive plants round about thy table* (Psalm 128:3). The man with the quiver full shall not be ashamed, for his seed is the covenant blessing, strong in the gate.',
       sv.verse_id, ev.verse_id, 'free', 25159
  FROM _s302_ps127_lookup sv, _s302_ps127_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=127 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he that built all things is Elohim (God)* (Hebrews 3:4) — behind every builder stands the One who built all things; the Formed Son through whom all was made.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*upon this rock I will build my church* (Matthew 16:18) — the Formed Son builds His own assembly; what He builds the gates of the grave cannot prevail against.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*ye are Elohim''s (God''s) building* (1 Corinthians 3:9) — the builders are labourers TOGETHER WITH Elohim; the building is His.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11) — the only foundation that does not fail is the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the house rises by His Spirit, not human strength.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he that keepeth Yashar''el (Israel) shall neither slumber nor sleep* (Psalm 121:4) — the true Keeper of the city never sleeps; the human watchman wakes in vain.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=1
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-except-yahuah-build-the-house-they-labour-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Take no thought for your life, what ye shall eat, or what ye shall drink* (Matthew 6:25) — the anxious toil of the psalm is the very care the Formed Son forbids.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=2
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-he-giveth-his-beloved-sleep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*seek ye first the kingdom of Elohim (God)... and all these things shall be added unto you* (Matthew 6:33) — what the anxious cannot wring from toil is added to the one who trusts.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=2
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-he-giveth-his-beloved-sleep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I laid me down and slept; I awaked; for Yahuah (LORD) sustained me* (Psalm 3:5) — the sleep of the beloved is the sleep of trust, sustained through the night.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=2
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-he-giveth-his-beloved-sleep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the blessing of Yahuah (LORD), it maketh rich, and he addeth no sorrow with it* (Proverbs 10:22) — His blessing carries no grief; the bread of sorrows is toil apart from Him.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=2
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-he-giveth-his-beloved-sleep'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The children which Elohim (God) hath graciously given thy servant* (Genesis 33:5) — Jacob names his seed exactly as the psalm does: graciously given, not earned.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=3
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=33 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-children-are-an-heritage-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He maketh the barren woman... a joyful mother of children* (Psalm 113:9) — the fruit of the womb is Yahuah''s to open, as for Sarah and Hannah.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=3
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=113 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-children-are-an-heritage-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*His seed shall be mighty upon earth: the generation of the upright shall be blessed* (Psalm 112:2) — the heritage of children is the covenant blessing on the seed.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=3
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=112 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-children-are-an-heritage-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thy children like olive plants round about thy table* (Psalm 128:3) — the next song of ascents shows the heritage made visible at the table of the man who fears Yahuah.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=3
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-children-are-an-heritage-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy seed shall possess the gate of his enemies* (Genesis 22:17) — the strong seed like arrows is the multiplied seed of Abraham''s oath.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=4
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-as-arrows-in-the-hand-of-a-mighty-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*and thy seed shall possess the gate of his enemies* (Genesis 22:17) — the gate where the full quiver prevails is the gate of Abraham''s oath; the man shall not be ashamed.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=5
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-as-arrows-in-the-hand-of-a-mighty-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*That our sons may be as plants grown up in their youth; that our daughters may be as corner stones* (Psalm 144:12) — the children of the youth, the strong seed of a flourishing house.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=4
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=144 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-as-arrows-in-the-hand-of-a-mighty-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thy children like olive plants round about thy table* (Psalm 128:3) — the happy man with the full quiver is the man whose table is ringed with olive-plant children.'
  FROM cross_reference_threads t
  JOIN _s302_ps127_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=127 AND sv.verse_number=5
  JOIN _s302_ps127_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-127-as-arrows-in-the-hand-of-a-mighty-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
