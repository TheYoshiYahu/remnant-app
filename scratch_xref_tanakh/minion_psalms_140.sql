-- ----- fragment: minion_psalms_140.sql (Psalm 140) -----
-- Chapter: Psalm 140 — David's prayer against the violent man (the serpent-tongue / seed-war imprecation)
-- Tag: ps140   Session: s302   Sort band base: 25475   Temp view: _s302_ps140_lookup
-- Output: minion_psalms_140.sql
--
-- Psalm 140 coverage:
--   v.1-3  (deliver from the evil/violent man; sharpened tongues like a serpent, adders' poison under their lips)
--          NT:     Rom 3:13 (the poison of asps is under their lips — Paul's depravity catena QUOTES this), James 3:8 (tongue full of deadly poison)
--          Extras: Sirach 28:18 (many fallen by the tongue) [edition apocrypha / book ecclesiasticus]
--          Tanakh: Gen 3:14-15 (the cursed serpent / the seed-war), Ps 58:4 (their poison like the poison of a serpent)
--   v.4-5  (the wicked purpose to overthrow my goings; the proud hid a snare, a net by the wayside, gins)
--          NT:     none warranted (the net/pit-recoil is sung forward in the Psalter itself)
--          Extras: none warranted (clean canon witnesses carry the snare motif)
--          Tanakh: Ps 35:7 (hid for me their net in a pit), Ps 57:6 (net for my steps... pit before me, into which they fell themselves)
--   v.6-8  (Thou art my Elohim; O GOD Yahuah, strength of my salvation, thou hast covered my head in the day of battle)
--          NT:     Eph 6:17 (take the helmet of salvation)
--          Extras: none warranted
--          Tanakh: Ps 27:1 (Yahuah my light and salvation, the strength of my life), Isa 59:17 (helmet of salvation upon his head)
--   v.9-11 (let the mischief of their own lips cover them; let burning coals fall; evil shall hunt the violent man — measure-for-measure recoil)
--          NT:     Gal 6:7 (whatsoever a man soweth, that shall he also reap)
--          Extras: none warranted
--          Tanakh: Ps 7:15 (made a pit and is fallen into the ditch he made), Ps 7:16 (his mischief shall return upon his own head), Ps 9:16 (the wicked is snared in the work of his own hands)
--   v.12-13 (Yahuah will maintain the cause of the afflicted and the right of the poor; the righteous give thanks, the upright dwell in thy presence)
--          NT:     Rev 7:15 (before the throne... he that sitteth on the throne shall dwell among them)
--          Extras: none warranted
--          Tanakh: Ps 9:18 (the needy shall not alway be forgotten), Lev 19:15 (the just-judgment Torah floor — respect not poor nor mighty)
--
-- Threads (5):
--   psalm-140-adders-poison-under-their-lips-the-serpent-tongue   [Tanakh + NT + extras]  — v.1-3 → Rom 3:13, James 3:8, Gen 3:14, Gen 3:15, Ps 58:4, Sirach 28:18
--   psalm-140-the-proud-hid-a-snare-the-net-by-the-wayside        [Tanakh]                — v.4-5 → Ps 35:7, Ps 57:6
--   psalm-140-thou-hast-covered-my-head-in-the-day-of-battle      [Tanakh + NT]           — v.6-8 → Ps 27:1, Isa 59:17, Eph 6:17
--   psalm-140-let-the-mischief-of-their-own-lips-cover-them       [Tanakh + NT]           — v.9-11 → Ps 7:15, Ps 7:16, Ps 9:16, Gal 6:7
--   psalm-140-Yahuah-will-maintain-the-cause-of-the-afflicted     [Tanakh + NT]           — v.12-13 → Ps 9:18, Lev 19:15, Rev 7:15
--
-- Framework / contested verses:
--   v.3 is the load-bearing FORWARD weave: Paul lifts it VERBATIM into Rom 3:13 — the serpent-tongue is the
--        Genesis 3:14-15 seed of the serpent surfacing in the depravity catena; the violent man speaks with the
--        adder's mouth (Ps 58:4; Jas 3:8). Framed as the seed-war, NOT a verdict on any people.
--   vv.9-11 IMPRECATION framed as covenant judgment-cry / measure-for-measure recoil (Ps 7:15-16; 9:16; Gal 6:7),
--        the seed-war handed UP to Yahuah the Judge — never ethnic hatred, never personal vengeance. Victims, not enemies.
--   vv.12-13 resolution stands on the Torah just-judgment floor (Lev 19:15) and reaches FORWARD to Rev 7:15 —
--        the upright shall DWELL IN HIS PRESENCE before the throne. The afflicted, not the violent, inherit.

CREATE TEMP VIEW _s302_ps140_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- Thread 1: vv.1-3 the serpent-tongue / adders' poison under their lips
  ('canon','psalms',140,3,'canon','romans',3,13,'free',
   E'*Their throat is an open sepulchre; with their tongues they have used deceit; the poison of asps is under their lips:* (Romans 3:13). Paul lifts David''s charge VERBATIM into the depravity catena — *they have sharpened their tongues like a serpent; adders'' poison is under their lips* (Psalm 140:3) is the very evidence that *there is none that doeth good*. The violent man''s mouth is the serpent''s mouth.'),
  ('canon','psalms',140,3,'canon','james',3,8,'free',
   E'*But the tongue can no man tame; it is an unruly evil, full of deadly poison.* (James 3:8). The *deadly poison* of the untamed tongue is the same *adders'' poison under their lips* (Psalm 140:3) — the serpent''s venom carried in human speech, the weapon of the violent man who *imagine mischiefs in their heart* (Psalm 140:2).'),
  ('canon','psalms',140,3,'canon','genesis',3,14,'free',
   E'*And Yahuah Elohim (the LORD God) said unto the serpent, Because thou hast done this, thou art cursed above all cattle... upon thy belly shalt thou go, and dust shalt thou eat all the days of thy life:* (Genesis 3:14). The *tongues like a serpent* and *adders'' poison* of Psalm 140:3 trace straight back to the cursed beast in the garden — the violent man speaks with the mouth of the serpent-seed.'),
  ('canon','psalms',140,3,'canon','genesis',3,15,'free',
   E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). David''s *evil man* and *violent man* (Psalm 140:1) are the serpent''s seed in the long enmity — the poisoned tongue is the heel-striking that runs the whole canon, the seed-war handed up to Yahuah the Deliverer.'),
  ('canon','psalms',140,3,'canon','psalms',58,4,'free',
   E'*Their poison is like the poison of a serpent: they are like the deaf adder that stoppeth her ear;* (Psalm 58:4). David sings the same serpent-tongue elsewhere — *adders'' poison is under their lips* (Psalm 140:3) — the wicked estranged from the womb, the serpent-seed speaking lies, deaf to correction.'),
  ('canon','psalms',140,3,'apocrypha','ecclesiasticus',28,18,'extras',
   E'*Many have fallen by the edge of the sword: but not so many as have fallen by the tongue.* (Sirach 28:18). Ben Sira weighs the slanderer''s tongue heavier than the sword — exactly the violent man David fears, whose *sharpened tongues like a serpent* and *adders'' poison* (Psalm 140:3) wound deeper than the snare or the net.'),
  -- Thread 2: vv.4-5 the proud hid a snare / the net by the wayside
  ('canon','psalms',140,5,'canon','psalms',35,7,'free',
   E'*For without cause have they hid for me their net in a pit, which without cause they have digged for my soul.* (Psalm 35:7). David''s recurring distress — *the proud have hid a snare for me, and cords; they have spread a net by the wayside* (Psalm 140:5) — the wicked dig the pit and spread the net for the righteous without cause.'),
  ('canon','psalms',140,5,'canon','psalms',57,6,'free',
   E'*They have prepared a net for my steps; my soul is bowed down: they have digged a pit before me, into the midst whereof they are fallen themselves. Selah.* (Psalm 57:6). The very *net by the wayside* and *gins* of Psalm 140:5 — and already the recoil: the pit-diggers *are fallen themselves*. The snare set for the righteous becomes the trap of the proud.'),
  -- Thread 3: vv.6-8 thou hast covered my head in the day of battle
  ('canon','psalms',140,7,'canon','psalms',27,1,'free',
   E'*Yahuah (LORD) is my light and my salvation; whom shall I fear? Yahuah (LORD) is the strength of my life; of whom shall I be afraid?* (Psalm 27:1). David''s confession in the day of battle — *O GOD Yahuah (Lord), the strength of my salvation, thou hast covered my head* (Psalm 140:7) — Yahuah Himself is the refuge and the strength, the shield against the violent man.'),
  ('canon','psalms',140,7,'canon','isaiah',59,17,'free',
   E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). The *covered my head in the day of battle* of Psalm 140:7 is the helmet of salvation — Yahuah arms His own with His own armour, the deliverance worn upon the head of His warrior.'),
  ('canon','psalms',140,7,'canon','ephesians',6,17,'free',
   E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* (Ephesians 6:17). Paul hands the covenant warrior the same helmet — *thou hast covered my head in the day of battle* (Psalm 140:7) — the salvation of Yahuah worn upon the head in the seed-war against the violent man and the spiritual wickedness behind him.'),
  -- Thread 4: vv.9-11 let the mischief of their own lips cover them — the recoil
  ('canon','psalms',140,9,'canon','psalms',7,15,'free',
   E'*He made a pit, and digged it, and is fallen into the ditch which he made.* (Psalm 7:15). The measure-for-measure recoil David prays — *let the mischief of their own lips cover them* (Psalm 140:9) — the violent man''s own device turns back upon him; the pit-digger falls in.'),
  ('canon','psalms',140,9,'canon','psalms',7,16,'free',
   E'*His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* (Psalm 7:16). Precisely the recoil of Psalm 140:9 — *let the mischief of their own lips cover them* — the violent dealing comes down upon the head that purposed it. The judgment is the wicked''s own work returned.'),
  ('canon','psalms',140,9,'canon','psalms',9,16,'free',
   E'*Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands. Higgaion. Selah.* (Psalm 9:16). The recoil is Yahuah''s known judgment — *let the mischief of their own lips cover them* (Psalm 140:9) — the wicked snared in the very work of his own hands, the imprecation handed up to the Judge.'),
  ('canon','psalms',140,11,'canon','galatians',6,7,'free',
   E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7). The harvest-law beneath David''s *evil shall hunt the violent man to overthrow him* (Psalm 140:11) — what the violent man sows in mischief he reaps in his own overthrow; Yahuah is not mocked.'),
  -- Thread 5: vv.12-13 Yahuah will maintain the cause of the afflicted
  ('canon','psalms',140,12,'canon','psalms',9,18,'free',
   E'*For the needy shall not alway be forgotten: the expectation of the poor shall not perish for ever.* (Psalm 9:18). The same confidence that closes Psalm 140 — *Yahuah (LORD) will maintain the cause of the afflicted, and the right of the poor* (Psalm 140:12) — the afflicted are not abandoned to the violent man; their hope is kept by the Judge.'),
  ('canon','psalms',140,12,'canon','leviticus',19,15,'free',
   E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour.* (Leviticus 19:15). The Torah just-judgment floor beneath David''s trust — *Yahuah will maintain the cause of the afflicted, and the right of the poor* (Psalm 140:12) — Yahuah Himself does the very righteous judgment His Torah commands.'),
  ('canon','psalms',140,13,'canon','revelation',7,15,'free',
   E'*Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them.* (Revelation 7:15). The Psalm''s resolution reaches its end — *the upright shall dwell in thy presence* (Psalm 140:13) — the afflicted, not the violent, stand before the throne; He that sitteth there dwells among them forever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps140_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps140_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-140-adders-poison-under-their-lips-the-serpent-tongue',
       E'Adders'' poison is under their lips — the serpent-tongue',
       E'David opens crying *Deliver me, O Yahuah (LORD), from the evil man: preserve me from the violent man* (Psalm 140:1) — men *which imagine mischiefs in their heart* (Psalm 140:2), who *have sharpened their tongues like a serpent; adders'' poison is under their lips* (Psalm 140:3). The weapon is the mouth, and the mouth is the serpent''s. This is the garden enmity surfacing: *thou art cursed above all cattle... upon thy belly shalt thou go* (Genesis 3:14), *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) — the violent man speaks with the venom of the serpent-seed. David knows the sound; he sings it elsewhere: *their poison is like the poison of a serpent: they are like the deaf adder that stoppeth her ear* (Psalm 58:4). Paul gathers the very line into his catena of human ruin — *the poison of asps is under their lips* (Romans 3:13) — and James names the organ: *the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). Ben Sira weighs it: *many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Sirach 28:18). The serpent''s heel-strike is verbal before it is violent.',
       sv.verse_id, ev.verse_id, 'extras', 25475
  FROM _s302_ps140_lookup sv, _s302_ps140_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=140 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-140-the-proud-hid-a-snare-the-net-by-the-wayside',
       E'The proud have hid a snare — the net by the wayside',
       E'The violent men *have purposed to overthrow my goings* (Psalm 140:4), and the means is the trap: *the proud have hid a snare for me, and cords; they have spread a net by the wayside; they have set gins for me* (Psalm 140:5). It is David''s recurring distress, the net hidden for the righteous without cause: *for without cause have they hid for me their net in a pit, which without cause they have digged for my soul* (Psalm 35:7). And already the Psalter holds the recoil that Psalm 140 will pray for outright — the snare-setters caught in their own snare: *they have prepared a net for my steps; my soul is bowed down: they have digged a pit before me, into the midst whereof they are fallen themselves* (Psalm 57:6). The wayside net is the serpent''s strategy; the pit recoils on the one who digs it.',
       sv.verse_id, ev.verse_id, 'free', 25476
  FROM _s302_ps140_lookup sv, _s302_ps140_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=140 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-140-thou-hast-covered-my-head-in-the-day-of-battle',
       E'Thou hast covered my head in the day of battle',
       E'Against the snare and the violent man David turns to the only refuge: *I said unto Yahuah (LORD), Thou art my Elohim (God): hear the voice of my supplications, O Yahuah (LORD)* (Psalm 140:6). Then the confession that names his armour: *O GOD Yahuah (Lord), the strength of my salvation, thou hast covered my head in the day of battle* (Psalm 140:7). The same trust opens Psalm 27 — *Yahuah (LORD) is my light and my salvation; whom shall I fear? Yahuah (LORD) is the strength of my life* (Psalm 27:1). The covered head is the helmet of salvation, and Isaiah shows Yahuah wearing it Himself before He gives it: *he put on righteousness as a breastplate, and an helmet of salvation upon his head* (Isaiah 59:17). Paul hands the same helmet to the covenant warrior — *take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The salvation of Yahuah is worn upon the head in the day of battle; the seed-war is fought in His strength, not the warrior''s own.',
       sv.verse_id, ev.verse_id, 'free', 25477
  FROM _s302_ps140_lookup sv, _s302_ps140_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=140 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-140-let-the-mischief-of-their-own-lips-cover-them',
       E'Let the mischief of their own lips cover them — the recoil',
       E'Now the imprecation — but watch its shape. David does not raise his own hand; he hands the seed-war up to the Judge and asks only that the wicked''s own device return on him: *as for the head of those that compass me about, let the mischief of their own lips cover them* (Psalm 140:9); *let burning coals fall upon them: let them be cast into the fire; into deep pits, that they rise not up again* (Psalm 140:10); *let not an evil speaker be established in the earth: evil shall hunt the violent man to overthrow him* (Psalm 140:11). This is measure-for-measure, the law already written in the Psalter: *he made a pit, and digged it, and is fallen into the ditch which he made* (Psalm 7:15); *his mischief shall return upon his own head, and his violent dealing shall come down upon his own pate* (Psalm 7:16); *Yahuah (LORD) is known by the judgment which he executeth: the wicked is snared in the work of his own hands* (Psalm 9:16). Paul names the harvest-law underneath it: *be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The imprecation is a judgment-cry, never personal vengeance — the violent man is overthrown by his own sowing, and Yahuah is the one who reaps it.',
       sv.verse_id, ev.verse_id, 'free', 25478
  FROM _s302_ps140_lookup sv, _s302_ps140_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=140 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-140-Yahuah-will-maintain-the-cause-of-the-afflicted',
       E'Yahuah will maintain the cause of the afflicted',
       E'The Psalm resolves not in triumph over enemies but in the vindication of victims: *I know that Yahuah (LORD) will maintain the cause of the afflicted, and the right of the poor* (Psalm 140:12). It is the settled confidence of the Psalter — *the needy shall not alway be forgotten: the expectation of the poor shall not perish for ever* (Psalm 9:18) — and it rests on the Torah''s own floor of just-judgment: *ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). Yahuah Himself does the righteous judgment His Torah commands. And the last verse reaches all the way forward: *surely the righteous shall give thanks unto thy name: the upright shall dwell in thy presence* (Psalm 140:13) — which John sees consummated, *they are before the throne of Elohim (God)... and he that sitteth on the throne shall dwell among them* (Revelation 7:15). The afflicted, not the violent, inherit the presence.',
       sv.verse_id, ev.verse_id, 'free', 25479
  FROM _s302_ps140_lookup sv, _s302_ps140_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=140 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 3:13 — Paul lifts *adders'' poison is under their lips* VERBATIM into his catena of human ruin (the poison of asps under their lips).'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'James 3:8 — the untamed tongue *full of deadly poison*: the same serpent-venom carried in human speech.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 3:14 — the cursed serpent in the garden: the tongue *like a serpent* traces straight back to the cursed beast.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 3:15 — the enmity between the two seeds: the violent man is the serpent-seed, the poisoned tongue the heel-strike.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 58:4 — David sings the same serpent-tongue: *their poison is like the poison of a serpent... the deaf adder*.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=58 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Sirach 28:18 — Ben Sira weighs the tongue heavier than the sword: *not so many... fallen by the tongue*. [extras]'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=3
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-adders-poison-under-their-lips-the-serpent-tongue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 35:7 — the net hidden in a pit *without cause*: the proud lay the same snare for the righteous.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=5
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-the-proud-hid-a-snare-the-net-by-the-wayside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 57:6 — the net for the steps, the pit dug — *into the midst whereof they are fallen themselves*: the recoil already showing.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=5
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=57 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-the-proud-hid-a-snare-the-net-by-the-wayside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 27:1 — *Yahuah is my light and my salvation... the strength of my life*: the same refuge in the day of battle.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=7
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-thou-hast-covered-my-head-in-the-day-of-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 59:17 — *an helmet of salvation upon his head*: the covered head is Yahuah''s own armour, worn first by Him.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=7
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-thou-hast-covered-my-head-in-the-day-of-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ephesians 6:17 — *take the helmet of salvation*: Paul hands the covenant warrior the same head-covering for the seed-war.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=7
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-thou-hast-covered-my-head-in-the-day-of-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 7:15 — *is fallen into the ditch which he made*: the pit-digger falls in; the device returns.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=9
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-let-the-mischief-of-their-own-lips-cover-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 7:16 — *his mischief shall return upon his own head*: the exact recoil David prays in Psalm 140:9.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=9
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-let-the-mischief-of-their-own-lips-cover-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 9:16 — *the wicked is snared in the work of his own hands*: the recoil is Yahuah''s known judgment.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=9
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-let-the-mischief-of-their-own-lips-cover-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Galatians 6:7 — *whatsoever a man soweth, that shall he also reap*: the harvest-law beneath *evil shall hunt the violent man* (Psalm 140:11).'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=11
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-let-the-mischief-of-their-own-lips-cover-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 9:18 — *the needy shall not alway be forgotten*: the same settled hope for the afflicted.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=12
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-Yahuah-will-maintain-the-cause-of-the-afflicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 19:15 — the Torah just-judgment floor: Yahuah does the very righteous judgment His Torah commands.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=12
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-Yahuah-will-maintain-the-cause-of-the-afflicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Revelation 7:15 — *he that sitteth on the throne shall dwell among them*: *the upright shall dwell in thy presence* (Psalm 140:13) consummated.'
  FROM cross_reference_threads t
  JOIN _s302_ps140_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=140 AND sv.verse_number=13
  JOIN _s302_ps140_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-140-Yahuah-will-maintain-the-cause-of-the-afflicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
