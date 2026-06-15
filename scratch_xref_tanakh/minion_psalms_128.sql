-- ----- fragment: minion_psalms_128.sql (Psalm 128) -----
-- Chapter: Psalm 128 — Song of Ascents; the blessing on the one who FEARS Yahuah and WALKS in his ways
-- Tag: ps128   Session prefix: s302   View: _s302_ps128_lookup
-- Sort band BASE = 25175 (25175, 25178, 25181, 25184)
--
-- THREADS (4):
--   psalm-128-blessed-is-everyone-that-feareth-Yahuah-that-walketh-in-his-ways  [Tanakh + NT]  band 25175
--       v1,4 — the Torah-walk itself IS the blessing; the anti-antinomian center
--   psalm-128-thou-shalt-eat-the-labour-of-thine-hands-it-shall-be-well-with-thee  [extras]  band 25178
--       v2 — the covenant-blessing of Deut28 (vs the curse) + Isa3:10 + Sirach
--   psalm-128-thy-wife-a-fruitful-vine-thy-children-like-olive-plants  [extras]  band 25181
--       v3 — the seed/heritage of promise; two-house olive (Rom11 with the guard)
--   psalm-128-Yahuah-bless-thee-out-of-Zion-and-peace-upon-Yashar-el  [Tanakh + NT]  band 25184
--       v5,6 — blessing from Zion, the good of Jerusalem, shalom on the whole house
--
-- Psalm 128 coverage:
--   v.1  NT:     1 John 2:3-6 (walk as he walked = keep his commandments)
--        Extras: Ecclesiasticus 1:11,14 (the fear of Yahuah = the beginning of wisdom) — placed in thread 1
--        Tanakh: Psalm 1:1-2; Deuteronomy 10:12-13; Proverbs 1:7; Ecclesiastes 12:13
--   v.2  NT:     none warranted (Gal6:7 sow/reap weighed; covenant-blessing frame is OT, kept tight)
--        Extras: Ecclesiasticus 1:13 (it shall go well with him at the last)
--        Tanakh: Deuteronomy 28:1-6; Isaiah 3:10 (it shall be well with the righteous, vs the curse)
--   v.3  NT:     Romans 11:17-24 (the olive tree, both branches Yashar'el — with the v.1-2 guard)
--        Extras: Ecclesiasticus 26:1-3 (a good wife given to them that fear Yahuah)
--        Tanakh: Psalm 127:3 (children an heritage of Yahuah)
--   v.4  NT:     (folded into thread 1, the v.1 inclusio)
--        Extras: (see v.1)
--        Tanakh: (see v.1)
--   v.5  NT:     none warranted (kept with v.6 in the Zion/Israel thread)
--        Extras: none warranted
--        Tanakh: Psalm 134:3 (Yahuah that made heaven and earth bless thee out of Zion)
--   v.6  NT:     Galatians 6:16 (peace upon the Yashar'el of Elohim); Romans 11:1-2 (guard)
--        Extras: none warranted
--        Tanakh: Psalm 125:5 (peace shall be upon Yashar'el); Deuteronomy 7:9 (covenant to a thousand generations)
--
-- Contested/load-bearing framing:
--   v.1/v.4 — *that walketh in his ways* is read as the Torah-walk = the blessing, NOT a vague piety;
--     1John2:3-6 supplies the apostolic filter (*hereby we do know that we know him, if we keep his
--     commandments*), Torah-keeping NEVER abolished.
--   v.3 — the OLIVE PLANTS draw Rom11's two-house olive, BUT the guard is carried in the member note:
--     both branches are Yashar'el (Rom11:1-2 *Elohim hath not cast away his people*), never replacement.

CREATE TEMP VIEW _s302_ps128_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: v.1,4 — the Torah-walk IS the blessing
    ('canon','psalms',128,1,'canon','psalms',1,2,'free',
      E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). The Psalter opens on the same blessing it sings here in the ascents: *Blessed is every one that feareth Yahuah (LORD); that walketh in his ways* (Psalm 128:1). To walk in his ways is to delight in his Torah — the blessed man of Psalm 1 and the blessed man of Psalm 128 are one and the same, the Torah-keeper, not the antinomian.'),
    ('canon','psalms',128,1,'canon','deuteronomy',10,12,'free',
      E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12). The psalm''s two verbs — *feareth Yahuah* and *walketh in his ways* — are lifted straight from Moses'' charge; the next breath names what the walk is: *To keep the commandments of Yahuah (LORD), and his statutes* (Deuteronomy 10:13).'),
    ('canon','psalms',128,1,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). The fear that opens Psalm 128 is the same fear that opens all wisdom — not dread but covenant reverence that bends the whole life to his instruction.'),
    ('canon','psalms',128,1,'canon','ecclesiastes',12,13,'free',
      E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The Preacher distils the entire pursuit to the very two things Psalm 128 calls blessed — *feareth Yahuah* and *walketh in his ways* — fear and commandment-keeping fused as the whole of man.'),
    ('canon','psalms',128,1,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4). The apostle hands us the filter for *walketh in his ways*: the walk is commandment-keeping, and *He that saith he abideth in him ought himself also so to walk, even as he walked* (1 John 2:6). The Torah-walk of Psalm 128 is never abolished — it is the proof one knows him.'),
    ('canon','psalms',128,4,'canon','psalms',128,1,'free',
      E'*Blessed is every one that feareth Yahuah (LORD); that walketh in his ways* (Psalm 128:1). Verse 4 seals the psalm''s inclusio — *Behold, that thus shall the man be blessed that feareth Yahuah (LORD)* (Psalm 128:4) — pointing back to verse 1: the whole blessing hangs on the fear of Yahuah and the walk in his ways, the frame around everything between.'),
    -- THREAD 2: v.2 — the covenant-blessing of the labour of the hands
    ('canon','psalms',128,2,'canon','deuteronomy',28,2,'free',
      E'*And all these blessings shall come on thee, and overtake thee, if thou shalt hearken unto the voice of Yahuah Elohayka (the LORD thy God)* (Deuteronomy 28:2). The eating of *the labour of thine hands* is the Deuteronomy blessing for the obedient — *Yahuah (LORD) shall open unto thee his good treasure... and to bless all the work of thine hand* (Deuteronomy 28:12) — the very reversal of the curse, where *a nation which thou knowest not* eats up *the fruit of thy land, and all thy labours* (Deuteronomy 28:33).'),
    ('canon','psalms',128,2,'canon','deuteronomy',28,33,'free',
      E'*The fruit of thy land, and all thy labours, shall a nation which thou knowest not eat up; and thou shalt be only oppressed and crushed alway* (Deuteronomy 28:33). This is the curse that *thou shalt eat the labour of thine hands* (Psalm 128:2) overturns: under judgment a stranger devours the harvest; under the blessing of the fear of Yahuah the labourer himself eats and is glad. The Torah-walk decides which side of Deuteronomy 28 a man lives on.'),
    ('canon','psalms',128,2,'canon','isaiah',3,10,'free',
      E'*Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings* (Isaiah 3:10). Isaiah pronounces over the righteous exactly what the psalm promises — *happy shalt thou be, and it shall be well with thee* (Psalm 128:2) — while the wicked, by contrast, *it shall be ill with him: for the reward of his hands shall be given him* (Isaiah 3:11). The same two harvests Psalm 128 quietly assumes.'),
    ('canon','psalms',128,2,'apocrypha','ecclesiasticus',1,13,'extras',
      E'*Whoso fears Yahuah (God), it shall go well with him at the last, and he shall find favour in the day of his death* (Ecclesiasticus 1:13). Ben Sira sings the psalm''s own promise back — *happy shalt thou be, and it shall be well with thee* (Psalm 128:2) — and stretches the well-being clear to the last day, the fear of Yahuah carrying the blessing past the table to the grave.'),
    -- THREAD 3: v.3 — the fruitful vine, the olive plants, the seed of promise
    ('canon','psalms',128,3,'canon','psalms',127,3,'free',
      E'*Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3). The ascent just before this one names what Psalm 128 pictures: *thy children like olive plants round about thy table* (Psalm 128:3) are the heritage and reward of Yahuah, the seed of promise given, never earned.'),
    ('canon','psalms',128,3,'canon','romans',11,17,'free',
      E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* (Romans 11:17). The *olive plants* round the table grow into Paul''s one olive of Yashar''el — but with the guard he himself sets: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2), and *all Yashar''el (Israel) shall be saved* (Romans 11:26). Both branches, natural and wild, are the one covenant people; never a new people replacing the old, only the scattered seed regathered to the root.'),
    ('canon','psalms',128,3,'apocrypha','ecclesiasticus',26,3,'extras',
      E'*A good wife is a good portion, which shall be given in the portion of them that fear Yahuah (God)* (Ecclesiasticus 26:3). Ben Sira binds the *fruitful vine by the sides of thine house* (Psalm 128:3) to the same condition the whole psalm turns on — the wife is the portion *of them that fear Yahuah* — *Blessed is the man that has a virtuous wife, for the number of his days shall be double* (Ecclesiasticus 26:1).'),
    -- THREAD 4: v.5,6 — blessing out of Zion, peace upon Yashar'el
    ('canon','psalms',128,5,'canon','psalms',134,3,'free',
      E'*Yahuah (LORD) that made heaven and earth bless thee out of Zion* (Psalm 134:3). The closing ascent answers Psalm 128''s plea word for word — *Yahuah (LORD) shall bless thee out of Zion* (Psalm 128:5) — the Maker of heaven and earth sending the household''s blessing from the one mountain where his name dwells.'),
    ('canon','psalms',128,6,'canon','psalms',125,5,'free',
      E'*As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel)* (Psalm 125:5). Psalm 128 ends on the very same benediction — *and peace upon Yashar''el (Israel)* (Psalm 128:6) — the household blessing widening out to shalom on the whole house, both sticks made one.'),
    ('canon','psalms',128,6,'canon','galatians',6,16,'free',
      E'*And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16). Paul closes Galatians on the psalm''s closing word — *peace... upon the Yashar''el of Elohim* — pronounced not over a replacement people but over those who *walk according to this rule*, the same Torah-walk Psalm 128 opens with (v.1) and ends blessing (v.6).'),
    ('canon','psalms',128,6,'canon','deuteronomy',7,9,'free',
      E'*Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9). *Thou shalt see thy children''s children* (Psalm 128:6) is this generational covenant in a single household''s view — the faithfulness that runs *to a thousand generations* shown in grandchildren round one table, the covenant kept with *them that... keep his commandments*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps128_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps128_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-128-blessed-is-everyone-that-feareth-Yahuah-that-walketh-in-his-ways',
       E'Blessed is every one that feareth Yahuah, that walketh in his ways',
       E'Psalm 128 opens and closes on one truth: *Blessed is every one that feareth Yahuah (LORD); that walketh in his ways* (Psalm 128:1), sealed at the center — *Behold, that thus shall the man be blessed that feareth Yahuah (LORD)* (Psalm 128:4). The Torah-walk itself is the blessing. This is the anti-antinomian center of the ascents.\n\nThe two verbs are not the psalmist''s invention; they are Moses'' charge: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways... To keep the commandments of Yahuah (LORD), and his statutes* (Deuteronomy 10:12-13). And they are the Psalter''s own first word: *Blessed is the man... his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2). The fear of Yahuah is *the beginning of knowledge* (Proverbs 1:7) and the whole of man: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13).\n\nThe apostle hands us the filter so no one can spiritualise the walk into nothing: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:3-4) — *He that saith he abideth in him ought himself also so to walk, even as he walked* (1 John 2:6). The walk of Psalm 128 is commandment-keeping, and it is never abolished. To walk in his ways is the blessing, not the prelude to it.',
       sv.verse_id, ev.verse_id, 'free', 25175
  FROM _s302_ps128_lookup sv, _s302_ps128_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=128 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=128 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-128-thou-shalt-eat-the-labour-of-thine-hands-it-shall-be-well-with-thee',
       E'Thou shalt eat the labour of thine hands: it shall be well with thee',
       E'*For thou shalt eat the labour of thine hands: happy shalt thou be, and it shall be well with thee* (Psalm 128:2). This is the covenant-blessing of Deuteronomy 28 in a single line — the harvest the labourer himself eats. The blessing is conditioned exactly as the psalm is: *if thou shalt hearken unto the voice of Yahuah Elohayka (the LORD thy God)... Yahuah (LORD) shall open unto thee his good treasure... and to bless all the work of thine hand* (Deuteronomy 28:2,12).\n\nIts shadow is the curse the psalm silently overturns: *The fruit of thy land, and all thy labours, shall a nation which thou knowest not eat up* (Deuteronomy 28:33). Under judgment a stranger devours what you grow; under the fear of Yahuah you eat your own labour and are glad. Isaiah pronounces the same two harvests: *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings* (Isaiah 3:10), while *Woe unto the wicked! it shall be ill with him* (Isaiah 3:11).\n\nBen Sira sings the promise on past the table: *Whoso fears Yahuah (God), it shall go well with him at the last, and he shall find favour in the day of his death* (Ecclesiasticus 1:13). The fear of Yahuah carries the *it shall be well with thee* of Psalm 128 clear to the last day.',
       sv.verse_id, ev.verse_id, 'extras', 25178
  FROM _s302_ps128_lookup sv, _s302_ps128_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=128 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=128 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-128-thy-wife-a-fruitful-vine-thy-children-like-olive-plants',
       E'Thy wife a fruitful vine, thy children like olive plants',
       E'*Thy wife shall be as a fruitful vine by the sides of thine house: thy children like olive plants round about thy table* (Psalm 128:3). The household of the man who fears Yahuah is the seed of promise made visible — and the seed is gift, never wage: *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3), the ascent just before.\n\nThe *olive plants* round the table grow into the one olive of Yashar''el. *And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them... partakest of the root and fatness of the olive tree* (Romans 11:17) — but read with the guard Paul himself nails down: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2), and *all Yashar''el (Israel) shall be saved* (Romans 11:26). Both branches, natural and wild, are the one covenant people regathered to the root — never a new people replacing the old.\n\nBen Sira ties the fruitful wife to the very fear the psalm turns on: *A good wife is a good portion, which shall be given in the portion of them that fear Yahuah (God)* (Ecclesiasticus 26:3) — *Blessed is the man that has a virtuous wife, for the number of his days shall be double* (Ecclesiasticus 26:1).',
       sv.verse_id, ev.verse_id, 'extras', 25181
  FROM _s302_ps128_lookup sv, _s302_ps128_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=128 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=128 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-128-Yahuah-bless-thee-out-of-Zion-and-peace-upon-Yashar-el',
       E'Yahuah bless thee out of Zion, and peace upon Yashar''el',
       E'The psalm widens from one table to the whole house: *Yahuah (LORD) shall bless thee out of Zion: and thou shalt see the good of Jerusalem all the days of thy life. Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel)* (Psalm 128:5-6). The blessing comes *out of Zion*, the one mountain where his name dwells, answered by the closing ascent: *Yahuah (LORD) that made heaven and earth bless thee out of Zion* (Psalm 134:3).\n\nAnd it ends where Psalm 125 ends: *but peace shall be upon Yashar''el (Israel)* (Psalm 125:5) — shalom on the whole house, both sticks made one. Paul seals Galatians with this same benediction over those who keep the Torah-walk: *as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16) — not a replacement people but the covenant people, for *Elohim (God) hath not cast away his people* (Romans 11:1-2).\n\n*Thou shalt see thy children''s children* is the generational covenant in one household''s view: *the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9) — the thousand generations seen in grandchildren round the table.',
       sv.verse_id, ev.verse_id, 'free', 25184
  FROM _s302_ps128_lookup sv, _s302_ps128_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=128 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=128 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (128,1,'canon','psalms',1,2,1,E'Psalm 1:2 — *his delight is in the law of Yahuah... in his law doth he meditate day and night*: the Psalter''s first blessed man is the Torah-keeper, identical to the blessed walker of Psalm 128:1.'),
    (128,1,'canon','deuteronomy',10,12,2,E'Deuteronomy 10:12 — Moses'' charge, *to fear Yahuah... to walk in all his ways*: the psalm''s two verbs lifted from Torah, and v.13 names the walk as keeping the commandments.'),
    (128,1,'canon','proverbs',1,7,3,E'Proverbs 1:7 — *The fear of Yahuah is the beginning of knowledge*: the fear that opens Psalm 128 is the fear that opens all wisdom.'),
    (128,1,'canon','ecclesiastes',12,13,4,E'Ecclesiastes 12:13 — *Fear Elohim, and keep his commandments: for this is the whole duty of man*: fear and commandment-keeping fused, the whole of Psalm 128:1.'),
    (128,1,'canon','1-john',2,3,5,E'1 John 2:3-4 — *if we keep his commandments... He that saith, I know him, and keepeth not his commandments, is a liar*: the apostolic filter that *walketh in his ways* means commandment-keeping, never abolished (v.6, walk as he walked).'),
    (128,4,'canon','psalms',128,1,6,E'Psalm 128:1 — v.4 (*thus shall the man be blessed that feareth Yahuah*) seals the inclusio back to v.1: the whole blessing hangs on the fear of Yahuah and the walk in his ways.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-128-blessed-is-everyone-that-feareth-Yahuah-that-walketh-in-his-ways'
  JOIN _s302_ps128_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps128_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (128,2,'canon','deuteronomy',28,2,1,E'Deuteronomy 28:2 — the covenant blessing *if thou shalt hearken*: eating the labour of one''s hands is the Deuteronomy reward for obedience (v.12, bless all the work of thine hand).'),
    (128,2,'canon','deuteronomy',28,33,2,E'Deuteronomy 28:33 — the curse the psalm overturns: *all thy labours shall a nation which thou knowest not eat up*. The fear of Yahuah decides which side of Deut 28 a man eats on.'),
    (128,2,'canon','isaiah',3,10,3,E'Isaiah 3:10 — *it shall be well with him: for they shall eat the fruit of their doings*: Isaiah pronounces over the righteous exactly Psalm 128:2''s *it shall be well with thee* (v.11 the wicked''s opposite).'),
    (128,2,'apocrypha','ecclesiasticus',1,13,4,E'Ecclesiasticus 1:13 — *Whoso fears Yahuah, it shall go well with him at the last*: Ben Sira stretches the psalm''s well-being past the table to the day of death.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-128-thou-shalt-eat-the-labour-of-thine-hands-it-shall-be-well-with-thee'
  JOIN _s302_ps128_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps128_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (128,3,'canon','psalms',127,3,1,E'Psalm 127:3 — *children are an heritage of Yahuah... the fruit of the womb is his reward*: the seed of promise round the table is gift, never wage.'),
    (128,3,'canon','romans',11,17,2,E'Romans 11:17 — the olive plants grow into the one olive of Yashar''el; read with Paul''s own guard (11:2 *hath not cast away his people*; 11:26 *all Yashar''el shall be saved*): both branches the one covenant people, never replacement.'),
    (128,3,'apocrypha','ecclesiasticus',26,3,3,E'Ecclesiasticus 26:3 — *A good wife... given in the portion of them that fear Yahuah*: the fruitful vine bound to the very fear the whole psalm turns on (26:1, days doubled).')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-128-thy-wife-a-fruitful-vine-thy-children-like-olive-plants'
  JOIN _s302_ps128_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps128_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (128,5,'canon','psalms',134,3,1,E'Psalm 134:3 — *Yahuah that made heaven and earth bless thee out of Zion*: the closing ascent answers Psalm 128:5 word for word, the Maker sending blessing from his mountain.'),
    (128,6,'canon','psalms',125,5,2,E'Psalm 125:5 — *but peace shall be upon Yashar''el*: the psalm''s closing benediction, shalom on the whole house, both sticks made one.'),
    (128,6,'canon','galatians',6,16,3,E'Galatians 6:16 — *peace... upon the Yashar''el of Elohim*, pronounced over those who *walk according to this rule*: the Torah-walk of v.1 blessed again at v.6, never a replacement people.'),
    (128,6,'canon','deuteronomy',7,9,4,E'Deuteronomy 7:9 — *keepeth covenant and mercy... to a thousand generations*: *thy children''s children* is the generational covenant seen in one household, kept with them that keep his commandments.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-128-Yahuah-bless-thee-out-of-Zion-and-peace-upon-Yashar-el'
  JOIN _s302_ps128_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps128_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
