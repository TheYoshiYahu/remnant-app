-- ----- fragment: minion_psalms_129.sql (Psalm 129) -----
-- Chapter: Psalm 129 — Song of Ascents — the afflicted-but-unprevailed covenant people
-- Tag: ps129   Session prefix: s302   Slug prefix: psalm-129-
-- Sort band base: 25200 (25200, 25203, 25206, 25209)
--
-- Psalm 129 coverage:
--   v.1-2  ("Many a time have they afflicted me from my youth... yet they have not prevailed")
--          NT:     Romans 8:35-37 (more than conquerors); Romans 11:1-2 (Elohim hath not cast away his people) — WARRANTED
--          Extras: none warranted (the NT + Tanakh laterals carry the seed-war/two-house frame)
--          Tanakh: Genesis 3:15 (enmity/seed-war); Hosea 11:1 (Yashar'el a child, called out of Egypt = "from my youth") — WARRANTED
--   v.3    ("The plowers plowed upon my back: they made long their furrows")
--          NT:     Matthew 27:26 (Yahusha scourged) — WARRANTED
--          Extras: none warranted (Isaiah's servant songs carry it)
--          Tanakh: Isaiah 50:6 (I gave my back to the smiters); Isaiah 53:5 (with his stripes we are healed) — WARRANTED
--   v.4    ("Yahuah is righteous: he hath cut asunder the cords of the wicked")
--          NT:     none warranted (the Psalter laterals carry the bonds-broken theme)
--          Extras: none warranted
--          Tanakh: Psalm 124:7 (the snare is broken, and we are escaped); Psalm 2:3 (break their bands asunder) — WARRANTED
--   v.5-8  ("Let them all be confounded... that hate Zion... as the grass upon the housetops, which withereth")
--          NT:     none warranted (the grass-withers/chaff frame is fully Tanakh)
--          Extras: none warranted
--          Tanakh: Psalm 83:4 (let us cut them off from being a nation); Isaiah 37:27 (as the grass on the housetops); Psalm 1:4 (chaff the wind driveth away); Isaiah 40:6-8 (the grass withereth... but the word of our Elohim shall stand) — WARRANTED
--
-- Threads (4):
--   psalm-129-many-a-time-afflicted-from-my-youth-yet-they-have-not-prevailed  [free; Tanakh+NT]
--       — v1-2; seed-war Gen3:15, "from my youth"=Hos11:1, Rom8:35-37 more-than-conquerors, Rom11:1-2 NOT cast off (guard)
--   psalm-129-the-plowers-plowed-upon-my-back-the-scourged-suffering-servant   [free; Tanakh+NT]
--       — v3; Isa50:6 back to the smiters, Isa53:5 with his stripes we are healed, Matt27:26 the scourging (FORWARD to the Formed Son in the flesh)
--   psalm-129-yahuah-is-righteous-he-hath-cut-asunder-the-cords-of-the-wicked  [free; Tanakh]
--       — v4; Ps124:7 snare broken (lateral Ascents), Ps2:3 the wicked's own cords cast away
--   psalm-129-let-them-that-hate-zion-be-as-grass-upon-the-housetops-that-withereth  [free; Tanakh]
--       — v5-8; Ps83:4 cut-off-from-being-a-nation, Isa37:27 grass on the housetops, Ps1:4 chaff, Isa40:6-8 grass withers but the word stands (victims-not-enemies: the system judged, not a people hated)
--
-- Framework notes: Psalm 129 is the persecuted two-house people preserved through history and
-- never overcome — the seed-war of Gen 3:15 run forward, the dispersion that did NOT cast off
-- (Rom 11:1-2 guard against any replacement reading). v.3's plowed back is read FORWARD as the
-- scourged suffering servant / the Formed Son in the flesh (Isa 50/53; Matt 27). v.5-8 is held
-- under victims-not-enemies: the haters of Zion's SYSTEM withers, no ethnic curse intended.

CREATE TEMP VIEW _s302_ps129_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: many a time afflicted from my youth, yet not prevailed (v1-2)
    ('canon','psalms',129,1,'canon','genesis',3,15,'free',
     E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) The whole affliction of *Many a time have they afflicted me from my youth* (Psalm 129:1) is the seed-war first declared in the garden — the serpent''s seed striking at the woman''s seed across all history, yet the heel-bruise never becomes a head-crush of the covenant people.'),
    ('canon','psalms',129,1,'canon','hosea',11,1,'free',
     E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1) The *from my youth* of *Many a time have they afflicted me from my youth* (Psalm 129:1) reaches back to the nation''s very beginning — Egypt, the house of bondage — where the affliction began and Yahuah loved and called his son out of it.'),
    ('canon','psalms',129,2,'canon','romans',8,35,'free',
     E'*Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35) The defiant *yet they have not prevailed against me* (Psalm 129:2) is sung forward here: every affliction listed is real, and not one of them severs the covenant people from the love that holds them.'),
    ('canon','psalms',129,2,'canon','romans',8,37,'free',
     E'*Nay, in all these things we are more than conquerors through him that loved us.* (Romans 8:37) *Yet they have not prevailed against me* (Psalm 129:2) is the very confession Sha''ul (Paul) makes good — the afflicted are not merely survivors but *more than conquerors*, unprevailed against through the One who loved them.'),
    ('canon','psalms',129,2,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) The unprevailed *yet they have not prevailed against me* (Psalm 129:2) is the guard against every replacement reading: the scattered people were afflicted but NOT cast away — Sha''ul stands as living proof of the preserved seed.'),
    ('canon','psalms',129,2,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew...* (Romans 11:2) *Yet they have not prevailed against me* (Psalm 129:2) — the persecutors could afflict but never undo the foreknown covenant: Yahuah *hath not cast away his people*, the dispersion is preservation, not divorce.'),
    -- Thread 2: the plowers plowed upon my back — the scourged suffering servant (v3)
    ('canon','psalms',129,3,'canon','isaiah',50,6,'free',
     E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting.* (Isaiah 50:6) The afflicted people''s *The plowers plowed upon my back: they made long their furrows* (Psalm 129:3) is taken up by the suffering servant who freely *gave my back to the smiters* — the same scourged back, borne willingly.'),
    ('canon','psalms',129,3,'canon','isaiah',53,5,'free',
     E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5) The long furrows plowed across the back of *The plowers plowed upon my back* (Psalm 129:3) become the very stripes by which *we are healed* — the servant absorbs the affliction of the people into his own scourged flesh.'),
    ('canon','psalms',129,3,'canon','matthew',27,26,'free',
     E'*Then released he Barabbas unto them: and when he had scourged Yahusha (Jesus), he delivered him to be crucified.* (Matthew 27:26) The plowers'' long furrows of *The plowers plowed upon my back: they made long their furrows* (Psalm 129:3) are answered FORWARD when the Formed Son in the flesh is scourged — the back of the afflicted people made the back of the Messiah.'),
    -- Thread 3: Yahuah is righteous, he hath cut asunder the cords of the wicked (v4)
    ('canon','psalms',129,4,'canon','psalms',124,7,'free',
     E'*Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken, and we are escaped.* (Psalm 124:7) The same Ascents deliverance: *Yahuah (LORD) is righteous: he hath cut asunder the cords of the wicked* (Psalm 129:4) — the bonds that bound the people are cut, *the snare is broken, and we are escaped*.'),
    ('canon','psalms',129,4,'canon','psalms',2,3,'free',
     E'*Let us break their bands asunder, and cast away their cords from us.* (Psalm 2:3) The raging wicked plot to throw off Yahuah''s cords; *Yahuah (LORD) is righteous: he hath cut asunder the cords of the wicked* (Psalm 129:4) turns it back on them — it is the WICKED whose cords the righteous Yahuah cuts asunder.'),
    -- Thread 4: let them that hate Zion be as grass upon the housetops that withereth (v5-8)
    ('canon','psalms',129,5,'canon','psalms',83,4,'free',
     E'*They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* (Psalm 83:4) This is the hatred of *all... that hate Zion* (Psalm 129:5) named outright — the design to erase Yashar''el from being a nation, the very enmity that *shall be confounded and turned back*.'),
    ('canon','psalms',129,6,'canon','isaiah',37,27,'free',
     E'*Therefore their inhabitants were of small power, they were dismayed and confounded: they were as the grass of the field, and as the green herb, as the grass on the housetops, and as corn blasted before it be grown up.* (Isaiah 37:27) The Assyrian haters of Zion are exactly *as the grass upon the housetops, which withereth afore it groweth up* (Psalm 129:6) — rootless growth on a roof, *confounded* and *blasted before it be grown up*.'),
    ('canon','psalms',129,6,'canon','psalms',1,4,'free',
     E'*The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4) The haters of Zion who are *as the grass upon the housetops, which withereth* (Psalm 129:6) share the end of all the ungodly — rootless *chaff which the wind driveth away*, nothing to gather, nothing that stands.'),
    ('canon','psalms',129,6,'canon','isaiah',40,7,'free',
     E'*The grass withereth, the flower fadeth: because the spirit of Yahuah (LORD) bloweth upon it: surely the people is grass.* (Isaiah 40:7) The withering of *the grass upon the housetops, which withereth afore it groweth up* (Psalm 129:6) is the universal verdict on flesh set against Yahuah — *the grass withereth* when his breath blows, and only the word of Elohim stands for ever.'),
    ('canon','psalms',129,6,'canon','isaiah',40,8,'free',
     E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8) The housetop grass of *which withereth afore it groweth up* (Psalm 129:6) withers — *but the word of our Elohim shall stand for ever*: the haters of Zion fade, the covenant word and the covenant people endure.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps129_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps129_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-129-many-a-time-afflicted-from-my-youth-yet-they-have-not-prevailed',
       E'Many a time have they afflicted me from my youth: yet they have not prevailed against me',
       E'*Many a time have they afflicted me from my youth, may Yashar''el (Israel) now say: Many a time have they afflicted me from my youth: yet they have not prevailed against me.* (Psalm 129:1-2) This Song of Ascents is the persecuted two-house people looking back over the whole history of their affliction — and declaring it never overcame them. The affliction is the seed-war first spoken in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — the serpent''s seed striking at the woman''s seed across the ages, wounding the heel but never crushing the head of the covenant line. The *from my youth* reaches back to the nation''s very beginning: *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1) — the affliction began in the house of bondage, and Yahuah loved and called his son out of it. The defiant *yet they have not prevailed against me* is sung forward by Sha''ul (Paul): *Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution, or famine, or nakedness, or peril, or sword?* (Romans 8:35) — and his answer, *Nay, in all these things we are more than conquerors through him that loved us.* (Romans 8:37). And lest any read the long affliction as Yahuah casting off his people, the guard stands: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew...* (Romans 11:2). The dispersion is preservation, not divorce — afflicted many a time, never prevailed against.',
       sv.verse_id, ev.verse_id, 'free', 25200
  FROM _s302_ps129_lookup sv, _s302_ps129_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=129 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-129-the-plowers-plowed-upon-my-back-the-scourged-suffering-servant',
       E'The plowers plowed upon my back: the scourged suffering servant',
       E'*The plowers plowed upon my back: they made long their furrows.* (Psalm 129:3) The affliction is made flesh as a scourged back — long furrows torn across the body of the covenant people. This is the back the suffering servant takes as his own: *I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting.* (Isaiah 50:6) — given willingly, not taken by force. And those long furrows become the very stripes of healing: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). The type is answered FORWARD when the Formed Son — the expressed Word who led Yashar''el, now in the flesh — bears the plowers'' furrows in his own body: *Then released he Barabbas unto them: and when he had scourged Yahusha (Jesus), he delivered him to be crucified.* (Matthew 27:26). The afflicted people''s plowed back and the Messiah''s scourged back are one back; the furrows long since become the stripes by which the people are healed.',
       sv.verse_id, ev.verse_id, 'free', 25203
  FROM _s302_ps129_lookup sv, _s302_ps129_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=129 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-129-yahuah-is-righteous-he-hath-cut-asunder-the-cords-of-the-wicked',
       E'Yahuah is righteous: he hath cut asunder the cords of the wicked',
       E'*Yahuah (LORD) is righteous: he hath cut asunder the cords of the wicked.* (Psalm 129:4) The afflicted back is loosed: the righteous Yahuah cuts the very bonds the wicked used to bind his people. It is the same Ascents deliverance sung two psalms before: *Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken, and we are escaped.* (Psalm 124:7) — the snare broken, the bird gone free. And the irony cuts the other way against the rebels who once boasted *Let us break their bands asunder, and cast away their cords from us.* (Psalm 2:3): they plotted to throw off Yahuah''s cords, but it is the cords of *the wicked* that the righteous Yahuah cuts asunder. The bonds of the oppressor do not hold, because the One who breaks them is righteous.',
       sv.verse_id, ev.verse_id, 'free', 25206
  FROM _s302_ps129_lookup sv, _s302_ps129_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=129 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-129-let-them-that-hate-zion-be-as-grass-upon-the-housetops-that-withereth',
       E'Let them that hate Zion be as the grass upon the housetops, which withereth',
       E'*Let them all be confounded and turned back that hate Zion. Let them be as the grass upon the housetops, which withereth afore it groweth up.* (Psalm 129:5-6) The psalm closes not in vengeance against a people but in a verdict on a system of hatred — the haters of Zion come to nothing, rootless growth on a roof that dies before it can be reaped. Their hatred is named outright: *They have said, Come, and let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* (Psalm 83:4) — the design to erase the covenant people, which is itself *confounded and turned back*. The figure is Isaiah''s of the dismayed Assyrian: *Therefore their inhabitants were of small power, they were dismayed and confounded: they were as the grass of the field... as the grass on the housetops, and as corn blasted before it be grown up.* (Isaiah 37:27). It is the end of all the ungodly: *The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4) — nothing to gather, *wherewith the mower filleth not his hand* (Psalm 129:7). And the whole frame is the verdict on flesh that sets itself against Yahuah: *The grass withereth, the flower fadeth: because the spirit of Yahuah (LORD) bloweth upon it: surely the people is grass.* (Isaiah 40:7); *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8). The haters of Zion wither; the covenant word and the covenant people stand. The system is judged — never a people hated.',
       sv.verse_id, ev.verse_id, 'free', 25209
  FROM _s302_ps129_lookup sv, _s302_ps129_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=129 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (129,1,'canon','genesis',3,15,1,E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — the seed-war behind *Many a time have they afflicted me from my youth*: the serpent''s seed bruises the heel, never crushes the head.'),
    (129,1,'canon','hosea',11,1,2,E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1) — *from my youth* = from Egypt, the nation''s beginning, where the affliction started and Yahuah called his son out.'),
    (129,2,'canon','romans',8,35,3,E'*Who shall separate us from the love of Messiah (Christ)? shall tribulation, or distress, or persecution...?* (Romans 8:35) — every affliction is real, yet none severs the people from the love that holds *yet they have not prevailed against me*.'),
    (129,2,'canon','romans',8,37,4,E'*Nay, in all these things we are more than conquerors through him that loved us.* (Romans 8:37) — *yet they have not prevailed against me* made good: not survivors only but more than conquerors.'),
    (129,2,'canon','romans',11,1,5,E'*Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham...* (Romans 11:1) — the guard: afflicted but NOT cast away; Sha''ul is the living preserved seed.'),
    (129,2,'canon','romans',11,2,6,E'*Elohim (God) hath not cast away his people which he foreknew...* (Romans 11:2) — the dispersion is preservation, not divorce; *they have not prevailed against me*.')
  ) AS m(src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-129-many-a-time-afflicted-from-my-youth-yet-they-have-not-prevailed'
  JOIN _s302_ps129_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=m.src_v
  JOIN _s302_ps129_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (129,3,'canon','isaiah',50,6,1,E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair...* (Isaiah 50:6) — the suffering servant takes the plowed back of *The plowers plowed upon my back* as his own, given willingly.'),
    (129,3,'canon','isaiah',53,5,2,E'*...with his stripes we are healed.* (Isaiah 53:5) — the long furrows become the stripes of healing; the servant absorbs the people''s affliction into his flesh.'),
    (129,3,'canon','matthew',27,26,3,E'*...when he had scourged Yahusha (Jesus), he delivered him to be crucified.* (Matthew 27:26) — answered FORWARD: the Formed Son in the flesh bears the plowers'' long furrows.')
  ) AS m(src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-129-the-plowers-plowed-upon-my-back-the-scourged-suffering-servant'
  JOIN _s302_ps129_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=m.src_v
  JOIN _s302_ps129_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (129,4,'canon','psalms',124,7,1,E'*Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken, and we are escaped.* (Psalm 124:7) — the same Ascents deliverance: *he hath cut asunder the cords of the wicked*, the snare broken.'),
    (129,4,'canon','psalms',2,3,2,E'*Let us break their bands asunder, and cast away their cords from us.* (Psalm 2:3) — the rebels plotted to throw off Yahuah''s cords; it is the WICKED''s cords the righteous Yahuah cuts asunder.')
  ) AS m(src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-129-yahuah-is-righteous-he-hath-cut-asunder-the-cords-of-the-wicked'
  JOIN _s302_ps129_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=m.src_v
  JOIN _s302_ps129_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (129,5,'canon','psalms',83,4,1,E'*...let us cut them off from being a nation; that the name of Yashar''el (Israel) may be no more in remembrance.* (Psalm 83:4) — the hatred of *all... that hate Zion* named outright, the design to erase Yashar''el, confounded and turned back.'),
    (129,6,'canon','isaiah',37,27,2,E'*...they were as the grass of the field... as the grass on the housetops, and as corn blasted before it be grown up.* (Isaiah 37:27) — the Assyrian haters are exactly *the grass upon the housetops, which withereth afore it groweth up*.'),
    (129,6,'canon','psalms',1,4,3,E'*The ungodly are not so: but are like the chaff which the wind driveth away.* (Psalm 1:4) — the housetop grass shares the end of all the ungodly: rootless chaff, nothing to gather.'),
    (129,6,'canon','isaiah',40,7,4,E'*The grass withereth, the flower fadeth: because the spirit of Yahuah (LORD) bloweth upon it: surely the people is grass.* (Isaiah 40:7) — flesh set against Yahuah withers at his breath.'),
    (129,6,'canon','isaiah',40,8,5,E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* (Isaiah 40:8) — the haters fade; the covenant word and the covenant people stand for ever.')
  ) AS m(src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-129-let-them-that-hate-zion-be-as-grass-upon-the-housetops-that-withereth'
  JOIN _s302_ps129_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=129 AND sv.verse_number=m.src_v
  JOIN _s302_ps129_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
