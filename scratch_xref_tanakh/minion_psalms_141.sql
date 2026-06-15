-- ----- fragment: minion_psalms_141.sql (Psalm 141) -----
-- Chapter: Psalm 141 (David's evening prayer — "Let my prayer be set forth before thee as incense")
-- Tag: ps141   Session prefix: s302   Sort band base: 25500   Temp view: _s302_ps141_lookup
-- Slug prefix: psalm-141-  (SINGULAR; verse-lookup book_slug stays PLURAL 'psalms')
--
-- THREADS (4):
--   psalm-141-let-my-prayer-be-set-forth-as-incense-and-the-evening-sacrifice  [Tanakh + NT]  vv.1-2
--   psalm-141-set-a-watch-before-my-mouth-and-the-table-of-the-wicked-refused  [Tanakh + NT]  vv.3-4
--   psalm-141-let-the-righteous-smite-me-the-wounds-of-a-friend                [Tanakh + NT]  v.5
--   psalm-141-mine-eyes-are-unto-thee-and-the-wicked-fall-into-their-own-nets  [Tanakh + NT]  vv.8-10
--
-- Per-chapter coverage checklist:
--   v.1  cry unto thee / make haste
--        NT:     none warranted (folded into the prayer-as-incense thread opener)
--        Extras: none warranted
--        Tanakh: none warranted (Ps 70:1 make-haste echo too thin to thread)
--   v.2  prayer as incense; lifting of hands as the evening sacrifice  ★ FRAMEWORK
--        NT:     Rev 5:8 (golden vials of odours = prayers of saints); Rev 8:3-4 (incense + prayers ascend); 1 Tim 2:8 (lift holy hands)  [THREADED]
--        Extras: none warranted (clean Tanakh+NT chain carries it)
--        Tanakh: Exod 30:7-8 (the incense altar, perpetual); Exod 29:38-39 (the evening lamb, tamid); Mal 1:11 (pure incense among the nations)  [THREADED]
--   v.3  set a watch before my mouth; keep the door of my lips
--        NT:     Jas 3:5-6 (the tongue a little fire)  [THREADED]
--        Extras: none warranted (Sir 28 tongue material thin/duplicative)
--        Tanakh: Ps 39:1 (bridle the mouth); Prov 13:3 (he that keepeth his mouth)  [THREADED]
--   v.4  incline not my heart to evil; let me not eat of their dainties
--        NT:     none warranted (Dan typology folded in)
--        Extras: none warranted
--        Tanakh: Prov 23:6 (eat not the bread of an evil eye); Dan 1:8 (would not defile himself with the king's meat)  [THREADED]
--   v.5  let the righteous smite me; an excellent oil  ★ receivable rebuke
--        NT:     Heb 12:5-6, 12:11 (the chastening of Yahuah, peaceable fruit)  [THREADED]
--        Extras: none warranted
--        Tanakh: Prov 27:6 (faithful are the wounds of a friend); Prov 9:8 (rebuke a wise man and he will love thee)  [THREADED]
--   vv.6-7  judges overthrown / bones scattered at the grave's mouth
--        NT:     none warranted
--        Extras: none warranted (Sheol imagery; no clean witness adds framework weight)
--        Tanakh: none warranted (kept inside the closing thread's prose, no separate member)
--   v.8  mine eyes are unto thee; leave not my soul destitute  ★
--        NT:     none warranted (Gal 6:7 carries the recoil in v.10)
--        Extras: none warranted
--        Tanakh: Ps 25:15 (mine eyes are ever toward Yahuah)  [THREADED]
--   v.9  keep me from the snares / gins of the workers of iniquity
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: folded with v.10 (the net imagery)
--   v.10 let the wicked fall into their own nets, whilst I escape  ★ the recoil
--        NT:     Gal 6:7 (whatsoever a man soweth, that shall he also reap)  [THREADED]
--        Extras: none warranted
--        Tanakh: Ps 7:15-16 (made a pit and is fallen into the ditch)  [THREADED]
--
-- Framework notes:
--   * vv.1-2 is the load-bearing verse: David frames his prayer ON the Torah-appointed worship —
--     the incense (Exod 30:7-8) and the evening tamid lamb (Exod 29:38-39). The worship is
--     Torah-SHAPED, not abolished; the NT carries the SAME figure FORWARD — the golden vials/censer
--     of incense ARE the prayers of the saints (Rev 5:8; Rev 8:3-4) and men everywhere lift holy
--     hands (1 Tim 2:8). Mal 1:11 binds the pure incense as a standing, widening worship.
--   * v.4/v.5 frame the anti-antinomian posture: the righteous man REFUSES the wicked's table
--     (Dan 1:8 the type) and RECEIVES the righteous man's rebuke as oil (Prov 27:6; Heb 12 chastening).
--   * vv.8-10 the recoil/sowing-and-reaping law: the snare returns on the snare-setter (Ps 7:15-16;
--     Gal 6:7) — covenant justice, never the psalmist's private vengeance.

CREATE TEMP VIEW _s302_ps141_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== C: cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- vv.1-2 prayer as incense + the evening sacrifice
    ('canon','psalms',141,2,'canon','exodus',30,7,'free',
     E'*And Aaron shall burn thereon sweet incense every morning: when he dresseth the lamps, he shall burn incense upon it* (Exodus 30:7). David''s *let my prayer be set forth before thee as incense* (Psalm 141:2) is not a metaphor cut loose from the Torah — it stands on the appointed incense of the golden altar, the daily-rising worship Yahuah Himself commanded.'),
    ('canon','psalms',141,2,'canon','exodus',30,8,'free',
     E'*And when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations* (Exodus 30:8). The *perpetual incense* at even is exactly the hour David prays — his *prayer set forth as incense* rises with the evening offering, the worship Torah-shaped and ongoing, never abolished.'),
    ('canon','psalms',141,2,'canon','exodus',29,39,'free',
     E'*The one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* (Exodus 29:39). *The lifting up of my hands as the evening sacrifice* (Psalm 141:2) names this tamid — the continual evening lamb — making the psalmist''s lifted hands the appointed offering of the day''s close.'),
    ('canon','psalms',141,2,'canon','malachi',1,11,'free',
     E'*For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering* (Malachi 1:11). The *incense* of David''s prayer (Psalm 141:2) is the figure Malachi widens — a pure, name-honouring incense rising in every place, the worship reaching outward, not undone.'),
    ('canon','psalms',141,2,'canon','1-timothy',2,8,'free',
     E'*I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8). Paul carries David''s *lifting up of my hands as the evening sacrifice* (Psalm 141:2) straight forward — the lifted, holy hands of prayer in every place, the same Torah-rooted posture of offering.'),
    ('canon','psalms',141,2,'canon','revelation',5,8,'free',
     E'*And when he had taken the book, the four beasts and four and twenty elders fell down before the Lamb, having every one of them harps, and golden vials full of odours, which are the prayers of saints* (Revelation 5:8). The *golden vials full of odours* ARE *the prayers of saints* — David''s *prayer set forth as incense* (Psalm 141:2) is shown in heaven as the very thing it figured.'),
    ('canon','psalms',141,2,'canon','revelation',8,3,'free',
     E'*And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne* (Revelation 8:3). The *incense... offered with the prayers of all saints upon the golden altar* fulfils David''s *let my prayer be set forth before thee as incense* (Psalm 141:2) — the incense altar of Exodus 30 standing before the throne.'),
    ('canon','psalms',141,2,'canon','revelation',8,4,'free',
     E'*And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel''s hand* (Revelation 8:4). The smoke of incense *ascended up... with the prayers of the saints* — the upward-rising answer to *let my prayer be set forth before thee as incense* (Psalm 141:2).'),

    -- vv.3-4 set a watch before my mouth; the table of the wicked refused
    ('canon','psalms',141,3,'canon','psalms',39,1,'free',
     E'*I said, I will take heed to my ways, that I sin not with my tongue: I will keep my mouth with a bridle, while the wicked is before me* (Psalm 39:1). David''s *set a watch, O Yahuah, before my mouth; keep the door of my lips* (Psalm 141:3) is the same vow — the guarded mouth, the bridled tongue, especially *while the wicked is before me*.'),
    ('canon','psalms',141,3,'canon','proverbs',13,3,'free',
     E'*He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3). The wisdom of *keep the door of my lips* (Psalm 141:3): to keep the mouth is to keep the life; the open, unwatched lips run to ruin.'),
    ('canon','psalms',141,3,'canon','james',3,5,'free',
     E'*Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* (James 3:5). James presses why David asks Yahuah to *keep the door of my lips* (Psalm 141:3) — the small tongue kindles a great fire, so the door must be watched.'),
    ('canon','psalms',141,3,'canon','james',3,6,'free',
     E'*And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). The unguarded tongue is *a fire, a world of iniquity* — the very danger behind *set a watch, O Yahuah, before my mouth* (Psalm 141:3).'),
    ('canon','psalms',141,4,'canon','proverbs',23,6,'free',
     E'*Eat thou not the bread of him that hath an evil eye, neither desire thou his dainty meats* (Proverbs 23:6). David''s *let me not eat of their dainties* (Psalm 141:4) is this proverb prayed — the dainty meats of the wicked refused, the table of the evil-eyed declined.'),
    ('canon','psalms',141,4,'canon','daniel',1,8,'free',
     E'*But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself* (Daniel 1:8). Daniel lives out *let me not eat of their dainties* (Psalm 141:4) — purposing in his heart to refuse the king''s dainties rather than be defiled by the table of the world.'),

    -- v.5 let the righteous smite me; the wounds of a friend
    ('canon','psalms',141,5,'canon','proverbs',27,6,'free',
     E'*Faithful are the wounds of a friend; but the kisses of an enemy are deceitful* (Proverbs 27:6). David''s *let the righteous smite me; it shall be a kindness* (Psalm 141:5) is this proverb embraced — the friend''s wound is faithful, an excellent oil, where the enemy''s flattery deceives.'),
    ('canon','psalms',141,5,'canon','proverbs',9,8,'free',
     E'*Reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). *Let him reprove me; it shall be an excellent oil* (Psalm 141:5) marks the wise man, not the scorner — the one who loves the reprover and receives the rebuke as oil.'),
    ('canon','psalms',141,5,'canon','hebrews',12,5,'free',
     E'*And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5). Hebrews quotes the same posture David prays — *despise not the chastening* answers *let the righteous smite me; it shall be a kindness* (Psalm 141:5).'),
    ('canon','psalms',141,5,'canon','hebrews',12,11,'free',
     E'*Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11). The reproof that *shall be an excellent oil* (Psalm 141:5) is this *peaceable fruit of righteousness* — grievous now, healing after, never breaking the head.'),

    -- vv.8-10 mine eyes are unto thee; the wicked fall into their own nets
    ('canon','psalms',141,8,'canon','psalms',25,15,'free',
     E'*Mine eyes are ever toward Yahuah (LORD); for he shall pluck my feet out of the net* (Psalm 25:15). The same fixed gaze: *but mine eyes are unto thee, O GOD Yahuah* (Psalm 141:8) — eyes lifted to the One who plucks the feet free of the snare the wicked have laid.'),
    ('canon','psalms',141,10,'canon','psalms',7,15,'free',
     E'*He made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15). *Let the wicked fall into their own nets, whilst that I withal escape* (Psalm 141:10) is the same recoil — the pit-digger falls into his own pit, the snare returns on the snare-setter.'),
    ('canon','psalms',141,10,'canon','psalms',7,16,'free',
     E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16). The mischief *returns upon his own head* — the covenant justice behind *let the wicked fall into their own nets* (Psalm 141:10), the wicked undone by their own device.'),
    ('canon','psalms',141,10,'canon','galatians',6,7,'free',
     E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Paul names the law the psalm trusts — *let the wicked fall into their own nets* (Psalm 141:10): a man reaps what he sows, the net recoiling on the one who set it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps141_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps141_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== D: threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-141-let-my-prayer-be-set-forth-as-incense-and-the-evening-sacrifice',
       E'Let my prayer be set forth as incense, and the evening sacrifice',
       E'David frames his prayer ON the worship Yahuah commanded in the Torah: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). The incense is the appointed incense of the golden altar — *Aaron shall burn thereon sweet incense every morning* and *when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah throughout your generations* (Exodus 30:7-8). The lifted hands are the evening lamb of the tamid: *the one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* (Exodus 29:39). This is worship Torah-shaped and ongoing, never abolished — Malachi widens it: *in every place incense shall be offered unto my name, and a pure offering* (Malachi 1:11). The New Testament carries the SAME figure forward, not away: Paul wills *that men pray every where, lifting up holy hands* (1 Timothy 2:8); and heaven shows what the incense always was — *golden vials full of odours, which are the prayers of saints* (Revelation 5:8), the angel''s *much incense... offered with the prayers of all saints upon the golden altar which was before the throne*, whose *smoke... ascended up before Elohim with the prayers of the saints* (Revelation 8:3-4). The evening prayer of David rises, in the end, before the throne.',
       sv.verse_id, ev.verse_id, 'free', 25500
  FROM _s302_ps141_lookup sv, _s302_ps141_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=141 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-141-set-a-watch-before-my-mouth-and-the-table-of-the-wicked-refused',
       E'Set a watch before my mouth, and the table of the wicked refused',
       E'Two guards the righteous man keeps: the mouth and the table. *Set a watch, O Yahuah, before my mouth; keep the door of my lips* (Psalm 141:3) is the vow David made before — *I will keep my mouth with a bridle, while the wicked is before me* (Psalm 39:1) — and the wisdom of Proverbs: *he that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3). James presses why the door must be watched: *the tongue is a little member, and boasteth great things... and the tongue is a fire, a world of iniquity... and it is set on fire of hell* (James 3:5-6). The second guard is the table: *let me not eat of their dainties* (Psalm 141:4) — *eat thou not the bread of him that hath an evil eye, neither desire thou his dainty meats* (Proverbs 23:6). Daniel lives it out: *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat... that he might not defile himself* (Daniel 1:8). The mouth watched, the wicked''s table refused — the whole man kept from the iniquity of those who work it.',
       sv.verse_id, ev.verse_id, 'free', 25501
  FROM _s302_ps141_lookup sv, _s302_ps141_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=141 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-141-let-the-righteous-smite-me-the-wounds-of-a-friend',
       E'Let the righteous smite me — the wounds of a friend',
       E'David welcomes correction as a gift: *let the righteous smite me; it shall be a kindness: and let him reprove me; it shall be an excellent oil, which shall not break my head* (Psalm 141:5). This is the proverb embraced — *faithful are the wounds of a friend; but the kisses of an enemy are deceitful* (Proverbs 27:6) — and the mark of the wise rather than the scorner: *reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). The New Testament names it the loving discipline of the Father: *despise not thou the chastening of Yahuah, nor faint when thou art rebuked of him* (Hebrews 12:5); and the reproof that *shall be an excellent oil* is the harvest Hebrews promises — *afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11). The friend''s wound, the righteous man''s rebuke, the Father''s chastening: grievous for the present, oil for the head, never breaking it.',
       sv.verse_id, ev.verse_id, 'free', 25502
  FROM _s302_ps141_lookup sv, _s302_ps141_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=141 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-141-mine-eyes-are-unto-thee-and-the-wicked-fall-into-their-own-nets',
       E'Mine eyes are unto thee, and the wicked fall into their own nets',
       E'The psalm closes with eyes lifted and snares recoiling. *But mine eyes are unto thee, O GOD Yahuah: in thee is my trust; leave not my soul destitute* (Psalm 141:8) is the same fixed gaze David kept before: *mine eyes are ever toward Yahuah; for he shall pluck my feet out of the net* (Psalm 25:15). Surrounded by *the snares which they have laid for me, and the gins of the workers of iniquity* (Psalm 141:9), he prays not private vengeance but covenant justice — *let the wicked fall into their own nets, whilst that I withal escape* (Psalm 141:10). This is the recoil written through the Psalms: *he made a pit, and digged it, and is fallen into the ditch which he made. His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:15-16). Paul names the standing law of it: *be not deceived; Elohim is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The eyes go up to Yahuah; the net comes down on the one who set it.',
       sv.verse_id, ev.verse_id, 'free', 25503
  FROM _s302_ps141_lookup sv, _s302_ps141_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=141 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: incense + evening sacrifice (vv.1-2)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (141,2,'canon','exodus',30,7,1,E'Exodus 30:7 — *Aaron shall burn thereon sweet incense every morning*: the appointed incense David''s prayer rises with.'),
    (141,2,'canon','exodus',30,8,2,E'Exodus 30:8 — *a perpetual incense before Yahuah throughout your generations* at even: the very hour of David''s evening prayer.'),
    (141,2,'canon','exodus',29,39,3,E'Exodus 29:39 — *the other lamb thou shalt offer at even*: the evening tamid that *the lifting up of my hands* answers.'),
    (141,2,'canon','malachi',1,11,4,E'Malachi 1:11 — *in every place incense shall be offered unto my name, and a pure offering*: the incense widened, not undone.'),
    (141,2,'canon','1-timothy',2,8,5,E'1 Timothy 2:8 — *men pray every where, lifting up holy hands*: David''s lifted hands carried forward.'),
    (141,2,'canon','revelation',5,8,6,E'Revelation 5:8 — *golden vials full of odours, which are the prayers of saints*: the incense shown to BE the prayers.'),
    (141,2,'canon','revelation',8,3,7,E'Revelation 8:3 — *much incense... offered with the prayers of all saints upon the golden altar*: the altar of Exodus 30 before the throne.'),
    (141,2,'canon','revelation',8,4,8,E'Revelation 8:4 — *the smoke of the incense... ascended up... with the prayers of the saints*: the evening prayer risen at last.')
  ) AS m(src_v_dummy_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps141_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=m.src_v
  JOIN _s302_ps141_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-141-let-my-prayer-be-set-forth-as-incense-and-the-evening-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: watch the mouth + refuse the table (vv.3-4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (141,3,'canon','psalms',39,1,1,E'Psalm 39:1 — *I will keep my mouth with a bridle, while the wicked is before me*: the same vow of the guarded mouth.'),
    (141,3,'canon','proverbs',13,3,2,E'Proverbs 13:3 — *he that keepeth his mouth keepeth his life*: to keep the door of the lips is to keep the life.'),
    (141,3,'canon','james',3,5,3,E'James 3:5 — *how great a matter a little fire kindleth*: why the door of the lips must be watched.'),
    (141,3,'canon','james',3,6,4,E'James 3:6 — *the tongue is a fire, a world of iniquity*: the danger behind *set a watch before my mouth*.'),
    (141,4,'canon','proverbs',23,6,5,E'Proverbs 23:6 — *neither desire thou his dainty meats*: David''s *let me not eat of their dainties* prayed.'),
    (141,4,'canon','daniel',1,8,6,E'Daniel 1:8 — *would not defile himself with the portion of the king''s meat*: the refused table lived out.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps141_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=m.src_v
  JOIN _s302_ps141_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-141-set-a-watch-before-my-mouth-and-the-table-of-the-wicked-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: let the righteous smite me (v.5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (141,5,'canon','proverbs',27,6,1,E'Proverbs 27:6 — *faithful are the wounds of a friend*: the righteous man''s smiting received as kindness.'),
    (141,5,'canon','proverbs',9,8,2,E'Proverbs 9:8 — *rebuke a wise man, and he will love thee*: David takes the wise man''s part, loving the reprover.'),
    (141,5,'canon','hebrews',12,5,3,E'Hebrews 12:5 — *despise not thou the chastening of Yahuah*: the same posture as *let the righteous smite me*.'),
    (141,5,'canon','hebrews',12,11,4,E'Hebrews 12:11 — *the peaceable fruit of righteousness*: the excellent oil the reproof yields after.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps141_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=m.src_v
  JOIN _s302_ps141_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-141-let-the-righteous-smite-me-the-wounds-of-a-friend'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: mine eyes unto thee + the recoil net (vv.8-10)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (141,8,'canon','psalms',25,15,1,E'Psalm 25:15 — *mine eyes are ever toward Yahuah; for he shall pluck my feet out of the net*: the same gaze, the same rescue from the snare.'),
    (141,10,'canon','psalms',7,15,2,E'Psalm 7:15 — *is fallen into the ditch which he made*: the pit-digger undone, the recoil David trusts.'),
    (141,10,'canon','psalms',7,16,3,E'Psalm 7:16 — *his mischief shall return upon his own head*: the covenant justice behind *let the wicked fall into their own nets*.'),
    (141,10,'canon','galatians',6,7,4,E'Galatians 6:7 — *whatsoever a man soweth, that shall he also reap*: the standing law the recoiling net obeys.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s302_ps141_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=141 AND sv.verse_number=m.src_v
  JOIN _s302_ps141_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='psalm-141-mine-eyes-are-unto-thee-and-the-wicked-fall-into-their-own-nets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
