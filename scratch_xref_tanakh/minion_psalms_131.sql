-- ----- fragment: minion_psalms_131.sql (Psalm 131) -----
-- Chapter: Psalm 131 (A Song of degrees of David) — the weaned-child humility
-- Tag: ps131   Session: s302   sort_order band base: 25250 (25250, 25253, 25256)
--
-- Psalm 131 coverage:
--   v.1 (heart not haughty, eyes not lofty, no great matters too high)
--        NT:     Matt 11:29 (meek and lowly in heart); Rom 12:3 (not think more highly);
--                Rom 12:16 (mind not high things); Jas 4:6 / 1Pet 5:5 (grace to the humble) — WOVEN
--        Extras: none warranted (the wisdom-lit humility is fully carried by Proverbs canon)
--        Tanakh: Prov 3:5-7 (lean not to thine own understanding / be not wise in thine own eyes) — WOVEN
--   v.2 (behaved and quieted myself, as a weaned child)
--        NT:     Matt 18:3 (become as little children); Matt 18:4 (humble himself as this little child);
--                Mark 10:15 (receive the kingdom as a little child) — WOVEN
--        Extras: none warranted
--        Tanakh: none warranted (the weaned-child figure is unique; NT fills it directly)
--   v.3 (Let Yashar'el hope in Yahuah from henceforth and for ever)
--        NT:     Rom 11:1 (Hath Elohim cast away his people? Elohim forbid); Rom 11:2 (not cast away
--                his people which he foreknew) — two-house RESTORATION guard — WOVEN
--        Extras: none warranted
--        Tanakh: Ps 130:7 (Let Yashar'el hope in Yahuah) — lateral, the twin Ascent close — WOVEN
--
-- Threads (3, all members canon → tier 'free'):
--   psalm-131-not-haughty-the-lowly-covenant-heart        [NT + Tanakh]  sort 25250
--   psalm-131-as-a-weaned-child-the-stilled-trusting-soul [NT]           sort 25253
--   psalm-131-let-israel-hope-in-yahuah-the-two-house-call [NT + Tanakh] sort 25256
-- ---------------------------------------------------------------------------

CREATE TEMP VIEW _s302_ps131_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- v.1 — the lowly covenant heart
    ('canon','psalms',131,1,'canon','matthew',11,29,'free',
     E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* (Matthew 11:29) David''s confession — *Yahuah (LORD), my heart is not haughty, nor mine eyes lofty: neither do I exercise myself in great matters, or in things too high for me* (Psalm 131:1) — is the very posture the Formed Son takes upon himself and calls his people into; the *meek and lowly in heart* is the weaned heart of this Psalm, and the *rest unto your souls* is the stilled soul of the next verse.'),
    ('canon','psalms',131,1,'canon','romans',12,3,'free',
     E'*For I say, through the grace given unto me, to every man that is among you, not to think of himself more highly than he ought to think; but to think soberly, according as Elohim (God) hath dealt to every man the measure of faith.* (Romans 12:3) Sha''ul presses the same lowliness — *my heart is not haughty, nor mine eyes lofty* (Psalm 131:1) — onto the gathered body: not to reach above the measure given, but to think soberly under Yahuah.'),
    ('canon','psalms',131,1,'canon','romans',12,16,'free',
     E'*Be of the same mind one toward another. Mind not high things, but condescend to men of low estate. Be not wise in your own conceits.* (Romans 12:16) *Mind not high things* is Psalm 131:1 verbatim in the apostolic key — *neither do I exercise myself in great matters, or in things too high for me*; the covenant heart stoops to the low estate rather than climbing.'),
    ('canon','psalms',131,1,'canon','proverbs',3,5,'free',
     E'*Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* (Proverbs 3:5) The wisdom of the fathers is the root of David''s song: to refuse *things too high for me* (Psalm 131:1) is to *lean not unto thine own understanding* — the heart that trusts rather than over-reaches.'),
    ('canon','psalms',131,1,'canon','proverbs',3,7,'free',
     E'*Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil.* (Proverbs 3:7) David''s *nor mine eyes lofty* (Psalm 131:1) is the lived form of this charge — eyes lowered, not *wise in thine own eyes*, the fear of Yahuah that turns from the proud heart.'),
    ('canon','psalms',131,1,'canon','james',4,6,'free',
     E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6) The whole canon weighs the proud against the humble, and Psalm 131:1 — *my heart is not haughty* — stands on the side grace is given to: Yahuah resists the lofty eye and bends to the lowly.'),
    ('canon','psalms',131,1,'canon','1-peter',5,5,'free',
     E'*Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* (1 Peter 5:5) Kepha clothes the flock in the garment of Psalm 131 — *my heart is not haughty, nor mine eyes lofty* (Psalm 131:1) — the humility Yahuah crowns with grace.'),
    -- v.2 — the weaned, stilled, trusting soul
    ('canon','psalms',131,2,'canon','matthew',18,3,'free',
     E'*And said, Verily I say unto you, Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven.* (Matthew 18:3) David has already become what the Formed Son commands — *my soul is even as a weaned child* (Psalm 131:2); the weaned, quieted soul IS the little-child heart without which none enters the kingdom.'),
    ('canon','psalms',131,2,'canon','matthew',18,4,'free',
     E'*Whosoever therefore shall humble himself as this little child, the same is greatest in the kingdom of heaven.* (Matthew 18:4) *Surely I have behaved and quieted myself, as a child that is weaned of his mother* (Psalm 131:2) — the greatness of the kingdom is measured downward, in the stilled child-soul David here describes.'),
    ('canon','psalms',131,2,'canon','mark',10,15,'free',
     E'*Verily I say unto you, Whosoever shall not receive the kingdom of Elohim (God) as a little child, he shall not enter therein.* (Mark 10:15) To *receive the kingdom... as a little child* is to come with the quieted, trusting soul of Psalm 131:2 — *my soul is even as a weaned child* — emptied of grasping, resting wholly on the Father.'),
    -- v.3 — let Yashar'el hope: the two-house restoration call
    ('canon','psalms',131,3,'canon','psalms',130,7,'free',
     E'*Let Yashar''el (Israel) hope in Yahuah (LORD): for with Yahuah (LORD) there is mercy, and with him is plenteous redemption.* (Psalm 130:7) The Song of Ascents before this one closes with the very words David repeats — *Let Yashar''el (Israel) hope in Yahuah (LORD) from henceforth and for ever* (Psalm 131:3); the stilled personal soul widens into the hope of the whole house, grounded in Yahuah''s mercy and plenteous redemption.'),
    ('canon','psalms',131,3,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) David bids *Yashar''el (Israel) hope in Yahuah... from henceforth and for ever* (Psalm 131:3) precisely because Yahuah has not cast away his people; the hope is restoration, not replacement.'),
    ('canon','psalms',131,3,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel), saying,* (Romans 11:2) The everlasting hope of Psalm 131:3 — *from henceforth and for ever* — rests on the foreknown, uncast-away people; the two-house call to hope is anchored in Yahuah''s unbroken covenant, never in any new people grafted in to displace them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps131_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps131_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. cross_reference_threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-131-not-haughty-the-lowly-covenant-heart',
       E'Not Haughty, Nor Mine Eyes Lofty — the Lowly Covenant Heart',
       E'David opens his short Song of Ascents with a confession that runs against the grain of the proud heart: *Yahuah (LORD), my heart is not haughty, nor mine eyes lofty: neither do I exercise myself in great matters, or in things too high for me* (Psalm 131:1). This is not false modesty but the covenant posture — the heart that refuses to climb above the measure Yahuah has given.\n\nThe wisdom of the fathers is its root: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5), and *Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7). David''s lowered eyes are exactly the eyes *not wise in their own sight*.\n\nThe Formed Son takes this same heart upon himself and calls his people into it: *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). Sha''ul presses it onto the gathered body — *not to think of himself more highly than he ought to think; but to think soberly* (Romans 12:3) and *Mind not high things, but condescend to men of low estate* (Romans 12:16), where *mind not high things* is Psalm 131:1 in the apostolic key. And the whole canon weighs the proud against the humble: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), echoed in *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The lowly heart of Psalm 131 is the one Yahuah crowns with grace.',
       sv.verse_id, ev.verse_id, 'free', 25250
  FROM _s302_ps131_lookup sv, _s302_ps131_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=131 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-131-as-a-weaned-child-the-stilled-trusting-soul',
       E'As a Weaned Child — the Stilled, Trusting Soul',
       E'The heart of the Psalm is one image: *Surely I have behaved and quieted myself, as a child that is weaned of his mother: my soul is even as a weaned child* (Psalm 131:2). The weaned child no longer cries for the breast — it has learned to rest near the mother for her own sake, content and quieted. So David has stilled his soul before Yahuah, not grasping, simply resting.\n\nThis is precisely the heart the Formed Son sets as the door of the kingdom: *Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven* (Matthew 18:3), and *Whosoever therefore shall humble himself as this little child, the same is greatest in the kingdom of heaven* (Matthew 18:4). The greatness of the kingdom is measured downward, in the stilled child-soul. *Whosoever shall not receive the kingdom of Elohim (God) as a little child, he shall not enter therein* (Mark 10:15) — and to receive it so is to come with the quieted, weaned soul of Psalm 131:2, emptied of grasping, resting wholly on the Father.',
       sv.verse_id, ev.verse_id, 'free', 25253
  FROM _s302_ps131_lookup sv, _s302_ps131_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=131 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-131-let-israel-hope-in-yahuah-the-two-house-call',
       E'Let Yashar''el Hope in Yahuah — the Two-House Call from Henceforth and For Ever',
       E'The Psalm does not stay personal. The stilled, weaned soul widens into a call to the whole people: *Let Yashar''el (Israel) hope in Yahuah (LORD) from henceforth and for ever* (Psalm 131:3). These are the very words that close the Song of Ascents just before it: *Let Yashar''el (Israel) hope in Yahuah (LORD): for with Yahuah (LORD) there is mercy, and with him is plenteous redemption* (Psalm 130:7). The lateral echo binds the two Ascents: the humbled individual heart becomes the posture of the gathered house, and its ground is Yahuah''s mercy and plenteous redemption.\n\nThat hope reaches *from henceforth and for ever* because Yahuah has not cast off his people. *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1), and *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The everlasting hope of Psalm 131:3 is restoration, never replacement — anchored in Yahuah''s unbroken covenant with Yashar''el, never in any new people grafted in to displace the foreknown house.',
       sv.verse_id, ev.verse_id, 'free', 25256
  FROM _s302_ps131_lookup sv, _s302_ps131_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=131 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. cross_reference_thread_members =====================
-- Thread 1: psalm-131-not-haughty-the-lowly-covenant-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart* (Matthew 11:29) — the Formed Son embodies and commands the very lowliness of *my heart is not haughty* (Psalm 131:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Not to think of himself more highly than he ought to think; but to think soberly* (Romans 12:3) — Psalm 131:1''s un-haughty heart pressed onto the gathered body.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Mind not high things, but condescend to men of low estate* (Romans 12:16) — Psalm 131:1''s *things too high for me* in the apostolic key.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5) — the wisdom-root of refusing *things too high for me*.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Be not wise in thine own eyes: fear Yahuah (LORD), and depart from evil* (Proverbs 3:7) — the lived form of *nor mine eyes lofty* (Psalm 131:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — the lowly heart of Psalm 131:1 stands on the side grace is given to.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5) — Psalm 131''s lowliness as the garment Yahuah crowns with grace.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=1
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-not-haughty-the-lowly-covenant-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: psalm-131-as-a-weaned-child-the-stilled-trusting-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven* (Matthew 18:3) — the weaned soul of Psalm 131:2 IS the little-child heart of entry.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=2
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-as-a-weaned-child-the-stilled-trusting-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Whosoever therefore shall humble himself as this little child, the same is greatest in the kingdom of heaven* (Matthew 18:4) — greatness measured downward into the stilled child-soul of Psalm 131:2.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=2
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-as-a-weaned-child-the-stilled-trusting-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whosoever shall not receive the kingdom of Elohim (God) as a little child, he shall not enter therein* (Mark 10:15) — to receive it so is to come with the quieted, weaned soul of Psalm 131:2.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=2
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-as-a-weaned-child-the-stilled-trusting-soul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: psalm-131-let-israel-hope-in-yahuah-the-two-house-call
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Let Yashar''el (Israel) hope in Yahuah (LORD): for with Yahuah (LORD) there is mercy, and with him is plenteous redemption* (Psalm 130:7) — the twin Ascent close; lateral echo binding the gathered house''s hope to Yahuah''s mercy.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=3
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-let-israel-hope-in-yahuah-the-two-house-call'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the everlasting hope of Psalm 131:3 rests on Yahuah''s uncast-away people.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=3
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-let-israel-hope-in-yahuah-the-two-house-call'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — *from henceforth and for ever* (Psalm 131:3) is restoration of the foreknown house, never replacement.'
  FROM cross_reference_threads t
  JOIN _s302_ps131_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=131 AND sv.verse_number=3
  JOIN _s302_ps131_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-131-let-israel-hope-in-yahuah-the-two-house-call'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s302_ps131_lookup;
