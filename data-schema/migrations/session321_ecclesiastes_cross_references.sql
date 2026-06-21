-- =====================================================================
-- Session 321 — Ecclesiastes FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session321_ecclesiastes_cross_references.sql
-- =====================================================================

\echo 'session321 — Ecclesiastes cross-references starting...'
BEGIN;

-- ----- fragment: minion_ecclesiastes_1.sql (Ecclesiastes 1) -----
-- Chapter: Ecclesiastes 1 — "Vanity of vanities," the Preacher's quest
-- Tag: ecc01 ; session prefix s321 ; temp view _s321_ecc01_lookup
-- Slug prefix: ecclesiastes-1-... ; sort_order band start 38900 (+1 per thread)
-- Source book_slug=ecclesiastes, chapter 1 (edition canon).
--
-- LENS: Qoheleth (the Preacher, son of David) is not a nihilist. He is dismantling the idol of
-- self-sufficient wisdom, pleasure, and labor "under the sun" — life measured by the closed
-- horizon, apart from the eternal Elohim — to drive the reader to the book's own conclusion:
-- "Fear Elohim (God), and keep his commandments" (Ecclesiastes 12:13). hevel = breath/vapor.
-- The futility is of the creature severed from the Creator, answered by the One who endures and
-- makes all things new.
--
-- Ecclesiastes 1 coverage:
--   v.1   son of David, king in Jerusalem — frame; folded into wisdom thread context. NT: none warranted. Extras: none warranted. Tanakh: none warranted (frame).
--   v.2   Vanity of vanities; all is vanity — KEYSTONE.
--         NT:     Romans 8:20 (creature made subject to vanity) — THREAD 1.
--         Extras: Wisdom of Solomon 2:2 (breath in our nostrils as smoke) — THREAD 1.
--         Tanakh: Psalm 39:5, 39:6 (every man at his best is vanity / vain shew), Psalm 144:4 (man is like to vanity) — THREAD 1.
--   v.3   What profit... labour under the sun — folded with v.2 (the "under the sun" horizon).
--   v.4-7 generations pass / sun / wind / rivers — the earth abideth, but the Creator endureth.
--         NT:     none warranted (lateral-Tanakh weight strongest).
--         Extras: none warranted.
--         Tanakh: Psalm 102:26, 102:27 (they shall perish but thou endurest), Psalm 90:2, 90:4 (everlasting Elohim / thousand years as yesterday) — THREAD 2.
--   v.8   all things full of labour; eye not satisfied — folded with v.4-7 round (wearisome cycle).
--   v.9-11 no new thing under the sun / no remembrance — the closed horizon answered.
--         NT:     Revelation 21:5 (Behold, I make all things new) — THREAD 3 (handled lightly forward).
--         Extras: Wisdom of Solomon 2:4 (our name shall be forgotten) — THREAD 3.
--         Tanakh: none warranted (covered by Ps 102/90 in THREAD 2).
--   v.13-18 the quest of wisdom; much wisdom much grief — the limit of wisdom apart from the fear of Elohim.
--         NT:     1 Corinthians 1:20, 3:19 (made foolish the wisdom of this world) — THREAD 4.
--         Extras: Ecclesiasticus (Sirach) 1:14 (to fear Yahuah is the beginning of wisdom) — THREAD 4.
--         Tanakh: Proverbs 1:7, 9:10 (fear of Yahuah the beginning of knowledge/wisdom), Ecclesiastes 12:13 (the book's own conclusion) — THREAD 4.
--   v.12  I the Preacher was king over Yashar'el — frame; folded into wisdom thread. none warranted.
--   v.15  crooked cannot be made straight — folded with wisdom thread (the limit). none warranted standalone.
--
-- THREADS (4):
--   1. ecclesiastes-1-vanity-of-vanities-all-is-vanity        [Tanakh + NT + Extras] tier extras  (Ps39:5,39:6,144:4 / Rom8:20 / WisSol2:2)
--   2. ecclesiastes-1-the-earth-abideth-but-the-creator-endureth [Tanakh]            tier free    (Ps102:26,102:27,90:2,90:4)
--   3. ecclesiastes-1-no-new-thing-under-the-sun              [NT + Extras]          tier extras  (Rev21:5 / WisSol2:4)
--   4. ecclesiastes-1-much-wisdom-is-much-grief               [Tanakh + NT + Extras] tier extras  (Prov1:7,9:10 / 1Cor1:20,3:19 / Ecclus1:14 / Ecc12:13)

CREATE TEMP VIEW _s321_ecc01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: vanity of vanities (1:2)
    ('canon','ecclesiastes',1,2,'canon','psalms',39,5,'free',
     E'*Behold, thou hast made my days as an handbreadth; and mine age is as nothing before thee: verily every man at his best state is altogether vanity. Selah.* (Psalm 39:5). David sings the same hevel (breath) that Qoheleth weighs in *Vanity of vanities, saith the Preacher, vanity of vanities; all is vanity* (Ecclesiastes 1:2): man measured against the eternal Elohim is a vapor, *altogether vanity* even *at his best state.*'),
    ('canon','ecclesiastes',1,2,'canon','psalms',39,6,'free',
     E'*Surely every man walketh in a vain shew: surely they are disquieted in vain: he heapeth up riches, and knoweth not who shall gather them.* (Psalm 39:6). The hoarder who *knoweth not who shall gather* his riches is the very futility Qoheleth names — *all is vanity* (Ecclesiastes 1:2) — the labor *under the sun* (1:3) that profits nothing because death levels it.'),
    ('canon','ecclesiastes',1,2,'canon','psalms',144,4,'free',
     E'*Man is like to vanity: his days are as a shadow that passeth away.* (Psalm 144:4). *Man is like to vanity* is the one-line creed of Ecclesiastes 1 — *all is vanity* (Ecclesiastes 1:2) — the breath-life whose *days are as a shadow*, set against Yahuah (LORD) who endures.'),
    ('canon','ecclesiastes',1,2,'canon','romans',8,20,'free',
     E'*For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope,* (Romans 8:20). Paul names the same word over the whole groaning creation: the creature *made subject to vanity* — yet *in hope*. Qoheleth''s *all is vanity* (Ecclesiastes 1:2) is the diagnosis; the deliverance *from the bondage of corruption* (Romans 8:21) is the answer the Preacher drives toward.'),
    ('canon','ecclesiastes',1,2,'apocrypha','the-wisdom-of-solomon',2,2,'extras',
     E'*For we are born at all adventure: and we shall be hereafter as though we had never been: for the breath in our nostrils is as smoke, and a little spark in the moving of our heart:* (Wisdom of Solomon 2:2). This is the ungodly''s reasoning that Qoheleth voices to overturn it — life as mere *breath in our nostrils... as smoke*, the hevel of *all is vanity* (Ecclesiastes 1:2). The book of Wisdom answers it; so does the Preacher''s conclusion in the fear of Elohim.'),

    -- THREAD 2: the earth abideth, the Creator endureth (1:4-7)
    ('canon','ecclesiastes',1,4,'canon','psalms',102,26,'free',
     E'*They shall perish, but thou shalt endure: yea, all of them shall wax old like a garment; as a vesture shalt thou change them, and they shall be changed:* (Psalm 102:26). Qoheleth''s wearisome round — *One generation passeth away, and another generation cometh: but the earth abideth for ever* (Ecclesiastes 1:4) — is steadied here: even the heavens *shall perish*, but Yahuah *shalt endure*; the cycles turn under an unchanging Creator.'),
    ('canon','ecclesiastes',1,4,'canon','psalms',102,27,'free',
     E'*But thou art the same, and thy years shall have no end.* (Psalm 102:27). Against the sun that rises and sets, the wind that whirls, the rivers that run yet fill not the sea (Ecclesiastes 1:5-7), stands the One of whom it is said *thou art the same, and thy years shall have no end* — the fixed point that the endless round circles.'),
    ('canon','ecclesiastes',1,4,'canon','psalms',90,2,'free',
     E'*Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God).* (Psalm 90:2). The *earth abideth for ever* (Ecclesiastes 1:4) only because *from everlasting to everlasting* the Elohim who formed it abides first; Moses'' psalm anchors the creature''s round in the Creator''s eternity.'),
    ('canon','ecclesiastes',1,4,'canon','psalms',90,4,'free',
     E'*For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* (Psalm 90:4). The generations that pass away (Ecclesiastes 1:4) are *but as yesterday* before Elohim — the very smallness of man''s span under the sun that drives Qoheleth past the vapor to the fear of the Eternal.'),

    -- THREAD 3: no new thing under the sun (1:9-11)
    ('canon','ecclesiastes',1,9,'canon','revelation',21,5,'free',
     E'*And he that sat upon the throne said, Behold, I make all things new. And he said unto me, Write: for these words are true and faithful.* (Revelation 21:5). Under the sun *there is no new thing* (Ecclesiastes 1:9) — the closed horizon repeats itself endlessly. The one true newness comes not from under the sun but from the throne above it: *Behold, I make all things new.*'),
    ('canon','ecclesiastes',1,9,'apocrypha','the-wisdom-of-solomon',2,4,'extras',
     E'*And our name shall be forgotten in time, and no man shall have our works in remembrance, and our life shall pass away as the trace of a cloud...* (Wisdom of Solomon 2:4). The ungodly dread exactly what Qoheleth observes: *There is no remembrance of former things* (Ecclesiastes 1:11), the *name... forgotten in time.* Within the closed horizon this is despair; it is undone only by the One who remembers and makes all things new.'),

    -- THREAD 4: much wisdom is much grief (1:13-18)
    ('canon','ecclesiastes',1,13,'canon','proverbs',1,7,'free',
     E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7). Qoheleth gave his heart *to seek and search out by wisdom* (Ecclesiastes 1:13) and found grief, because wisdom that begins anywhere but *the fear of Yahuah* is a *sore travail.* Proverbs supplies the missing first principle the Preacher''s quest exposes by its absence.'),
    ('canon','ecclesiastes',1,13,'canon','proverbs',9,10,'free',
     E'*The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10). *In much wisdom is much grief* (Ecclesiastes 1:18) only when wisdom is pursued under the sun, apart from its true beginning — *the fear of Yahuah.* The grief is the dead end of the closed horizon, not of wisdom rightly grounded.'),
    ('canon','ecclesiastes',1,13,'canon','1-corinthians',1,20,'free',
     E'*Where is the wise? where is the scribe? where is the disputer of this world? hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20). Paul reaches Qoheleth''s verdict: *the wisdom of this world* — wisdom *under the sun* — Elohim hath *made foolish.* *He that increaseth knowledge increaseth sorrow* (Ecclesiastes 1:18) when that knowledge knows not Elohim.'),
    ('canon','ecclesiastes',1,13,'canon','1-corinthians',3,19,'free',
     E'*For the wisdom of this world is foolishness with Elohim (God). For it is written, He taketh the wise in their own craftiness.* (1 Corinthians 3:19). The travail of *all the works that are done under the sun* (Ecclesiastes 1:14) is *vanity and vexation of spirit* precisely because *the wisdom of this world is foolishness with Elohim* — confirming the Preacher''s finding from the other side of the cross.'),
    ('canon','ecclesiastes',1,13,'apocrypha','ecclesiasticus',1,14,'extras',
     E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Ecclesiasticus 1:14). Sirach, the wisdom-book that walks beside Ecclesiastes, names the cure for *much wisdom is much grief* (Ecclesiastes 1:18): *to fear Yahuah... is the beginning of wisdom.* The grief is the wisdom that forgot its beginning.'),
    ('canon','ecclesiastes',1,13,'canon','ecclesiastes',12,13,'free',
     E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* (Ecclesiastes 12:13). The Preacher''s own conclusion answers his opening quest: the wisdom that begins under the sun ends in *grief* (Ecclesiastes 1:18), but the search lands here — *Fear Elohim, and keep his commandments.* Vanity dismantled drives the reader to Torah-keeping, not to despair.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. cross_reference_threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-1-vanity-of-vanities-all-is-vanity',
       E'Vanity of vanities — all is breath under the sun',
       E'*Vanity of vanities, saith the Preacher, vanity of vanities; all is vanity* (Ecclesiastes 1:2). The word is hevel — breath, vapor — and the Preacher pronounces it over everything measured by the closed horizon of *under the sun* (1:3). This is not nihilism but diagnosis: life severed from the eternal Elohim is a vapor. David sang it first — *verily every man at his best state is altogether vanity* (Psalm 39:5), *surely every man walketh in a vain shew... he heapeth up riches, and knoweth not who shall gather them* (Psalm 39:6) — and again, *Man is like to vanity: his days are as a shadow that passeth away* (Psalm 144:4). The ungodly say it in despair: *the breath in our nostrils is as smoke* (Wisdom of Solomon 2:2). Paul lifts it to the whole creation: *the creature was made subject to vanity, not willingly... but in hope* (Romans 8:20). The vapor is real, but it is *in hope* — the futility names the lack that drives the heart to the One who endures.',
       sv.verse_id, ev.verse_id, 'extras', 38900
  FROM _s321_ecc01_lookup sv, _s321_ecc01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-1-the-earth-abideth-but-the-creator-endureth',
       E'The earth abideth for ever — but the Creator endureth',
       E'*One generation passeth away, and another generation cometh: but the earth abideth for ever* (Ecclesiastes 1:4). The sun rises and sets and hastes back to its place, the wind whirls and returns on its circuits, the rivers run to the sea yet it is never full (1:5-7) — a wearisome, closed round. The point is not that the cosmos is meaningless but that it is restless and dependent: it circles a fixed center. Asaph''s psalm names that center — *They shall perish, but thou shalt endure: yea, all of them shall wax old like a garment... But thou art the same, and thy years shall have no end* (Psalm 102:26-27). Moses anchors it deeper: *from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2), and before him *a thousand years... are but as yesterday* (Psalm 90:4). The earth abides for an age; the Elohim who formed it abides for ever. The endless cycle is the creature''s testimony to the Creator''s eternity.',
       sv.verse_id, ev.verse_id, 'free', 38901
  FROM _s321_ecc01_lookup sv, _s321_ecc01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-1-no-new-thing-under-the-sun',
       E'No new thing under the sun — answered from the throne',
       E'*The thing that hath been, it is that which shall be; and that which is done is that which shall be done: and there is no new thing under the sun* (Ecclesiastes 1:9). Within the closed horizon nothing is ever truly new, and nothing is truly remembered — *There is no remembrance of former things* (1:11). The ungodly dread this as final erasure: *our name shall be forgotten in time, and no man shall have our works in remembrance, and our life shall pass away as the trace of a cloud* (Wisdom of Solomon 2:4). But Qoheleth''s "under the sun" is precisely the limit, not the whole. The one newness that the closed round cannot manufacture comes from above it, from the throne: *Behold, I make all things new... for these words are true and faithful* (Revelation 21:5). What no labor under the sun can produce, the Eternal speaks into being.',
       sv.verse_id, ev.verse_id, 'extras', 38902
  FROM _s321_ecc01_lookup sv, _s321_ecc01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-1-much-wisdom-is-much-grief',
       E'Much wisdom is much grief — wisdom that forgot its beginning',
       E'*And I gave my heart to seek and search out by wisdom concerning all things that are done under heaven* (Ecclesiastes 1:13) — and the Preacher, wiser than all before him in Jerusalem (1:16), found that *in much wisdom is much grief: and he that increaseth knowledge increaseth sorrow* (1:18). The quest of wisdom pursued *under the sun* dead-ends in *vexation of spirit* (1:14). Why? Because it began in the wrong place. Proverbs names the missing first principle: *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7), *the beginning of wisdom* (Proverbs 9:10); and Sirach, the wisdom-book beside Ecclesiastes, agrees — *To fear Yahuah (God) is the beginning of wisdom* (Ecclesiasticus 1:14). Paul reaches the same verdict from the far side: *hath not Elohim (God) made foolish the wisdom of this world?* (1 Corinthians 1:20), for *the wisdom of this world is foolishness with Elohim* (1 Corinthians 3:19). The grief is the wisdom that forgot its beginning — and the Preacher''s own conclusion supplies the cure: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13).',
       sv.verse_id, ev.verse_id, 'extras', 38903
  FROM _s321_ecc01_lookup sv, _s321_ecc01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ===== D. cross_reference_thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 39:5 — *every man at his best state is altogether vanity*: David''s hevel matches Qoheleth''s *all is vanity.*'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-vanity-of-vanities-all-is-vanity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 39:6 — *he heapeth up riches, and knoweth not who shall gather them*: the futile labor under the sun.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-vanity-of-vanities-all-is-vanity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 144:4 — *Man is like to vanity: his days are as a shadow*: the one-line creed of Ecclesiastes 1.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=144 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-vanity-of-vanities-all-is-vanity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 8:20 — *the creature was made subject to vanity... in hope*: the vapor lifted to the whole creation, and toward deliverance.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-vanity-of-vanities-all-is-vanity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Wisdom of Solomon 2:2 — *the breath in our nostrils is as smoke*: the ungodly''s reasoning Qoheleth voices to overturn it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-vanity-of-vanities-all-is-vanity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 102:26 — *They shall perish, but thou shalt endure*: even the heavens wax old; the Creator does not.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-the-earth-abideth-but-the-creator-endureth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 102:27 — *thou art the same, and thy years shall have no end*: the fixed point the endless round circles.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-the-earth-abideth-but-the-creator-endureth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 90:2 — *from everlasting to everlasting, thou art Elohim*: the earth abides only because the Creator abides first.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-the-earth-abideth-but-the-creator-endureth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 90:4 — *a thousand years... are but as yesterday*: the passing generations are a moment before the Eternal.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-the-earth-abideth-but-the-creator-endureth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Revelation 21:5 — *Behold, I make all things new*: the one newness the closed round under the sun cannot produce, spoken from the throne.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-no-new-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Wisdom of Solomon 2:4 — *our name shall be forgotten in time*: the ungodly''s dread of *no remembrance* (Ecclesiastes 1:11), undone only from above the sun.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-no-new-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 1:7 — *The fear of Yahuah is the beginning of knowledge*: the missing first principle the Preacher''s grief exposes.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 9:10 — *The fear of Yahuah is the beginning of wisdom*: wisdom grounded here does not dead-end in grief.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 1:20 — *hath not Elohim made foolish the wisdom of this world?*: Paul''s verdict on wisdom under the sun.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 3:19 — *the wisdom of this world is foolishness with Elohim*: confirms Qoheleth''s *vexation of spirit* from the far side of the cross.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ecclesiasticus (Sirach) 1:14 — *To fear Yahuah is the beginning of wisdom*: the wisdom-book beside Ecclesiastes names the cure for *much wisdom is much grief.*'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ecclesiastes 12:13 — *Fear Elohim, and keep his commandments*: the Preacher''s own conclusion answers his opening quest — vanity dismantled drives to Torah-keeping.'
  FROM cross_reference_threads t
  JOIN _s321_ecc01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s321_ecc01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-1-much-wisdom-is-much-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_2.sql (Ecclesiastes 2) -----
-- Ecclesiastes 2 — the testing of pleasure, wealth, and wisdom, all vanity under the sun.
-- Tag: ecc02   Session: s321   Sort band: 38925-38928 (+1 per thread)
-- Source book_slug=ecclesiastes, chapter 2 (edition canon).
--
-- Ecclesiastes 2 coverage:
--   v.1-10 (Qoheleth tests mirth/wine/works/houses/vineyards/gardens/silver/singers):
--        NT:     none warranted (the catalogue of the experiment; its verdict is v.11, threaded there)
--        Extras: none warranted
--        Tanakh: none warranted (folded into the v.11 verdict thread)
--   v.11 (all was vanity, no profit under the sun):
--        NT:     Luke 12:19-21 rich fool; Matthew 6:19-21 treasure on earth; 1 John 2:16-17 lust of the eyes
--        Extras: none warranted (Sirach lateral placed on the heir thread v.18)
--        Tanakh: Psalm 49:10-12 (placed primarily on the death-levels thread v.14)
--   v.12-13 (wisdom excelleth folly as light excelleth darkness):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (the qualifier before the leveling verdict; folded into v.14 thread)
--   v.14-16 (wise man and fool meet one event — how dieth the wise? as the fool):
--        NT:     none warranted (under-the-sun horizon; resurrection answered at 12:13-14, not here)
--        Extras: none warranted
--        Tanakh: Psalm 49:10; Ecclesiastes 9:2-3 (one event to all)
--   v.18-23 (labour left to an heir who may be a fool — vanity and a great evil):
--        NT:     Luke 12:20 (then whose shall those things be)
--        Extras: Ecclesiasticus 11:18-19 (must leave those things to others, and die)
--        Tanakh: none warranted (Psalm 49 placed on v.14)
--   v.24-26 (eat, drink, enjoy thy labour — it was from the hand of Elohim):
--        NT:     1 Timothy 6:17 (Elohim giveth us richly all things to enjoy)
--        Extras: none warranted
--        Tanakh: Ecclesiastes 3:13; Ecclesiastes 5:18-19; Deuteronomy 12:7 (eat before Yahuah and rejoice)
--
-- THREADS (slug — target libraries):
--   ecclesiastes-2-all-was-vanity-no-profit-under-the-sun (s321, band 38925) — NT (Luke/Matthew/1 John). free.
--       Guard: the verdict on grasping accumulation, NOT on labour itself nor on Elohim's gifts (v.24 answers it).
--   ecclesiastes-2-how-dieth-the-wise-man-as-the-fool (s321, band 38926) — Tanakh (Psalm 49, Ecclesiastes 9). free.
--       Guard: the leveling of death is the LIMIT of the under-the-sun horizon, answered by resurrection/judgment
--       elsewhere (the book closes at 12:13-14 judgment) — not a denial of the wise man's reward.
--   ecclesiastes-2-leave-it-unto-the-man-that-shall-be-after-me (s321, band 38927) — Tanakh+Extras+NT
--       (Sirach 11:18-19 + Luke 12:20). extras.
--   ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy (s321, band 38928) — Tanakh+NT
--       (Ecclesiastes 3:13, 5:18-19, Deuteronomy 12:7, 1 Timothy 6:17). free.
--       Guard: the "eat, drink, enjoy thy labour" refrain is NOT hedonism — it is the contented reception of
--       daily bread as the GIFT OF ELOHIM'S HAND, the opposite of the grasping accumulation just exposed as vanity.

CREATE TEMP VIEW _s321_ecc02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: all was vanity, no profit under the sun (2:11)
    ('canon','ecclesiastes',2,11,'canon','luke',12,19,'free',
      E'The rich fool says the same words Qoheleth tested and rejected: ''And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry'' (Luke 12:19). Qoheleth had ''gathered me also silver and gold... and whatsoever mine eyes desired I kept not from them'' (Ecclesiastes 2:8,10), then ''looked on all the works that my hands had wrought... and, behold, all was vanity... and there was no profit under the sun'' (Ecclesiastes 2:11). The hoard cannot purchase the next breath.'),
    ('canon','ecclesiastes',2,11,'canon','luke',12,20,'free',
      E'''But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?'' (Luke 12:20). This is Qoheleth''s verdict made narrative: ''all was vanity and vexation of spirit, and there was no profit under the sun'' (Ecclesiastes 2:11). What the hands wrought stays under the sun; the soul does not.'),
    ('canon','ecclesiastes',2,11,'canon','luke',12,21,'free',
      E'''So is he that layeth up treasure for himself, and is not rich toward Elohim (God)'' (Luke 12:21). Yahusha (Jesus) names the disease Ecclesiastes diagnosed — treasure laid up for self yields ''no profit under the sun'' (Ecclesiastes 2:11); riches toward Elohim are the answer the chapter reaches in v.24-26.'),
    ('canon','ecclesiastes',2,11,'canon','matthew',6,19,'free',
      E'''Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal'' (Matthew 6:19). Qoheleth''s ''great works... houses... vineyards... silver and gold'' (Ecclesiastes 2:4-8) are earth-treasure: ''all was vanity... and there was no profit under the sun'' (Ecclesiastes 2:11). What corrupts and is stolen profits nothing.'),
    ('canon','ecclesiastes',2,11,'canon','matthew',6,21,'free',
      E'''For where your treasure is, there will your heart be also'' (Matthew 6:21). Qoheleth ''withheld not my heart from any joy'' yet found ''no profit under the sun'' (Ecclesiastes 2:10-11) — a heart anchored to perishing treasure perishes with it; the cure is treasure ''in heaven'' (Matthew 6:20).'),
    ('canon','ecclesiastes',2,11,'canon','1-john',2,16,'free',
      E'''For all that is in the world, the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world'' (1 John 2:16). Qoheleth catalogues exactly these — pleasure for the flesh, ''whatsoever mine eyes desired'' for the eyes, ''so I was great, and increased more than all'' for the pride of life (Ecclesiastes 2:1,10,9) — and weighs them: ''all was vanity'' (Ecclesiastes 2:11).'),
    ('canon','ecclesiastes',2,11,'canon','1-john',2,17,'free',
      E'''And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever'' (1 John 2:17). This is the answer over the edge of Qoheleth''s ''no profit under the sun'' (Ecclesiastes 2:11): the under-the-sun world and its grasping pass away; only the doer of Elohim''s will abides.'),
    -- Thread 2: how dieth the wise man? as the fool (2:14-16)
    ('canon','ecclesiastes',2,16,'canon','psalms',49,10,'free',
      E'''For he seeth that wise men die, likewise the fool and the brutish person perish, and leave their wealth to others'' (Psalm 49:10). The Psalm sings what Qoheleth observed — ''how dieth the wise man? as the fool'' (Ecclesiastes 2:16); ''one event happeneth to them all'' (Ecclesiastes 2:14). Wisdom does not buy an exemption from the grave.'),
    ('canon','ecclesiastes',2,16,'canon','psalms',49,12,'free',
      E'''Nevertheless man being in honour abideth not: he is like the beasts that perish'' (Psalm 49:12). Qoheleth said ''there is no remembrance of the wise more than of the fool for ever'' (Ecclesiastes 2:16); the Psalmist agrees the honoured man does not abide — yet Psalm 49:15 adds the hope beyond the sun: ''Elohim will redeem my soul from the power of the grave.'''),
    ('canon','ecclesiastes',2,14,'canon','ecclesiastes',9,2,'free',
      E'''All things come alike to all: there is one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean'' (Ecclesiastes 9:2). Qoheleth''s own later refrain of his observation here: ''one event happeneth to them all'' (Ecclesiastes 2:14) — the leveling fact of death under the sun, the very horizon the book will pierce at its close (Ecclesiastes 12:13-14).'),
    ('canon','ecclesiastes',2,16,'canon','ecclesiastes',9,3,'free',
      E'''This is an evil among all things that are done under the sun, that there is one event unto all... and after that they go to the dead'' (Ecclesiastes 9:3). The same ''one event'' that made Qoheleth ask ''how dieth the wise man? as the fool'' (Ecclesiastes 2:16). Both passages name the limit of the under-the-sun view, not the last word of the book.'),
    -- Thread 3: leave it unto the man that shall be after me (2:18-23)
    ('canon','ecclesiastes',2,18,'apocrypha','ecclesiasticus',11,19,'extras',
      E'''Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die'' (Ecclesiasticus 11:19). Ben Sira sets the heaper-up beside Qoheleth: ''I hated all my labour... because I should leave it unto the man that shall be after me'' (Ecclesiastes 2:18) — and this same wisdom-saying stands behind the rich fool of Luke 12:19-20.'),
    ('canon','ecclesiastes',2,18,'apocrypha','ecclesiasticus',11,18,'extras',
      E'''There is that waxeth rich by his wariness and pinching, and this is the portion of his reward'' (Ecclesiasticus 11:18). The wealth scraped together by anxious pinching is the ''portion'' that must be left behind — exactly Qoheleth''s ''great evil,'' that the labourer ''shall leave it unto the man that shall be after me. And who knoweth whether he shall be a wise man or a fool?'' (Ecclesiastes 2:18-19,21).'),
    ('canon','ecclesiastes',2,21,'canon','luke',12,20,'free',
      E'''Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?'' (Luke 12:20). ''Then whose shall those things be'' is the question of Ecclesiastes 2:21 made urgent — ''to a man that hath not laboured therein shall he leave it for his portion. This also is vanity and a great evil.'''),
    -- Thread 4: the gift of Elohim's hand — eat and drink and enjoy (2:24-26)
    ('canon','ecclesiastes',2,24,'canon','ecclesiastes',3,13,'free',
      E'''And also that every man should eat and drink, and enjoy the good of all his labour, it is the gift of Elohim (God)'' (Ecclesiastes 3:13). The first ''eat, drink, enjoy'' refrain (Ecclesiastes 2:24) is restated as gift: ''it was from the hand of Elohim'' becomes ''it is the gift of Elohim'' — daily bread received, not accumulation grasped.'),
    ('canon','ecclesiastes',2,24,'canon','ecclesiastes',5,19,'free',
      E'''Every man also to whom Elohim (God) hath given riches and wealth, and hath given him power to eat thereof, and to take his portion, and to rejoice in his labour; this is the gift of Elohim (God)'' (Ecclesiastes 5:19). Even riches are not the evil — the power to enjoy them with a contented soul is itself the gift, ''from the hand of Elohim'' (Ecclesiastes 2:24), the opposite of the sinner''s travail ''to gather and to heap up'' (Ecclesiastes 2:26).'),
    ('canon','ecclesiastes',2,24,'canon','deuteronomy',12,7,'free',
      E'''And there ye shall eat before Yahuah Elohaychem (the LORD your God), and ye shall rejoice in all that ye put your hand unto, ye and your households, wherein Yahuah Elohayka (the LORD thy God) hath blessed thee'' (Deuteronomy 12:7). Qoheleth''s contented eating is Torah''s own pattern — joyful eating BEFORE Yahuah at the place He chose; the labour enjoyed ''from the hand of Elohim'' (Ecclesiastes 2:24) is covenant rejoicing, not appetite.'),
    ('canon','ecclesiastes',2,24,'canon','1-timothy',6,17,'free',
      E'''Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy'' (1 Timothy 6:17). Sha''ul names the same Giver Qoheleth found: enjoyment is ''from the hand of Elohim'' (Ecclesiastes 2:24); riches are held loosely, the gift received with thanks, never trusted in place of the Giver.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-2-all-was-vanity-no-profit-under-the-sun',
       E'All was vanity, and no profit under the sun',
       E'Qoheleth runs the great experiment: mirth, wine, ''great works,'' ''houses... vineyards... gardens... pools of water,'' servants, ''silver and gold... men singers and women singers,'' until ''whatsoever mine eyes desired I kept not from them'' (Ecclesiastes 2:4-10). Then the audit: *Then I looked on all the works that my hands had wrought, and on the labour that I had laboured to do: and, behold, all was vanity and vexation of spirit, and there was no profit under the sun* (Ecclesiastes 2:11).\n\nYahusha (Jesus) tells the same verdict as a story. The rich man says Qoheleth''s very words — *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19) — and the answer comes: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20), *So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21). The same teacher had already drawn the map: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal* (Matthew 6:19), *for where your treasure is, there will your heart be also* (Matthew 6:21).\n\nYochanan (John) catalogues Qoheleth''s whole experiment in one line — *the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world* (1 John 2:16) — and then carries the answer over the edge of ''no profit under the sun'': *the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever* (1 John 2:17). This is the verdict on grasping accumulation, not on labour itself nor on Elohim''s gifts — which v.24-26 will receive with joy.',
       sv.verse_id, ev.verse_id, 'free', 38925
  FROM _s321_ecc02_lookup sv, _s321_ecc02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-2-how-dieth-the-wise-man-as-the-fool',
       E'How dieth the wise man? as the fool',
       E'Qoheleth turns to weigh wisdom itself, and grants it real worth — *wisdom excelleth folly, as far as light excelleth darkness. The wise man''s eyes are in his head; but the fool walketh in darkness* (Ecclesiastes 2:13-14). Then the leveling blow: *and I myself perceived also that one event happeneth to them all* (Ecclesiastes 2:14); *there is no remembrance of the wise more than of the fool for ever... And how dieth the wise man? as the fool* (Ecclesiastes 2:16).\n\nThe Psalmist sings the same fact: *For he seeth that wise men die, likewise the fool and the brutish person perish, and leave their wealth to others* (Psalm 49:10); *man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12). And Qoheleth himself returns to the observation later — *All things come alike to all: there is one event to the righteous, and to the wicked* (Ecclesiastes 9:2), *and after that they go to the dead* (Ecclesiastes 9:3).\n\nThis is the limit of the under-the-sun horizon, not the last word. Death levels every observer who looks only beneath the sun; but Psalm 49 itself breaks the ceiling — *Elohim will redeem my soul from the power of the grave* (Psalm 49:15) — and the book of Ecclesiastes closes by piercing it: *Fear Elohim, and keep his commandments... For Elohim shall bring every work into judgment* (Ecclesiastes 12:13-14). The wise man and the fool meet one death; they do not meet one judgment.',
       sv.verse_id, ev.verse_id, 'free', 38926
  FROM _s321_ecc02_lookup sv, _s321_ecc02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-2-leave-it-unto-the-man-that-shall-be-after-me',
       E'I should leave it unto the man that shall be after me',
       E'A second emptiness gnaws at Qoheleth — not death only, but inheritance: *I hated all my labour which I had taken under the sun: because I should leave it unto the man that shall be after me. And who knoweth whether he shall be a wise man or a fool?* (Ecclesiastes 2:18-19). The labourer pours wisdom, knowledge, and equity into his work, *yet to a man that hath not laboured therein shall he leave it for his portion. This also is vanity and a great evil* (Ecclesiastes 2:21).\n\nBen Sira draws the same portrait of the anxious heaper-up: *There is that waxeth rich by his wariness and pinching, and this is the portion of his reward* (Ecclesiasticus 11:18); *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Ecclesiasticus 11:19). The wisdom-saying — *leave those things to others, and die* — stands word-for-word behind both Qoheleth and the rich fool: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). ''Then whose shall those things be'' is precisely Qoheleth''s ''great evil'' — the hoard handed off to an unknown heir, and the heaper carried to the dead.',
       sv.verse_id, ev.verse_id, 'extras', 38927
  FROM _s321_ecc02_lookup sv, _s321_ecc02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy',
       E'It was from the hand of Elohim — eat, drink, and enjoy thy labour',
       E'After exposing accumulation as vanity, Qoheleth turns — and the turn is the heart of the book: *There is nothing better for a man, than that he should eat and drink, and that he should make his soul enjoy good in his labour. This also I saw, that it was from the hand of Elohim (God)* (Ecclesiastes 2:24). And the line that follows separates the contented from the grasping: *For Elohim (God) giveth to a man that is good in his sight wisdom, and knowledge, and joy: but to the sinner he giveth travail, to gather and to heap up* (Ecclesiastes 2:26).\n\nThis is not hedonism. It is the opposite of the grasping just exposed — the contented reception of daily bread as the GIFT OF ELOHIM''S HAND. Qoheleth repeats it as gift: *every man should eat and drink, and enjoy the good of all his labour, it is the gift of Elohim (God)* (Ecclesiastes 3:13); even riches are no evil when *power to eat thereof, and to take his portion, and to rejoice in his labour* is given — *this is the gift of Elohim* (Ecclesiastes 5:19).\n\nThe pattern is Torah''s own. Israel was commanded to eat with joy before the Giver: *And there ye shall eat before Yahuah Elohaychem (the LORD your God), and ye shall rejoice in all that ye put your hand unto, ye and your households, wherein Yahuah Elohayka (the LORD thy God) hath blessed thee* (Deuteronomy 12:7). And Sha''ul names the same Giver to the rich: *trust... in the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17). The hand that gives the bread is the hand to be thanked — never the hoard trusted in place of the Giver.',
       sv.verse_id, ev.verse_id, 'free', 38928
  FROM _s321_ecc02_lookup sv, _s321_ecc02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=2 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19) — the rich fool speaks Qoheleth''s tested words.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou fool, this night thy soul shall be required of thee: then whose shall those things be* (Luke 12:20) — the verdict ''no profit under the sun'' made narrative.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21) — names the disease Ecclesiastes diagnosed.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt* (Matthew 6:19) — the great works are earth-treasure.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For where your treasure is, there will your heart be also* (Matthew 6:21) — a heart anchored to perishing treasure perishes with it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the lust of the flesh, and the lust of the eyes, and the pride of life, is not of the Father, but is of the world* (1 John 2:16) — Qoheleth''s whole experiment in one line.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever* (1 John 2:17) — the answer over the edge of ''no profit under the sun.'''
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-all-was-vanity-no-profit-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*wise men die, likewise the fool and the brutish person perish, and leave their wealth to others* (Psalm 49:10) — the Psalm sings Qoheleth''s observation.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-how-dieth-the-wise-man-as-the-fool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12) — yet Psalm 49:15 breaks the ceiling: ''Elohim will redeem my soul from the power of the grave.'''
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-how-dieth-the-wise-man-as-the-fool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*one event to the righteous, and to the wicked; to the good and to the clean, and to the unclean* (Ecclesiastes 9:2) — Qoheleth''s own later refrain of the leveling fact.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-how-dieth-the-wise-man-as-the-fool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there is one event unto all... and after that they go to the dead* (Ecclesiastes 9:3) — the limit of the under-the-sun view, not the book''s last word (Ecclesiastes 12:13-14).'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-how-dieth-the-wise-man-as-the-fool'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*this is the portion of his reward* (Ecclesiasticus 11:18) — the wealth scraped by anxious pinching is the portion left behind.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-leave-it-unto-the-man-that-shall-be-after-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he must leave those things to others, and die* (Ecclesiasticus 11:19) — word-for-word behind Qoheleth''s ''great evil'' and the rich fool.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-leave-it-unto-the-man-that-shall-be-after-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*then whose shall those things be, which thou hast provided?* (Luke 12:20) — the question of Ecclesiastes 2:21 made urgent.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-leave-it-unto-the-man-that-shall-be-after-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*enjoy the good of all his labour, it is the gift of Elohim (God)* (Ecclesiastes 3:13) — the refrain restated as gift, not grasping.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=24
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*power to eat thereof, and to take his portion, and to rejoice in his labour; this is the gift of Elohim (God)* (Ecclesiastes 5:19) — even riches are no evil when the joy is received as gift.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=24
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there ye shall eat before Yahuah Elohaychem (the LORD your God), and ye shall rejoice in all that ye put your hand unto* (Deuteronomy 12:7) — Torah''s own pattern of joyful eating before the Giver.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=24
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the living Elohim (God), who giveth us richly all things to enjoy* (1 Timothy 6:17) — Sha''ul names the same Giver; riches held loosely, the gift received with thanks.'
  FROM cross_reference_threads t
  JOIN _s321_ecc02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=2 AND sv.verse_number=24
  JOIN _s321_ecc02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-2-the-gift-of-elohims-hand-eat-and-drink-and-enjoy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_3.sql (Ecclesiastes 3) -----
-- Ecclesiastes 3 — a season for every thing, and the eternal purpose of Elohim
-- tag: ecc03   session prefix: s321   sort_order band: 38950..38954 (+1 per thread)
-- source book_slug=ecclesiastes, chapter 3
--
-- Ecclesiastes 3 coverage:
--   v.1-8  NT:     none warranted (the providential-ordering weave runs lateral/extras)
--          Extras: Ecclesiasticus (Sirach) 33:8-9 'he altered seasons and feasts' [extras]
--          Tanakh: Psalm 31:15 'my times are in thy hand'; Daniel 2:21 'he changeth the times and the seasons'
--   v.9-10 NT:     none warranted (the labour/travail under the sun — answered in the threads above/below)
--          Extras: none warranted
--          Tanakh: none warranted (carried in the season thread)
--   v.11   NT:     Romans 1:20 invisible-things-clearly-seen; Acts 17:26-27 he-determined-the-times-that-they-should-seek
--          Extras: none warranted (clean canon weave suffices)
--          Tanakh: none warranted here (the eternity-in-the-heart longing is its own thread)
--   v.12-13 NT:    none warranted (the eat-drink-enjoy gift recurs; framed under 2:24/5:18 elsewhere)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.14   NT:     James 1:17 no-variableness; Revelation 22:18-19 add-not / take-not-away
--          Extras: Ecclesiasticus (Sirach) 42:21 'to him may nothing be added, neither can he be diminished' [extras]
--          Tanakh: Deuteronomy 4:2 add-not / diminish-not the word; Malachi 3:6 'I am Yahuah, I change not'
--   v.15   NT:     none warranted (that-which-hath-been carried in immutability thread)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.16-17 NT:    Acts 17:31 appointed-a-day-to-judge; Romans 2:6-8 render-to-every-man-according-to-his-deeds
--          Extras: none warranted (canon judgment weave is full)
--          Tanakh: Ecclesiastes 12:14 Elohim-shall-bring-every-work-into-judgment (the book's anchor)
--   v.18-21 NT:    none warranted (the dust/spirit question is answered within the canon at 12:7)
--          Extras: none warranted
--          Tanakh: Genesis 3:19 dust-thou-art; Ecclesiastes 12:7 the-spirit-shall-return-unto-Elohim; Psalm 90:3 return-ye-children-of-men
--   v.22   NT:     none warranted (rejoice-in-his-own-works = the recurring gift, framed elsewhere)
--          Extras: none warranted
--          Tanakh: none warranted
--
-- THREADS (5):
--   1. ecclesiastes-3-to-every-thing-there-is-a-season-my-times-in-thy-hand  [extras: Ps31:15, Dan2:21, Sirach33:8]
--   2. ecclesiastes-3-he-hath-set-the-world-eternity-in-their-heart          [free: Rom1:20, Acts17:26, Acts17:27]
--   3. ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing [extras: Deut4:2, Mal3:6, Jas1:17, Rev22:18, Rev22:19, Sirach42:21]
--   4. ecclesiastes-3-elohim-shall-judge-the-righteous-and-the-wicked        [free: Ecc12:14, Acts17:31, Rom2:6]
--   5. ecclesiastes-3-all-are-of-the-dust-and-the-spirit-goeth-upward        [free: Gen3:19, Ecc12:7, Ps90:3]
--
-- FRAMING NOTES (load-bearing):
--   * 3:1-8 the season for everything = the PROVIDENTIAL ORDERING of life under Elohim's sovereignty
--     (Ps31:15 my-times-in-thy-hand; Dan2:21 he-changeth-the-times-and-the-seasons), NOT fatalism;
--     Sirach33:8 grounds it in the appointed-times — 'he altered seasons and feasts' — the same Hand
--     that set Leviticus 23 set the seasons of a life.
--   * 3:11 olam/'the world' set in the heart = the Elohim-given longing for the EVERLASTING that the
--     under-the-sun horizon cannot satisfy; it drives outward to seek Elohim (Acts17:27), not inward
--     to despair. Rom1:20 the-invisible-things-clearly-seen — creation testifies, men without excuse.
--   * 3:14 the unchangeable work -> the immutability that GROUNDS REVERENCE ('that men should fear
--     before him'); Deut4:2 add-not/diminish-not is the Torah/word that cannot be edited — framed as
--     reverence for the unchangeable instruction, NEVER abolition. Mal3:6 'I change not'; Jas1:17 no-
--     variableness; Rev22:18-19 the canon's own seal; Sirach42:21 the second-Temple echo verbatim.
--   * 3:17 'Elohim shall judge' = the book's ANCHOR (12:14), the answer to under-the-sun injustice;
--     Acts17:31 the appointed day by the ordained Man; Rom2:6 render-to-every-man-according-to-his-deeds.
--   * 3:19-21 the dust/spirit question is left OPEN here ('who knoweth...') and ANSWERED forward in the
--     same book at 12:7 'the spirit shall return unto Elohim who gave it' — Gen3:19 dust-thou-art is the
--     root. No NT add: Qoheleth's question is resolved within the canon's own voice.

CREATE TEMP VIEW _s321_ecc03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: a season for everything — my times are in thy hand
    ('canon','ecclesiastes',3,1,'canon','psalms',31,15,'free',
     E'*My times are in thy hand: deliver me from the hand of mine enemies, and from them that persecute me* (Psalm 31:15). The Preacher''s *To every thing there is a season, and a time to every purpose under the heaven* (Ecclesiastes 3:1) is not blind fate but the providential ordering of a life held in the hand of Yahuah (LORD); every appointed season — birth and death, weeping and laughing — falls within the Hand David trusts.'),
    ('canon','ecclesiastes',3,1,'canon','daniel',2,21,'free',
     E'*And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). The same Elohim (God) who appoints *a time to be born, and a time to die* (Ecclesiastes 3:2) governs the times and the seasons of nations — the sovereignty over a single life is the sovereignty over all history.'),
    ('canon','ecclesiastes',3,1,'apocrypha','ecclesiasticus',33,8,'extras',
     E'*By the knowledge of Yahuah (God) they were distinguished: and he altered seasons and feasts* (Ecclesiasticus / Sirach 33:8). The wisdom-tradition heir of Qoheleth roots the seasons in the appointed times themselves — the Hand that ordered *a time to plant, and a time to pluck up* (Ecclesiastes 3:2) is the Hand that set the feasts of Leviticus 23; the rhythm of providence and the calendar of Yahuah (LORD) are one.'),
    -- Thread 2: eternity set in the heart
    ('canon','ecclesiastes',3,11,'canon','romans',1,20,'free',
     E'*For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). Qoheleth says Elohim (God) *hath set the world in their heart* (Ecclesiastes 3:11) — the everlasting placed within man; Sha''ul (Paul) says the eternal power is clearly seen in what is made. The longing within and the witness without leave no man with an excuse.'),
    ('canon','ecclesiastes',3,11,'canon','acts',17,26,'free',
     E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The Elohim (God) who *hath made every thing beautiful in his time* (Ecclesiastes 3:11) determined the appointed times and bounds of every people — the same ordering Hand, now declared to the nations at Athens.'),
    ('canon','ecclesiastes',3,11,'canon','acts',17,27,'free',
     E'*That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). This is the purpose of the eternity *set in the heart* (Ecclesiastes 3:11): the under-the-sun world cannot satisfy the longing for the everlasting, so it drives a man outward to seek Yahuah (LORD) — not inward to despair.'),
    -- Thread 3: whatsoever Elohim doeth shall be for ever — add nothing, take nothing
    ('canon','ecclesiastes',3,14,'canon','deuteronomy',4,2,'free',
     E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you* (Deuteronomy 4:2). Qoheleth says of the work of Elohim (God), *nothing can be put to it, nor any thing taken from it* (Ecclesiastes 3:14); Mosheh (Moses) says the same of the word He commands. The immutable work and the immutable Torah are one — you may not edit what Yahuah (LORD) has set, and that reverence is the point: *that men should fear before him*.'),
    ('canon','ecclesiastes',3,14,'canon','malachi',3,6,'free',
     E'*For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6). That *whatsoever Elohim (God) doeth, it shall be for ever* (Ecclesiastes 3:14) rests on the immutability of the One who does it; because He changes not, the covenant people are not consumed — the unchangeableness that grounds the fear of Elohim also grounds their preservation.'),
    ('canon','ecclesiastes',3,14,'canon','james',1,17,'free',
     E'*Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). The eternal, un-added-to, un-diminished work of *Ecclesiastes 3:14* is the doing of the Father of lights *with whom is no variableness* — Ya''aqov (James) speaks the very attribute Qoheleth contemplates.'),
    ('canon','ecclesiastes',3,14,'canon','revelation',22,18,'free',
     E'*For I testify unto every man that heareth the words of the prophecy of this book, If any man shall add unto these things, Elohim (God) shall add unto him the plagues that are written in this book* (Revelation 22:18). The principle Qoheleth states of Elohim''s work — *nothing can be put to it* (Ecclesiastes 3:14) — the canon seals over its own words: to add is to incur the plagues. The same reverence Deuteronomy 4:2 commanded.'),
    ('canon','ecclesiastes',3,14,'canon','revelation',22,19,'free',
     E'*And if any man shall take away from the words of the book of this prophecy, Elohim (God) shall take away his part out of the book of life, and out of the holy city, and from the things which are written in this book* (Revelation 22:19). The other half of Qoheleth''s law — *nor any thing taken from it* (Ecclesiastes 3:14) — sealed at the end of the canon: to diminish the word is to be diminished from the book of life. Add-not and take-not-away bracket the whole Scripture.'),
    ('canon','ecclesiastes',3,14,'apocrypha','ecclesiasticus',42,21,'extras',
     E'*He has garnished the excellent works of his wisdom, and he is from everlasting to everlasting: to him may nothing be added, neither can he be diminished, and he has no need of any counsellor* (Ecclesiasticus / Sirach 42:21). Ben Sira hears Qoheleth and answers him almost verbatim: *nothing can be put to it, nor any thing taken from it* (Ecclesiastes 3:14) — the second-Temple wisdom tradition confessing the immutable, everlasting work of Elohim (God).'),
    -- Thread 4: Elohim shall judge the righteous and the wicked
    ('canon','ecclesiastes',3,17,'canon','ecclesiastes',12,14,'free',
     E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). What Qoheleth declares in his heart here — *Elohim (God) shall judge the righteous and the wicked* (Ecclesiastes 3:17) — is the book''s own closing anchor: the coming judgment is the answer to all the wickedness seen *under the sun in the place of judgment* (3:16). Every work, every secret thing, has its time.'),
    ('canon','ecclesiastes',3,17,'canon','acts',17,31,'free',
     E'*Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). Qoheleth said *there is a time there for every purpose and for every work* (Ecclesiastes 3:17); Sha''ul (Paul) names the time — an appointed day — and the Judge — the ordained Man, the Formed Son raised from the dead.'),
    ('canon','ecclesiastes',3,17,'canon','romans',2,6,'free',
     E'*Who will render to every man according to his deeds* (Romans 2:6). The judgment of *the righteous and the wicked* (Ecclesiastes 3:17) is rendered by deeds — Sha''ul (Paul) quotes the Tanakh''s standing measure (Psalm 62:12; Proverbs 24:12); the under-the-sun injustice Qoheleth saw is set right when each is repaid according to what he has done.'),
    -- Thread 5: all are of the dust, and the spirit goeth upward
    ('canon','ecclesiastes',3,20,'canon','genesis',3,19,'free',
     E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). *All are of the dust, and all turn to dust again* (Ecclesiastes 3:20) is Qoheleth reaching back to the sentence in the garden — the curse of Adam''s mortality is the root of the vanity he observes under the sun.'),
    ('canon','ecclesiastes',3,21,'canon','ecclesiastes',12,7,'free',
     E'*Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). The question Qoheleth leaves open — *Who knoweth the spirit of man that goeth upward* (Ecclesiastes 3:21) — his own book answers at its close: the dust to the earth, but the spirit back to the Elohim (God) who gave it. The canon resolves its own riddle.'),
    ('canon','ecclesiastes',3,20,'canon','psalms',90,3,'free',
     E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3). The prayer of Mosheh (Moses) sings the same return to dust Qoheleth observes — *all are of the dust, and all turn to dust again* (Ecclesiastes 3:20) — and turns it toward wisdom: to number our days under the Hand that turns man back to the ground.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
-- Thread 1: a season for everything
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-3-to-every-thing-there-is-a-season-my-times-in-thy-hand',
       E'To Every Thing a Season — My Times Are in Thy Hand',
       E'*To every thing there is a season, and a time to every purpose under the heaven: A time to be born, and a time to die... a time to kill, and a time to heal... a time to weep, and a time to laugh... a time to keep silence, and a time to speak... a time of war, and a time of peace* (Ecclesiastes 3:1-8). The Preacher''s famous catalogue is not a doctrine of fate but a confession of providence: every season of a human life falls within an appointed ordering, and the Hand that orders it is the Hand of Yahuah (LORD). David sings the same trust — *My times are in thy hand: deliver me from the hand of mine enemies* (Psalm 31:15). Daniel widens it to all history — *And he changeth the times and the seasons: he removeth kings, and setteth up kings* (Daniel 2:21). And the wisdom-heir Ben Sira roots it in the very calendar of Yahuah (LORD): *By the knowledge of Yahuah (God) they were distinguished: and he altered seasons and feasts* (Ecclesiasticus / Sirach 33:8) — the same Hand that appointed *a time to plant, and a time to pluck up* (3:2) set the appointed times of Leviticus 23. The rhythm of a life and the rhythm of the feasts flow from one sovereign ordering.',
       sv.verse_id, ev.verse_id, 'extras', 38950
  FROM _s321_ecc03_lookup sv, _s321_ecc03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: eternity set in the heart
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-3-he-hath-set-the-world-eternity-in-their-heart',
       E'He Hath Set Eternity in Their Heart',
       E'*He hath made every thing beautiful in his time: also he hath set the world in their heart, so that no man can find out the work that Elohim (God) maketh from the beginning to the end* (Ecclesiastes 3:11). The Hebrew *olam* — the everlasting, eternity — Elohim (God) has placed within man; and that is precisely why the under-the-sun horizon can never satisfy him. The longing for the eternal exposes the smallness of the world that can be seen, and drives the seeker outward. Sha''ul (Paul) names both the witness without and the verdict it brings: *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). And at Athens he names the purpose of the appointed ordering: Elohim (God) *hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — *That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). The eternity set in the heart is not a torment but a summons: it is the homing instinct for the Maker, and it ends in the fear of Elohim, never in despair.',
       sv.verse_id, ev.verse_id, 'free', 38951
  FROM _s321_ecc03_lookup sv, _s321_ecc03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: whatsoever Elohim doeth shall be for ever
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing',
       E'Whatsoever Elohim Doeth Shall Be For Ever — Add Nothing, Take Nothing',
       E'*I know that, whatsoever Elohim (God) doeth, it shall be for ever: nothing can be put to it, nor any thing taken from it: and Elohim (God) doeth it, that men should fear before him* (Ecclesiastes 3:14). The unchangeableness of the work of Elohim (God) is not a cold abstraction — Qoheleth gives it its purpose: *that men should fear before him*. The immutability grounds reverence. And the law Qoheleth states of the work, Mosheh (Moses) states of the word: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it... that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2) — you may not edit what Yahuah (LORD) has set, neither His work nor His Torah; both stand for ever, and that is the very reason to walk in them, never the excuse to abolish them. The attribute is the Doer''s own: *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6); *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). The canon seals the same law over its own words at its close — *If any man shall add unto these things, Elohim (God) shall add unto him the plagues* (Revelation 22:18); *if any man shall take away... Elohim (God) shall take away his part out of the book of life* (Revelation 22:19) — add-not and take-not-away bracketing the whole Scripture. And the second-Temple wisdom tradition confesses it almost word for word: *he is from everlasting to everlasting: to him may nothing be added, neither can he be diminished* (Ecclesiasticus / Sirach 42:21).',
       sv.verse_id, ev.verse_id, 'extras', 38952
  FROM _s321_ecc03_lookup sv, _s321_ecc03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: Elohim shall judge the righteous and the wicked
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-3-elohim-shall-judge-the-righteous-and-the-wicked',
       E'Elohim Shall Judge the Righteous and the Wicked',
       E'*And moreover I saw under the sun the place of judgment, that wickedness was there; and the place of righteousness, that iniquity was there. I said in mine heart, Elohim (God) shall judge the righteous and the wicked: for there is a time there for every purpose and for every work* (Ecclesiastes 3:16-17). Confronted by injustice in the very seats of justice, Qoheleth''s answer is the coming judgment — and it is the anchor of his whole book: *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). The time appointed *for every purpose and for every work* (3:17) is named in the New Testament: *he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31) — the day is fixed, and the Judge is the ordained Man, the Formed Son raised up. And the measure is the Tanakh''s own: *Who will render to every man according to his deeds* (Romans 2:6). The wickedness seen under the sun is not the last word; there is a time there, and every secret work is weighed.',
       sv.verse_id, ev.verse_id, 'free', 38953
  FROM _s321_ecc03_lookup sv, _s321_ecc03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: all are of the dust, and the spirit goeth upward
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-3-all-are-of-the-dust-and-the-spirit-goeth-upward',
       E'All Are of the Dust — and the Spirit Goeth Upward',
       E'*All go unto one place; all are of the dust, and all turn to dust again. Who knoweth the spirit of man that goeth upward, and the spirit of the beast that goeth downward to the earth?* (Ecclesiastes 3:20-21). Qoheleth sees man and beast share one breath and one return to dust, and he leaves the spirit''s ascent as an open question — a question rooted in the garden sentence: *for dust thou art, and unto dust shalt thou return* (Genesis 3:19). Mosheh (Moses) prays the same return — *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3) — and turns it toward wisdom, to number our days. But Qoheleth''s open question is answered by Qoheleth himself, in the same book, at its close: *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). The dust goes down to the ground from which it was taken; the spirit goes up to the Elohim (God) who gave it. The canon resolves its own riddle in its own voice.',
       sv.verse_id, ev.verse_id, 'free', 38954
  FROM _s321_ecc03_lookup sv, _s321_ecc03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*My times are in thy hand* (Psalm 31:15) — David''s trust answers Qoheleth''s seasons: every appointed time held in the Hand of Yahuah (LORD), not blind fate.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-to-every-thing-there-is-a-season-my-times-in-thy-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He changeth the times and the seasons* (Daniel 2:21) — the sovereignty over one life is the sovereignty over all history; the Hand that orders a season orders the throne of nations.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-to-every-thing-there-is-a-season-my-times-in-thy-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He altered seasons and feasts* (Ecclesiasticus / Sirach 33:8) — Ben Sira roots the seasons in the appointed times: the Hand that set Leviticus 23 set the seasons of a life.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=33 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-to-every-thing-there-is-a-season-my-times-in-thy-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The invisible things of him... are clearly seen... so that they are without excuse* (Romans 1:20) — the witness without matches the eternity within; no man is left an excuse.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-he-hath-set-the-world-eternity-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He... hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — the same ordering Hand of Ecclesiastes 3:11, declared to the nations.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-he-hath-set-the-world-eternity-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*That they should seek Yahuah (Lord), if haply they might feel after him, and find him* (Acts 17:27) — the purpose of the eternity set in the heart: it summons the seeker outward to the Maker.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-he-hath-set-the-world-eternity-in-their-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall not add unto the word... neither shall ye diminish ought from it* (Deuteronomy 4:2) — the law of the immutable work is the law of the immutable Torah; reverence, never abolition.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — the immutability that grounds the fear of Elohim also preserves the covenant people.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17) — Ya''aqov names the very attribute Qoheleth contemplates: the unchanging Doer of the eternal work.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If any man shall add unto these things, Elohim (God) shall add unto him the plagues* (Revelation 22:18) — the canon seals the add-not law over its own words.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If any man shall take away from the words... Elohim (God) shall take away his part out of the book of life* (Revelation 22:19) — the take-not-away half; to diminish the word is to be diminished.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*To him may nothing be added, neither can he be diminished* (Ecclesiasticus / Sirach 42:21) — the second-Temple wisdom tradition answers Ecclesiastes 3:14 almost verbatim.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=42 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-whatsoever-elohim-doeth-it-shall-be-for-ever-add-nothing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Elohim (God) shall bring every work into judgment, with every secret thing* (Ecclesiastes 12:14) — the book''s closing anchor; the judgment of 3:17 is Qoheleth''s final word.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-elohim-shall-judge-the-righteous-and-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31) — the time of 3:17 named; the Judge is the ordained Formed Son, raised.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-elohim-shall-judge-the-righteous-and-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who will render to every man according to his deeds* (Romans 2:6) — the Tanakh''s standing measure of judgment; under-the-sun injustice set right when each is repaid.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-elohim-shall-judge-the-righteous-and-the-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the garden sentence is the root of Qoheleth''s return to dust.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-all-are-of-the-dust-and-the-spirit-goeth-upward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7) — Qoheleth''s own answer to his open question of 3:21; the canon resolves its own riddle.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-all-are-of-the-dust-and-the-spirit-goeth-upward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3) — Mosheh sings the same return to dust and turns it toward the wisdom of numbering our days.'
  FROM cross_reference_threads t
  JOIN _s321_ecc03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s321_ecc03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-3-all-are-of-the-dust-and-the-spirit-goeth-upward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_4.sql (Ecclesiastes 4) -----
-- Chapter: Ecclesiastes 4 — OPPRESSION, RIVALRY, AND THE STRENGTH OF COMPANIONSHIP. The Preacher
-- returns to the world *under the sun* and sees three vanities. First the oppressions: *the tears
-- of such as were oppressed, and they had no comforter; and on the side of their oppressors there
-- was power; but they had no comforter* (4:1) — the cry with no answer in it, the lament that ends
-- the chapter cannot finish, because under-the-sun has no comforter; only the covenant hope does.
-- Second, the engine that drives all the toil: *every right work, that for this a man is envied of
-- his neighbour* (4:4) — labour and skill spring from rivalry, and that is vanity; against it the
-- wisdom of contentment, *Better is an handful with quietness, than both the hands full with travail
-- and vexation of spirit* (4:6). Third, the solitary toiler with neither child nor brother nor
-- anyone to labour for (4:8), answered by the great praise of fellowship: *Two are better than one;
-- because they have a good reward for their labour. For if they fall, the one will lift up his
-- fellow... And if one prevail against him, two shall withstand him; and a threefold cord is not
-- quickly broken* (4:9,10,12) — the created good of companionship, *it is not good that the man
-- should be alone* (Genesis 2:18). The chapter closes on the vanity of fleeting popularity: the poor
-- wise youth outshines the old foolish king, yet the next generation will not rejoice in him either
-- (4:13-16).
-- Tag: ecc04   Temp view: _s321_ecc04_lookup
-- Sort band: base 38975, step 1 -> threads at 38975, 38976, 38977 (3 threads)
-- Source of EVERY row: 'canon','ecclesiastes',4,v
--
-- Ecclesiastes 4 coverage:
--   ★ v.1 (the tears of such as were oppressed, and they had no comforter; and on the side of their
--          oppressors there was power; but they had no comforter)
--        NT:     ★ Matthew 5:4 (Blessed are they that mourn: for they shall be comforted) — THREAD 1
--                (the under-the-sun lament answered by the covenant comfort)
--        Extras: none warranted distinct (the comfort-hope is carried best by Isaiah 61 + the NT; no
--                clean extra-canonical witness improves on the Tanakh-to-NT weave)
--        Tanakh: ★ Psalm 12:5 (For the oppression of the poor... now will I arise, saith Yahuah),
--                ★ Lamentations 1:2 (among all her lovers she hath none to comfort her),
--                Lamentations 1:16 (the comforter that should relieve my soul is far from me),
--                ★ Isaiah 61:1-2 (anointed... to bind up the brokenhearted... to comfort all that
--                mourn) — THREAD 1
--   v.2-3 (praised the dead... better is he... which hath not yet been)
--        NT/Extras/Tanakh: none warranted as a distinct thread — the despair of the oppressed is the
--                tail of v.1's lament; held in thread 1's prose, the cry that under-the-sun cannot answer
--   v.4 (every right work, that for this a man is envied of his neighbour... vanity)
--        NT/Extras: held in thread 2's prose (the rivalry that drives grasping toil)
--        Tanakh: woven into thread 2 (the envy-driven travail the handful-with-quietness rebukes)
--   v.5 (The fool foldeth his hands together, and eateth his own flesh)
--        Tanakh: held in prose (the opposite error — sloth — bracketing the contentment of v.6)
--   ★ v.6 (Better is an handful with quietness, than both the hands full with travail and vexation
--          of spirit)
--        NT:     ★ 1 Timothy 6:6 (But godliness with contentment is great gain) — THREAD 2
--        Extras: none warranted distinct (Sirach's wealth-vanity sayings are weaker than the Proverbs
--                "better-is" pair; the clean Sirach witness is spent on the friendship thread)
--        Tanakh: ★ Proverbs 15:16 (Better is little with the fear of Yahuah than great treasure and
--                trouble therewith), ★ Proverbs 16:8 (Better is a little with righteousness than great
--                revenues without right), Proverbs 15:17 (Better is a dinner of herbs where love is) — THREAD 2
--   ★ v.8 (one alone... neither child nor brother... no end of all his labour... For whom do I
--          labour... This is also vanity)
--        anchors THREAD 3 as the foil the praise of companionship answers
--   ★ v.9-12 (Two are better than one... if they fall, the one will lift up his fellow... a
--          threefold cord is not quickly broken)
--        NT:     none warranted distinct (the created-good frame is carried by Genesis 2:18; no NT
--                verse improves on the Torah root + wisdom witnesses)
--        Extras: ★ Sirach (Ecclesiasticus) 6:14-16 (A faithfull friend is a strong defence... a
--                faithful friend is the medicine of life) — THREAD 3
--        Tanakh: ★ Genesis 2:18 (It is not good that the man should be alone; I will make him an help
--                meet for him — the created good, not mere pragmatism), ★ Proverbs 17:17 (A friend
--                loveth at all times, and a brother is born for adversity), ★ Proverbs 18:24 (there is
--                a friend that sticketh closer than a brother) — THREAD 3
--   v.13-16 (poor wise child better than an old foolish king... they also that come after shall not
--          rejoice in him... vanity)
--        NT:     none warranted (the fleeting-popularity vanity is wisdom observation, no fulfilment weave)
--        Extras: none warranted distinct
--        Tanakh: none warranted as a distinct thread — adequately self-contained; not stretched into a thread
--
-- ============================================================================
-- A. TEMP VIEW
-- ============================================================================
CREATE TEMP VIEW _s321_ecc04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the tears of the oppressed with none to comfort (4:1)
    ('canon','ecclesiastes',4,1,'canon','psalms',12,5,'free',
     E'*For the oppression of the poor, for the sighing of the needy, now will I arise, saith Yahuah (LORD); I will set him in safety from him that puffeth at him* (Psalm 12:5). The Preacher sees only the half the oppressed can see — *the tears of such as were oppressed, and they had no comforter; and on the side of their oppressors there was power* (Ecclesiastes 4:1). The Psalm supplies the other half that under-the-sun cannot: the One above the sun who rises for the very oppression that has no comforter on earth.'),
    ('canon','ecclesiastes',4,1,'canon','lamentations',1,2,'free',
     E'*She weepeth sore in the night, and her tears are on her cheeks: among all her lovers she hath none to comfort her: all her friends have dealt treacherously with her* (Lamentations 1:2). Zion in her captivity is the Preacher''s observation given a face — *the tears of such as were oppressed, and they had no comforter* (Ecclesiastes 4:1). The same wound, *she hath none to comfort her*, runs from the wisdom of Qoheleth into the lament over the scattered house.'),
    ('canon','ecclesiastes',4,1,'canon','lamentations',1,16,'free',
     E'*For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed* (Lamentations 1:16). The double cry of Ecclesiastes — *they had no comforter... but they had no comforter* (Ecclesiastes 4:1) — is the lament''s very ache: the comforter that should relieve the soul is far off, and the under-the-sun eye runs down with water for it.'),
    ('canon','ecclesiastes',4,1,'canon','isaiah',61,1,'free',
     E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1). Here is the Comforter the Preacher could not find under the sun — the Anointed sent precisely *to bind up the brokenhearted*, the answer to *they had no comforter* (Ecclesiastes 4:1) that comes from above the sun, the covenant hope meeting the lament.'),
    ('canon','ecclesiastes',4,1,'canon','isaiah',61,2,'free',
     E'*To proclaim the acceptable year of Yahuah (LORD), and the day of vengeance of our Elohim (God); to comfort all that mourn* (Isaiah 61:2). The oppressors had power and the oppressed had no comforter (Ecclesiastes 4:1) — but the Anointed is sent *to comfort all that mourn*, and the day of vengeance answers the side of the oppressors. What Qoheleth saw with no resolution, Isaiah names the Formed Son sent to resolve.'),
    ('canon','ecclesiastes',4,1,'canon','matthew',5,4,'free',
     E'*Blessed are they that mourn: for they shall be comforted* (Matthew 5:4). On the mountain Yahusha (Jesus) takes the very absence the Preacher lamented and fills it: the mourners who *had no comforter* (Ecclesiastes 4:1) are pronounced blessed, *for they shall be comforted*. The under-the-sun cry that could not be answered is answered in the One who is the Comfort of Isaiah 61.'),

    -- THREAD 2: the handful with quietness (4:6)
    ('canon','ecclesiastes',4,6,'canon','proverbs',15,16,'free',
     E'*Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith* (Proverbs 15:16). The Preacher''s *Better is an handful with quietness, than both the hands full with travail and vexation of spirit* (Ecclesiastes 4:6) is the same wisdom scale — the little weighed against the much — but Proverbs names what makes the little better: *the fear of Yahuah*, the quietness that grasping with both hands forfeits.'),
    ('canon','ecclesiastes',4,6,'canon','proverbs',16,8,'free',
     E'*Better is a little with righteousness than great revenues without right* (Proverbs 16:8). Twice the Proverb sets the handful against the full hands, and twice the difference is covenant — righteousness, the fear of Yahuah — not mere thrift. So the Preacher''s *handful with quietness* (Ecclesiastes 4:6) is no counsel of laziness but of the contentment the envy-driven toil of verse 4 destroys.'),
    ('canon','ecclesiastes',4,6,'canon','1-timothy',6,6,'free',
     E'*But godliness with contentment is great gain* (1 Timothy 6:6). Paul gathers up the whole Tanakh wisdom of the better-handful: against those who suppose *that gain is godliness*, he sets the true gain — godliness with contentment. The Preacher''s *handful with quietness* over *both the hands full with travail* (Ecclesiastes 4:6) is exactly this — the quiet sufficiency that the rivalry of verse 4 can never reach.'),

    -- THREAD 3: two are better than one / the threefold cord (4:8-12)
    ('canon','ecclesiastes',4,9,'canon','genesis',2,18,'free',
     E'*And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him* (Genesis 2:18). Before the curse and outside all pragmatism, the Maker declared the solitary state *not good* — the created root of *Two are better than one* (Ecclesiastes 4:9) and of the *woe to him that is alone when he falleth* (4:10). Companionship is not a survival tactic Qoheleth invents; it is the good Yahuah Elohim built into Adam from the beginning.'),
    ('canon','ecclesiastes',4,12,'canon','proverbs',17,17,'free',
     E'*A friend loveth at all times, and a brother is born for adversity* (Proverbs 17:17). The threefold cord *not quickly broken* (Ecclesiastes 4:12) is bound of this: a love that holds *at all times*, a brother given *for adversity* — the very *if they fall, the one will lift up his fellow* of Ecclesiastes 4:10. The Proverb names the bond that makes two stronger than one.'),
    ('canon','ecclesiastes',4,12,'canon','proverbs',18,24,'free',
     E'*A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother* (Proverbs 18:24). The Preacher praises the fellow who lifts you when you fall and the two who withstand the one (Ecclesiastes 4:10,12); Proverbs points past kinship to *a friend that sticketh closer than a brother* — the bond stronger than the cord of two, the third strand that is not quickly broken.'),
    ('canon','ecclesiastes',4,12,'apocrypha','ecclesiasticus',6,14,'extras',
     E'*A faithfull friend is a strong defence: and he that has found such an one has found a treasure* (Sirach / Ecclesiasticus 6:14). Ben Sira draws out the very strength the Preacher praises — *if one prevail against him, two shall withstand him* (Ecclesiastes 4:12): the faithful friend is *a strong defence*, the second hand that lifts the fallen, the treasure the solitary toiler of verse 8 never gained.'),
    ('canon','ecclesiastes',4,12,'apocrypha','ecclesiasticus',6,16,'extras',
     E'*A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him* (Sirach / Ecclesiasticus 6:16). The threefold cord is *not quickly broken* (Ecclesiastes 4:12) because the faithful friend is *the medicine of life* — and the wisdom tradition binds even this to the covenant: *they that fear Yahuah shall find him*. The companionship of Ecclesiastes 4 is Genesis 2:18''s good, found by those who fear Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
-- THREAD 1 (free): the tears of the oppressed with none to comfort -> the covenant Comforter
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter',
       E'The Tears of the Oppressed, and They Had No Comforter',
       E'The Preacher returns to the world *under the sun* and sees the oppressed: *and behold the tears of such as were oppressed, and they had no comforter; and on the side of their oppressors there was power; but they had no comforter* (Ecclesiastes 4:1). The word doubles — *no comforter... no comforter* — because under-the-sun has no answer in it; the lament cannot be finished from below.\n\nThe Psalm supplies the half Qoheleth''s eye could not see: *For the oppression of the poor, for the sighing of the needy, now will I arise, saith Yahuah (LORD); I will set him in safety from him that puffeth at him* (Psalm 12:5) — the One above the sun rises for the very oppression that had none to comfort it. Lamentations gives the cry a face, the scattered house weeping: *among all her lovers she hath none to comfort her* (Lamentations 1:2), *because the comforter that should relieve my soul is far from me* (Lamentations 1:16).\n\nAnd then the answer comes from above the sun, the Formed Son sent and anointed: *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me... he hath sent me to bind up the brokenhearted* (Isaiah 61:1), *to comfort all that mourn* (Isaiah 61:2). What the Preacher could not find, Isaiah names — and on the mountain Yahusha (Jesus) seals it: *Blessed are they that mourn: for they shall be comforted* (Matthew 5:4). The under-the-sun lament with no comforter is met by the covenant hope; the mourners who had none are pronounced blessed, for they shall be comforted.',
       sv.verse_id, ev.verse_id, 'free', 38975
  FROM _s321_ecc04_lookup sv, _s321_ecc04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (free): the handful with quietness -> contentment is great gain
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-4-better-is-an-handful-with-quietness',
       E'Better Is an Handful With Quietness',
       E'The engine of all the world''s toil is rivalry: *I considered all travail, and every right work, that for this a man is envied of his neighbour. This is also vanity and vexation of spirit* (Ecclesiastes 4:4). Against the envy that fills both hands, the Preacher sets the wisdom scale: *Better is an handful with quietness, than both the hands full with travail and vexation of spirit* (Ecclesiastes 4:6).\n\nThis is the Proverbs *better-is*, and Proverbs names what makes the little better — not thrift but covenant: *Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith* (Proverbs 15:16); *Better is a little with righteousness than great revenues without right* (Proverbs 16:8). The handful with quietness is the handful with the fear of Yahuah; the full hands of grasping forfeit the quietness.\n\nPaul gathers it forward against those who suppose *that gain is godliness*: *But godliness with contentment is great gain* (1 Timothy 6:6). The true gain is the quiet sufficiency the rivalry of verse 4 can never reach — the handful held in the fear of Yahuah, not the both-hands-full of vexation of spirit.',
       sv.verse_id, ev.verse_id, 'free', 38976
  FROM _s321_ecc04_lookup sv, _s321_ecc04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (extras): two are better than one / a threefold cord (Gen 2:18 created good)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord',
       E'Two Are Better Than One, and a Threefold Cord',
       E'The Preacher sees the solitary toiler — *There is one alone, and there is not a second; yea, he hath neither child nor brother: yet is there no end of all his labour... For whom do I labour, and bereave my soul of good?* (Ecclesiastes 4:8) — and answers him with the great praise of fellowship: *Two are better than one; because they have a good reward for their labour. For if they fall, the one will lift up his fellow: but woe to him that is alone when he falleth... And if one prevail against him, two shall withstand him; and a threefold cord is not quickly broken* (Ecclesiastes 4:9,10,12).\n\nThis is not mere pragmatism. It is the created good, declared before the curse: *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him* (Genesis 2:18). Companionship is built into Adam from the beginning; the woe to him that is alone reaches back to *it is not good that the man should be alone*.\n\nThe wisdom witnesses bind the cord tight: *A friend loveth at all times, and a brother is born for adversity* (Proverbs 17:17) — the very one who lifts up his fellow when he falls; and *there is a friend that sticketh closer than a brother* (Proverbs 18:24), the bond stronger than two. And Ben Sira draws out the strength: *A faithfull friend is a strong defence: and he that has found such an one has found a treasure* (Sirach / Ecclesiasticus 6:14) — the second hand that withstands when one prevails; *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him* (Sirach / Ecclesiasticus 6:16). The threefold cord is not quickly broken because the faithful friend is the medicine of life — Genesis 2:18''s good, found by those who fear Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 38977
  FROM _s321_ecc04_lookup sv, _s321_ecc04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*now will I arise, saith Yahuah (LORD)* (Psalm 12:5) — the One above the sun rises for the oppression that had no comforter under it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*she hath none to comfort her* (Lamentations 1:2) — the scattered house gives the Preacher''s observation a weeping face.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the comforter that should relieve my soul is far from me* (Lamentations 1:16) — the double cry of Ecclesiastes 4:1 is the lament''s very ache.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he hath sent me to bind up the brokenhearted* (Isaiah 61:1) — the Anointed, the Formed Son, is the Comforter Qoheleth could not find under the sun.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*to comfort all that mourn* (Isaiah 61:2) — the day of vengeance answers the side of the oppressors; the comfort answers the side that had none.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Blessed are they that mourn: for they shall be comforted* (Matthew 5:4) — Yahusha (Jesus) fills the absence; the mourners who had no comforter are pronounced blessed.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-the-tears-of-the-oppressed-and-they-had-no-comforter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Better is little with the fear of Yahuah (LORD) than great treasure and trouble therewith* (Proverbs 15:16) — the handful with quietness is the handful with the fear of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-better-is-an-handful-with-quietness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Better is a little with righteousness than great revenues without right* (Proverbs 16:8) — twice the Proverb makes the difference covenant, not mere thrift.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-better-is-an-handful-with-quietness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*But godliness with contentment is great gain* (1 Timothy 6:6) — Paul names the true gain the handful with quietness holds and the both-hands-full forfeit.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-better-is-an-handful-with-quietness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*It is not good that the man should be alone* (Genesis 2:18) — the created good, declared before the curse; the woe to him that is alone reaches back here.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A friend loveth at all times, and a brother is born for adversity* (Proverbs 17:17) — the one who lifts up his fellow when he falls.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there is a friend that sticketh closer than a brother* (Proverbs 18:24) — the bond stronger than the cord of two, the third strand not quickly broken.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*A faithfull friend is a strong defence... has found a treasure* (Sirach / Ecclesiasticus 6:14) — the second hand that withstands when one prevails; the treasure the solitary toiler never gained.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him* (Sirach / Ecclesiasticus 6:16) — the threefold cord is not quickly broken; the bond is bound to the fear of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s321_ecc04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s321_ecc04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-4-two-are-better-than-one-and-a-threefold-cord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_5.sql (Ecclesiastes 5) -----
-- Book: Ecclesiastes  Chapter: 5   Tag: ecc05   Session: s321
-- Sort band: 39000+ (one per thread, 5 threads -> 39000..39004)
-- Temp view: _s321_ecc05_lookup
-- Source edition: canon  book_slug: ecclesiastes  chapter: 5
--
-- THEME: the fear of Elohim in worship, and the vanity of riches.
--
-- Ecclesiastes 5 coverage:
--   v.1-2  NT:     Matthew 6:7 (vain repetitions / much speaking) — threaded
--          Extras: none warranted (reverence-of-hearing carried by canon prophets)
--          Tanakh: 1 Samuel 15:22 (obey better than sacrifice), Hosea 6:6 (mercy not
--                  sacrifice), Proverbs 15:8 (sacrifice of the wicked) — threaded
--   v.3    NT/Extras/Tanakh: none warranted (proverbial restatement folded into 5:1-2 / 5:7)
--   v.4-5  NT:     Matthew 5:33-37 (swear not / let your communication be yea) — threaded
--          Extras: Ecclesiasticus 18:22 (pay your vow, defer not) — threaded
--          Tanakh: Deuteronomy 23:21 (vow unto Yahuah, slack not to pay), Numbers 30:2
--                  (he shall not break his word), Psalm 76:11 (vow and pay) — threaded
--   v.6    NT/Extras/Tanakh: none warranted (folds into the vow thread, 5:4-5)
--   v.7    NT/Extras: none warranted
--          Tanakh: Ecclesiastes 12:13 (fear Elohim and keep his commandments) — threaded (the spine)
--   v.8-9  NT/Extras/Tanakh: none warranted (the higher-than-the-highest providence; covered by book's frame)
--   v.10   NT:     1 Timothy 6:9-10 (love of money root of all evil), Hebrews 13:5 (be content) — threaded
--          Extras: Ecclesiasticus 31:5 (he that loves gold shall not be justified) — threaded
--          Tanakh: Proverbs 23:4-5 (labour not to be rich; riches fly away) — threaded
--   v.11-14 NT/Extras/Tanakh: none warranted (illustration of 5:10's vanity; carried by 5:10 + 5:15 threads)
--   v.15   NT:     1 Timothy 6:7 (brought nothing in, carry nothing out) — threaded
--          Extras: none warranted (Job 1:21 is the canon spring)
--          Tanakh: Job 1:21 (naked came I, naked shall I return) — threaded
--   v.16-17 NT/Extras/Tanakh: none warranted (the laboured-for-the-wind lament; in the 5:15 thread)
--   v.18-20 NT/Extras/Tanakh: none warranted (the eat-drink-enjoy gift refrain; book-wide motif,
--                  already carried in earlier chapters' refrain threads — not re-threaded here)
--
-- GUARDS APPLIED: 5:1-2 "be more ready to hear than to give the sacrifice of fools" = the
--   obedient, reverent hearing the prophets prize over empty ritual (1 Sam 15:22, Hosea 6:6) —
--   NOT a devaluing of true worship/Torah, but the heart Elohim requires WITHIN it. 5:4-5 vows
--   are anchored to Deut 23:21 / Num 30:2 / Matt 5:33 — the binding word, Torah affirmed (the
--   NT tightens, never dissolves, the vow). 5:7 "fear thou Elohim" is the book's repeated spine
--   pointing forward to its own conclusion 12:13. 5:10 the love of money exposed -> 1 Tim 6:10
--   (the love, not the silver, is the root). All sacred names quoted EXACTLY as dump_canon returns.

CREATE TEMP VIEW _s321_ecc05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: 5:1-2 keep thy foot / better to hear than the sacrifice of fools
    ('canon','ecclesiastes',5,1,'canon','1-samuel',15,22,'free',
     E'*Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Qoheleth''s *be more ready to hear, than to give the sacrifice of fools* (Ecclesiastes 5:1) sings the same Torah-heart Samuel spoke to Saul: Yahuah (LORD) prizes the obedient, hearkening ear above the ritual hand. This does not devalue true worship — it names the heart Elohim requires within it.'),
    ('canon','ecclesiastes',5,1,'canon','hosea',6,6,'free',
     E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). The prophet sets the same scale as the Preacher: the sacrifice of fools (Ecclesiastes 5:1) — offering without the hearing heart — is the very thing Yahuah refuses; He desires the knowledge that listens and obeys.'),
    ('canon','ecclesiastes',5,1,'canon','proverbs',15,8,'free',
     E'*The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8). This is the *sacrifice of fools* (Ecclesiastes 5:1) named exactly: the offering of a heart that *consider[s] not that they do evil* is abomination, while the few reverent words of the upright are His delight.'),
    ('canon','ecclesiastes',5,2,'canon','matthew',6,7,'free',
     E'*But when ye pray, use not vain repetitions, as the heathen do: for they think that they shall be heard for their much speaking* (Matthew 6:7). The Formed Son fills the Preacher''s charge — *let not thine heart be hasty to utter any thing before Elohim (God)... therefore let thy words be few* (Ecclesiastes 5:2) — exposing the heathen heaping-up of words as the fool''s rashness Qoheleth warned against.'),

    -- Thread 2: 5:4-5 the binding vow
    ('canon','ecclesiastes',5,4,'canon','deuteronomy',23,21,'free',
     E'*When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee; and it would be sin in thee* (Deuteronomy 23:21). The Torah is the ground of Qoheleth''s warning — *When thou vowest a vow unto Elohim (God), defer not to pay it* (Ecclesiastes 5:4): the vow is a binding word Yahuah will surely require.'),
    ('canon','ecclesiastes',5,4,'canon','numbers',30,2,'free',
     E'*If a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). The bond of the mouth stands behind *pay that which thou hast vowed* (Ecclesiastes 5:4) — the word that goes out of a man''s lips binds his soul before Elohim.'),
    ('canon','ecclesiastes',5,4,'canon','psalms',76,11,'free',
     E'*Vow, and pay unto Yahuah Elohaychem (the LORD your God): let all that be round about him bring presents unto him that ought to be feared* (Psalm 76:11). The psalm joins vow to pay as one act of the fear of Elohim, the same fear that frames Qoheleth''s *defer not to pay it* (Ecclesiastes 5:4).'),
    ('canon','ecclesiastes',5,5,'canon','matthew',5,33,'free',
     E'*Again, ye have heard that it hath been said by them of old time, Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths: But I say unto you, Swear not at all... But let your communication be, Yea, yea; Nay, nay* (Matthew 5:33-37). The Formed Son tightens, never loosens, the Preacher''s rule — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5): better the plain true word than the rash binding one broken.'),
    ('canon','ecclesiastes',5,4,'apocrypha','ecclesiasticus',18,22,'extras',
     E'*Let nothing hinder you to pay your vow in due time, and defer not until death to be justified* (Ecclesiasticus 18:22). Ben Sira, the wisdom-witness nearest Qoheleth, echoes him almost word for word — *defer not to pay it* (Ecclesiastes 5:4): the vow paid in due time, never deferred, never left as a debt at death.'),

    -- Thread 3: 5:7 fear thou Elohim (the spine)
    ('canon','ecclesiastes',5,7,'canon','ecclesiastes',12,13,'free',
     E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The refrain *but fear thou Elohim (God)* (Ecclesiastes 5:7) is the spine of the book reaching toward its own conclusion: against the multitude of dreams and many words and divers vanities, the one fixed thing is to fear Elohim and keep His commandments.'),

    -- Thread 4: 5:10 the insatiable love of money
    ('canon','ecclesiastes',5,10,'canon','proverbs',23,4,'free',
     E'*Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). Wisdom''s twin to Qoheleth''s *He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10): the increase chased is the thing that flies away, vanity pursued.'),
    ('canon','ecclesiastes',5,10,'canon','1-timothy',6,10,'free',
     E'*For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The apostle names the snare Qoheleth saw — *nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10): it is the LOVE of money, never the silver itself, that is the root, the never-satisfied hunger that pierces the soul.'),
    ('canon','ecclesiastes',5,10,'canon','hebrews',13,5,'free',
     E'*Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). The cure for the silver-lover who *shall not be satisfied with silver* (Ecclesiastes 5:10) is contentment grounded in the abiding presence of Yahuah, who never leaves nor forsakes.'),
    ('canon','ecclesiastes',5,10,'apocrypha','ecclesiasticus',31,5,'extras',
     E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5). Ben Sira sets the lover of gold beside Qoheleth''s lover of silver — *He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10): the love of gold cannot justify, and the one who follows it follows corruption.'),

    -- Thread 5: 5:15 naked shall he return
    ('canon','ecclesiastes',5,15,'canon','job',1,21,'free',
     E'*Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). Job''s confession is the spring of Qoheleth''s word — *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour* (Ecclesiastes 5:15): all that is gathered is loosed at death, and what remains is the name of Yahuah blessed.'),
    ('canon','ecclesiastes',5,15,'canon','1-timothy',6,7,'free',
     E'*For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). The apostle restates the Preacher exactly — *shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15): the naked entrance and naked exit are the frame that exposes the love of riches as vanity.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
-- Thread 1: ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools  (sort 39000, free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools',
       E'Keep thy foot — better to hear than to give the sacrifice of fools',
       E'*Keep thy foot when thou goest to the house of Elohim (God), and be more ready to hear, than to give the sacrifice of fools: for they consider not that they do evil. Be not rash with thy mouth... for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:1-2). Qoheleth sets the reverent, hearkening heart above the ritual hand — and the whole canon reaches back to confirm it. Samuel told Saul *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); Hosea cried *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6); the proverb names it plainly — *The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8). This is no devaluing of true worship or of Torah; it is the heart Elohim requires WITHIN the worship. The Formed Son fills it: *use not vain repetitions, as the heathen do: for they think that they shall be heard for their much speaking* (Matthew 6:7) — let thy words be few, and let them be the few words of one who fears.',
       sv.verse_id, ev.verse_id, 'free', 39000
  FROM _s321_ecc05_lookup sv, _s321_ecc05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed  (sort 39001, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed',
       E'When thou vowest a vow — defer not to pay it',
       E'*When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed. Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:4-5). The Preacher stands on the Torah of the binding word. Deuteronomy: *When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee* (Deuteronomy 23:21). Numbers: *he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). And the psalm joins the two as one act of fear — *Vow, and pay unto Yahuah Elohaychem (the LORD your God)... unto him that ought to be feared* (Psalm 76:11). The wisdom-witness echoes it: *Let nothing hinder you to pay your vow in due time, and defer not until death to be justified* (Ecclesiasticus 18:22). The Formed Son does not loosen this Torah but tightens it: *Swear not at all... But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:33-37) — better the plain true word kept than the rash vow broken.',
       sv.verse_id, ev.verse_id, 'extras', 39001
  FROM _s321_ecc05_lookup sv, _s321_ecc05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: ecclesiastes-5-but-fear-thou-elohim  (sort 39002, free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-5-but-fear-thou-elohim',
       E'In the multitude of dreams there are vanities — but fear thou Elohim',
       E'*For in the multitude of dreams and many words there are also divers vanities: but fear thou Elohim (God)* (Ecclesiastes 5:7). This is the spine of the whole book — the refrain that, against every dream and every multitude of words and every vanity under the sun, holds the one fixed and un-vain thing. It reaches forward to the book''s own conclusion, the verse it has been pointing to all along: *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The fear of Elohim is never a bare emotion; it is the fear that keeps His commandments — the whole duty of man, the end of all Qoheleth''s searching.',
       sv.verse_id, ev.verse_id, 'free', 39002
  FROM _s321_ecc05_lookup sv, _s321_ecc05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied  (sort 39003, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied',
       E'He that loveth silver shall not be satisfied with silver',
       E'*He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10). The Preacher exposes the bottomless hunger of the heart set on riches. Wisdom''s twin warns: *Labour not to be rich... for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). The wisdom-witness presses it: *He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5). The apostle names the root exactly — not the silver but the LOVE of it: *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). And the cure is set against it: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — contentment grounded in the abiding presence of Yahuah, the only satisfaction silver can never give.',
       sv.verse_id, ev.verse_id, 'extras', 39003
  FROM _s321_ecc05_lookup sv, _s321_ecc05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: ecclesiastes-5-naked-shall-he-return-and-carry-nothing-away  (sort 39004, free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-5-naked-shall-he-return-and-carry-nothing-away',
       E'Naked shall he return — and carry nothing of his labour away',
       E'*As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand* (Ecclesiastes 5:15). The riches *kept for the owners thereof to their hurt* (5:13) perish, and the man departs as bare as he arrived. This is Job''s own confession made into a proverb of the sun: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). And the apostle seals it: *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). The naked entrance and the naked exit are the frame that empties the love of riches of all its weight — what a man cannot carry past the grave cannot be his portion; only the fear of Elohim remains.',
       sv.verse_id, ev.verse_id, 'free', 39004
  FROM _s321_ecc05_lookup sv, _s321_ecc05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — Samuel''s word to Saul, the Torah-heart behind *be more ready to hear, than to give the sacrifice of fools*.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — the prophet''s scale: the offering without the hearing heart is the thing Yahuah refuses.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The sacrifice of the wicked is an abomination to Yahuah (LORD): but the prayer of the upright is his delight* (Proverbs 15:8) — the *sacrifice of fools* named exactly.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*use not vain repetitions, as the heathen do: for they think that they shall be heard for their much speaking* (Matthew 6:7) — the Formed Son fills *let thy words be few*.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-better-to-hear-than-the-sacrifice-of-fools'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt not slack to pay it: for Yahuah Elohayka (the LORD thy God) will surely require it of thee* (Deuteronomy 23:21) — the Torah ground of the binding vow.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2) — the bond of the mouth that binds the soul.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Vow, and pay unto Yahuah Elohaychem (the LORD your God)... unto him that ought to be feared* (Psalm 76:11) — vow and pay as one act of the fear of Elohim.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Swear not at all... But let your communication be, Yea, yea; Nay, nay* (Matthew 5:33-37) — the Formed Son tightens the vow rule, the plain true word over the rash one.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Let nothing hinder you to pay your vow in due time, and defer not until death to be justified* (Ecclesiasticus 18:22) — the wisdom-witness nearest Qoheleth, echoing *defer not to pay it* almost word for word.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-defer-not-to-pay-the-vow-thou-hast-vowed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13) — the book''s own conclusion, the verse *but fear thou Elohim* has pointed to all along.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-but-fear-thou-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Labour not to be rich... for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5) — wisdom''s twin: the increase chased is the thing that flies away.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the love of money is the root of all evil... they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10) — the LOVE, never the silver itself, is the root.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the cure: contentment grounded in the abiding presence of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5) — Ben Sira''s lover of gold beside Qoheleth''s lover of silver.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=31 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-he-that-loveth-silver-shall-not-be-satisfied'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away* (Job 1:21) — the spring of Qoheleth''s word; what remains is the name of Yahuah blessed.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-naked-shall-he-return-and-carry-nothing-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7) — the apostle restating *shall take nothing of his labour... which he may carry away in his hand*.'
  FROM cross_reference_threads t
  JOIN _s321_ecc05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s321_ecc05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-5-naked-shall-he-return-and-carry-nothing-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_6.sql (Ecclesiastes 6) -----
-- Chapter: Ecclesiastes 6 — wealth without the power to enjoy it; the unsatisfied appetite; the creature's limit.
-- Tag: ecc06   Session prefix: s321   Temp view: _s321_ecc06_lookup
-- Sort band: 39025..39028 (+1 per thread)
-- Source book_slug=ecclesiastes, chapter 6 (canon).
--
-- Ecclesiastes 6 coverage:
--   v.1-2  NT:     Luke 12:20 (the rich fool — goods laid up, soul required this night) — USED
--          Extras: Sirach 14:4-5 (gathers for others, shall not take pleasure in his goods) — USED (14:4)
--          Tanakh: Ecc 5:19 (riches+power-to-eat = the gift of Elohim) USED; Deut 28:30 (curse — build/not dwell, another consumes) USED
--   v.3-6  NT:     none warranted (Sheol/one-place wisdom, no direct NT fulfillment line)
--          Extras: none warranted (Sirach 14 woven into 6:1-2 + 6:7 instead)
--          Tanakh: Job 3:16 (the untimely birth that never saw light) USED; Ecc 4:3 (better is he who hath not been) USED
--   v.7    NT:     John 6:35 (I am the bread of life — never hunger, never thirst) USED; John 6:27 (labour not for meat that perisheth) weighed, 6:35 is the answer
--          Extras: Sirach 14:9 (covetous man's eye not satisfied with his portion) USED
--          Tanakh: Prov 27:20 (hell and destruction never full; eyes of man never satisfied) USED; Hab 2:5 (enlargeth his desire as hell, cannot be satisfied) USED
--   v.8-9  NT:     none warranted   Extras: none warranted   Tanakh: folded into 6:7 appetite thread (sight-of-eyes vs wandering desire)
--   v.10   NT:     Rom 9:20 (shall the thing formed say to him that formed it?) USED
--          Extras: none warranted
--          Tanakh: Job 9:32 (he is not a man, as I am, that I should answer him) USED; Isa 45:9 (woe to him that striveth with his Maker; clay to potter) USED
--   v.11-12 NT:    none warranted   Extras: none warranted   Tanakh: man's vain shadow-life / cannot know his future — folded into 6:10 creature-limit thread
--
-- Threads (4):
--   1. ecclesiastes-6-riches-without-power-to-enjoy-them (6:1-2) [EXTRAS] — Ecc5:19 (Tanakh), Luke12:20 (NT), Deut28:30 (Tanakh), Sirach14:4 (Extras/apocrypha)
--   2. ecclesiastes-6-an-untimely-birth-is-better-than-he (6:3-6) [FREE] — Job3:16 (Tanakh), Ecc4:3 (Tanakh)
--   3. ecclesiastes-6-the-appetite-is-never-filled (6:7) [EXTRAS] — Prov27:20 (Tanakh), Hab2:5 (Tanakh), John6:35 (NT), Sirach14:9 (Extras/apocrypha)
--   4. ecclesiastes-6-the-creature-cannot-contend-with-his-maker (6:10) [FREE] — Job9:32 (Tanakh), Isa45:9 (Tanakh), Rom9:20 (NT)
--
-- Framework notes: 6:1-2 = anti-prosperity-gospel — wealth is empty unless Elohim grants the gift of enjoyment (Ecc5:19);
--   the power to eat is the gift, never automatic with the goods; Deut28:30 the covenant-curse of labouring for a stranger to consume.
--   6:7 = the bottomless craving the world cannot fill, answered ONLY in the bread of life (John6:35, handled forward).
--   6:10 "it is known that it is man" (Adam) — the creature's limit before his Maker (Isa45:9 / Rom9:20 the formed thing to the Former).

CREATE TEMP VIEW _s321_ecc06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- B. cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: riches without the power to enjoy them (6:1-2)
    ('canon','ecclesiastes',6,2,  'canon','ecclesiastes',5,19, 'free',
      E'*Every man also to whom Elohim (God) hath given riches and wealth, and hath given him power to eat thereof, and to take his portion, and to rejoice in his labour; this is the gift of Elohim (God)* (Ecclesiastes 5:19). The verse just before names the missing piece exactly: the *power to eat thereof* is itself *the gift of Elohim* — never automatic with the goods. Where 5:19 has the gift granted, 6:2 has *Elohim (God) giveth him not power to eat thereof, but a stranger eateth it*: the same wealth, but the gift withheld, *and it is an evil disease*. Contentment is from his hand or it is nowhere.'),
    ('canon','ecclesiastes',6,2,  'canon','luke',12,20, 'free',
      E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The rich fool fills his barns and says to his soul *take thine ease, eat, drink, and be merry* — and that very night *a stranger eateth it*, his goods passing to another. He has the wealth that *wanteth nothing for his soul of all that he desireth*, yet not the power to enjoy it; *this is vanity, and it is an evil disease*.'),
    ('canon','ecclesiastes',6,2,  'canon','deuteronomy',28,30, 'free',
      E'*Thou shalt betroth a wife, and another man shall lie with her: thou shalt build an house, and thou shalt not dwell therein: thou shalt plant a vineyard, and shalt not gather the grapes thereof* (Deuteronomy 28:30). The covenant-curse of Deuteronomy 28 is precisely this evil — to labour and have *a stranger eateth it*. The Preacher sees under the sun what Moses foretold under the covenant: the goods are there, but the enjoyment is taken by another.'),
    ('canon','ecclesiastes',6,2,  'apocrypha','ecclesiasticus',14,4, 'extras',
      E'*He that gathers by defrauding his own soul gathers for others, that shall spend his goods riotously* (Sirach 14:4). Ben Sira reads the same evil the Preacher names: the hoarder who *wanteth nothing for his soul of all that he desireth* yet has no power to eat thereof gathers only *for others* — *a stranger eateth it*. The next breath of Sirach seals it: *he shall not take pleasure in his goods* (14:5).'),

    -- Thread 2: an untimely birth is better than he (6:3-6)
    ('canon','ecclesiastes',6,3,  'canon','job',3,16, 'free',
      E'*Or as an hidden untimely birth I had not been; as infants which never saw light* (Job 3:16). Job in his anguish reaches for the same dark comparison the Preacher makes: the *untimely birth* that *hath not seen the sun, nor known any thing* is reckoned better than the long-lived man whose *soul be not filled with good*, and who *have no burial*. Length of days without good is no mercy.'),
    ('canon','ecclesiastes',6,3,  'canon','ecclesiastes',4,3, 'free',
      E'*Yea, better is he than both they, which hath not yet been, who hath not seen the evil work that is done under the sun* (Ecclesiastes 4:3). The Preacher had already weighed the never-born above the living and the dead; here he weighs the *untimely birth* above the man of *an hundred children* and *a thousand years twice told* who *hath seen no good*. *Do not all go to one place?* — the one grave levels the long life and the unborn alike.'),

    -- Thread 3: the appetite is never filled (6:7)
    ('canon','ecclesiastes',6,7,  'canon','proverbs',27,20, 'free',
      E'*Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20). The proverb states the law the Preacher observes: *all the labour of man is for his mouth, and yet the appetite is not filled*. The grave and the human craving share one bottomless nature — feed the mouth all it asks and the appetite gapes open still.'),
    ('canon','ecclesiastes',6,7,  'canon','habakkuk',2,5, 'free',
      E'*Yea also, because he transgresseth by wine, he is a proud man, neither keepeth at home, who enlargeth his desire as hell, and is as death, and cannot be satisfied, but gathereth unto him all nations, and heapeth unto him all people* (Habakkuk 2:5). The proud man *enlargeth his desire as hell* and *cannot be satisfied* — the very emptiness behind *the appetite is not filled*. He swallows nations and is no fuller for it.'),
    ('canon','ecclesiastes',6,7,  'canon','john',6,35, 'free',
      E'*And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). The Preacher names the wound — *all the labour of man is for his mouth, and yet the appetite is not filled* — and the Formed Son names the only cure: the bread that *perisheth* leaves the mouth craving, but *the bread of life* alone answers it, *he that cometh to me shall never hunger*. Labour for that meat instead.'),
    ('canon','ecclesiastes',6,7,  'apocrypha','ecclesiasticus',14,9, 'extras',
      E'*A covetous man’s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul* (Sirach 14:9). Ben Sira diagnoses the same unfilled mouth: the covetous eye *is not satisfied with his portion*, just as *the appetite is not filled*. The craving does not rest the soul; it *drieth up his soul*.'),

    -- Thread 4: the creature cannot contend with his Maker (6:10)
    ('canon','ecclesiastes',6,10, 'canon','job',9,32, 'free',
      E'*For he is not a man, as I am, that I should answer him, and we should come together in judgment* (Job 9:32). The Preacher draws the creature''s boundary: man *may not contend with him that is mightier than he*. Job confesses the same — Elohim is *not a man, as I am*, so there is no court where the dust may summon its Maker to answer.'),
    ('canon','ecclesiastes',6,10, 'canon','isaiah',45,9, 'free',
      E'*Woe unto him that striveth with his Maker! Let the potsherd strive with the potsherds of the earth. Shall the clay say to him that fashioneth it, What makest thou? or thy work, He hath no hands?* (Isaiah 45:9). *It is known that it is man* — Adam, the formed of the ground — and *neither may he contend with him that is mightier than he*. Isaiah pronounces the woe on the clay that argues with the One who shaped it.'),
    ('canon','ecclesiastes',6,10, 'canon','romans',9,20, 'free',
      E'*Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). Paul carries the Preacher''s limit forward in the same potter-and-clay frame: the man who *is named already* as *man* — the formed thing — cannot *contend with him that is mightier than he*. The reply against the Maker is silenced before it is spoken.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- C. cross_reference_threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-6-riches-without-power-to-enjoy-them',
  E'Riches without the power to enjoy them',
  E'The Preacher names a particular *evil which I have seen under the sun*: *A man to whom Elohim (God) hath given riches, wealth, and honour, so that he wanteth nothing for his soul of all that he desireth, yet Elohim (God) giveth him not power to eat thereof, but a stranger eateth it: this is vanity, and it is an evil disease* (Ecclesiastes 6:1-2). The wound is not poverty — it is wealth without the gift of enjoyment. The verse just before makes the missing piece explicit: *Every man also to whom Elohim (God) hath given riches and wealth, and hath given him power to eat thereof... this is the gift of Elohim (God)* (Ecclesiastes 5:19). The *power to eat thereof* is itself the gift; contentment comes from his hand or it comes from nowhere. This is the anti-prosperity-gospel verse: the goods never carry the enjoyment automatically.\n\nMessiah''s rich fool lives it out — *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20) — the barns full, the soul required, *a stranger eateth it*. And Moses had foretold this exact evil as the covenant-curse: *thou shalt build an house, and thou shalt not dwell therein: thou shalt plant a vineyard, and shalt not gather the grapes thereof* (Deuteronomy 28:30). Ben Sira reads it the same way: *He that gathers by defrauding his own soul gathers for others, that shall spend his goods riotously* (Sirach 14:4) — and *he shall not take pleasure in his goods* (14:5).',
  sv.verse_id, ev.verse_id, 'extras', 39025
  FROM _s321_ecc06_lookup sv, _s321_ecc06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-6-an-untimely-birth-is-better-than-he',
  E'An untimely birth is better than he',
  E'The Preacher pushes the vanity of unenjoyed life to its bleakest edge: *If a man beget an hundred children, and live many years... and his soul be not filled with good, and also that he have no burial; I say, that an untimely birth is better than he* (Ecclesiastes 6:3). The stillborn *hath not seen the sun, nor known any thing: this hath more rest than the other* (6:5), and though the man *live a thousand years twice told, yet hath he seen no good: do not all go to one place?* (6:6). Length of days without good is no mercy; the grave levels them all.\n\nJob reaches for the same dark comparison in his grief: *Or as an hidden untimely birth I had not been; as infants which never saw light* (Job 3:16). And the Preacher had already weighed the never-born above the living and the dead: *better is he than both they, which hath not yet been, who hath not seen the evil work that is done under the sun* (Ecclesiastes 4:3). The lesson is not despair of life but the emptiness of a life *not filled with good* — the warning that mere duration, children, and length of years are no portion at all without the gift named in the verses around it.',
  sv.verse_id, ev.verse_id, 'free', 39026
  FROM _s321_ecc06_lookup sv, _s321_ecc06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-6-the-appetite-is-never-filled',
  E'The appetite is never filled',
  E'In one line the Preacher names the bottomless human craving: *All the labour of man is for his mouth, and yet the appetite is not filled* (Ecclesiastes 6:7). Everything we work for is poured into a hunger that never closes; *better is the sight of the eyes than the wandering of the desire: this is also vanity and vexation of spirit* (6:9). The proverb states it as a fixed law: *Hell and destruction are never full; so the eyes of man are never satisfied* (Proverbs 27:20). Habakkuk paints the proud man in the same colours — he *enlargeth his desire as hell, and is as death, and cannot be satisfied, but gathereth unto him all nations* (Habakkuk 2:5) — and is no fuller for swallowing the world.\n\nThe craving does not rest the soul; Ben Sira says *a covetous man’s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul* (Sirach 14:9). The Preacher names the wound, but only the Formed Son names the cure. *Labour not for the meat which perisheth, but for that meat which endureth unto everlasting life* (John 6:27) — and then: *I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). The bread of the mouth leaves the appetite gaping; the bread of life alone fills it.',
  sv.verse_id, ev.verse_id, 'extras', 39027
  FROM _s321_ecc06_lookup sv, _s321_ecc06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-6-the-creature-cannot-contend-with-his-maker',
  E'The creature cannot contend with his Maker',
  E'The Preacher marks the boundary of the creature: *That which hath been is named already, and it is known that it is man: neither may he contend with him that is mightier than he* (Ecclesiastes 6:10). The very name *man* — Adam, formed of the ground — declares the limit; the dust cannot summon its Maker to court. *Seeing there be many things that increase vanity, what is man the better?* (6:11), and *who can tell a man what shall be after him under the sun?* (6:12) — he cannot win the argument, and he cannot know his future.\n\nJob confessed the same: *For he is not a man, as I am, that I should answer him, and we should come together in judgment* (Job 9:32). Isaiah pronounces the woe over it: *Woe unto him that striveth with his Maker!... Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9). And Paul carries the limit forward in the same potter-and-clay frame: *Nay but, O man, who art thou that repliest against Elohim (God)? Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20). The formed thing does not arraign the One who formed it — the reply is silenced before it is spoken.',
  sv.verse_id, ev.verse_id, 'free', 39028
  FROM _s321_ecc06_lookup sv, _s321_ecc06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- D. cross_reference_thread_members
-- ============================================================
-- Thread 1: riches without power to enjoy them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*this is the gift of Elohim (God)* (Ecclesiastes 5:19) — the power to eat thereof is itself the gift, the piece 6:2 says is withheld.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-riches-without-power-to-enjoy-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*this night thy soul shall be required of thee* (Luke 12:20) — the rich fool, barns full, a stranger eateth it; wealth without the power to enjoy it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-riches-without-power-to-enjoy-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt build an house, and thou shalt not dwell therein* (Deuteronomy 28:30) — the covenant-curse of labouring for a stranger to consume.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-riches-without-power-to-enjoy-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*gathers for others, that shall spend his goods riotously* (Sirach 14:4) — the hoarder gathers only for a stranger to eat; the extras witness to the same evil.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-riches-without-power-to-enjoy-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: an untimely birth is better than he
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*an hidden untimely birth... infants which never saw light* (Job 3:16) — Job''s same dark comparison; the stillborn reckoned better than the joyless long life.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-an-untimely-birth-is-better-than-he'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*better is he... which hath not yet been* (Ecclesiastes 4:3) — the Preacher already weighed the never-born above the living and the dead.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-an-untimely-birth-is-better-than-he'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the appetite is never filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the eyes of man are never satisfied* (Proverbs 27:20) — the grave and the human craving share one bottomless nature.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-appetite-is-never-filled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*enlargeth his desire as hell... cannot be satisfied* (Habakkuk 2:5) — the proud man swallows nations and is no fuller for it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-appetite-is-never-filled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I am the bread of life: he that cometh to me shall never hunger* (John 6:35) — the Formed Son names the only cure for the appetite the world cannot fill.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-appetite-is-never-filled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a covetous man’s eye is not satisfied with his portion* (Sirach 14:9) — the craving drieth up the soul; the extras witness to the unfilled appetite.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-appetite-is-never-filled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the creature cannot contend with his Maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he is not a man, as I am, that I should answer him* (Job 9:32) — there is no court where the dust may summon its Maker.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=9 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-creature-cannot-contend-with-his-maker'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Shall the clay say to him that fashioneth it, What makest thou?* (Isaiah 45:9) — the woe on the clay that argues with the One who shaped it.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-creature-cannot-contend-with-his-maker'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Shall the thing formed say to him that formed it, Why hast thou made me thus?* (Romans 9:20) — the creature''s limit carried forward in the same potter-and-clay frame.'
  FROM cross_reference_threads t
  JOIN _s321_ecc06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s321_ecc06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-6-the-creature-cannot-contend-with-his-maker'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_7.sql (Ecclesiastes 7) -----
-- Chapter: Ecclesiastes 7 — the wisdom of sober reflection
-- Tag: ecc07 ; session prefix s321 ; temp view _s321_ecc07_lookup
-- sort_order band: 39050 + 1 per thread (39050..39054)
-- Source book_slug=ecclesiastes, chapter 7
--
-- Ecclesiastes 7 coverage:
--   v.1-4 (good name; house of mourning; sorrow better than laughter):
--        NT:     2 Corinthians 7:10 (godly sorrow worketh repentance) [woven]
--        Extras: Ecclesiasticus (Sirach) 7:36 (remember the end and never do amiss) [woven]
--        Tanakh: Proverbs 22:1 (a good name rather than great riches), Psalm 90:12 (number our days),
--                Psalm 39:4 (make me know mine end) [all woven]
--   v.5-7 (rebuke of the wise; laughter of fools; oppression/gift): NT none warranted;
--        Extras none warranted; Tanakh folded under house-of-mourning theme (5-6 = fool's mirth) — no separate thread
--   v.8 (end of a thing better than beginning; patient in spirit): folded into mourning/sober-reflection thread
--        as a member of the same wisdom-of-the-end weave (Sirach 7:36 remember-the-end)
--   v.9-12 (anger; former days; wisdom a defence): NT/Extras/Tanakh none warranted (general wisdom proverbs)
--   v.13-14 (consider the work of Elohim; day of prosperity / day of adversity, the one over against the other):
--        NT:     none warranted ; Extras: none warranted
--        Tanakh: Job 2:10 (shall we receive good and not evil), Isaiah 45:7 (I make peace and create evil),
--                Lamentations 3:38 (out of the mouth of El Elyon proceedeth not evil and good) [all woven]
--   v.15-18 (just man perisheth / wicked prolonged; be not righteous over much / over much wicked; fear of Elohim):
--        NT:     none warranted (guarded — NOT Romans-grace-vs-law)
--        Extras: Ecclesiasticus (Sirach) 1:14 (to fear Yahuah is the beginning of wisdom) [woven]
--        Tanakh: folded — the balance is the fear of Elohim (7:18), the same axis as Proverbs 1:7/9:10
--   v.19 (wisdom strengtheneth): none warranted
--   v.20 (there is not a just man upon earth that sinneth not):  ★★ universal sin
--        NT:     Romans 3:23 (all have sinned) [PRE-EXISTING bare cross_ref — reused], Romans 3:10 (none righteous),
--                Romans 3:31 (we establish the law — the guard), 1 John 1:8 (if we say we have no sin) [woven]
--        Extras: none warranted
--        Tanakh: 1 Kings 8:46 (there is no man that sinneth not), Psalm 143:2 (in thy sight shall no man living be justified) [woven]
--   v.21-28 (heed not all words; bitter than death the snaring woman; one man among a thousand):
--        NT/Extras/Tanakh none warranted (Solomon's personal search; no framework weave)
--   v.29 (Elohim made man upright; they sought out many inventions):  ★ upright creation then the fall
--        NT:     Romans 5:12 (by one man sin entered the world) [woven]
--        Extras: The Wisdom of Solomon 2:23-24 (created man immortal / through envy of the devil death entered) [woven]
--        Tanakh: Genesis 1:27 (created man in his own image), Genesis 1:31 (very good),
--                Genesis 6:5 (every imagination only evil continually) [all woven]
--
-- Threads (slug -> target libraries):
--   ecclesiastes-7-a-good-name-and-the-house-of-mourning            -> Tanakh + NT + Extras(Sirach)   [extras]
--   ecclesiastes-7-both-the-good-day-and-the-evil-day-are-from-elohim -> Tanakh                         [free]
--   ecclesiastes-7-the-balance-kept-by-the-fear-of-elohim           -> Extras(Sirach)                  [extras]
--   ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not -> Tanakh + NT                  [free]
--   ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions -> Tanakh + NT + Extras(WisSol) [extras]
--
-- GUARDS applied:
--   7:16-18 "be not righteous over much" = warning against self-righteous, censorious over-scrupulousness
--     AND against wickedness — both escaped by "he that feareth Elohim" (the fear of Elohim is the balance);
--     NOT a license for lukewarm compromise, NOT a devaluing of Torah-obedience.
--   7:20 universal sin -> Romans 3:23 EXPOSES the need; it does NOT abolish Torah — Romans 3:31 "we establish the law" woven as guard.
--   7:29 man made upright then sought inventions = the goodness of the creation and the reality of the fall (no flaw in the Creator).

CREATE TEMP VIEW _s321_ecc07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: a good name and the house of mourning (7:1-8)
    ('canon','ecclesiastes',7,1,'canon','proverbs',22,1,'free',
      E'*A good name is rather to be chosen than great riches, and loving favour rather than silver and gold.* (Proverbs 22:1). The preacher''s *A good name is better than precious ointment; and the day of death than the day of one''s birth* (Ecclesiastes 7:1) sings the same wisdom Proverbs sings — the imperishable name weighed against perishable wealth, the ointment that fades and the riches that fly away.'),
    ('canon','ecclesiastes',7,1,'canon','psalms',90,12,'free',
      E'*So teach us to number our days, that we may apply our hearts unto wisdom.* (Psalm 90:12). When the preacher prizes *the day of death than the day of one''s birth* (Ecclesiastes 7:1) and says *the living will lay it to his heart* (Ecclesiastes 7:2), he is doing what Moses prayed — letting the certainty of the end teach the heart wisdom.'),
    ('canon','ecclesiastes',7,2,'canon','psalms',39,4,'free',
      E'*Yahuah (LORD), make me to know mine end, and the measure of my days, what it is; that I may know how frail I am.* (Psalm 39:4). The house of mourning, where *that is the end of all men; and the living will lay it to his heart* (Ecclesiastes 7:2), is the very school David asks to enter — to know his end and so to measure his days.'),
    ('canon','ecclesiastes',7,3,'canon','2-corinthians',7,10,'free',
      E'*For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* (2 Corinthians 7:10). *Sorrow is better than laughter: for by the sadness of the countenance the heart is made better* (Ecclesiastes 7:3) — Sha''ul names what the preacher saw: a grief that does its saving work upon the heart, not the world''s sorrow that ends in death.'),
    ('canon','ecclesiastes',7,8,'apocrypha','ecclesiasticus',7,36,'extras',
      E'*Whatsoever you take in hand, remember the end, and you shall never do amiss.* (Ecclesiasticus / Sirach 7:36). Ben Sira distills the chapter: *Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit* (Ecclesiastes 7:8) — the wise keep the end in view, and so the house of mourning makes the heart better than the house of mirth.'),
    -- THREAD 2: both the good day and the evil day are from Elohim (7:13-14)
    ('canon','ecclesiastes',7,14,'canon','job',2,10,'free',
      E'*But he said unto her, Thou speakest as one of the foolish women speaketh. What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips.* (Job 2:10). *In the day of prosperity be joyful, but in the day of adversity consider: Elohim (God) also hath set the one over against the other* (Ecclesiastes 7:14) — Job lives the very wisdom: both the good day and the hard day come from the one hand.'),
    ('canon','ecclesiastes',7,14,'canon','isaiah',45,7,'free',
      E'*I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things.* (Isaiah 45:7). When the preacher says *Elohim (God) also hath set the one over against the other* (Ecclesiastes 7:14), he confesses what Yahuah declares to Cyrus — the prosperity and the adversity alike are set in place by the sovereign hand, that man should find nothing after him.'),
    ('canon','ecclesiastes',7,13,'canon','lamentations',3,38,'free',
      E'*Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:38). *Consider the work of Elohim (God): for who can make that straight, which he hath made crooked?* (Ecclesiastes 7:13) — the weeping prophet asks the same question the preacher asks: who orders the crooked and the straight, the good and the evil, if not the Most High himself?'),
    -- THREAD 3: the balance kept by the fear of Elohim (7:16-18)
    ('canon','ecclesiastes',7,18,'apocrypha','ecclesiasticus',1,14,'extras',
      E'*To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Ecclesiasticus / Sirach 1:14). The preacher warns against self-righteous excess and against wickedness alike, then names the one axis that escapes both: *for he that feareth Elohim (God) shall come forth of them all* (Ecclesiastes 7:18). Ben Sira places that fear where all wisdom begins — not lukewarm compromise but the reverence that holds the soul true.'),
    -- THREAD 4: there is not a just man upon earth that sinneth not (7:20)
    ('canon','ecclesiastes',7,20,'canon','romans',3,23,'free',
      E'*For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23). *For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) — Sha''ul gathers the whole world under the preacher''s verdict; the gap is universal, and it exposes the need without ever abolishing the Torah it convicts us by.'),
    ('canon','ecclesiastes',7,20,'canon','romans',3,10,'free',
      E'*As it is written, There is none righteous, no, not one:* (Romans 3:10). Sha''ul cites the verdict the preacher already pronounced — *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) — laying Jew and Greek alike under the same truth that none is righteous of himself.'),
    ('canon','ecclesiastes',7,20,'canon','1-kings',8,46,'free',
      E'*If they sin against thee, (for there is no man that sinneth not,) and thou be angry with them, and deliver them to the enemy...* (1 Kings 8:46). Solomon prays at the temple dedication the very truth he later writes: *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) — *there is no man that sinneth not* — and so he begs mercy for a people who will surely fall.'),
    ('canon','ecclesiastes',7,20,'canon','psalms',143,2,'free',
      E'*And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* (Psalm 143:2). David asks not to be judged on the strict account, because *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) — no man living stands justified before that gaze on his own doing.'),
    ('canon','ecclesiastes',7,20,'canon','1-john',1,8,'free',
      E'*If we say that we have no sin, we deceive ourselves, and the truth is not in us.* (1 John 1:8). Yochanan seals the preacher''s verdict — *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) — the man who claims sinlessness is self-deceived; honesty about sin is the door to cleansing.'),
    ('canon','ecclesiastes',7,20,'canon','romans',3,31,'free',
      E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law.* (Romans 3:31). The universal sin of *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20) exposes the need for mercy — but Sha''ul guards the very next breath: the Torah is not made void by faith; it is established. Sin convicted by the law does not abolish the law.'),
    -- THREAD 5: Elohim made man upright but they sought out many inventions (7:29)
    ('canon','ecclesiastes',7,29,'canon','genesis',1,27,'free',
      E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). *Lo, this only have I found, that Elohim (God) hath made man upright* (Ecclesiastes 7:29) reaches back to the very forming — man bore the image, made upright; the marring was not in the Maker''s hand.'),
    ('canon','ecclesiastes',7,29,'canon','genesis',1,31,'free',
      E'*And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* (Genesis 1:31). The preacher''s *Elohim (God) hath made man upright* (Ecclesiastes 7:29) is the verdict of the sixth day — *very good* — over the creation before any invention of man corrupted it.'),
    ('canon','ecclesiastes',7,29,'canon','genesis',6,5,'free',
      E'*And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5). *They have sought out many inventions* (Ecclesiastes 7:29) names the descent Genesis records: the upright creature turned his thoughts to evil continually — the fall is in man''s devising, not the Maker''s design.'),
    ('canon','ecclesiastes',7,29,'canon','romans',5,12,'free',
      E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* (Romans 5:12). Sha''ul traces the inventions back to their first author: *Elohim (God) hath made man upright; but they have sought out many inventions* (Ecclesiastes 7:29) — by one man sin entered, and the upright creation came under death through its own seeking.'),
    ('canon','ecclesiastes',7,29,'apocrypha','the-wisdom-of-solomon',2,23,'extras',
      E'*For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity.* (The Wisdom of Solomon 2:23). *Elohim (God) hath made man upright* (Ecclesiastes 7:29) — created in the image, made for eternity; the upright forming is exactly what the Wisdom of Solomon confesses before naming what undid it.'),
    ('canon','ecclesiastes',7,29,'apocrypha','the-wisdom-of-solomon',2,24,'extras',
      E'*Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (The Wisdom of Solomon 2:24). *But they have sought out many inventions* (Ecclesiastes 7:29) — the Wisdom of Solomon names the first invention sought, the envy of the serpent that brought death upon the upright creation (Genesis 3).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-7-a-good-name-and-the-house-of-mourning',
  E'A good name, and the house of mourning',
  E'The preacher opens chapter seven with the wisdom that learns from death and grief: *A good name is better than precious ointment; and the day of death than the day of one''s birth* (Ecclesiastes 7:1). *It is better to go to the house of mourning, than to go to the house of feasting: for that is the end of all men; and the living will lay it to his heart* (Ecclesiastes 7:2). *Sorrow is better than laughter: for by the sadness of the countenance the heart is made better* (Ecclesiastes 7:3); *The heart of the wise is in the house of mourning; but the heart of fools is in the house of mirth* (Ecclesiastes 7:4). This is the same scale Proverbs holds — *A good name is rather to be chosen than great riches, and loving favour rather than silver and gold* (Proverbs 22:1) — and the same school Moses prayed to enter: *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12), which David begged for too: *Yahuah (LORD), make me to know mine end, and the measure of my days, what it is; that I may know how frail I am* (Psalm 39:4). Sha''ul names the saving grief the preacher saw: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). And Ben Sira distills it: *Whatsoever you take in hand, remember the end, and you shall never do amiss* (Ecclesiasticus / Sirach 7:36) — for *Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit* (Ecclesiastes 7:8). The wise keep the end in view, and so the house of mourning makes the heart better than the house of mirth.',
  sv.verse_id, ev.verse_id, 'extras', 39050
  FROM _s321_ecc07_lookup sv, _s321_ecc07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-7-both-the-good-day-and-the-evil-day-are-from-elohim',
  E'Both the good day and the evil day are from Elohim',
  E'*Consider the work of Elohim (God): for who can make that straight, which he hath made crooked?* (Ecclesiastes 7:13). *In the day of prosperity be joyful, but in the day of adversity consider: Elohim (God) also hath set the one over against the other, to the end that man should find nothing after him* (Ecclesiastes 7:14). Both the good days and the hard days come from the one sovereign hand. Job lived this very wisdom when the calamity fell: *What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips* (Job 2:10). Yahuah declares it of himself to Cyrus: *I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7). And the weeping prophet asks it as a settled truth: *Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:38). The preacher does not bid us read the crooked as a flaw in the Maker — he bids us consider the work of Elohim, who has set the one over against the other.',
  sv.verse_id, ev.verse_id, 'free', 39051
  FROM _s321_ecc07_lookup sv, _s321_ecc07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-7-the-balance-kept-by-the-fear-of-elohim',
  E'The balance kept by the fear of Elohim',
  E'*Be not righteous over much; neither make thyself over wise: why shouldest thou destroy thyself?* (Ecclesiastes 7:16). *Be not over much wicked, neither be thou foolish: why shouldest thou die before thy time?* (Ecclesiastes 7:17). This is no license for lukewarm compromise — it is a double warning: against the self-righteous, censorious over-scrupulousness that destroys a man, and against the wickedness that cuts his days short. The preacher then names the one axis that escapes both excesses: *It is good that thou shouldest take hold of this; yea, also from this withdraw not thine hand: for he that feareth Elohim (God) shall come forth of them all* (Ecclesiastes 7:18). The fear of Elohim is the balance — the same fear in which all wisdom begins: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Ecclesiasticus / Sirach 1:14). This reverence does not devalue obedience; it is the very root that holds a soul true between the ditches of self-righteous excess and open wickedness.',
  sv.verse_id, ev.verse_id, 'extras', 39052
  FROM _s321_ecc07_lookup sv, _s321_ecc07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not',
  E'There is not a just man upon earth that sinneth not',
  E'*For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20). The preacher pronounces the universal verdict, and the whole canon echoes it. Solomon prayed it at the temple dedication: *for there is no man that sinneth not* (1 Kings 8:46). David begged not to be tried on the strict account: *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). Sha''ul gathers Jew and Greek alike under it: *As it is written, There is none righteous, no, not one* (Romans 3:10); *For all have sinned, and come short of the glory of Elohim (God)* (Romans 3:23). And Yochanan seals it: *If we say that we have no sin, we deceive ourselves, and the truth is not in us* (1 John 1:8). But mark the guard — this universal sin exposes the need for mercy; it does not abolish the Torah it convicts us by. Sha''ul says so in the same breath: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). The verdict humbles every man; it never voids the commandment.',
  sv.verse_id, ev.verse_id, 'free', 39053
  FROM _s321_ecc07_lookup sv, _s321_ecc07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions',
  E'Elohim made man upright, but they sought out many inventions',
  E'The preacher closes the chapter with the whole shape of the human story in one line: *Lo, this only have I found, that Elohim (God) hath made man upright; but they have sought out many inventions* (Ecclesiastes 7:29). The forming was good — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27) — and the verdict of the sixth day was *behold, it was very good* (Genesis 1:31). The Wisdom of Solomon confesses the same upright making: *For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (The Wisdom of Solomon 2:23). The marring was not in the Maker''s hand but in man''s own devising — *through envy of the devil came death into the world* (The Wisdom of Solomon 2:24), and the inventions multiplied until *every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5). Sha''ul names the first author: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The goodness of the creation and the reality of the fall stand together: Elohim made man upright; the inventions are man''s own.',
  sv.verse_id, ev.verse_id, 'extras', 39054
  FROM _s321_ecc07_lookup sv, _s321_ecc07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=7 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ thread_members
-- THREAD 1: a good name and the house of mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A good name is rather to be chosen than great riches* (Proverbs 22:1) — the imperishable name weighed against perishable wealth, the same scale as Ecclesiastes 7:1.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-a-good-name-and-the-house-of-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12) — the school the house of mourning opens; Ecclesiastes 7:1-2 lets the end teach the heart.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-a-good-name-and-the-house-of-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD), make me to know mine end... that I may know how frail I am* (Psalm 39:4) — David asks to enter the very house of mourning of Ecclesiastes 7:2, to measure his days.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-a-good-name-and-the-house-of-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For godly sorrow worketh repentance to salvation* (2 Corinthians 7:10) — Sha''ul names the grief that *maketh the heart better* in Ecclesiastes 7:3.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-a-good-name-and-the-house-of-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Remember the end, and you shall never do amiss* (Ecclesiasticus / Sirach 7:36) — Ben Sira distills *Better is the end of a thing than the beginning thereof* (Ecclesiastes 7:8).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=7 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-a-good-name-and-the-house-of-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: both the good day and the evil day are from Elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Consider the work of Elohim... who can make that straight, which he hath made crooked?* (Ecclesiastes 7:13) → *Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:38) — the weeping prophet asks the preacher''s own question.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-both-the-good-day-and-the-evil-day-are-from-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*shall we receive good at the hand of Elohim (God), and shall we not receive evil?* (Job 2:10) — Job lives the wisdom of Ecclesiastes 7:14, both days from one hand.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-both-the-good-day-and-the-evil-day-are-from-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7) — Yahuah declares of himself what the preacher confesses: *Elohim hath set the one over against the other* (Ecclesiastes 7:14).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-both-the-good-day-and-the-evil-day-are-from-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the balance kept by the fear of Elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To fear Yahuah (God) is the beginning of wisdom* (Ecclesiasticus / Sirach 1:14) — the one axis that escapes both excesses: *he that feareth Elohim shall come forth of them all* (Ecclesiastes 7:18).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-the-balance-kept-by-the-fear-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: there is not a just man upon earth that sinneth not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*for there is no man that sinneth not* (1 Kings 8:46) — Solomon prays at the temple the verdict he later writes in Ecclesiastes 7:20.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*in thy sight shall no man living be justified* (Psalm 143:2) — David asks not to be tried on the strict account, for the verdict of Ecclesiastes 7:20 stands over all.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*There is none righteous, no, not one* (Romans 3:10) — Sha''ul lays Jew and Greek alike under the preacher''s verdict (Ecclesiastes 7:20).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For all have sinned, and come short of the glory of Elohim (God)* (Romans 3:23) — the universal gap the preacher saw in Ecclesiastes 7:20 [the pre-existing pairing, woven into the thread].'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If we say that we have no sin, we deceive ourselves* (1 John 1:8) — Yochanan seals the verdict of Ecclesiastes 7:20; honesty about sin opens the door to cleansing.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*we establish the law* (Romans 3:31) — the guard: universal sin exposes the need, it does NOT make void the Torah it convicts us by (Ecclesiastes 7:20).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-there-is-not-a-just-man-upon-earth-that-sinneth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: Elohim made man upright but they sought out many inventions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*So Elohim (God) created man in his own image* (Genesis 1:27) — the upright forming the preacher reaches back to in Ecclesiastes 7:29.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*behold, it was very good* (Genesis 1:31) — the sixth-day verdict over the creation made upright (Ecclesiastes 7:29).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (The Wisdom of Solomon 2:23) — the upright making the preacher confesses (Ecclesiastes 7:29).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*through envy of the devil came death into the world* (The Wisdom of Solomon 2:24) — names the first invention sought (Ecclesiastes 7:29; Genesis 3).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5) — the inventions multiplied into the descent the preacher names (Ecclesiastes 7:29).'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*as by one man sin entered into the world, and death by sin* (Romans 5:12) — Sha''ul names the first author of the inventions of Ecclesiastes 7:29.'
  FROM cross_reference_threads t
  JOIN _s321_ecc07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s321_ecc07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-7-elohim-made-man-upright-but-they-sought-out-many-inventions'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_8.sql (Ecclesiastes 8) -----
-- Ecclesiastes 8 — wisdom before authority, and the delayed judgment of Elohim.
-- tag: ecc08 ; session prefix s321 ; temp view _s321_ecc08_lookup
-- slug prefix: ecclesiastes-8-... ; sort_order band: 39075+ (+1 per thread)
-- source: canon / ecclesiastes / chapter 8
--
-- Ecclesiastes 8 coverage:
--   v.1  (wisdom maketh the face to shine)
--        NT:     Matthew 13:43 (the righteous shine forth as the sun) — USED
--        Extras: none warranted
--        Tanakh: Exodus 34:29 (Moses' face shone), Numbers 6:25 (Yahuah make his face shine) — USED
--   v.2-5  (keep the king's commandment / feel no evil thing)
--        NT:     Romans 13:1 (powers ordained of Elohim), 1 Peter 2:13 (submit to every ordinance of man) — USED
--        Extras: none warranted (Sirach near but no clean parse pulled)
--        Tanakh: Proverbs 24:21 (fear Yahuah and the king) — USED
--   v.6-10 (time and judgment / no power over the spirit / the wicked buried)
--        NT:     none warranted (gathered into the 8:11 and 8:12-13 threads)
--        Extras: none warranted
--        Tanakh: none warranted (folded into the delay/end threads below)
--   v.11 ★ (sentence not executed speedily emboldens the wicked)
--        NT:     2 Peter 3:9 (Yahuah not slack, longsuffering), Romans 2:4-5 (goodness leadeth to repentance / treasurest up wrath) — USED
--        Extras: none warranted
--        Tanakh: Psalm 50:21 (thou thoughtest I was such an one as thyself) — USED
--   v.12-13 ★ (sinner's days prolonged, yet it shall be well with them that fear Elohim; the fear divides the two ends)
--        NT:     none warranted (the certain-end weave runs Tanakh-forward; Mal/Isa/Ps carry it)
--        Extras: none warranted
--        Tanakh: Psalm 1:6 (Yahuah knoweth the way of the righteous), Malachi 3:18 (discern between righteous and wicked), Isaiah 3:10-11 (well with the righteous / woe to the wicked) — USED
--   v.14-15 (vanity of reversed recompense / eat-drink-be-merry gift refrain)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (refrain = contented reception of the daily gift; framed in 8:12-13 summary, not a separate thread — guarded against hedonism reading)
--   v.16-17 (the unsearchable work of Elohim)
--        NT:     Romans 11:33 (how unsearchable his judgments) — USED
--        Extras: none warranted
--        Tanakh: Ecclesiastes 3:11 (no man can find out the work), Job 11:7 (canst thou by searching find out Elohim?) — USED
--
-- THREADS (5):
--   ecclesiastes-8-a-mans-wisdom-maketh-his-face-to-shine          (free) Tanakh+NT  | Exod 34:29, Num 6:25, Matt 13:43
--   ecclesiastes-8-keep-the-kings-commandment-feel-no-evil-thing    (free) Tanakh+NT  | Prov 24:21, Rom 13:1, 1Pet 2:13
--   ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened (free) Tanakh+NT | Ps 50:21, 2Pet 3:9, Rom 2:4, Rom 2:5
--   ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim      (free) Tanakh     | Ps 1:6, Mal 3:18, Isa 3:10, Isa 3:11
--   ecclesiastes-8-the-unsearchable-work-of-elohim-under-the-sun    (free) Tanakh+NT  | Eccl 3:11, Rom 11:33, Job 11:7
--
-- GUARD: 8:11 delay + 8:12-13 certain end = the longsuffering of Elohim the wicked mistake for absence
--   (2 Pet 3:9, Rom 2:4); the fear of Elohim divides the two ends — the book's spine, forward to 12:13.
--   The eat-drink-be-merry refrain = contented reception of the daily gift Elohim giveth, NOT hedonism.

CREATE TEMP VIEW _s321_ecc08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- 8:1 — wisdom maketh the face to shine
    ('canon','ecclesiastes',8,1,'canon','exodus',34,29,'free',
     E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). The Preacher asks *Who is as the wise man?... a man''s wisdom maketh his face to shine* (Ecclesiastes 8:1); the type stands at Sinai — the face that has been near the words of Yahuah (LORD) carries their light, the wisdom of the Torah marking the man who keeps it.'),
    ('canon','ecclesiastes',8,1,'canon','numbers',6,25,'free',
     E'*Yahuah (LORD) make his face shine upon thee, and be gracious unto thee:* (Numbers 6:25). The shining face of wisdom in *a man''s wisdom maketh his face to shine* (Ecclesiastes 8:1) is the priestly blessing answered downward — the light a man bears is the lifted countenance of Yahuah (LORD) reflected in the one who walks in His instruction.'),
    ('canon','ecclesiastes',8,1,'canon','matthew',13,43,'free',
     E'*Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43). The wisdom that *maketh his face to shine* (Ecclesiastes 8:1) under the sun is the foretaste of the harvest-end glory the Formed Son promises His own — the righteous shining forth not by their own brightness but in the kingdom of their Father.'),

    -- 8:2-5 — keep the king's commandment
    ('canon','ecclesiastes',8,2,'canon','proverbs',24,21,'free',
     E'*My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change:* (Proverbs 24:21). *I counsel thee to keep the king''s commandment, and that in regard of the oath of Elohim (God)* (Ecclesiastes 8:2): the wisdom-lit man honours ordained authority — but the fear of the king is bounded by and second to the fear of Yahuah (LORD), the same double charge Proverbs sets.'),
    ('canon','ecclesiastes',8,5,'canon','romans',13,1,'free',
     E'*Let every soul be subject unto the higher powers. For there is no power but of Elohim (God): the powers that be are ordained of Elohim (God).* (Romans 13:1). *Whoso keepeth the commandment shall feel no evil thing* (Ecclesiastes 8:5): the prudence of submission to ordained authority that the Preacher counsels is the same order the apostle names — power is not a rival to Elohim (God) but appointed under Him.'),
    ('canon','ecclesiastes',8,5,'canon','1-peter',2,13,'free',
     E'*Submit yourselves to every ordinance of man for Yahuah''s (Lord''s) sake: whether it be to the king, as supreme;* (1 Peter 2:13). The counsel that *whoso keepeth the commandment shall feel no evil thing* (Ecclesiastes 8:5) is carried forward — submission to the king is rendered *for Yahuah''s (Lord''s) sake*, the obedience to authority grounded in the oath of Elohim (God), never authority worshipped for itself.'),

    -- 8:11 ★ — sentence not executed speedily emboldens the wicked
    ('canon','ecclesiastes',8,11,'canon','2-peter',3,9,'free',
     E'*Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* (2 Peter 3:9). *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil* (Ecclesiastes 8:11): what the wicked read as the absence of judgment is in truth the longsuffering of Yahuah (Lord) — the delay is mercy held open for repentance, not slackness.'),
    ('canon','ecclesiastes',8,11,'canon','psalms',50,21,'free',
     E'*These things hast thou done, and I kept silence; thou thoughtest that I was altogether such an one as thyself: but I will reprove thee, and set them in order before thine eyes.* (Psalm 50:21). The heart *fully set... to do evil* because the *sentence... is not executed speedily* (Ecclesiastes 8:11) is exactly the error Yahuah (LORD) names — His silence mistaken for consent, the wicked imagining Elohim (God) to be one like themselves, until He sets all in order before their eyes.'),
    ('canon','ecclesiastes',8,11,'canon','romans',2,4,'free',
     E'*Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The delayed *sentence against an evil work* (Ecclesiastes 8:11) is the forbearance the apostle warns men not to despise — the goodness of Elohim (God) is meant to lead to repentance, and to read it as license is to misread mercy.'),
    ('canon','ecclesiastes',8,11,'canon','romans',2,5,'free',
     E'*But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* (Romans 2:5). The very *heart of the sons of men... fully set... to do evil* (Ecclesiastes 8:11) is what is at work here — the delay that emboldens the hardened only treasures up wrath against the day of the righteous judgment of Elohim (God); the sentence postponed is not the sentence cancelled.'),

    -- 8:12-13 ★ — it shall be well with them that fear Elohim
    ('canon','ecclesiastes',8,12,'canon','psalms',1,6,'free',
     E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:6). *Surely I know that it shall be well with them that fear Elohim (God)... But it shall not be well with the wicked* (Ecclesiastes 8:12-13): the same two ways and two ends — the righteous known and kept by Yahuah (LORD), the way of the ungodly coming to nothing despite its prolonged days.'),
    ('canon','ecclesiastes',8,13,'canon','malachi',3,18,'free',
     E'*Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* (Malachi 3:18). *It shall not be well with the wicked... because he feareth not before Elohim (God)* (Ecclesiastes 8:13): the dividing line the Preacher draws is the line Malachi promises shall finally be made plain — the fear of Elohim (God), serving Him versus serving Him not, is what separates the two ends.'),
    ('canon','ecclesiastes',8,12,'canon','isaiah',3,10,'free',
     E'*Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings.* (Isaiah 3:10). The Preacher''s verdict *it shall be well with them that fear Elohim (God)* (Ecclesiastes 8:12) is the prophet''s word verbatim — *it shall be well with him* — the certain recompense of the righteous that present delay does not overturn.'),
    ('canon','ecclesiastes',8,13,'canon','isaiah',3,11,'free',
     E'*Woe unto the wicked! it shall be ill with him: for the reward of his hands shall be given him.* (Isaiah 3:11). *It shall not be well with the wicked, neither shall he prolong his days* (Ecclesiastes 8:13): the prophet seals the other end — *it shall be ill with him* — the reward of his own hands returning upon him, whatever the shadow-length of his prolonged days.'),

    -- 8:16-17 — the unsearchable work of Elohim
    ('canon','ecclesiastes',8,17,'canon','ecclesiastes',3,11,'free',
     E'*He hath made every thing beautiful in his time: also he hath set the world in their heart, so that no man can find out the work that Elohim (God) maketh from the beginning to the end.* (Ecclesiastes 3:11). *A man cannot find out the work that is done under the sun... though a wise man think to know it, yet shall he not be able to find it* (Ecclesiastes 8:17): the Preacher returns to his own earlier sentence — the work of Elohim (God) is set beyond the reach of even the wisest search, eternity laid in the heart but the whole withheld.'),
    ('canon','ecclesiastes',8,17,'canon','romans',11,33,'free',
     E'*O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). That *a wise man think to know it, yet shall he not be able to find it* (Ecclesiastes 8:17) is the apostle''s doxology already sung under the sun — the judgments of Elohim (God) unsearchable, His ways past finding out, the limit of wisdom met with worship rather than despair.'),
    ('canon','ecclesiastes',8,17,'canon','job',11,7,'free',
     E'*Canst thou by searching find out Elohim (God)? canst thou find out the Almighty unto perfection?* (Job 11:7). The Preacher''s confession that *a man cannot find out the work that is done under the sun* (Ecclesiastes 8:17) answers Zophar''s ancient question — no, a man cannot by searching find out Elohim (God) to perfection; the work and the Worker alike exceed the creature''s grasp.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-8-a-mans-wisdom-maketh-his-face-to-shine',
       E'A man''s wisdom maketh his face to shine',
       E'*Who is as the wise man? and who knoweth the interpretation of a thing? a man''s wisdom maketh his face to shine, and the boldness of his face shall be changed* (Ecclesiastes 8:1). The Preacher opens with the mark of true wisdom — a light upon the face. The type stands at Sinai: *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29), the face that had been near the words of Yahuah (LORD) carrying their radiance. And that shining is the priestly blessing answered downward — *Yahuah (LORD) make his face shine upon thee, and be gracious unto thee* (Numbers 6:25): the light a man bears is the lifted countenance of Yahuah (LORD) reflected in one who walks in His instruction. Such wisdom under the sun is the foretaste of the harvest end, when *the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43) — not their own brightness, but the glory of the Father resting upon His own.',
       sv.verse_id, ev.verse_id, 'free', 39075
  FROM _s321_ecc08_lookup sv, _s321_ecc08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-8-keep-the-kings-commandment-feel-no-evil-thing',
       E'Keep the king''s commandment — and feel no evil thing',
       E'*I counsel thee to keep the king''s commandment, and that in regard of the oath of Elohim (God)* (Ecclesiastes 8:2)... *Whoso keepeth the commandment shall feel no evil thing: and a wise man''s heart discerneth both time and judgment* (Ecclesiastes 8:5). The wisdom-lit man honours ordained authority — yet always bounded by the higher oath. Proverbs sets the same double charge: *My son, fear thou Yahuah (LORD) and the king: and meddle not with them that are given to change* (Proverbs 24:21) — the fear of the king second to the fear of Yahuah (LORD). The apostle names the order plainly: *there is no power but of Elohim (God): the powers that be are ordained of Elohim (God)* (Romans 13:1), and *Submit yourselves to every ordinance of man for Yahuah''s (Lord''s) sake: whether it be to the king, as supreme* (1 Peter 2:13). The submission is real, but its ground is the oath of Elohim (God) — authority honoured under Yahuah (LORD), never worshipped in His place.',
       sv.verse_id, ev.verse_id, 'free', 39076
  FROM _s321_ecc08_lookup sv, _s321_ecc08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened',
       E'Sentence not executed speedily — the longsuffering the wicked mistake for absence',
       E'*Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil* (Ecclesiastes 8:11). Here is the great misreading of the world: the delay of judgment taken for the lack of a Judge. But what the wicked count as slackness is mercy held open. *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The silence is not consent — *These things hast thou done, and I kept silence; thou thoughtest that I was altogether such an one as thyself: but I will reprove thee, and set them in order before thine eyes* (Psalm 50:21). To presume upon the delay is to despise mercy: *despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4) — for the hardened heart only *treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God)* (Romans 2:5). The sentence postponed is not the sentence cancelled.',
       sv.verse_id, ev.verse_id, 'free', 39077
  FROM _s321_ecc08_lookup sv, _s321_ecc08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim',
       E'It shall be well with them that fear Elohim — the fear divides the two ends',
       E'*Though a sinner do evil an hundred times, and his days be prolonged, yet surely I know that it shall be well with them that fear Elohim (God), which fear before him: But it shall not be well with the wicked, neither shall he prolong his days, which are as a shadow; because he feareth not before Elohim (God)* (Ecclesiastes 8:12-13). Against all the present delay, the Preacher fixes the certain end — and the fear of Elohim (God) is the dividing line, the spine of the whole book that ends *Fear Elohim, and keep his commandments* (12:13). It is the two ways: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). It is the dividing Malachi promises shall be made plain: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). And it is the prophet''s twofold sentence, verbatim: *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings* (Isaiah 3:10); *Woe unto the wicked! it shall be ill with him: for the reward of his hands shall be given him* (Isaiah 3:11). The sinner''s prolonged days are *as a shadow* — the end is sure though the recompense tarries.',
       sv.verse_id, ev.verse_id, 'free', 39078
  FROM _s321_ecc08_lookup sv, _s321_ecc08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-8-the-unsearchable-work-of-elohim-under-the-sun',
       E'The unsearchable work of Elohim under the sun',
       E'*Then I beheld all the work of Elohim (God), that a man cannot find out the work that is done under the sun: because though a man labour to seek it out, yet he shall not find it; yea further; though a wise man think to know it, yet shall he not be able to find it* (Ecclesiastes 8:17). The Preacher reaches the limit of wisdom and names it honestly. He returns to his own earlier sentence: *He hath made every thing beautiful in his time: also he hath set the world in their heart, so that no man can find out the work that Elohim (God) maketh from the beginning to the end* (Ecclesiastes 3:11) — eternity laid in the heart, yet the whole withheld. The apostle meets that same limit and turns it to worship: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). And it answers the ancient question of Zophar: *Canst thou by searching find out Elohim (God)? canst thou find out the Almighty unto perfection?* (Job 11:7). No — the work and the Worker alike exceed the creature''s grasp; the end of wisdom is not despair but the fear of the One who cannot be searched out.',
       sv.verse_id, ev.verse_id, 'free', 39079
  FROM _s321_ecc08_lookup sv, _s321_ecc08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: shining face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Moses wist not that the skin of his face shone* (Exodus 34:29) — the face near the words of Yahuah (LORD) carries their light, the Sinai type of wisdom-lit countenance.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-a-mans-wisdom-maketh-his-face-to-shine'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) make his face shine upon thee* (Numbers 6:25) — the shining face of wisdom is the priestly blessing answered downward, His lifted countenance reflected.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-a-mans-wisdom-maketh-his-face-to-shine'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43) — the harvest-end glory the wisdom-lit face foretastes.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-a-mans-wisdom-maketh-his-face-to-shine'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: keep the king's commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*fear thou Yahuah (LORD) and the king* (Proverbs 24:21) — the double charge; the fear of the king bounded by and second to the fear of Yahuah (LORD).'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-keep-the-kings-commandment-feel-no-evil-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the powers that be are ordained of Elohim (God)* (Romans 13:1) — submission to authority because authority is appointed under Him, not a rival to Him.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-keep-the-kings-commandment-feel-no-evil-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Submit yourselves to every ordinance of man for Yahuah''s (Lord''s) sake* (1 Peter 2:13) — the obedience grounded in the oath of Elohim (God), never authority worshipped for itself.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-keep-the-kings-commandment-feel-no-evil-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: delayed sentence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (Lord) is not slack concerning his promise... but is longsuffering* (2 Peter 3:9) — the delay the wicked count as slackness is mercy held open for repentance.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou thoughtest that I was altogether such an one as thyself* (Psalm 50:21) — His silence mistaken for consent, until He sets all in order before their eyes.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the goodness of Elohim (God) leadeth thee to repentance* (Romans 2:4) — the forbearance not to be despised; to read it as license is to misread mercy.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*treasurest up unto thyself wrath against the day of wrath* (Romans 2:5) — the sentence postponed is not cancelled; the hardened heart only stores up judgment.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-sentence-not-executed-speedily-the-wicked-emboldened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: it shall be well with them that fear Elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — the two ways and two ends, the righteous known and kept.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18) — the dividing line made plain at the last.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Say ye to the righteous, that it shall be well with him* (Isaiah 3:10) — the Preacher''s verdict verbatim in the prophet; the certain recompense of the righteous.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Woe unto the wicked! it shall be ill with him* (Isaiah 3:11) — the other end sealed; the reward of his own hands returning upon him.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-it-shall-be-well-with-them-that-fear-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: unsearchable work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*no man can find out the work that Elohim (God) maketh from the beginning to the end* (Ecclesiastes 3:11) — the Preacher''s own earlier sentence; eternity in the heart, the whole withheld.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-the-unsearchable-work-of-elohim-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33) — the limit of wisdom met with worship, not despair.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-the-unsearchable-work-of-elohim-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Canst thou by searching find out Elohim (God)?* (Job 11:7) — Zophar''s ancient question answered: no, not unto perfection; the Worker exceeds the creature''s grasp.'
  FROM cross_reference_threads t
  JOIN _s321_ecc08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s321_ecc08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=11 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-8-the-unsearchable-work-of-elohim-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_9.sql (Ecclesiastes 9) -----
-- Chapter: Ecclesiastes 9 — one event to all; living wholeheartedly under Elohim
-- Tag: ecc09 | session prefix s321 | sort band start 39100 (+1 per thread)
-- Source book_slug=ecclesiastes, chapter 9 (edition canon)
--
-- Ecclesiastes 9 coverage:
--   v.1   NT:     John 10:28-29 (none pluck them out of my hand) — USED
--         Extras: Wisdom of Solomon 3:1 (souls of the righteous in the hand) — USED (clean witness)
--         Tanakh: Deuteronomy 33:3 (all his saints are in thy hand) — USED
--   v.2-3 NT:     none warranted (the one-event limit answered by judgment/resurrection at 12:14; folded into the dead-know-nothing thread's answer)
--         Extras: none warranted
--         Tanakh: covered within the v.5-6 thread (one event / under the sun)
--   v.4   NT:     none warranted (hope-while-living folds into the eat-drink and the dead-know threads)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.5-6 NT:     none warranted (resurrection answer carried by Tanakh witnesses Job/Dan/Isa, named lightly)
--         Extras: none warranted
--         Tanakh: Psalm 6:5, Psalm 115:17, Psalm 146:4 (the silence) + Job 19:25, Daniel 12:2, Isaiah 26:19 (the answer beyond the horizon) — USED
--   v.7-9 NT:     Revelation 3:4-5 (walk in white / white raiment), Revelation 19:8 (arrayed in fine linen) — USED
--         Extras: none warranted
--         Tanakh: Ecclesiastes 2:24 (eat and drink from the hand of Elohim), Proverbs 5:18 (rejoice with the wife) — USED
--   v.10  NT:     John 9:4 (work while it is day), Colossians 3:23 (do it heartily) — USED
--         Extras: none warranted
--         Tanakh: none warranted (the sheol-no-work limit answered by the resurrection thread above)
--   v.11-12 NT:   Luke 12:20 (this night thy soul required — man knoweth not his time) — USED
--         Extras: none warranted
--         Tanakh: Psalm 33:16-17 (no king saved by a host), Jeremiah 9:23-24 (glory not in might but in knowing Yahuah) — USED
--   v.13-18 NT:   none warranted
--         Extras: none warranted
--         Tanakh: none warranted (the poor-wise-man parable; wisdom-better-than-strength stands on its own this pass)
--
-- GUARDS applied:
--   9:5 "the dead know not anything" framed as Qoheleth's honest under-the-sun observation of death's
--       silence — the limit of the horizon. Job 19:25 / Daniel 12:2 / Isaiah 26:19 named LIGHTLY as the
--       answer the rest of the canon supplies. NOT used to deny resurrection; NOT over-read into soul-sleep dogmatics.
--   9:10 "do it with thy might" → John 9:4 work while it is day.
--   9:8 white garments lightly anticipate Revelation 3:4 / 19:8 (the joyful covenant life, white raiment foreshadowed).
--
-- Threads (5):
--   ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim  [Tanakh + NT + Extras]  sort 39100
--   ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun  [Tanakh]  sort 39101
--   ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white  [Tanakh + NT]  sort 39102
--   ecclesiastes-9-whatsoever-thy-hand-findeth-to-do-do-it-with-thy-might  [NT]  sort 39103
--   ecclesiastes-9-the-race-is-not-to-the-swift-but-time-and-chance  [Tanakh + NT]  sort 39104

CREATE TEMP VIEW _s321_ecc09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- B. cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: 9:1 the righteous in the hand of Elohim
    ('canon','ecclesiastes',9,1,'canon','deuteronomy',33,3,'free',
      E'*Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words* (Deuteronomy 33:3). Qoheleth''s *the righteous, and the wise, and their works, are in the hand of Elohim (God)* (Ecclesiastes 9:1) reaches back to Moses'' blessing: the covenant people are not loose in a chaotic world but held *in thy hand* by Yahuah (the LORD), receiving of his words even where *no man knoweth either love or hatred by all that is before them.*'),
    ('canon','ecclesiastes',9,1,'canon','john',10,28,'free',
      E'*And I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand* (John 10:28). The hand that holds *the righteous, and the wise, and their works* (Ecclesiastes 9:1) is the same grip the Formed Son names over his sheep — the Shepherd who gathers the *other sheep... not of this fold* (John 10:16) into one flock, none plucked out.'),
    ('canon','ecclesiastes',9,1,'canon','john',10,29,'free',
      E'*My Father, which gave them me, is greater than all; and no man is able to pluck them out of my Father''s hand* (John 10:29). The held-ness of *the righteous... in the hand of Elohim (God)* (Ecclesiastes 9:1) rises to its source: the Father''s hand, *greater than all*, from which the Formed Son receives and keeps his own.'),
    ('canon','ecclesiastes',9,1,'apocrypha','the-wisdom-of-solomon',3,1,'extras',
      E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1). The restored wisdom library says it almost word for word: where Qoheleth observes *the righteous... are in the hand of Elohim (God)* (Ecclesiastes 9:1), Wisdom presses past the under-the-sun horizon — *in the sight of the unwise they seemed to die... but they are in peace* (Wisdom of Solomon 3:2-3).'),

    -- Thread 2: 9:5-6 the dead know not any thing (under the sun) + the resurrection answer
    ('canon','ecclesiastes',9,5,'canon','psalms',6,5,'free',
      E'*For in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalm 6:5). David sings the same under-the-sun silence Qoheleth observes — *the dead know not any thing, neither have they any more a reward; for the memory of them is forgotten* (Ecclesiastes 9:5) — the grave gives no praise, no remembrance, within the bounds of this life.'),
    ('canon','ecclesiastes',9,5,'canon','psalms',115,17,'free',
      E'*The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17). The Psalter names the same limit: *the dead know not any thing* (Ecclesiastes 9:5) — the silence of those gone down, the stilled tongue that no longer blesses under the sun.'),
    ('canon','ecclesiastes',9,5,'canon','psalms',146,4,'free',
      E'*His breath goeth forth, he returneth to his earth; in that very day his thoughts perish* (Psalm 146:4). The perishing of thought matches Qoheleth exactly — *also their love, and their hatred, and their envy, is now perished; neither have they any more a portion for ever in any thing that is done under the sun* (Ecclesiastes 9:6). This is the honest report of death''s horizon, not the last word of the canon.'),
    ('canon','ecclesiastes',9,5,'canon','job',19,25,'free',
      E'*For I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25). Where Qoheleth''s eye stops at the silence — *the dead know not any thing* (Ecclesiastes 9:5) — Job sees past the horizon to the redeemer who stands at the latter day and the flesh that *in my flesh shall I see Elohim (God)* (Job 19:26). The answer the under-the-sun verse leaves open, the rest of the canon supplies.'),
    ('canon','ecclesiastes',9,5,'canon','daniel',12,2,'free',
      E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Qoheleth reports the silence of *the dead* (Ecclesiastes 9:5) as it stands under the sun; Daniel lifts the veil to the awakening of those who sleep in the dust — the resurrection that the limit of Ecclesiastes 9 only points toward.'),
    ('canon','ecclesiastes',9,5,'canon','isaiah',26,19,'free',
      E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). The dust that holds the silent dead in Ecclesiastes 9:5 is summoned by Isaiah to *awake and sing* — the answer beyond Qoheleth''s horizon, the dead living again.'),

    -- Thread 3: 9:7-9 eat thy bread with joy / garments white / live joyfully with thy wife
    ('canon','ecclesiastes',9,7,'canon','ecclesiastes',2,24,'free',
      E'*There is nothing better for a man, than that he should eat and drink, and that he should make his soul enjoy good in his labour. This also I saw, that it was from the hand of Elohim (God)* (Ecclesiastes 2:24). Qoheleth''s refrain returns enlarged: *go thy way, eat thy bread with joy, and drink thy wine with a merry heart; for Elohim (God) now accepteth thy works* (Ecclesiastes 9:7). The common gifts of bread and wine are received as from the hand of Elohim, the joyful covenant life under the sun.'),
    ('canon','ecclesiastes',9,9,'canon','proverbs',5,18,'free',
      E'*Let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18). Wisdom''s charge to delight in the covenant wife is echoed in Qoheleth''s *live joyfully with the wife whom thou lovest all the days of the life of thy vanity... for that is thy portion in this life* (Ecclesiastes 9:9) — the marriage joy held as a portion given under the sun.'),
    ('canon','ecclesiastes',9,8,'canon','revelation',3,4,'free',
      E'*Thou hast a few names even in Sardis which have not defiled their garments; and they shall walk with me in white: for they are worthy* (Revelation 3:4). The everyday charge *let thy garments be always white* (Ecclesiastes 9:8) lightly foreshadows the white raiment of the worthy — the joyful covenant life on earth anticipating the undefiled garments of those who walk with the Lamb.'),
    ('canon','ecclesiastes',9,8,'canon','revelation',3,5,'free',
      E'*He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels* (Revelation 3:5). Qoheleth''s *let thy garments be always white* (Ecclesiastes 9:8) reaches forward to the white raiment of the overcomer, the name kept in the book of life — the joy under the sun a shadow of the joy that does not perish.'),
    ('canon','ecclesiastes',9,8,'canon','revelation',19,8,'free',
      E'*And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The white garments of Ecclesiastes 9:8 find their consummation in the bride''s fine linen — *clean and white*, the righteousness of the set-apart ones at the marriage of the Lamb.'),

    -- Thread 4: 9:10 do it with thy might / no work in the grave
    ('canon','ecclesiastes',9,10,'canon','john',9,4,'free',
      E'*I must work the works of him that sent me, while it is day: the night cometh, when no man can work* (John 9:4). The Formed Son speaks Qoheleth''s urgency: *whatsoever thy hand findeth to do, do it with thy might; for there is no work, nor device, nor knowledge, nor wisdom, in the grave, whither thou goest* (Ecclesiastes 9:10). Labor while it is day, for the grave — the night — gives no second chance.'),
    ('canon','ecclesiastes',9,10,'canon','colossians',3,23,'free',
      E'*And what soever ye do, do it heartily, as to Yahuah (Lord), and not unto men* (Colossians 3:23). The wholehearted *do it with thy might* of Ecclesiastes 9:10 is taken up as covenant labor done *heartily, as to Yahuah (Lord)* — the same charge to spend the strength of this life fully, now, while there is breath to spend.'),

    -- Thread 5: 9:11-12 race not to the swift / time and chance / knoweth not his time
    ('canon','ecclesiastes',9,11,'canon','psalms',33,16,'free',
      E'*There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalm 33:16). The Psalter sings what Qoheleth observed: *the race is not to the swift, nor the battle to the strong* (Ecclesiastes 9:11). Swiftness, strength, and numbers do not finally secure a man — *an horse is a vain thing for safety* (Psalm 33:17); deliverance is of Yahuah.'),
    ('canon','ecclesiastes',9,11,'canon','jeremiah',9,23,'free',
      E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23). Qoheleth strips the same boasts — *neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill* (Ecclesiastes 9:11) — and Jeremiah names the only true glory: *that he understandeth and knoweth me, that I am Yahuah (LORD)* (Jeremiah 9:24).'),
    ('canon','ecclesiastes',9,12,'canon','luke',12,20,'free',
      E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The Formed Son''s parable of the rich fool turns on Qoheleth''s warning — *for man also knoweth not his time... so are the sons of men snared in an evil time, when it falleth suddenly upon them* (Ecclesiastes 9:12). The hour falls suddenly; no man holds his own time.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- C. cross_reference_threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim',
       E'The righteous, and their works, are in the hand of Elohim',
       E'Qoheleth opens the chapter with a hand: *for all this I considered in my heart even to declare all this, that the righteous, and the wise, and their works, are in the hand of Elohim (God)* (Ecclesiastes 9:1). The covenant people are not adrift in a world they cannot read — *no man knoweth either love or hatred by all that is before them* — but held. Moses had already laid the foundation: *yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words* (Deuteronomy 33:3). The Formed Son takes the same grip over his flock: *and I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand* (John 10:28), and traces it to its source, *no man is able to pluck them out of my Father''s hand* (John 10:29). The restored wisdom library says it almost word for word: *but the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1) — and presses past the under-the-sun horizon, *in the sight of the unwise they seemed to die... but they are in peace* (Wisdom of Solomon 3:2-3). One hand holds the righteous from Moses to the Shepherd.',
       sv.verse_id, ev.verse_id, 'extras', 39100
  FROM _s321_ecc09_lookup sv, _s321_ecc09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun',
       E'The dead know not any thing — under the sun, and the answer beyond',
       E'This is Qoheleth''s most sober report from the horizon of *under the sun*: *for the living know that they shall die: but the dead know not any thing, neither have they any more a reward; for the memory of them is forgotten* (Ecclesiastes 9:5); *also their love, and their hatred, and their envy, is now perished; neither have they any more a portion for ever in any thing that is done under the sun* (Ecclesiastes 9:6). He is naming death''s silence honestly, as it appears to the eye that watches life and death come *alike to all... one event to the righteous, and to the wicked* (Ecclesiastes 9:2). The Psalter sings the same limit — *for in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalm 6:5); *the dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17); *his breath goeth forth, he returneth to his earth; in that very day his thoughts perish* (Psalm 146:4). But this silence is the limit of the under-the-sun horizon, not the last word of the canon. Past the horizon stands the answer the rest of Scripture supplies: *for I know that my redeemer liveth, and that he shall stand at the latter day upon the earth* (Job 19:25); *and many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2); *thy dead men shall live... awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19). Qoheleth tells the truth about the grave''s silence; Job, Daniel, and Isaiah tell the truth that lies beyond it.',
       sv.verse_id, ev.verse_id, 'free', 39101
  FROM _s321_ecc09_lookup sv, _s321_ecc09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white',
       E'Eat thy bread with joy, and let thy garments be white',
       E'Against the silence of the grave Qoheleth sets a charge to live: *go thy way, eat thy bread with joy, and drink thy wine with a merry heart; for Elohim (God) now accepteth thy works* (Ecclesiastes 9:7); *let thy garments be always white; and let thy head lack no ointment* (Ecclesiastes 9:8); *live joyfully with the wife whom thou lovest all the days of the life of thy vanity... for that is thy portion in this life* (Ecclesiastes 9:9). The bread, the wine, the marriage joy are received as gifts from the hand of Elohim — *there is nothing better for a man, than that he should eat and drink, and that he should make his soul enjoy good in his labour. This also I saw, that it was from the hand of Elohim (God)* (Ecclesiastes 2:24) — and the covenant wife is to be delighted in, *let thy fountain be blessed: and rejoice with the wife of thy youth* (Proverbs 5:18). The white garments are the everyday gladness of the accepted life, and they lightly foreshadow the raiment of the worthy: *thou hast a few names even in Sardis which have not defiled their garments; and they shall walk with me in white* (Revelation 3:4); *he that overcometh, the same shall be clothed in white raiment* (Revelation 3:5); and at the marriage of the Lamb, *she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The joy under the sun is a shadow of the joy that does not perish.',
       sv.verse_id, ev.verse_id, 'free', 39102
  FROM _s321_ecc09_lookup sv, _s321_ecc09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-9-whatsoever-thy-hand-findeth-to-do-do-it-with-thy-might',
       E'Whatsoever thy hand findeth to do, do it with thy might',
       E'The under-the-sun honesty about the grave turns into urgency, not despair: *whatsoever thy hand findeth to do, do it with thy might; for there is no work, nor device, nor knowledge, nor wisdom, in the grave, whither thou goest* (Ecclesiastes 9:10). The grave gives no second chance, so the strength of this life is to be spent fully, now. The Formed Son speaks the very same urgency: *I must work the works of him that sent me, while it is day: the night cometh, when no man can work* (John 9:4) — the grave is the night, and the day of labor is short. And the wholehearted *do it with thy might* is taken up as covenant labor done as worship: *and what soever ye do, do it heartily, as to Yahuah (Lord), and not unto men* (Colossians 3:23). Work while it is day, with all thy might, as unto Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 39103
  FROM _s321_ecc09_lookup sv, _s321_ecc09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-9-the-race-is-not-to-the-swift-but-time-and-chance',
       E'The race is not to the swift — time and chance, and the unknown hour',
       E'Qoheleth watches life refuse to reward the obvious favorites: *the race is not to the swift, nor the battle to the strong, neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill; but time and chance happeneth to them all* (Ecclesiastes 9:11). The Psalter had stripped the same confidences: *there is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalm 33:16), *an horse is a vain thing for safety* (Psalm 33:17). Jeremiah names the only boast that holds: *let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* (Jeremiah 9:23), *but let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* (Jeremiah 9:24). And the hour itself is hidden — *for man also knoweth not his time: as the fishes that are taken in an evil net... so are the sons of men snared in an evil time, when it falleth suddenly upon them* (Ecclesiastes 9:12). The Formed Son sets a parable on exactly this: *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). No man is swift enough, strong enough, or rich enough to hold his own time; that is reason to glory only in knowing Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 39104
  FROM _s321_ecc09_lookup sv, _s321_ecc09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- D. cross_reference_thread_members
-- ============================================================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 33:3 — *all his saints are in thy hand*: Moses'' blessing is the root of *the righteous... in the hand of Elohim (God)* (Ecclesiastes 9:1).'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'John 10:28 — *neither shall any man pluck them out of my hand*: the Shepherd''s grip over his flock fills the hand of Ecclesiastes 9:1.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 10:29 — *no man is able to pluck them out of my Father''s hand*: the held-ness of Ecclesiastes 9:1 rises to the Father''s hand.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Wisdom of Solomon 3:1 — *the souls of the righteous are in the hand of Yahuah (God)*: the restored wisdom witness echoes Ecclesiastes 9:1 almost word for word.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-righteous-and-their-works-are-in-the-hand-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 6:5 — *in the grave who shall give thee thanks?*: David sings the same under-the-sun silence as Ecclesiastes 9:5.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 115:17 — *the dead praise not Yahuah (LORD), neither any that go down into silence*: the same stilled tongue of Ecclesiastes 9:5.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 146:4 — *in that very day his thoughts perish*: matches *their love, and their hatred, and their envy, is now perished* (Ecclesiastes 9:6).'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Job 19:25 — *I know that my redeemer liveth*: the answer beyond Qoheleth''s horizon — past the silence of Ecclesiastes 9:5.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake*: the resurrection the limit of Ecclesiastes 9:5 only points toward.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 26:19 — *awake and sing, ye that dwell in dust*: the dust of Ecclesiastes 9:5 summoned to live again.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-dead-know-not-any-thing-under-the-sun'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ecclesiastes 2:24 — *eat and drink... from the hand of Elohim (God)*: Qoheleth''s refrain returns enlarged in 9:7.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 5:18 — *rejoice with the wife of thy youth*: the covenant marriage joy of Ecclesiastes 9:9.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Revelation 3:4 — *they shall walk with me in white*: the white garments of Ecclesiastes 9:8 lightly foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 3:5 — *clothed in white raiment*: the overcomer''s raiment that Ecclesiastes 9:8 anticipates.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Revelation 19:8 — *arrayed in fine linen, clean and white*: the bride''s consummation of the white garments of Ecclesiastes 9:8.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-eat-thy-bread-with-joy-and-let-thy-garments-be-white'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 9:4 — *I must work the works of him that sent me, while it is day*: the Formed Son speaks the urgency of Ecclesiastes 9:10.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-whatsoever-thy-hand-findeth-to-do-do-it-with-thy-might'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Colossians 3:23 — *do it heartily, as to Yahuah (Lord)*: the wholehearted *do it with thy might* of Ecclesiastes 9:10 as covenant labor.'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-whatsoever-thy-hand-findeth-to-do-do-it-with-thy-might'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 33:16 — *no king saved by the multitude of an host*: the Psalter sings *the race is not to the swift* (Ecclesiastes 9:11).'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-race-is-not-to-the-swift-but-time-and-chance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 9:23 — *let not the wise man glory in his wisdom*: the same boasts stripped in Ecclesiastes 9:11; the only glory is knowing Yahuah (9:24).'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-race-is-not-to-the-swift-but-time-and-chance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Luke 12:20 — *this night thy soul shall be required of thee*: the Formed Son''s parable turns on *man... knoweth not his time* (Ecclesiastes 9:12).'
  FROM cross_reference_threads t
  JOIN _s321_ecc09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=9 AND sv.verse_number=12
  JOIN _s321_ecc09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-9-the-race-is-not-to-the-swift-but-time-and-chance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_10.sql (Ecclesiastes 10) -----
-- Chapter: Ecclesiastes 10 — the proverbs of Qoheleth (wisdom and folly).
-- Tag: ecc10  | session prefix: s321 | temp view: _s321_ecc10_lookup
-- Sort band: 39125 + 1 per thread (39125..39129)
-- Source: canon ecclesiastes ch.10. Lens: wisdom-tradition foundation — these Tanakh
-- proverbs are the root the NT picks up (a-little-leaven, sowing-and-reaping, gracious-
-- speech). Weave LATERAL to Proverbs heavily, FORWARD to the NT where the image is taken
-- up, and OUT to the restored wisdom witness (Sirach/Ecclesiasticus). The deed-returns-on-
-- the-doer (10:8) is the moral order Elohim built into creation (Galatians 6:7), not karma.
--
-- Ecclesiastes 10 coverage:
--   v.1  (a little folly ruins much wisdom = leaven)
--        NT:     1 Corinthians 5:6 + Galatians 5:9 (a little leaven leaveneth the whole lump) -> THREAD 1
--        Extras: none warranted (NT carries the leaven-image)
--        Tanakh: none warranted (the leaven law is Exodus 12/Leviticus 2; the proverb itself is unique)
--   v.2-3 (wise heart at right hand; fool announces himself) NT/Extras/Tanakh: none warranted (general)
--   v.4  (yielding pacifieth great offences)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Proverbs 15:1 (soft answer turneth away wrath) + Proverbs 25:15 (soft tongue breaketh the bone) -> THREAD 2
--   v.5-7 (folly set in dignity; servants on horses) NT/Extras/Tanakh: none warranted (observation of disorder)
--   v.8  (he that diggeth a pit shall fall into it; serpent bites the hedge-breaker)
--        NT:     Galatians 6:7 (whatsoever a man soweth, that shall he also reap) -> THREAD 3
--        Extras: Ecclesiasticus (Sirach) 27:26 (whoso diggeth a pit shall fall in it) -> THREAD 3
--        Tanakh: Psalm 7:15-16 (made a pit and is fallen in) + Proverbs 26:27 (whoso diggeth a pit shall fall therein) -> THREAD 3
--   v.9-11 (stones/wood/iron/serpent-without-enchantment) NT/Extras/Tanakh: none warranted (folded image into v.8 thread? kept v.8 distinct)
--   v.12 (words of the wise are gracious; fool's lips swallow himself)
--        NT:     Luke 4:22 (the gracious words which proceeded out of his mouth) + Colossians 4:6 (let your speech be alway with grace) -> THREAD 4
--        Extras: Ecclesiasticus (Sirach) 20:7 (a wise man will hold his tongue; a babbler and a fool) -> THREAD 4
--        Tanakh: Proverbs 10:32 (lips of the righteous know what is acceptable) + Proverbs 18:7 (a fool's mouth is his destruction) -> THREAD 4
--   v.13-15 (fool full of words; the labour of the foolish) NT/Extras/Tanakh: none warranted (in v.12 orbit)
--   v.16-17 (woe/blessed the land by its king) NT/Extras/Tanakh: none warranted (covenant-blessing-of-rulers, no single tight target)
--   v.18-19 (slothfulness; money answereth all things) NT/Extras/Tanakh: none warranted
--   v.20 (curse not the king; a bird shall carry the voice)
--        NT:     Luke 12:3 (proclaimed upon the housetops) -> THREAD 5
--        Extras: none warranted
--        Tanakh: Exodus 22:28 (thou shalt not... curse the ruler of thy people) -> THREAD 5
--
-- Threads (slug -> target libraries):
--   ecclesiastes-10-a-little-folly-spoils-much-wisdom           (NT: 1Cor 5:6, Gal 5:9) — free
--   ecclesiastes-10-a-soft-answer-yielding-pacifieth-great-offences  (Tanakh: Prov 15:1, 25:15) — free
--   ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it    (Tanakh: Ps 7:15-16, Prov 26:27; NT: Gal 6:7; Extras: Sirach 27:26) — extras
--   ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious (Tanakh: Prov 10:32, 18:7; NT: Luke 4:22, Col 4:6; Extras: Sirach 20:7) — extras
--   ecclesiastes-10-curse-not-the-king-a-bird-shall-carry-the-voice  (Tanakh: Exod 22:28; NT: Luke 12:3) — free

CREATE TEMP VIEW _s321_ecc10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: a little folly (10:1) = a little leaven
  ('canon','ecclesiastes',10,1,'canon','1-corinthians',5,6,'free',
   E'*Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6). Qoheleth saw it first: *Dead flies cause the ointment of the apothecary to send forth a stinking savour: so doth a little folly him that is in reputation for wisdom and honour* (Ecclesiastes 10:1). A small corruption spreads through the whole — Sha''ul (Paul) takes up the very figure to purge the assembly, and the leaven he names is the old un-purged sin, *Messiah (Christ) our passover* keeping the feast in sincerity.'),
  ('canon','ecclesiastes',10,1,'canon','galatians',5,9,'free',
   E'*A little leaven leaveneth the whole lump* (Galatians 5:9). The same proverb stands behind *so doth a little folly him that is in reputation for wisdom and honour* (Ecclesiastes 10:1): a fraction of folly spoils a life of esteem, as a pinch of leaven swells the entire batch. The wisdom tradition and the apostolic warning are one voice on the danger of the small compromise.'),
  -- THREAD 2: yielding pacifieth (10:4) = soft answer
  ('canon','ecclesiastes',10,4,'canon','proverbs',15,1,'free',
   E'*A soft answer turneth away wrath: but grievous words stir up anger* (Proverbs 15:1). Qoheleth gives the courtier the same counsel: *If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences* (Ecclesiastes 10:4). Composure, not flight or fury, disarms the angry; the soft answer of Proverbs is the *yielding* that *pacifieth*.'),
  ('canon','ecclesiastes',10,4,'canon','proverbs',25,15,'free',
   E'*By long forbearing is a prince persuaded, and a soft tongue breaketh the bone* (Proverbs 25:15). This is the wisdom of *yielding pacifieth great offences* (Ecclesiastes 10:4) — patient gentleness moves even a ruler''s rising spirit, the soft tongue prevailing where hardness would break.'),
  -- THREAD 3: diggeth a pit (10:8) = the deed returns on the doer
  ('canon','ecclesiastes',10,8,'canon','psalms',7,15,'free',
   E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15). Qoheleth states the law as proverb: *He that diggeth a pit shall fall into it* (Ecclesiastes 10:8). The Psalm sings the same justice — the trap-layer is caught in his own trap, the violence returning *upon his own head* (Psalm 7:16). This is the moral order Yahuah built into creation, not blind chance.'),
  ('canon','ecclesiastes',10,8,'canon','psalms',7,16,'free',
   E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). The recoil Qoheleth names in *He that diggeth a pit shall fall into it* (Ecclesiastes 10:8) is no accident of fortune but the appointed boomerang of evil — what a man devises against another, Yahuah turns back upon the deviser.'),
  ('canon','ecclesiastes',10,8,'canon','proverbs',26,27,'free',
   E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27). The proverb is nearly word-for-word with *He that diggeth a pit shall fall into it; and whoso breaketh an hedge, a serpent shall bite him* (Ecclesiastes 10:8). The wisdom books speak with one mouth: the harm a man prepares circles back to its author.'),
  ('canon','ecclesiastes',10,8,'canon','galatians',6,7,'free',
   E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Sha''ul (Paul) names the very principle Qoheleth saw in *He that diggeth a pit shall fall into it* (Ecclesiastes 10:8) — the deed returns on the doer because Elohim (God) Himself wove this harvest-law into creation. Not karma, but the unmocked justice of the Maker.'),
  ('canon','ecclesiastes',10,8,'apocrypha','ecclesiasticus',27,26,'extras',
   E'*Whoso diggeth a pit shall fall in it: and he that sets a trap shall be taken in it* (Ecclesiasticus / Sirach 27:26). Ben Sira repeats Qoheleth''s *He that diggeth a pit shall fall into it* (Ecclesiastes 10:8) almost verbatim — the restored wisdom witness confirms that the recoil of the evil deed was settled doctrine in Yashar''el (Israel)''s sages, the same creation-justice the apostles preach.'),
  -- THREAD 4: words of the wise are gracious (10:12)
  ('canon','ecclesiastes',10,12,'canon','proverbs',10,32,'free',
   E'*The lips of the righteous know what is acceptable: but the mouth of the wicked speaketh frowardness* (Proverbs 10:32). Qoheleth draws the same contrast: *The words of a wise man''s mouth are gracious; but the lips of a fool will swallow up himself* (Ecclesiastes 10:12). Gracious, fitting speech marks the wise; the fool''s mouth devours its own owner.'),
  ('canon','ecclesiastes',10,12,'canon','proverbs',18,7,'free',
   E'*A fool''s mouth is his destruction, and his lips are the snare of his soul* (Proverbs 18:7). This is the precise echo of *the lips of a fool will swallow up himself* (Ecclesiastes 10:12) — the fool''s own words are the trap that catches him, his tongue the instrument of his ruin.'),
  ('canon','ecclesiastes',10,12,'canon','luke',4,22,'free',
   E'*And all bare him witness, and wondered at the gracious words which proceeded out of his mouth* (Luke 4:22). The proverb *The words of a wise man''s mouth are gracious* (Ecclesiastes 10:12) finds its fullness in the Formed Son: when Yahusha (Jesus) opened His mouth in the synagogue, grace itself proceeded — the wisest of words from the Word made flesh.'),
  ('canon','ecclesiastes',10,12,'canon','colossians',4,6,'free',
   E'*Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). Sha''ul (Paul) makes the wisdom of *The words of a wise man''s mouth are gracious* (Ecclesiastes 10:12) the standing rule for the saints — speech always graced, never the self-swallowing folly of the fool.'),
  ('canon','ecclesiastes',10,12,'apocrypha','ecclesiasticus',20,7,'extras',
   E'*A wise man will hold his tongue till he see opportunity: but a babbler and a fool will regard no time* (Ecclesiasticus / Sirach 20:7). Ben Sira sets the wise tongue against the fool''s exactly as Qoheleth does in *The words of a wise man''s mouth are gracious; but the lips of a fool will swallow up himself* (Ecclesiastes 10:12) — the babbler of Ecclesiastes 10:11 is the very fool who *will regard no time*.'),
  -- THREAD 5: curse not the king (10:20)
  ('canon','ecclesiastes',10,20,'canon','exodus',22,28,'free',
   E'*Thou shalt not revile the gods, nor curse the ruler of thy people* (Exodus 22:28). Qoheleth''s counsel rests on Torah: *Curse not the king, no not in thy thought... for a bird of the air shall carry the voice* (Ecclesiastes 10:20). The wise man honours the ruler because Yahuah''s own law forbids cursing him — the proverb is the Torah commandment applied to the secret heart.'),
  ('canon','ecclesiastes',10,20,'canon','luke',12,3,'free',
   E'*Therefore whatsoever ye have spoken in darkness shall be heard in the light; and that which ye have spoken in the ear in closets shall be proclaimed upon the housetops* (Luke 12:3). The Formed Son turns Qoheleth''s warning into eschatological certainty: where Ecclesiastes 10:20 says *a bird of the air shall carry the voice, and that which hath wings shall tell the matter*, Yahusha (Jesus) declares the hidden word will surely be published — nothing whispered escapes the day of revealing.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-10-a-little-folly-spoils-much-wisdom',
       E'A little folly spoils much wisdom — a little leaven leaveneth the whole lump',
       E'Qoheleth opens with the image of corruption out of all proportion to its size: *Dead flies cause the ointment of the apothecary to send forth a stinking savour: so doth a little folly him that is in reputation for wisdom and honour* (Ecclesiastes 10:1). A lifetime of esteem is undone by a small folly, as a few dead flies spoil the whole perfume. The New Testament takes up the identical figure under the name of leaven: *Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6), and again *A little leaven leaveneth the whole lump* (Galatians 5:9). The wisdom tradition and the apostles speak with one voice — the small compromise is never small in its spread.',
       sv.verse_id, ev.verse_id, 'free', 39125
  FROM _s321_ecc10_lookup sv, _s321_ecc10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-10-a-soft-answer-yielding-pacifieth-great-offences',
       E'Yielding pacifieth great offences — the soft answer that turns away wrath',
       E'To the courtier under an angry ruler Qoheleth counsels composure, not panic: *If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences* (Ecclesiastes 10:4). This is the heart of Proverbs'' counsel on the tongue: *A soft answer turneth away wrath: but grievous words stir up anger* (Proverbs 15:1), and *By long forbearing is a prince persuaded, and a soft tongue breaketh the bone* (Proverbs 25:15). The *yielding* that *pacifieth* is the soft answer and the long forbearing — patient gentleness disarms the rising spirit where hardness would only break.',
       sv.verse_id, ev.verse_id, 'free', 39126
  FROM _s321_ecc10_lookup sv, _s321_ecc10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it',
       E'He that diggeth a pit shall fall into it — the deed returns on the doer',
       E'*He that diggeth a pit shall fall into it; and whoso breaketh an hedge, a serpent shall bite him* (Ecclesiastes 10:8). Qoheleth states as proverb the moral order Yahuah built into creation: the harm a man prepares recoils upon him. The Psalm sings it — *He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15), *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). Proverbs repeats it nearly word-for-word — *Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27) — and the restored wisdom witness confirms it: *Whoso diggeth a pit shall fall in it: and he that sets a trap shall be taken in it* (Ecclesiasticus / Sirach 27:26). Sha''ul (Paul) names the principle for the assembly: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). This is not karma but the unmocked justice of the Maker, woven into the world He made.',
       sv.verse_id, ev.verse_id, 'extras', 39127
  FROM _s321_ecc10_lookup sv, _s321_ecc10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious',
       E'The words of a wise man''s mouth are gracious — the tongue of the wise and the fool',
       E'*The words of a wise man''s mouth are gracious; but the lips of a fool will swallow up himself* (Ecclesiastes 10:12). The wise speak fitting, gracious words; the fool''s own mouth devours him — *A fool''s mouth is his destruction, and his lips are the snare of his soul* (Proverbs 18:7), while *The lips of the righteous know what is acceptable* (Proverbs 10:32). The restored wisdom witness sets the same contrast: *A wise man will hold his tongue till he see opportunity: but a babbler and a fool will regard no time* (Ecclesiasticus / Sirach 20:7) — Qoheleth''s own babbler of verse 11. The proverb finds its fullness in the Formed Son, of whom all *wondered at the gracious words which proceeded out of his mouth* (Luke 4:22), and its standing rule for the saints in *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). Grace on the lips is the mark of wisdom from Qoheleth to Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 39128
  FROM _s321_ecc10_lookup sv, _s321_ecc10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-10-curse-not-the-king-a-bird-shall-carry-the-voice',
       E'Curse not the king — a bird of the air shall carry the voice',
       E'*Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter* (Ecclesiastes 10:20). Qoheleth''s counsel rests on Torah, which forbids cursing the ruler: *Thou shalt not revile the gods, nor curse the ruler of thy people* (Exodus 22:28). And the warning that no secret word stays hidden is taken up by the Formed Son and made eschatological certainty: *Therefore whatsoever ye have spoken in darkness shall be heard in the light; and that which ye have spoken in the ear in closets shall be proclaimed upon the housetops* (Luke 12:3). The bird that carries the voice in Qoheleth becomes the day of revealing in Yahusha (Jesus) — nothing whispered escapes the light.',
       sv.verse_id, ev.verse_id, 'free', 39129
  FROM _s321_ecc10_lookup sv, _s321_ecc10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=10 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6) — Sha''ul (Paul) takes up Qoheleth''s small-corruption-spreads figure to purge the assembly.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-a-little-folly-spoils-much-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A little leaven leaveneth the whole lump* (Galatians 5:9) — the same proverb: a fraction of folly spoils a life of esteem.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-a-little-folly-spoils-much-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A soft answer turneth away wrath: but grievous words stir up anger* (Proverbs 15:1) — the soft answer is the *yielding* that *pacifieth*.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-a-soft-answer-yielding-pacifieth-great-offences'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By long forbearing is a prince persuaded, and a soft tongue breaketh the bone* (Proverbs 25:15) — patient gentleness moves even a ruler''s rising spirit.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-a-soft-answer-yielding-pacifieth-great-offences'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15) — the trap-layer caught in his own trap.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*His mischief shall return upon his own head* (Psalm 7:16) — the appointed boomerang of evil.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whoso diggeth a pit shall fall therein: and he that rolleth a stone, it will return upon him* (Proverbs 26:27) — nearly word-for-word with Ecclesiastes 10:8.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*for whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — Sha''ul (Paul) names the creation-justice as the unmocked law of Elohim (God).'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Whoso diggeth a pit shall fall in it: and he that sets a trap shall be taken in it* (Ecclesiasticus / Sirach 27:26) — the restored wisdom witness repeats the recoil-law verbatim.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-he-that-diggeth-a-pit-shall-fall-into-it'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The lips of the righteous know what is acceptable* (Proverbs 10:32) — fitting, gracious speech is the mark of the wise.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A fool''s mouth is his destruction, and his lips are the snare of his soul* (Proverbs 18:7) — the precise echo of the fool''s lips that swallow himself.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*wondered at the gracious words which proceeded out of his mouth* (Luke 4:22) — the proverb fulfilled in the Formed Son, the Word made flesh.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Let your speech be alway with grace, seasoned with salt* (Colossians 4:6) — the standing rule for the saints, never the self-swallowing folly.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*A wise man will hold his tongue till he see opportunity: but a babbler and a fool will regard no time* (Ecclesiasticus / Sirach 20:7) — Qoheleth''s own babbler of verse 11.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-the-words-of-a-wise-mans-mouth-are-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not revile the gods, nor curse the ruler of thy people* (Exodus 22:28) — Qoheleth''s counsel rests on Torah''s command against cursing the ruler.'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=20
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-curse-not-the-king-a-bird-shall-carry-the-voice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that which ye have spoken in the ear in closets shall be proclaimed upon the housetops* (Luke 12:3) — the bird that carries the voice becomes the day of revealing in Yahusha (Jesus).'
  FROM cross_reference_threads t
  JOIN _s321_ecc10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=10 AND sv.verse_number=20
  JOIN _s321_ecc10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-10-curse-not-the-king-a-bird-shall-carry-the-voice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_11.sql (Ecclesiastes 11) -----
-- Chapter: Ecclesiastes 11 — sow generously, work in faith, rejoice under judgment.
-- Tag: ecc11  | session prefix: s321 | temp view: _s321_ecc11_lookup
-- Sort band: 39150 + 1 per thread (39150..39153)
-- Source: canon ecclesiastes ch.11. Lens: wisdom-tradition foundation — Qoheleth's counsel
-- to open-handed generosity, diligent labour amid uncertainty, and joy held UNDER the coming
-- judgment is the root the NT picks up (sow-and-reap, give-and-it-shall-be-given, judgment-
-- seat). Weave LATERAL to Proverbs/Deuteronomy/Numbers, FORWARD to the NT.
-- GUARDS: 11:1 *cast thy bread upon the waters* = open-handed generosity that TRUSTS Elohim
-- for the return (the return is Elohim's to give) — NOT a prosperity-investment scheme.
-- 11:9 *rejoice... walk in the ways of thine heart... BUT know that Elohim will bring thee
-- into judgment* — the *but* is decisive: legitimate joy lived in the FEAR of the coming
-- judgment, the deliberate answer to Numbers 15:39's warning against following the heart and
-- eyes, setting up the book's conclusion at 12:13-14.
--
-- Ecclesiastes 11 coverage:
--   v.1-2 (cast thy bread upon the waters; give a portion to seven and to eight)
--        NT:     2 Corinthians 9:6 + Luke 6:38 (soweth bountifully reaps bountifully; give and it shall be given) -> THREAD 1
--        Extras: none warranted (NT + Tanakh wisdom carry the open-hand)
--        Tanakh: Proverbs 11:24-25 (there is that scattereth and yet increaseth) + Deuteronomy 15:10 (open thine hand) -> THREAD 1
--   v.3  (clouds full of rain empty; where the tree falleth) NT/Extras/Tanakh: none warranted (observation framing v.4)
--   v.4  (he that observeth the wind shall not sow) — folded into THREAD 2 (diligent labour) by association
--        NT:     none warranted (the sowing-in-uncertainty point carried by v.6 -> Gal 6:9)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.5  (knowest not the way of the spirit, nor how the bones grow; even so the works of Elohim)
--        NT:     John 3:8 (the wind bloweth where it listeth... so is every one born of the Spirit) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Psalm 139:13-15 (covered me in my mother's womb) + Job 10:11 (clothed me with skin and flesh) -> THREAD 2
--   v.6  (in the morning sow thy seed; in the evening withhold not thine hand)
--        NT:     Galatians 6:9 (let us not be weary in well doing) + 2 Timothy 4:2 (be instant in season, out of season) -> THREAD 3
--        Extras: none warranted
--        Tanakh: none warranted (the diligence-amid-uncertainty is taken up by the NT)
--   v.7-8 (light is sweet; remember the days of darkness; all is vanity) NT/Extras/Tanakh: none warranted (transition into v.9 judgment)
--   v.9-10 (rejoice O young man in thy youth... BUT know Elohim will bring thee into judgment)
--        NT:     2 Corinthians 5:10 (we must all appear before the judgment seat) + Romans 14:12 (give account of himself to Elohim) -> THREAD 4
--        Extras: none warranted
--        Tanakh: Numbers 15:39 (seek not after your own heart and your own eyes) + Ecclesiastes 12:14 (Elohim shall bring every work into judgment) -> THREAD 4
--
-- Threads (slug -> target libraries):
--   ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand   (Tanakh: Prov 11:24-25, Deut 15:10; NT: 2Cor 9:6, Luke 6:38) — free
--   ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all  (Tanakh: Ps 139:13-15, Job 10:11; NT: John 3:8) — free
--   ecclesiastes-11-in-the-morning-sow-thy-seed-diligence-amid-uncertainty  (NT: Gal 6:9, 2Tim 4:2) — free
--   ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment  (Tanakh: Num 15:39, Ecc 12:14; NT: 2Cor 5:10, Rom 14:12) — free

CREATE TEMP VIEW _s321_ecc11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: cast thy bread upon the waters (11:1-2) = the open hand that trusts Elohim
  ('canon','ecclesiastes',11,1,'canon','proverbs',11,24,'free',
   E'*There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty* (Proverbs 11:24). This is the paradox of *Cast thy bread upon the waters: for thou shalt find it after many days* (Ecclesiastes 11:1) — the open hand that scatters in generosity is the hand that increases, while the clutching hand comes to poverty. The wisdom books agree: giving freely, trusting Yahuah (LORD) for the return, is the path to gain, not loss.'),
  ('canon','ecclesiastes',11,1,'canon','proverbs',11,25,'free',
   E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25). The bread cast upon the waters returns *after many days* (Ecclesiastes 11:1) by the same law — the one who waters others is himself watered. The return is Elohim (God)''s to give, not a guaranteed yield the giver controls; this is open-handed trust, not a prosperity scheme.'),
  ('canon','ecclesiastes',11,2,'canon','deuteronomy',15,10,'free',
   E'*Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10). Qoheleth''s *Give a portion to seven, and also to eight; for thou knowest not what evil shall be upon the earth* (Ecclesiastes 11:2) is the wisdom-form of Torah''s open-hand command — give without grudging, and Yahuah (LORD) Himself answers the giving with blessing in all the works of the hand.'),
  ('canon','ecclesiastes',11,1,'canon','2-corinthians',9,6,'free',
   E'*He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). Sha''ul (Paul) preaches the very principle of *Cast thy bread upon the waters: for thou shalt find it after many days* (Ecclesiastes 11:1) — the bountiful sower reaps bountifully, for *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) and is *able to make all grace abound* unto every good work. The harvest is Elohim (God)''s, not the giver''s, to control.'),
  ('canon','ecclesiastes',11,1,'canon','luke',6,38,'free',
   E'*Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over, shall men give into your bosom* (Luke 6:38). The Formed Son seals Qoheleth''s counsel: *Cast thy bread upon the waters: for thou shalt find it after many days* (Ecclesiastes 11:1) becomes the promise that the measure given out is the measure returned — open-handed generosity that trusts Yahuah (LORD) for the overflowing return.'),
  -- THREAD 2: thou knowest not the works of Elohim who maketh all (11:5) = the hidden creative work
  ('canon','ecclesiastes',11,5,'canon','psalms',139,13,'free',
   E'*For thou hast possessed my reins: thou hast covered me in my mother''s womb* (Psalm 139:13). Qoheleth confesses the same hidden work: *As thou knowest not... how the bones do grow in the womb of her that is with child: even so thou knowest not the works of Elohim (God) who maketh all* (Ecclesiastes 11:5). The forming of the child in the womb is Elohim (God)''s secret craft, past all human knowing — the Psalmist worships where Qoheleth marvels.'),
  ('canon','ecclesiastes',11,5,'canon','psalms',139,14,'free',
   E'*I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well* (Psalm 139:14). The works of *Elohim (God) who maketh all* (Ecclesiastes 11:5) are the fearful and wonderful works the Psalmist praises — the body knit in secret is the very emblem of the Maker''s unsearchable skill, beyond the reach of the human eye.'),
  ('canon','ecclesiastes',11,5,'canon','psalms',139,15,'free',
   E'*My substance was not hid from thee, when I was made in secret, and curiously wrought in the lowest parts of the earth* (Psalm 139:15). What is hidden from man — *how the bones do grow in the womb* (Ecclesiastes 11:5) — is open and *curiously wrought* before Elohim (God). The limit of human knowledge is the boundary of the Maker''s secret workmanship.'),
  ('canon','ecclesiastes',11,5,'canon','job',10,11,'free',
   E'*Thou hast clothed me with skin and flesh, and hast fenced me with bones and sinews* (Job 10:11). Iyov (Job) names the very growing of the bones Qoheleth marvels at in *how the bones do grow in the womb of her that is with child* (Ecclesiastes 11:5) — the clothing of skin and flesh, the fencing of bones and sinews, is Elohim (God)''s hidden handiwork upon every child.'),
  ('canon','ecclesiastes',11,5,'canon','john',3,8,'free',
   E'*The wind bloweth where it listeth, and thou hearest the sound thereof, but canst not tell whence it cometh, and whither it goeth: so is every one that is born of the Spirit* (John 3:8). The Formed Son takes up Qoheleth''s *thou knowest not what is the way of the spirit* (Ecclesiastes 11:5): as the way of the wind and the growing of the bones lie past human knowing, so does the new birth of the Ruach HaKodesh (Holy Spirit) — the works of *Elohim (God) who maketh all* remain His unsearchable secret.'),
  -- THREAD 3: in the morning sow thy seed (11:6) = diligent labour amid uncertainty
  ('canon','ecclesiastes',11,6,'canon','galatians',6,9,'free',
   E'*And let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9). Qoheleth''s *In the morning sow thy seed, and in the evening withhold not thine hand: for thou knowest not whether shall prosper, either this or that* (Ecclesiastes 11:6) is the same call to unwearied labour: sow through the uncertainty, for the harvest comes *in due season* to the hand that does not slack.'),
  ('canon','ecclesiastes',11,6,'canon','2-timothy',4,2,'free',
   E'*Preach the word; be instant in season, out of season; reprove, rebuke, exhort with all longsuffering and doctrine* (2 Timothy 4:2). The morning-and-evening diligence of *In the morning sow thy seed, and in the evening withhold not thine hand* (Ecclesiastes 11:6) becomes the apostolic charge to be *instant in season, out of season* — labour pressed on at every hour, since which sowing prospers is hidden from the sower.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4 (separate INSERT — Ecc 12:14 source 11:9 -> a 12 target, kept identical pattern)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  ('canon','ecclesiastes',11,9,'canon','numbers',15,39,'free',
   E'*And it shall be unto you for a fringe, that ye may look upon it, and remember all the commandments of Yahuah (LORD), and do them; and that ye seek not after your own heart and your own eyes, after which ye use to go a whoring* (Numbers 15:39). Qoheleth''s *walk in the ways of thine heart, and in the sight of thine eyes: but know thou, that for all these things Elohim (God) will bring thee into judgment* (Ecclesiastes 11:9) is the deliberate answer to this warning — the *but* is decisive: the joy of youth is no licence to follow heart and eyes, for the very heart and eyes Numbers forbids chasing are accountable before the coming judgment.'),
  ('canon','ecclesiastes',11,9,'canon','ecclesiastes',12,14,'free',
   E'*For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). This is the book''s own conclusion, set up by *know thou, that for all these things Elohim (God) will bring thee into judgment* (Ecclesiastes 11:9). The rejoicing of youth is held UNDER the certainty that every deed, even the secret, comes before Elohim (God) — the fear of the judgment guards the joy.'),
  ('canon','ecclesiastes',11,9,'canon','2-corinthians',5,10,'free',
   E'*For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad* (2 Corinthians 5:10). Sha''ul (Paul) names the very judgment Qoheleth sets over the joy of youth: *for all these things Elohim (God) will bring thee into judgment* (Ecclesiastes 11:9). Every deed of the body is weighed before the judgment seat — the rejoicing is real, but lived in the fear of that appearing.'),
  ('canon','ecclesiastes',11,9,'canon','romans',14,12,'free',
   E'*So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12). The certainty that *Elohim (God) will bring thee into judgment* (Ecclesiastes 11:9) is the apostolic word: each one renders his own account to Elohim (God). The joy of *Rejoice, O young man, in thy youth* is never severed from the reckoning that follows it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand',
       E'Cast thy bread upon the waters — the open hand that trusts Elohim for the return',
       E'*Cast thy bread upon the waters: for thou shalt find it after many days. Give a portion to seven, and also to eight; for thou knowest not what evil shall be upon the earth* (Ecclesiastes 11:1-2). Qoheleth counsels open-handed generosity that scatters freely and trusts Yahuah (LORD) for the return — not a prosperity-investment scheme, for the harvest is Elohim (God)''s to give. The wisdom books speak the same paradox: *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty* (Proverbs 11:24), and *The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25). It is the wisdom-form of Torah''s open-hand command — *Thou shalt surely give him, and thine heart shall not be grieved... because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10). Sha''ul (Paul) takes it up: *He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6), and the Formed Son seals it: *Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over* (Luke 6:38). From Qoheleth to Messiah, the open hand is the hand Yahuah (LORD) fills.',
       sv.verse_id, ev.verse_id, 'free', 39150
  FROM _s321_ecc11_lookup sv, _s321_ecc11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all',
       E'Thou knowest not the works of Elohim who maketh all — the hidden craft in the womb',
       E'*As thou knowest not what is the way of the spirit, nor how the bones do grow in the womb of her that is with child: even so thou knowest not the works of Elohim (God) who maketh all* (Ecclesiastes 11:5). Qoheleth marks the boundary of human knowledge at the secret workmanship of the Maker. The Psalmist worships there: *For thou hast possessed my reins: thou hast covered me in my mother''s womb* (Psalm 139:13); *I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works* (Psalm 139:14); *My substance was not hid from thee, when I was made in secret, and curiously wrought in the lowest parts of the earth* (Psalm 139:15). Iyov (Job) names the very growing of the bones: *Thou hast clothed me with skin and flesh, and hast fenced me with bones and sinews* (Job 10:11). And the Formed Son carries the *way of the spirit* forward to the new birth: *The wind bloweth where it listeth, and thou hearest the sound thereof, but canst not tell whence it cometh, and whither it goeth: so is every one that is born of the Spirit* (John 3:8). What man cannot trace — wind, womb, and the work of the Ruach HaKodesh (Holy Spirit) — is the unsearchable craft of *Elohim (God) who maketh all*.',
       sv.verse_id, ev.verse_id, 'free', 39151
  FROM _s321_ecc11_lookup sv, _s321_ecc11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-11-in-the-morning-sow-thy-seed-diligence-amid-uncertainty',
       E'In the morning sow thy seed — diligent labour in the face of uncertainty',
       E'*In the morning sow thy seed, and in the evening withhold not thine hand: for thou knowest not whether shall prosper, either this or that, or whether they both shall be alike good* (Ecclesiastes 11:6). Since the sower cannot tell which labour will prosper, Qoheleth bids him work from morning to evening without slacking — the very opposite of *He that observeth the wind shall not sow* (Ecclesiastes 11:4). The apostles take up the same call to unwearied diligence: *And let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9), and *Preach the word; be instant in season, out of season* (2 Timothy 4:2). The harvest is hidden, so the hand keeps sowing — faithfulness in the labour, the increase left to Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 39152
  FROM _s321_ecc11_lookup sv, _s321_ecc11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment',
       E'Rejoice, O young man — but know that Elohim will bring thee into judgment',
       E'*Rejoice, O young man, in thy youth; and let thy heart cheer thee in the days of thy youth, and walk in the ways of thine heart, and in the sight of thine eyes: but know thou, that for all these things Elohim (God) will bring thee into judgment* (Ecclesiastes 11:9). The *but* is decisive: the joy of youth is real and good, yet it is held UNDER the certainty of the coming reckoning. This is the deliberate answer to Torah''s warning — *that ye seek not after your own heart and your own eyes, after which ye use to go a whoring* (Numbers 15:39): the heart and eyes a man is told he may walk in are the very heart and eyes that must answer in judgment. It sets up the book''s own conclusion: *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). The apostles confirm the reckoning: *For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body* (2 Corinthians 5:10), and *So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12). Joy lived in the fear of the judgment — that is the wisdom of the young.',
       sv.verse_id, ev.verse_id, 'free', 39153
  FROM _s321_ecc11_lookup sv, _s321_ecc11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There is that scattereth, and yet increaseth* (Proverbs 11:24) — the open hand that scatters in generosity is the hand that increases.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25) — the return is Elohim (God)''s to give, not a controlled yield.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt surely give him, and thine heart shall not be grieved... Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* (Deuteronomy 15:10) — the Torah open-hand command behind *give a portion to seven, and also to eight*.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6) — Sha''ul (Paul) preaches the open-hand principle of casting bread on the waters.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over* (Luke 6:38) — the Formed Son seals the measure-given-is-measure-returned promise.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-cast-thy-bread-upon-the-waters-the-open-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou hast covered me in my mother''s womb* (Psalm 139:13) — the forming of the child is Elohim (God)''s secret craft, where Qoheleth marvels.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am fearfully and wonderfully made: marvellous are thy works* (Psalm 139:14) — the works of *Elohim (God) who maketh all* are the wonderful works the Psalmist praises.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when I was made in secret, and curiously wrought in the lowest parts of the earth* (Psalm 139:15) — what is hidden from man is *curiously wrought* before Elohim (God).'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou hast clothed me with skin and flesh, and hast fenced me with bones and sinews* (Job 10:11) — Iyov (Job) names the very growing of the bones Qoheleth marvels at.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The wind bloweth where it listeth... so is every one that is born of the Spirit* (John 3:8) — the Formed Son carries the unknowable *way of the spirit* forward to the new birth.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-thou-knowest-not-the-works-of-elohim-who-maketh-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9) — sow through the uncertainty, the harvest comes in due season.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-in-the-morning-sow-thy-seed-diligence-amid-uncertainty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*be instant in season, out of season* (2 Timothy 4:2) — the morning-and-evening diligence becomes the apostolic charge to labour at every hour.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-in-the-morning-sow-thy-seed-diligence-amid-uncertainty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*seek not after your own heart and your own eyes* (Numbers 15:39) — the heart and eyes Torah forbids chasing are the very ones that must answer in judgment.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For Elohim (God) shall bring every work into judgment, with every secret thing* (Ecclesiastes 12:14) — the book''s own conclusion, set up by the judgment-clause of 11:9.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*we must all appear before the judgment seat of Messiah (Christ)* (2 Corinthians 5:10) — every deed of the body weighed, the joy lived in the fear of that appearing.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*So then every one of us shall give account of himself to Elohim (God)* (Romans 14:12) — the joy of youth never severed from the reckoning that follows.'
  FROM cross_reference_threads t
  JOIN _s321_ecc11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s321_ecc11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ecclesiastes-11-rejoice-o-young-man-but-elohim-will-bring-thee-into-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiastes_12.sql (Ecclesiastes 12) -----
-- Chapter: Ecclesiastes 12 — REMEMBER THY CREATOR, AND THE CONCLUSION (the capstone of the book and of all wisdom)
-- Session prefix: s321   Tag: ecc12   Temp view: _s321_ecc12_lookup
-- Slug prefix: ecclesiastes-12-...   Sort band: 39175..39180 (+1 per thread, 6 threads)
-- Source: canon / ecclesiastes / chapter 12
--
-- THREADS (6):
--   39175 ecclesiastes-12-remember-thy-creator-in-the-days-of-thy-youth         [Tanakh + NT]   (free)
--   39176 ecclesiastes-12-frailty-and-the-end-of-the-body                       [Tanakh]        (free)
--   39177 ecclesiastes-12-the-dust-returns-to-the-earth-the-spirit-to-elohim-who-gave-it [Tanakh + NT] (free)
--   39178 ecclesiastes-12-the-words-of-the-wise-given-from-one-shepherd         [Tanakh + NT]   (free)
--   39179 ecclesiastes-12-fear-elohim-and-keep-his-commandments-the-whole-duty-of-man [Tanakh + NT + Extras] (extras)
--   39180 ecclesiastes-12-elohim-shall-bring-every-work-into-judgment           [NT + Extras]   (extras)
--
-- 12:13-14 CAPSTONE FRAMING (anti-antinomian, Torah-upholding):
--   12:13 "Fear Elohim, and keep his commandments: for this is the whole duty of man" is the
--   conclusion the WHOLE book drove toward — every under-the-sun search resolves HERE, in the
--   fear of Yahuah AND Torah-obedience together as the sum of wisdom. Framed through the master
--   filter 1 John 2:3-4 ("if we keep his commandments... he that saith, I know him, and keepeth
--   not his commandments, is a liar") — any reading that makes commandment-keeping irrelevant is
--   the lie this work exists to override — and through Deuteronomy 10:12-13 (fear + keep the
--   commandments = what Yahuah requires). The Torah is NOT abolished; it is the END of the matter,
--   the whole duty of man. 12:14 ("every work into judgment, with every secret thing") seals it:
--   the coming judgment of every secret deed is why the conclusion binds (Rom 2:16; Rev 20:12).
--   The 2nd-Temple wisdom fusion is witnessed live: Sirach 1:26 "If you desire wisdom, keep the
--   commandments," and the judgment of secrets is witnessed by Wisdom 1:9 and 1 Enoch 49:4 (the
--   Elect One judges the secret things).
--   12:11 "one shepherd" framed as the Formed Son whose words are goads and nails (John 10; Ezek 34:23).
--   12:7 "the spirit shall return unto Elohim who gave it" = breath/spirit to its Giver (Gen 2:7),
--   carrying the seed of the resurrection hope (Dan 12:2) — handled lightly, not soul-sleep dogmatics.
--
-- COVERAGE CHECKLIST:
--   v.1  NT:     2 Timothy 3:15 (from a child known the scriptures) -> used
--        Extras: none warranted
--        Tanakh: Psalm 90:12, Psalm 71:5/17, Lamentations 3:27 -> used
--   v.2  NT:     none warranted (allegory of aging; covered under frailty thread)
--        Extras: none warranted
--        Tanakh: covered in frailty thread (Job 14, Ps 103, Ps 90)
--   v.3-4 NT:    none warranted
--        Extras: none warranted
--        Tanakh: Job 14:1-2, Psalm 103:14-16 (frailty) -> used
--   v.5  NT:     none warranted
--        Extras: none warranted
--        Tanakh: Job 14:1-2, Psalm 90:10, Genesis 3:19 -> used (frailty + dust threads)
--   v.6  NT:     none warranted
--        Extras: none warranted
--        Tanakh: frailty thread anchor (silver cord / golden bowl broken)
--   v.7  NT:     Luke 23:46 (into thy hands I commend my spirit) -> used
--        Extras: none warranted (Wis 15:11 weighed; reserved for clean witnesses elsewhere)
--        Tanakh: Genesis 2:7, Genesis 3:19, Job 34:14-15, Psalm 104:29, Daniel 12:2 -> used
--   v.8  NT:     none warranted (refrain; covered by whole-book vanity threads elsewhere)
--        Extras: none warranted
--        Tanakh: none warranted here
--   v.9-10 NT:   none warranted
--        Extras: none warranted
--        Tanakh: rolled into the one-shepherd words-of-truth thread context
--   v.11 NT:     John 10:11, John 10:16 (the one shepherd) -> used
--        Extras: none warranted
--        Tanakh: Psalm 23:1, Ezekiel 34:23, Jeremiah 3:15 -> used
--   v.12 NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted
--   v.13 NT:     1 John 2:3-4, John 14:15, Revelation 14:12, Revelation 22:14, Matthew 19:17, James 2:10 -> used
--        Extras: Sirach (Ecclesiasticus) 1:26 -> used
--        Tanakh: Deuteronomy 10:12-13, Deuteronomy 6:2, Proverbs 1:7, Proverbs 9:10, Micah 6:8, Ecclesiastes 5:7 -> used
--   v.14 NT:     Romans 2:16, 2 Corinthians 5:10, Matthew 12:36, Revelation 20:12, 1 Corinthians 4:5 -> used
--        Extras: Wisdom of Solomon 1:9, 1 Enoch 49:4 -> used
--        Tanakh: none warranted (sealed forward into the judgment witnesses)
-- =====================================================================================

CREATE TEMP VIEW _s321_ecc12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================================
-- B. cross_references
-- =====================================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Remember thy Creator in the days of thy youth (12:1)
    ('canon','ecclesiastes',12,1,'canon','psalms',90,12,'free',
      E'*So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12). The Preacher''s charge to *Remember now thy Creator in the days of thy youth, while the evil days come not* (Ecclesiastes 12:1) is the same wisdom — turn the heart to the Creator before the years draw nigh, numbering the few days while there is yet pleasure in them.'),
    ('canon','ecclesiastes',12,1,'canon','psalms',71,5,'free',
      E'*For thou art my hope, O Yahuah (Lord) GOD: thou art my trust from my youth* (Psalm 71:5). The Preacher commands what the psalmist lived — *Remember now thy Creator in the days of thy youth* (Ecclesiastes 12:1) — the Creator laid hold of from the womb and trusted before old age, *Cast me not off in the time of old age* (Psalm 71:9).'),
    ('canon','ecclesiastes',12,1,'canon','lamentations',3,27,'free',
      E'*It is good for a man that he bear the yoke in his youth* (Lamentations 3:27). The same counsel as *Remember now thy Creator in the days of thy youth* (Ecclesiastes 12:1) — the yoke of the fear of Yahuah and his commandments is best taken up early, before the evil days come.'),
    ('canon','ecclesiastes',12,1,'canon','2-timothy',3,15,'free',
      E'*And that from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation through faith which is in HaMashiach Yahusha (Christ Jesus)* (2 Timothy 3:15). This is *Remember now thy Creator in the days of thy youth* (Ecclesiastes 12:1) fulfilled forward — the Creator known from childhood through his own scriptures, the youth instructed before the years of no pleasure arrive.'),

    -- THREAD 2: Frailty and the end of the body (12:5-6)
    ('canon','ecclesiastes',12,5,'canon','job',14,1,'free',
      E'*Man that is born of a woman is of few days, and full of trouble. He cometh forth like a flower, and is cut down: he fleeth also as a shadow, and continueth not* (Job 14:1-2). This is the allegory of Ecclesiastes 12 in plain speech — *because man goeth to his long home, and the mourners go about the streets* (Ecclesiastes 12:5); the flesh flowers and is cut down.'),
    ('canon','ecclesiastes',12,6,'canon','job',14,2,'free',
      E'*He cometh forth like a flower, and is cut down: he fleeth also as a shadow, and continueth not* (Job 14:2). When *the silver cord be loosed, or the golden bowl be broken* (Ecclesiastes 12:6) the frame fails like the fading flower — the costly vessel of the body shattered, the lamp put out.'),
    ('canon','ecclesiastes',12,5,'canon','psalms',103,15,'free',
      E'*As for man, his days are as grass: as a flower of the field, so he flourisheth. For the wind passeth over it, and it is gone; and the place thereof shall know it no more* (Psalm 103:15-16). The almond tree flourishing and *the grasshopper shall be a burden, and desire shall fail* (Ecclesiastes 12:5) sing the same brevity — grass that flowers and is gone, *for he knoweth our frame; he remembereth that we are dust* (Psalm 103:14).'),
    ('canon','ecclesiastes',12,5,'canon','psalms',90,10,'free',
      E'*The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away* (Psalm 90:10). The same counted, fading span the allegory paints, where *desire shall fail: because man goeth to his long home* (Ecclesiastes 12:5).'),

    -- THREAD 3: The dust returns to the earth, the spirit unto Elohim who gave it (12:7)
    ('canon','ecclesiastes',12,7,'canon','genesis',2,7,'free',
      E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). Ecclesiastes 12:7 is the unwinding of that forming — *the spirit shall return unto Elohim (God) who gave it*; the breath breathed in at the beginning goes back to its Giver, and the dust returns to the dust it was taken from.'),
    ('canon','ecclesiastes',12,7,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). This is the first half of Ecclesiastes 12:7 — *then shall the dust return to the earth as it was* — the Edenic sentence on the body, the ground reclaiming what it gave.'),
    ('canon','ecclesiastes',12,7,'canon','job',34,14,'free',
      E'*If he set his heart upon man, if he gather unto himself his spirit and his breath; All flesh shall perish together, and man shall turn again unto dust* (Job 34:14-15). The same two-fold return Ecclesiastes 12:7 names — Elohim gathering back the spirit and breath he gave, the flesh turning again unto dust.'),
    ('canon','ecclesiastes',12,7,'canon','psalms',104,29,'free',
      E'*Thou hidest thy face, they are troubled: thou takest away their breath, they die, and return to their dust* (Psalm 104:29). The breath is on loan from Elohim; when he withdraws it the flesh returns to dust and *the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7).'),
    ('canon','ecclesiastes',12,7,'canon','daniel',12,2,'free',
      E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The spirit returning to its Giver carries the seed of this hope — the dust that receives the body is not its last word; those who sleep in it *shall awake*, the Giver who took the breath able to give it again.'),
    ('canon','ecclesiastes',12,7,'canon','luke',23,46,'free',
      E'*And when Yahusha (Jesus) had cried with a loud voice, he said, Father, into thy hands I commend my spirit: and having said thus, he gave up the ghost* (Luke 23:46). At the cross the Formed Son lives out Ecclesiastes 12:7 — *the spirit shall return unto Elohim (God) who gave it* — yielding his spirit back into the Father''s hands, the pattern of trust at death.'),

    -- THREAD 4: The words of the wise given from one shepherd (12:11)
    ('canon','ecclesiastes',12,11,'canon','psalms',23,1,'free',
      E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). The wise words are *given from one shepherd* (Ecclesiastes 12:11) — the goads and nails come from the one true Shepherd of his people, the same Shepherd David sang.'),
    ('canon','ecclesiastes',12,11,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The *one shepherd* of Ecclesiastes 12:11 is named in the prophet — the promised servant-David, the Formed Son who feeds his flock with the words of truth.'),
    ('canon','ecclesiastes',12,11,'canon','jeremiah',3,15,'free',
      E'*And I will give you pastors according to mine heart, which shall feed you with knowledge and understanding* (Jeremiah 3:15). The wise words *as goads, and as nails fastened by the masters of assemblies* (Ecclesiastes 12:11) are this feeding with knowledge — under-shepherds, yet all the truth flows from the one Shepherd''s heart.'),
    ('canon','ecclesiastes',12,11,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The *one shepherd* from whom the wise words are given (Ecclesiastes 12:11) stands forth in the flesh — the Formed Son whose goading, holding words are the voice of the Good Shepherd himself.'),
    ('canon','ecclesiastes',12,11,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). Ecclesiastes 12:11''s *one shepherd* gathers the two houses into one — both folds hearing the one voice whose words are goads and nails, made one flock under one Shepherd.'),

    -- THREAD 5: Fear Elohim and keep his commandments, the whole duty of man (12:13) — THE CAPSTONE
    ('canon','ecclesiastes',12,13,'canon','deuteronomy',10,12,'free',
      E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul, To keep the commandments of Yahuah (LORD), and his statutes* (Deuteronomy 10:12-13). This IS the conclusion of Ecclesiastes — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The whole under-the-sun search resolves into the very thing Torah said Yahuah requires: fear, and keep the commandments.'),
    ('canon','ecclesiastes',12,13,'canon','deuteronomy',6,2,'free',
      E'*That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments, which I command thee* (Deuteronomy 6:2). Fear AND keep, joined as one duty — exactly the sum the Preacher names: *Fear Elohim (God), and keep his commandments* (Ecclesiastes 12:13). The commandments are not abolished by wisdom; they ARE its end.'),
    ('canon','ecclesiastes',12,13,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). Wisdom''s book begins where Ecclesiastes ends — *Fear Elohim (God)* (Ecclesiastes 12:13). The fear of Yahuah opens knowledge and crowns it; the whole search returns to its beginning.'),
    ('canon','ecclesiastes',12,13,'canon','proverbs',9,10,'free',
      E'*The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). The fear that begins wisdom is the fear that concludes it — *Fear Elohim (God), and keep his commandments* (Ecclesiastes 12:13); the whole duty of man is no other than this.'),
    ('canon','ecclesiastes',12,13,'canon','micah',6,8,'free',
      E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). The prophet''s sum and the Preacher''s sum are one — *this is the whole duty of man* (Ecclesiastes 12:13): the requirement of Yahuah, walking humbly in his commandments.'),
    ('canon','ecclesiastes',12,13,'canon','ecclesiastes',5,7,'free',
      E'*For in the multitude of dreams and many words there are also divers vanities: but fear thou Elohim (God)* (Ecclesiastes 5:7). The book''s own earlier word anticipates its last — past the vanity of many words, *fear thou Elohim*, which the conclusion completes: *Fear Elohim (God), and keep his commandments* (Ecclesiastes 12:13).'),
    ('canon','ecclesiastes',12,13,'apocrypha','ecclesiasticus',1,26,'extras',
      E'*If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26). The same 2nd-Temple wisdom fusion as Ecclesiastes 12:13 — *Fear Elohim (God), and keep his commandments* — wisdom is not found apart from commandment-keeping; the fear of Yahuah and the keeping of his Torah are the one path to her.'),
    ('canon','ecclesiastes',12,13,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4). This is the master filter on Ecclesiastes 12:13 — *keep his commandments* is *the whole duty of man*; any reading that makes commandment-keeping irrelevant is the lie. To know Elohim is to keep his commandments, the Torah upheld, not abolished.'),
    ('canon','ecclesiastes',12,13,'canon','john',14,15,'free',
      E'*If ye love me, keep my commandments* (John 14:15). The Formed Son seals the conclusion of the matter — love of him is no substitute for the commandments but the keeping of them, *for this is the whole duty of man* (Ecclesiastes 12:13).'),
    ('canon','ecclesiastes',12,13,'canon','matthew',19,17,'free',
      E'*And he said unto him... if thou wilt enter into life, keep the commandments* (Matthew 19:17). The Son''s own answer to the way of life is the Preacher''s conclusion — *keep his commandments* (Ecclesiastes 12:13). The commandments are the door to life, not a discarded yoke.'),
    ('canon','ecclesiastes',12,13,'canon','james',2,10,'free',
      E'*For whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). The whole duty of man is the whole law kept — *Fear Elohim (God), and keep his commandments* (Ecclesiastes 12:13); James upholds the Torah as one and binding, not partitioned or set aside.'),
    ('canon','ecclesiastes',12,13,'canon','revelation',14,12,'free',
      E'*Here is the patience of the saints: here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12). The end of the matter and the end of the age agree — the remnant is marked by what Ecclesiastes 12:13 calls the whole duty of man: keeping the commandments of Elohim.'),
    ('canon','ecclesiastes',12,13,'canon','revelation',22,14,'free',
      E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The canon closes where Ecclesiastes concludes — *keep his commandments* (Ecclesiastes 12:13). The whole duty of man opens the gates to the tree of life; the Torah upheld to the very last page.'),

    -- THREAD 6: Elohim shall bring every work into judgment (12:14)
    ('canon','ecclesiastes',12,14,'canon','romans',2,16,'free',
      E'*In the day when Elohim (God) shall judge the secrets of men by Yahusha HaMashiach (Jesus Christ) according to my gospel* (Romans 2:16). This is Ecclesiastes 12:14 forward — *Elohim (God) shall bring every work into judgment, with every secret thing* — the hidden deeds judged, and the Formed Son the one through whom Elohim judges them.'),
    ('canon','ecclesiastes',12,14,'canon','2-corinthians',5,10,'free',
      E'*For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad* (2 Corinthians 5:10). The very terms of Ecclesiastes 12:14 — every work judged *whether it be good, or whether it be evil* — every deed of the body brought before the judgment seat.'),
    ('canon','ecclesiastes',12,14,'canon','matthew',12,36,'free',
      E'*But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). Even the idle word is *every secret thing* (Ecclesiastes 12:14) — nothing falls outside the judgment of every work the Preacher warns of.'),
    ('canon','ecclesiastes',12,14,'canon','revelation',20,12,'free',
      E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened... and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). The final scene of *Elohim (God) shall bring every work into judgment* (Ecclesiastes 12:14) — the books opened, all judged according to their works, the secret things laid bare.'),
    ('canon','ecclesiastes',12,14,'canon','1-corinthians',4,5,'free',
      E'*...until Yahuah (Lord) come, who both will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts: and then shall every man have praise of Elohim (God)* (1 Corinthians 4:5). This is *every secret thing* of Ecclesiastes 12:14 brought into judgment — the hidden things of darkness and the counsels of the heart made manifest at his coming.'),
    ('canon','ecclesiastes',12,14,'apocrypha','the-wisdom-of-solomon',1,9,'extras',
      E'*For inquisition shall be made into the counsels of the ungodly: and the sound of his words shall come to Yahuah (God) for the manifestation of his wicked deeds* (Wisdom of Solomon 1:9). The same library voice as Ecclesiastes 12:14 — *with every secret thing* — the hidden counsels searched out and the secret deeds manifested before Yahuah.'),
    ('canon','ecclesiastes',12,14,'enoch','1-enoch',49,4,'extras',
      E'*And he shall judge the secret things, And none shall be able to utter a lying word before him; For he is the Elect One before Yahuah (God) of Spirits* (1 Enoch 49:4). The judgment of *every secret thing* (Ecclesiastes 12:14) is committed to the Elect One — the Formed Son before whom no secret and no lie can stand, sealing the conclusion of the whole matter.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================================
-- C. cross_reference_threads
-- =====================================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-remember-thy-creator-in-the-days-of-thy-youth',
  E'Remember Now Thy Creator in the Days of Thy Youth',
  E'The capstone chapter opens with a charge: *Remember now thy Creator in the days of thy youth, while the evil days come not, nor the years draw nigh, when thou shalt say, I have no pleasure in them* (Ecclesiastes 12:1). Turn to the Creator BEFORE age and death close in — the whole book has searched under the sun, and the first word of its conclusion is to remember the One above the sun while there is yet strength to do it.\n\nThe Psalms sing the same wisdom. *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12) — the brevity of the years is the very reason to give the heart now. The psalmist who lived it cries, *For thou art my hope, O Yahuah (Lord) GOD: thou art my trust from my youth* (Psalm 71:5), the Creator laid hold of from the womb and trusted into old age. Lamentations puts it as a yoke: *It is good for a man that he bear the yoke in his youth* (Lamentations 3:27) — the yoke of the fear of Yahuah and his commandments is best taken up early.\n\nThe weave runs forward to the apostle''s charge to Timothy: *And that from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation through faith which is in HaMashiach Yahusha (Christ Jesus)* (2 Timothy 3:15). This is the youth who remembered his Creator — instructed in the Creator''s own scriptures from childhood, before the years of no pleasure ever arrived.',
  sv.verse_id, ev.verse_id, 'free', 39175
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-frailty-and-the-end-of-the-body',
  E'The Frailty and the End of the Body',
  E'The Preacher paints aging and death in unforgettable allegory: the sun and light darkened, *the keepers of the house shall tremble* (Ecclesiastes 12:3), the daughters of music brought low, *the almond tree shall flourish, and the grasshopper shall be a burden, and desire shall fail: because man goeth to his long home, and the mourners go about the streets* (Ecclesiastes 12:5) — and then the body itself: *Or ever the silver cord be loosed, or the golden bowl be broken* (Ecclesiastes 12:6), the costly vessel shattered, the lamp put out.\n\nJob says the same in plain speech: *Man that is born of a woman is of few days, and full of trouble. He cometh forth like a flower, and is cut down: he fleeth also as a shadow, and continueth not* (Job 14:1-2). The flower that flowers and is cut down is the almond tree of the allegory and the silver cord loosed. The Psalms echo it: *As for man, his days are as grass: as a flower of the field, so he flourisheth. For the wind passeth over it, and it is gone; and the place thereof shall know it no more* (Psalm 103:15-16) — and the tender ground of it, *for he knoweth our frame; he remembereth that we are dust* (Psalm 103:14).\n\nMoses had counted the same span: *The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away* (Psalm 90:10). The frailty is no accident to be raged against — it is the appointed brevity that makes the conclusion of the whole matter urgent.',
  sv.verse_id, ev.verse_id, 'free', 39176
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-the-dust-returns-to-the-earth-the-spirit-to-elohim-who-gave-it',
  E'The Dust Returns to the Earth, the Spirit unto Elohim Who Gave It',
  E'At the heart of the death-allegory stands the great unwinding: *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). This is the forming of Genesis run backward. *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7) — at death the dust goes back to the ground and the breath goes back to its Giver.\n\nThe first half is the Edenic sentence: *for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The second half is Job''s witness: *If he set his heart upon man, if he gather unto himself his spirit and his breath; All flesh shall perish together, and man shall turn again unto dust* (Job 34:14-15), and the Psalm''s: *Thou hidest thy face, they are troubled: thou takest away their breath, they die, and return to their dust* (Psalm 104:29). The breath is on loan from Elohim, withdrawn at his will.\n\nYet the spirit returning to its Giver carries the seed of a hope: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). The dust that receives the body is not its last word — the Giver who took the breath is able to give it again. And the Formed Son lives the trust of this verse out at the cross: *Father, into thy hands I commend my spirit: and having said thus, he gave up the ghost* (Luke 23:46). The spirit yielded back to the Father is the very pattern of Ecclesiastes 12:7.',
  sv.verse_id, ev.verse_id, 'free', 39177
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-the-words-of-the-wise-given-from-one-shepherd',
  E'The Words of the Wise Given from One Shepherd',
  E'The Preacher names the source of true wisdom: *The words of the wise are as goads, and as nails fastened by the masters of assemblies, which are given from one shepherd* (Ecclesiastes 12:11). Words that goad the conscience forward and fasten the soul like a driven nail — and all of them flow from ONE Shepherd. That Shepherd is sung from the first: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1).\n\nThe prophet names him as the coming servant-David: *And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The under-shepherds feed only from his heart: *And I will give you pastors according to mine heart, which shall feed you with knowledge and understanding* (Jeremiah 3:15) — the masters of assemblies pass on what the one Shepherd gives.\n\nIn the flesh the one Shepherd stands forth as the Formed Son: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). And his goading, holding words gather the two houses into one flock: *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The wise words of Ecclesiastes 12:11 are the very voice of this one Shepherd, drawing both folds home.',
  sv.verse_id, ev.verse_id, 'free', 39178
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-fear-elohim-and-keep-his-commandments-the-whole-duty-of-man',
  E'Fear Elohim and Keep His Commandments: The Whole Duty of Man',
  E'Here is the capstone of the book and of all wisdom: *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). Every page of searching under the sun — pleasure, labour, riches, wisdom, all vanity — resolves HERE: the fear of Yahuah AND the keeping of his commandments, the Torah, together as the entire duty of man. This is the anti-antinomian summit of the Writings: the commandments are not abolished by wisdom; they ARE its end.\n\nThis is exactly what Torah said Yahuah requires: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways... To keep the commandments of Yahuah (LORD), and his statutes* (Deuteronomy 10:12-13); *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments* (Deuteronomy 6:2). Wisdom''s own book agrees at both ends: *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10). The prophet sums it the same way: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8), and the book itself foretold its close: *but fear thou Elohim (God)* (Ecclesiastes 5:7). The same 2nd-Temple fusion is witnessed live: *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you* (Sirach 1:26).\n\nThe master filter seals it forward: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4) — any reading that makes commandment-keeping irrelevant is the lie. The Formed Son confirms it: *If ye love me, keep my commandments* (John 14:15); *if thou wilt enter into life, keep the commandments* (Matthew 19:17). The Torah is one and binding: *whosoever shall keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10). And the canon closes where Ecclesiastes concludes: *here are they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12); *Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14). The whole duty of man, the Torah upheld from beginning to end.',
  sv.verse_id, ev.verse_id, 'extras', 39179
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiastes-12-elohim-shall-bring-every-work-into-judgment',
  E'Elohim Shall Bring Every Work into Judgment',
  E'The final word of the book seals the conclusion with the coming judgment: *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* (Ecclesiastes 12:14). This is WHY the fear of Elohim and the keeping of his commandments is the whole duty of man — every deed, even the most hidden, will be brought into account. Nothing under the sun escapes the One above the sun.\n\nThe apostles preach it in the same terms: *In the day when Elohim (God) shall judge the secrets of men by Yahusha HaMashiach (Jesus Christ) according to my gospel* (Romans 2:16) — and the Formed Son is the One through whom Elohim judges. *For we must all appear before the judgment seat of Messiah (Christ); that every one may receive the things done in his body, according to that he hath done, whether it be good or bad* (2 Corinthians 5:10) — the very "good or evil" of the Preacher. Even the idle word is weighed: *every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36); the hidden things made manifest: *will bring to light the hidden things of darkness, and will make manifest the counsels of the hearts* (1 Corinthians 4:5). The final scene: *the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12).\n\nThe restored library witnesses the same: *For inquisition shall be made into the counsels of the ungodly... for the manifestation of his wicked deeds* (Wisdom of Solomon 1:9), and the judgment of secrets is committed to the Formed Son: *And he shall judge the secret things, And none shall be able to utter a lying word before him; For he is the Elect One before Yahuah (God) of Spirits* (1 Enoch 49:4). Before him no secret and no lie can stand — the judgment of every work seals the conclusion of the whole matter.',
  sv.verse_id, ev.verse_id, 'extras', 39180
  FROM _s321_ecc12_lookup sv, _s321_ecc12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ecclesiastes' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================================
-- D. cross_reference_thread_members
-- =====================================================================================
-- THREAD 1: Remember thy Creator
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,'psalms',90,12,E'*So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12) — turn the heart to the Creator while the days are few.'),
    (2,'psalms',71,5,E'*thou art my trust from my youth* (Psalm 71:5) — the Creator trusted from the womb, the youth-charge lived out.'),
    (3,'lamentations',3,27,E'*It is good for a man that he bear the yoke in his youth* (Lamentations 3:27) — take up the yoke of his commandments early.'),
    (4,'2-timothy',3,15,E'*from a child thou hast known the holy scriptures* (2 Timothy 3:15) — the Creator known from childhood through his own word.')
  ) AS m(so,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-remember-thy-creator-in-the-days-of-thy-youth'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: Frailty and the end of the body (source verses vary: 12:5 and 12:6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,5,'job',14,1,E'*He cometh forth like a flower, and is cut down* (Job 14:1-2) — the allegory in plain speech.'),
    (2,6,'job',14,2,E'*he fleeth also as a shadow, and continueth not* (Job 14:2) — when the silver cord is loosed.'),
    (3,5,'psalms',103,15,E'*his days are as grass: as a flower of the field, so he flourisheth* (Psalm 103:15-16) — and *he remembereth that we are dust* (v.14).'),
    (4,5,'psalms',90,10,E'*threescore years and ten... soon cut off, and we fly away* (Psalm 90:10) — the counted, fading span.')
  ) AS m(so,src_v,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-frailty-and-the-end-of-the-body'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Dust returns / spirit unto Elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,'genesis',2,7,E'*formed man of the dust of the ground, and breathed into his nostrils the breath of life* (Genesis 2:7) — the forming run backward.'),
    (2,'genesis',3,19,E'*dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the dust to the earth as it was.'),
    (3,'job',34,14,E'*if he gather unto himself his spirit and his breath... man shall turn again unto dust* (Job 34:14-15) — the two-fold return.'),
    (4,'psalms',104,29,E'*thou takest away their breath, they die, and return to their dust* (Psalm 104:29) — the breath on loan, withdrawn.'),
    (5,'daniel',12,2,E'*many of them that sleep in the dust of the earth shall awake* (Daniel 12:2) — the seed of the resurrection hope.'),
    (6,'luke',23,46,E'*Father, into thy hands I commend my spirit* (Luke 23:46) — the Formed Son yields his spirit back to the Giver.')
  ) AS m(so,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-the-dust-returns-to-the-earth-the-spirit-to-elohim-who-gave-it'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: One shepherd
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,'psalms',23,1,E'*Yahuah Ra''ah (The LORD is my shepherd)* (Psalm 23:1) — the one Shepherd from whom the wise words come.'),
    (2,'ezekiel',34,23,E'*I will set up one shepherd over them... even my servant David* (Ezekiel 34:23) — the one Shepherd named in the prophet.'),
    (3,'jeremiah',3,15,E'*pastors according to mine heart, which shall feed you with knowledge* (Jeremiah 3:15) — under-shepherds feeding from his heart.'),
    (4,'john',10,11,E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the one Shepherd in the flesh.'),
    (5,'john',10,16,E'*one fold, and one shepherd* (John 10:16) — the two houses gathered into one flock by his voice.')
  ) AS m(so,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-the-words-of-the-wise-given-from-one-shepherd'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: Fear Elohim and keep his commandments (CAPSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,'canon','deuteronomy',10,12,E'*to fear Yahuah Elohayka... To keep the commandments of Yahuah* (Deuteronomy 10:12-13) — exactly what Torah said Yahuah requires.'),
    (2,'canon','deuteronomy',6,2,E'*That thou mightest fear Yahuah Elohayka... to keep all his statutes and his commandments* (Deuteronomy 6:2) — fear and keep joined as one.'),
    (3,'canon','proverbs',1,7,E'*The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) — wisdom begins where Ecclesiastes ends.'),
    (4,'canon','proverbs',9,10,E'*The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10) — the fear that begins and concludes wisdom.'),
    (5,'canon','micah',6,8,E'*what doth Yahuah (LORD) require of thee, but to do justly... and to walk humbly* (Micah 6:8) — the prophet''s sum and the Preacher''s are one.'),
    (6,'canon','ecclesiastes',5,7,E'*but fear thou Elohim (God)* (Ecclesiastes 5:7) — the book''s own earlier word, completed at the close.'),
    (7,'apocrypha','ecclesiasticus',1,26,E'*If you desire wisdom, keep the commandments* (Sirach 1:26) — the same 2nd-Temple fusion of wisdom and Torah-keeping.'),
    (8,'canon','1-john',2,3,E'*if we keep his commandments... keepeth not his commandments, is a liar* (1 John 2:3-4) — the master filter; antinomian readings are the lie.'),
    (9,'canon','john',14,15,E'*If ye love me, keep my commandments* (John 14:15) — the Formed Son binds love to commandment-keeping.'),
    (10,'canon','matthew',19,17,E'*if thou wilt enter into life, keep the commandments* (Matthew 19:17) — the commandments are the door to life.'),
    (11,'canon','james',2,10,E'*keep the whole law, and yet offend in one point, he is guilty of all* (James 2:10) — the Torah one and binding.'),
    (12,'canon','revelation',14,12,E'*they that keep the commandments of Elohim (God), and the faith of Yahusha (Jesus)* (Revelation 14:12) — the remnant marked by the whole duty of man.'),
    (13,'canon','revelation',22,14,E'*Blessed are they that do his commandments... right to the tree of life* (Revelation 22:14) — the canon closes where Ecclesiastes concludes.')
  ) AS m(so,tgt_ed,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-fear-elohim-and-keep-his-commandments-the-whole-duty-of-man'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6: Every work into judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (1,'canon','romans',2,16,E'*Elohim (God) shall judge the secrets of men by Yahusha HaMashiach* (Romans 2:16) — the Formed Son judges the hidden deeds.'),
    (2,'canon','2-corinthians',5,10,E'*the judgment seat of Messiah... whether it be good or bad* (2 Corinthians 5:10) — the very terms of the Preacher.'),
    (3,'canon','matthew',12,36,E'*every idle word... they shall give account thereof in the day of judgment* (Matthew 12:36) — even the idle word is every secret thing.'),
    (4,'canon','revelation',20,12,E'*the dead were judged... according to their works* (Revelation 20:12) — the books opened, the secret things laid bare.'),
    (5,'canon','1-corinthians',4,5,E'*will bring to light the hidden things of darkness* (1 Corinthians 4:5) — every secret thing made manifest at his coming.'),
    (6,'apocrypha','the-wisdom-of-solomon',1,9,E'*inquisition shall be made into the counsels of the ungodly* (Wisdom of Solomon 1:9) — the hidden counsels searched out.'),
    (7,'enoch','1-enoch',49,4,E'*he shall judge the secret things... For he is the Elect One* (1 Enoch 49:4) — judgment of secrets committed to the Formed Son.')
  ) AS m(so,tgt_ed,tgt_book,tgt_ch,tgt_v,mnote)
  JOIN cross_reference_threads t ON t.slug='ecclesiastes-12-elohim-shall-bring-every-work-into-judgment'
  JOIN _s321_ecc12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ecclesiastes' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s321_ecc12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_book AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session321 — Ecclesiastes cross-references complete.'
