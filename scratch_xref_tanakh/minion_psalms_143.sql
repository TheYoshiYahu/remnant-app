-- ----- fragment: minion_psalms_143.sql (Psalm 143) -----
-- Chapter: Psalm 143 (David's penitential prayer — "Hear my prayer, O Yahuah"; last of the seven penitential psalms)
-- Tag: ps143   Session prefix: s302   Sort band base: 25550   Temp view: _s302_ps143_lookup
-- Slug prefix: psalm-143-  (SINGULAR; verse-lookup book_slug stays PLURAL 'psalms')
--
-- THREADS (5):
--   psalm-143-no-man-living-justified-flesh-merit-excluded-not-the-torah     [Tanakh + NT]  vv.1-2  ★★ FRAMEWORK
--   psalm-143-i-remember-the-days-of-old-i-meditate-on-all-thy-works         [Tanakh]       v.5
--   psalm-143-my-soul-thirsteth-after-thee-as-a-thirsty-land                 [Tanakh + NT]  v.6
--   psalm-143-teach-me-to-do-thy-will-the-good-spirit-and-the-torah-on-the-heart [Tanakh + NT] vv.8-10 ★ new-covenant heart
--   psalm-143-quicken-me-bring-my-soul-out-of-trouble                        [Tanakh]       vv.11-12
--
-- Per-chapter coverage checklist:
--   v.1  hear my prayer; in thy faithfulness and righteousness answer me
--        NT:     none warranted (the appeal to Yahuah's righteousness opens the v.1-2 thread)
--        Extras: none warranted
--        Tanakh: Ps 130:2 echo too thin to thread alone (folded; Ps 130:3 carried in v.2 thread)
--   v.2  enter not into judgment with thy servant; no man living justified  ★★ FRAMEWORK
--        NT:     Rom 3:20 (by the deeds of the law no flesh justified); Rom 3:31 (we establish the law); Gal 2:16  [THREADED]
--        Extras: none warranted (canon chain carries the doctrine; no clean extra adds weight)
--        Tanakh: Ps 130:3 (if thou mark iniquities who shall stand); Job 9:2; Job 25:4; Eccl 7:20; Gen 26:5 (the justified-by-faith Abraham KEPT the commandments)  [THREADED]
--   vv.3-4  the enemy persecuted my soul; my spirit overwhelmed, heart desolate
--        NT:     none warranted (lament; no member adds framework weight)
--        Extras: none warranted
--        Tanakh: none warranted (held inside the prayer's prose; Ps 142:3 spirit-overwhelmed folded to vv.11-12 thread)
--   v.5  I remember the days of old; I meditate on all thy works
--        NT:     none warranted (the cure of remembering is an OT-internal discipline here)
--        Extras: none warranted
--        Tanakh: Ps 77:11 (I will remember the works of Yahuah)  [THREADED]
--   v.6  I stretch forth my hands; my soul thirsteth after thee as a thirsty land
--        NT:     John 7:37 (if any man thirst, let him come unto me, and drink)  [THREADED]
--        Extras: none warranted (clean Tanakh+NT thirst chain carries it)
--        Tanakh: Ps 42:1 (the hart panteth); Ps 42:2 (my soul thirsteth for Elohim); Ps 63:1 (my soul thirsteth... in a dry and thirsty land)  [THREADED]
--   vv.7-8  hide not thy face; cause me to know the way wherein I should walk
--        NT:     none warranted (folded into the teach-me-to-do-thy-will thread)
--        Extras: none warranted
--        Tanakh: Ps 25:4 (shew me thy ways); Ps 25:5 (lead me in thy truth); Ps 32:8 (I will teach thee in the way)  [THREADED with vv.9-10]
--   vv.9-10 teach me to do thy will; thy spirit is good; lead me into the land of uprightness  ★ NEW-COVENANT HEART
--        NT:     none warranted (Ezek/Jer carry the Spirit-and-Torah; NT fulfilment folded in prose)
--        Extras: none warranted (Ezek 36:27 + Jer 31:33 are the load-bearing witnesses)
--        Tanakh: Ezek 36:27 (cause you to walk in my statutes); Jer 31:33 (my law in their inward parts); Ps 119:35 (make me to go in the path of thy commandments); Neh 9:20 (thy good spirit to instruct them)  [THREADED]
--   vv.11-12 quicken me for thy name's sake; bring my soul out of trouble; cut off mine enemies
--        NT:     none warranted (resurrection-deliverance kept inside OT frame)
--        Extras: none warranted
--        Tanakh: Ps 142:7 (bring my soul out of prison, that I may praise thy name)  [THREADED]
--
-- Framework notes:
--   * vv.1-2 is the LOAD-BEARING, CONTESTED verse. *And enter not into judgment with thy servant:
--     for in thy sight shall no man living be justified* (Psalm 143:2) is the line Paul echoes at
--     Rom 3:20 (*by the deeds of the law there shall no flesh be justified in his sight*) and Gal 2:16.
--     FRAMED CAREFULLY: this excludes FLESH-MERIT / self-justification before Yahuah's holiness — no
--     man can stand on his own account in judgment (Ps 130:3 *if thou mark iniquities... who shall
--     stand?*; Job 9:2; Job 25:4; Eccl 7:20 *there is not a just man upon earth, that... sinneth not*).
--     It does NOT abolish the Torah: Paul's very next breath is *we establish the law* (Rom 3:31), and
--     the same psalm prays *teach me to do thy will* (v.10). The Abraham justified by faith is the one
--     who *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Gen 26:5) —
--     faith and obedience one cloth, the flesh's merit excluded but the covenant instruction kept.
--   * vv.9-10 the NEW-COVENANT heart: *teach me to do thy will... thy spirit is good; lead me into the
--     land of uprightness* (Psalm 143:10) is the Torah written on the heart and walked by the good
--     Spirit — *I will put my spirit within you, and cause you to walk in my statutes* (Ezek 36:27);
--     *I will put my law in their inward parts, and write it in their hearts* (Jer 31:33). The Spirit
--     and the Torah are inseparable; the same prayer that confesses no flesh is justified (v.2) asks to
--     be TAUGHT TO DO the will (v.10) — the answer to the confession, not its contradiction.

CREATE TEMP VIEW _s302_ps143_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== C: cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- vv.1-2 no man living justified — flesh-merit excluded, NOT the Torah abolished
    ('canon','psalms',143,2,'canon','psalms',130,3,'free',
     E'*If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand?* (Psalm 130:3). This is exactly David''s plea: *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). If Yahuah weighed the iniquity of any man on his own account, none could stand — the confession is of the creature''s need, not a charge against the covenant.'),
    ('canon','psalms',143,2,'canon','job',9,2,'free',
     E'*I know it is so of a truth: but how should man be just with Elohim (God)?* (Job 9:2). Job asks what David confesses — *in thy sight shall no man living be justified* (Psalm 143:2). No man can be reckoned just with Elohim on the strength of his own flesh; the holiness of Yahuah overwhelms every self-account.'),
    ('canon','psalms',143,2,'canon','job',25,4,'free',
     E'*How then can man be justified with Elohim (God)? or how can he be clean that is born of a woman?* (Job 25:4). The same question stands behind *no man living be justified* (Psalm 143:2) — none born of woman can stand clean before the Most High by his own merit; the standing must be given, not earned.'),
    ('canon','psalms',143,2,'canon','ecclesiastes',7,20,'free',
     E'*For there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20). David''s *no man living be justified* (Psalm 143:2) is this plain truth in prayer — there is not one upon earth who does good and never sins, so no man may enter judgment on his own righteousness.'),
    ('canon','psalms',143,2,'canon','romans',3,20,'free',
     E'*Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). Paul echoes David almost word for word — *no flesh be justified in his sight* answers *in thy sight shall no man living be justified* (Psalm 143:2). The point is the exclusion of FLESH-MERIT before Yahuah''s holiness: the law gives the knowledge of sin, stripping every self-justification — it is not a charge that the law itself is undone.'),
    ('canon','psalms',143,2,'canon','romans',3,31,'free',
     E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). Paul''s very next breath after excluding flesh-merit guards the frame: faith does NOT void the Torah but ESTABLISHES it. So David''s *no man living be justified* (Psalm 143:2) condemns self-righteousness, not the commandment — the same psalm prays *teach me to do thy will* (Psalm 143:10).'),
    ('canon','psalms',143,2,'canon','galatians',2,16,'free',
     E'*Knowing that a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ)... for by the works of the law shall no flesh be justified* (Galatians 2:16). Paul again says what David prays — *no flesh be justified* by the law''s works as a ground of merit, just as *no man living be justified* (Psalm 143:2). A man cannot earn his standing; he receives it by faith — the faith that then keeps the commandments.'),
    ('canon','psalms',143,2,'canon','genesis',26,5,'free',
     E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). The Abraham reckoned righteous by faith is the very man who *obeyed my voice, and kept my charge, my commandments*. So David''s confession that *no man living be justified* (Psalm 143:2) by his own merit stands beside obedient faith, not against it — the flesh''s boast excluded, the covenant kept.'),

    -- v.5 I remember the days of old; I meditate on all thy works
    ('canon','psalms',143,5,'canon','psalms',77,11,'free',
     E'*I will remember the works of Yahuah (LORD): surely I will remember thy wonders of old* (Psalm 77:11). This is the same cure David reaches for in the dark: *I remember the days of old; I meditate on all thy works; I muse on the work of thy hands* (Psalm 143:5). When the spirit is overwhelmed, the soul turns deliberately to remember the wonders of old — the works of Yahuah are the steadying ground.'),

    -- v.6 I stretch forth my hands; my soul thirsteth after thee as a thirsty land
    ('canon','psalms',143,6,'canon','psalms',42,1,'free',
     E'*As the hart panteth after the water brooks, so panteth my soul after thee, O Elohim (God)* (Psalm 42:1). David''s *my soul thirsteth after thee, as a thirsty land* (Psalm 143:6) is the same longing — the panting hart, the soul reaching for Yahuah as the parched ground reaches for rain.'),
    ('canon','psalms',143,6,'canon','psalms',42,2,'free',
     E'*My soul thirsteth for Elohim (God), for the living Elohim (God): when shall I come and appear before Elohim (God)?* (Psalm 42:2). The thirst of *my soul thirsteth after thee, as a thirsty land* (Psalm 143:6) is for the living Elohim Himself — not relief only, but His presence, to come and appear before Him.'),
    ('canon','psalms',143,6,'canon','psalms',63,1,'free',
     E'*O Elohim (God), thou art my Elohim (God); early will I seek thee: my soul thirsteth for thee, my flesh longeth for thee in a dry and thirsty land, where no water is* (Psalm 63:1). The very image of *my soul thirsteth after thee, as a thirsty land* (Psalm 143:6) — soul and flesh longing in the dry and thirsty land where no water is, the seeking turned toward Yahuah alone.'),
    ('canon','psalms',143,6,'canon','john',7,37,'free',
     E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). The Formed Son answers the thirst David prays — *my soul thirsteth after thee, as a thirsty land* (Psalm 143:6). The thirsty land is invited to come and drink; the longing of the psalm finds its water in him.'),

    -- vv.8-10 teach me to do thy will; the good Spirit and the Torah on the heart
    ('canon','psalms',143,8,'canon','psalms',25,4,'free',
     E'*Shew me thy ways, O Yahuah (LORD); teach me thy paths* (Psalm 25:4). David''s *cause me to know the way wherein I should walk* (Psalm 143:8) is this same prayer — to be shown the ways of Yahuah and taught His paths, the walk learned from Him, not invented.'),
    ('canon','psalms',143,8,'canon','psalms',25,5,'free',
     E'*Lead me in thy truth, and teach me: for thou art the Elohim (God) of my salvation; on thee do I wait all the day* (Psalm 25:5). To be led in His truth and taught is the substance of *cause me to know the way wherein I should walk* (Psalm 143:8) — the soul lifted up to Yahuah, waiting on Him to teach the way.'),
    ('canon','psalms',143,8,'canon','psalms',32,8,'free',
     E'*I will instruct thee and teach thee in the way which thou shalt go: I will guide thee with mine eye* (Psalm 32:8). Yahuah''s own answer to *cause me to know the way wherein I should walk* (Psalm 143:8): He promises to instruct and teach and guide in the way to go.'),
    ('canon','psalms',143,10,'canon','psalms',119,35,'free',
     E'*Make me to go in the path of thy commandments; for therein do I delight* (Psalm 119:35). *Teach me to do thy will* (Psalm 143:10) is this very plea — the will of Yahuah is the path of His commandments, and the taught heart delights to be made to go in it.'),
    ('canon','psalms',143,10,'canon','ezekiel',36,27,'free',
     E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). This is the answer to *teach me to do thy will... thy spirit is good* (Psalm 143:10): the good Spirit put within causes the man to WALK in the statutes and DO them — Spirit and Torah inseparable, the will done from the heart.'),
    ('canon','psalms',143,10,'canon','jeremiah',31,33,'free',
     E'*I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). *Teach me to do thy will* (Psalm 143:10) prays for what the new covenant gives — the law written in the inward parts, the will of Yahuah become the desire of the heart, not Torah replaced but Torah within.'),
    ('canon','psalms',143,10,'canon','nehemiah',9,20,'free',
     E'*Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst* (Nehemiah 9:20). *Thy spirit is good; lead me into the land of uprightness* (Psalm 143:10) names the same gift — Yahuah''s GOOD Spirit given to instruct His people, leading and feeding them in the way.'),

    -- vv.11-12 quicken me; bring my soul out of trouble
    ('canon','psalms',143,11,'canon','psalms',142,7,'free',
     E'*Bring my soul out of prison, that I may praise thy name: the righteous shall compass me about; for thou shalt deal bountifully with me* (Psalm 142:7). The companion prayer to *quicken me, O Yahuah, for thy name''s sake: for thy righteousness'' sake bring my soul out of trouble* (Psalm 143:11) — the soul brought out of prison and out of trouble, for the sake of His name, that it may live to praise Him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== D: threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-143-no-man-living-justified-flesh-merit-excluded-not-the-torah',
       E'No man living justified — flesh-merit excluded, not the Torah',
       E'David opens his prayer on the ground of Yahuah''s own righteousness, not his: *Hear my prayer, O Yahuah; give ear to my supplications: in thy faithfulness answer me, and in thy righteousness. And enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:1-2). No man can stand in judgment on his own account — *if thou, Yahuah, shouldest mark iniquities, O Yahuah, who shall stand?* (Psalm 130:3); *how should man be just with Elohim?* (Job 9:2); *how then can man be justified with Elohim? or how can he be clean that is born of a woman?* (Job 25:4); *there is not a just man upon earth, that doeth good, and sinneth not* (Ecclesiastes 7:20). Paul echoes this very verse to exclude FLESH-MERIT before Yahuah''s holiness: *by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20); *by the works of the law shall no flesh be justified* (Galatians 2:16). But read what Paul guards in the same breath — *do we then make void the law through faith? Elohim forbid: yea, we establish the law* (Romans 3:31). The confession that no flesh earns its standing does NOT abolish the Torah; it strips self-righteousness so the standing may be received by faith. And the faith that receives it is obedient faith: the Abraham reckoned righteous is the man who *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). The proof is this same psalm — the soul that confesses *no man living be justified* (v.2) goes on to pray *teach me to do thy will* (v.10). The flesh''s boast excluded; the covenant kept.',
       sv.verse_id, ev.verse_id, 'free', 25550
  FROM _s302_ps143_lookup sv, _s302_ps143_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=143 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-143-i-remember-the-days-of-old-i-meditate-on-all-thy-works',
       E'I remember the days of old — I meditate on all thy works',
       E'With his spirit overwhelmed and his heart desolate (Psalm 143:3-4), David does not sink into the dark — he turns deliberately to remember: *I remember the days of old; I meditate on all thy works; I muse on the work of thy hands* (Psalm 143:5). This is the same discipline he set for himself in another dark night: *I will remember the works of Yahuah: surely I will remember thy wonders of old* (Psalm 77:11). The cure for the desolate heart is not to forget but to remember — to muse on what the hands of Yahuah have already done, and so to find again the ground to ask Him to act now.',
       sv.verse_id, ev.verse_id, 'free', 25551
  FROM _s302_ps143_lookup sv, _s302_ps143_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=143 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-143-my-soul-thirsteth-after-thee-as-a-thirsty-land',
       E'My soul thirsteth after thee, as a thirsty land',
       E'*I stretch forth my hands unto thee: my soul thirsteth after thee, as a thirsty land* (Psalm 143:6). It is David''s recurring image of the soul reaching for Yahuah like parched ground for rain: *as the hart panteth after the water brooks, so panteth my soul after thee, O Elohim... my soul thirsteth for Elohim, for the living Elohim* (Psalm 42:1-2); *my soul thirsteth for thee, my flesh longeth for thee in a dry and thirsty land, where no water is* (Psalm 63:1). The longing is for the living Elohim Himself, not relief only. And the Formed Son answers the thirst across the testaments: *in the last day, that great day of the feast, Yahusha stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). The thirsty land of the psalm is invited to come and drink — the prayer''s longing finds its water in him.',
       sv.verse_id, ev.verse_id, 'free', 25552
  FROM _s302_ps143_lookup sv, _s302_ps143_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=143 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-143-teach-me-to-do-thy-will-the-good-spirit-and-the-torah-on-the-heart',
       E'Teach me to do thy will — the good Spirit and the Torah on the heart',
       E'David asks not merely to know the way but to be made to DO the will: *cause me to know the way wherein I should walk; for I lift up my soul unto thee* (Psalm 143:8); *teach me to do thy will; for thou art my Elohim: thy spirit is good; lead me into the land of uprightness* (Psalm 143:10). The asking for the way is his constant prayer — *shew me thy ways, O Yahuah; teach me thy paths. Lead me in thy truth, and teach me* (Psalm 25:4-5) — and Yahuah''s own answer: *I will instruct thee and teach thee in the way which thou shalt go* (Psalm 32:8). But the will of Yahuah is no vague impulse; it is the path of His commandments — *make me to go in the path of thy commandments; for therein do I delight* (Psalm 119:35). And the Spirit that leads is the very Spirit that writes the Torah on the heart: *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); *thou gavest also thy good spirit to instruct them* (Nehemiah 9:20). The Spirit and the Torah are one cloth — *thy spirit is good* leads into *the land of uprightness*, the will of Yahuah taught and done from a heart it is written on. This is the same psalm that confessed *no man living be justified* (v.2): the soul that knows it cannot earn its standing is the soul that asks to be taught to do the will.',
       sv.verse_id, ev.verse_id, 'free', 25553
  FROM _s302_ps143_lookup sv, _s302_ps143_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=143 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-143-quicken-me-bring-my-soul-out-of-trouble',
       E'Quicken me — bring my soul out of trouble',
       E'The prayer closes by appealing to the name and the righteousness of Yahuah for life and rescue: *quicken me, O Yahuah, for thy name''s sake: for thy righteousness'' sake bring my soul out of trouble* (Psalm 143:11). It is the twin of the prayer just before it: *bring my soul out of prison, that I may praise thy name: the righteous shall compass me about; for thou shalt deal bountifully with me* (Psalm 142:7). The soul brought out of prison, out of trouble, quickened to life — and all of it *for thy name''s sake*, that the rescued one may live to praise the Name. Deliverance is asked not as the servant''s due but on the ground of Yahuah''s own faithfulness and righteousness, the same ground the psalm opened on.',
       sv.verse_id, ev.verse_id, 'free', 25554
  FROM _s302_ps143_lookup sv, _s302_ps143_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=143 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: no man living justified (vv.1-2)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (143,2,'canon','psalms',130,3,1,E'Psalm 130:3 — *if thou, Yahuah, shouldest mark iniquities... who shall stand?*: none can stand on his own account in judgment.'),
    (143,2,'canon','job',9,2,2,E'Job 9:2 — *how should man be just with Elohim?*: the creature cannot be reckoned just by his own flesh.'),
    (143,2,'canon','job',25,4,3,E'Job 25:4 — *how can he be clean that is born of a woman?*: no man born of woman stands clean by his own merit.'),
    (143,2,'canon','ecclesiastes',7,20,4,E'Ecclesiastes 7:20 — *there is not a just man upon earth... that sinneth not*: the plain truth David prays.'),
    (143,2,'canon','romans',3,20,5,E'Romans 3:20 — *no flesh be justified in his sight*: Paul echoes the verse to exclude flesh-merit, not the Torah.'),
    (143,2,'canon','romans',3,31,6,E'Romans 3:31 — *we establish the law*: the guard — faith does not void the Torah, it confirms it.'),
    (143,2,'canon','galatians',2,16,7,E'Galatians 2:16 — *by the works of the law shall no flesh be justified*: standing received by faith, not earned.'),
    (143,2,'canon','genesis',26,5,8,E'Genesis 26:5 — *Abraham... kept my charge, my commandments, my statutes, and my laws*: the justified-by-faith man keeps the covenant.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=m.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-143-no-man-living-justified-flesh-merit-excluded-not-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: I remember the days of old (v.5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (143,5,'canon','psalms',77,11,1,E'Psalm 77:11 — *I will remember the works of Yahuah... thy wonders of old*: the same cure of deliberate remembering in the dark.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=m.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-143-i-remember-the-days-of-old-i-meditate-on-all-thy-works'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: my soul thirsteth as a thirsty land (v.6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (143,6,'canon','psalms',42,1,1,E'Psalm 42:1 — *as the hart panteth after the water brooks, so panteth my soul after thee*: the same longing of the parched soul.'),
    (143,6,'canon','psalms',42,2,2,E'Psalm 42:2 — *my soul thirsteth for Elohim, for the living Elohim*: the thirst is for the living Elohim Himself.'),
    (143,6,'canon','psalms',63,1,3,E'Psalm 63:1 — *my soul thirsteth for thee... in a dry and thirsty land, where no water is*: the very image of Psalm 143:6.'),
    (143,6,'canon','john',7,37,4,E'John 7:37 — *if any man thirst, let him come unto me, and drink*: the Formed Son answers the thirst, the dry land invited to drink.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=m.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-143-my-soul-thirsteth-after-thee-as-a-thirsty-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: teach me to do thy will — the good Spirit and the Torah on the heart (vv.8-10)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (143,8,'canon','psalms',25,4,1,E'Psalm 25:4 — *shew me thy ways, O Yahuah; teach me thy paths*: the walk learned from Yahuah, the same plea.'),
    (143,8,'canon','psalms',25,5,2,E'Psalm 25:5 — *lead me in thy truth, and teach me*: led and taught the way wherein to walk.'),
    (143,8,'canon','psalms',32,8,3,E'Psalm 32:8 — *I will instruct thee and teach thee in the way which thou shalt go*: Yahuah''s own answer to the asking.'),
    (143,10,'canon','psalms',119,35,4,E'Psalm 119:35 — *make me to go in the path of thy commandments*: the will of Yahuah IS the path of His commandments.'),
    (143,10,'canon','ezekiel',36,27,5,E'Ezekiel 36:27 — *my spirit within you... cause you to walk in my statutes... and do them*: the good Spirit makes the man DO the will.'),
    (143,10,'canon','jeremiah',31,33,6,E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts*: Torah within, not Torah replaced.'),
    (143,10,'canon','nehemiah',9,20,7,E'Nehemiah 9:20 — *thou gavest also thy good spirit to instruct them*: the GOOD Spirit given to teach the way.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=m.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-143-teach-me-to-do-thy-will-the-good-spirit-and-the-torah-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: quicken me, bring my soul out of trouble (vv.11-12)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (143,11,'canon','psalms',142,7,1,E'Psalm 142:7 — *bring my soul out of prison, that I may praise thy name*: the twin prayer, the soul rescued for the sake of the Name.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps143_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=143 AND sv.verse_number=m.src_v
  JOIN _s302_ps143_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-143-quicken-me-bring-my-soul-out-of-trouble'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
