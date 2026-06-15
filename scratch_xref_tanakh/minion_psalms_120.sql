-- ----- fragment: minion_psalms_120.sql (Psalm 120) -----
-- Chapter: Psalm 120 — the FIRST Song of Ascents, the pilgrim's start
-- Tag: ps120   Session prefix: s302   Sort band base: 24975 (step 3: 24975, 24978, 24981)
-- Source rows: 'canon','psalms',120,v   Thread slug prefix: psalm-120-  (SINGULAR)
--
-- Per-chapter coverage checklist:
--   v.1  (In my distress I cried unto Yahuah, and he heard me)
--        NT:     none warranted (distress-answered woven in thread prose, not a standalone link)
--        Extras: none warranted
--        Tanakh: none warranted (frames the deceitful-tongue thread; the cry sets the band)
--   v.2  (Deliver my soul... from lying lips, and from a deceitful tongue)
--        NT:     James 3:6,8 (the tongue a fire / unruly evil) — thread A
--        Extras: Ecclesiasticus 28:13-14 (curse the doubletongued / driven them from nation to nation) — thread A
--        Tanakh: Psalm 12:2-3 (flattering lips / Yahuah cut off all flattering lips); Proverbs 12:19 (a lying tongue is but for a moment) — thread A
--   v.3  (What shall be given... thou false tongue?)
--        NT:     James 3:8 (full of deadly poison) — thread A
--        Extras: Ecclesiasticus 28:18 (many have fallen... by the tongue) — thread A
--        Tanakh: Psalm 12:3 — thread A
--   v.4  (Sharp arrows of the mighty, with coals of juniper)
--        NT:     none warranted (the recompense-on-the-tongue image carried by Tanakh witness)
--        Extras: none warranted
--        Tanakh: Proverbs 25:18 (a false witness is... a sharp arrow) — thread A
--   v.5  (Woe is me, that I sojourn in Mesech, that I dwell in the tents of Kedar!)
--        NT:     Hebrews 11:13 (strangers and pilgrims on the earth); 1 Peter 2:11 (strangers and pilgrims) — thread C
--        Extras: none warranted (Sirach's "driven from nation to nation" already anchors the exile in thread A)
--        Tanakh: Romans 11:1-2 GUARD (Elohim hath not cast away his people) — thread C (two-house dispersion, not replacement)
--   v.6  (My soul hath long dwelt with him that hateth peace)
--        NT:     Matthew 5:9 (peacemakers... children of Elohim) — thread B
--        Extras: none warranted
--        Tanakh: none warranted (joined to v.7 in thread B)
--   v.7  (I am for peace: but when I speak, they are for war)
--        NT:     Romans 12:18 (live peaceably with all men); Matthew 5:9 (blessed are the peacemakers); Matthew 5:44 (love your enemies) — thread B
--        Extras: none warranted
--        Tanakh: none warranted
--
-- Threads:
--   A. psalm-120-deliver-my-soul-from-lying-lips-and-a-deceitful-tongue  (v.1-4)
--        tier extras (has Sirach members) — targets: Tanakh (Psalm 12, Proverbs 12, Proverbs 25) + NT (James 3) + Extras (Ecclesiasticus/Sirach 28)
--   B. psalm-120-i-am-for-peace-but-when-i-speak-they-are-for-war  (v.6-7)
--        tier free — targets: NT (Romans 12, Matthew 5)
--   C. psalm-120-i-sojourn-in-mesech-i-dwell-in-the-tents-of-kedar  (v.5)
--        tier free — targets: NT (Hebrews 11, 1 Peter 2) + Tanakh (Romans 11 two-house guard)

-- ============================================================
-- A. Temp view
-- ============================================================
CREATE TEMP VIEW _s302_ps120_lookup AS
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
    -- Thread A: the deceitful tongue (v.2-4)
    ('canon','psalms',120,2,'canon','psalms',12,2,'free',
      E'*They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* (Psalm 12:2) The pilgrim''s plea *Deliver my soul, O Yahuah (LORD), from lying lips, and from a deceitful tongue* (Psalm 120:2) sings the same wound as its companion psalm — the *double heart* behind the *flattering lips* is the *deceitful tongue* that drives the righteous to cry out.'),
    ('canon','psalms',120,2,'canon','psalms',12,3,'free',
      E'*Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:3) is the answer to *Deliver my soul, O Yahuah (LORD), from lying lips, and from a deceitful tongue* (Psalm 120:2) — what the ascending pilgrim prays for, Yahuah (LORD) Himself vows to perform.'),
    ('canon','psalms',120,3,'canon','psalms',12,3,'free',
      E'*Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:3) answers the taunt *What shall be given unto thee? or what shall be done unto thee, thou false tongue?* (Psalm 120:3) — the recompense the false tongue earns is to be cut off by Yahuah (LORD).'),
    ('canon','psalms',120,2,'canon','proverbs',12,19,'free',
      E'*The lip of truth shall be established for ever: but a lying tongue is but for a moment* (Proverbs 12:19). The pilgrim begs deliverance *from lying lips, and from a deceitful tongue* (Psalm 120:2); Proverbs steadies him — the lying tongue that wounds him *is but for a moment*, while the truth he walks toward *shall be established for ever*.'),
    ('canon','psalms',120,4,'canon','proverbs',25,18,'free',
      E'*A man that beareth false witness against his neighbour is a maul, and a sword, and a sharp arrow* (Proverbs 25:18). The *sharp arrows of the mighty, with coals of juniper* (Psalm 120:4) are no mere figure — Proverbs names the weapon exactly: the false witness''s tongue is itself *a sharp arrow*, and Yahuah (LORD) turns that recompense back upon it.'),
    ('canon','psalms',120,3,'canon','james',3,8,'free',
      E'*But the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). The Tanakh''s *thou false tongue* (Psalm 120:3) is the very member James names — the untameable *unruly evil*, *full of deadly poison*, that no son of Adam can govern apart from the deliverance the pilgrim cries for.'),
    ('canon','psalms',120,2,'canon','james',3,6,'free',
      E'*And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). James unfolds why the pilgrim must pray *Deliver my soul... from lying lips, and from a deceitful tongue* (Psalm 120:2) — the *deceitful tongue* is *a fire, a world of iniquity*, the small member that defiles the whole.'),
    ('canon','psalms',120,2,'apocrypha','ecclesiasticus',28,13,'extras',
      E'*Curse the whisperer and doubletongued: for such have destroyed many that were at peace* (Ecclesiasticus 28:13). The restored wisdom of Ben Sira names the very enemy the pilgrim flees in praying *Deliver my soul... from lying lips, and from a deceitful tongue* (Psalm 120:2) — the *doubletongued* whisperer who unmakes the peace the psalmist later confesses he is *for* (Psalm 120:7).'),
    ('canon','psalms',120,5,'apocrypha','ecclesiasticus',28,14,'extras',
      E'*A backbiting tongue has disquieted many, and driven them from nation to nation: strong cities has it pulled down, and overthrown the houses of great men* (Ecclesiasticus 28:14). Here the deceitful tongue and the exile are bound as one: the *backbiting tongue* literally *driven them from nation to nation* — exactly the pilgrim''s lament that he must *sojourn in Mesech... dwell in the tents of Kedar* (Psalm 120:5).'),
    ('canon','psalms',120,3,'apocrypha','ecclesiasticus',28,18,'extras',
      E'*Many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Ecclesiasticus 28:18). Ben Sira measures the *false tongue* (Psalm 120:3) against the *sharp arrows of the mighty* (Psalm 120:4) and finds the tongue deadlier than the blade — which is why the pilgrim names it the first thing he must be delivered from.'),
    -- Thread B: I am for peace (v.7)
    ('canon','psalms',120,7,'canon','matthew',5,9,'free',
      E'*Blessed are the peacemakers: for they shall be called the children of Elohim (God)* (Matthew 5:9). The pilgrim''s confession *I am for peace: but when I speak, they are for war* (Psalm 120:7) is the peacemaker''s very posture on the Mount — to be *for peace* among those who answer with war is the blessedness the Formed Son pronounces.'),
    ('canon','psalms',120,6,'canon','matthew',5,9,'free',
      E'*Blessed are the peacemakers: for they shall be called the children of Elohim (God)* (Matthew 5:9). The one whose *soul hath long dwelt with him that hateth peace* (Psalm 120:6) yet remains himself *for peace* is the peacemaker the Son names blessed — peace held among the peace-haters, not withdrawn from them.'),
    ('canon','psalms',120,7,'canon','romans',12,18,'free',
      E'*If it be possible, as much as lieth in you, live peaceably with all men* (Romans 12:18). Paul gives the pilgrim''s burden its measure: *I am for peace: but when I speak, they are for war* (Psalm 120:7) is the *as much as lieth in you* — the peace is held from the psalmist''s side even when the answer is war.'),
    ('canon','psalms',120,7,'canon','matthew',5,44,'free',
      E'*But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you* (Matthew 5:44). The Formed Son carries *I am for peace: but when I speak, they are for war* (Psalm 120:7) to its end — the one who dwells among *him that hateth peace* (Psalm 120:6) is to bless and not curse, victims to be loved, not enemies to be answered in kind.'),
    -- Thread C: I sojourn in Mesech (v.5)
    ('canon','psalms',120,5,'canon','hebrews',11,13,'free',
      E'*These all died in faith, not having received the promises, but having seen them afar off, and were persuaded of them, and embraced them, and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). The pilgrim''s *Woe is me, that I sojourn in Mesech, that I dwell in the tents of Kedar!* (Psalm 120:5) is the faith-confession of the whole cloud of witnesses — *strangers and pilgrims on the earth*, dwelling among the nations while the promise waits afar off.'),
    ('canon','psalms',120,5,'canon','1-peter',2,11,'free',
      E'*Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11). Peter names the scattered of the two houses exactly what the psalmist is — *strangers and pilgrims* who *sojourn in Mesech* and *dwell in the tents of Kedar* (Psalm 120:5), aliens in the nations whose true home is the covenant gathering.'),
    ('canon','psalms',120,5,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The pilgrim scattered into *Mesech* and *the tents of Kedar* (Psalm 120:5) is not cast off — Paul forbids the very thought: the dispersion among the nations is exile, not rejection.'),
    ('canon','psalms',120,5,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The dwelling *in Mesech... in the tents of Kedar* (Psalm 120:5) is the two-house scattering, never replacement — the people Yahuah (LORD) *foreknew* are gathered home, not exchanged for another. He that scattered Yashar''el (Israel) will gather him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps120_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps120_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- C. threads
-- ============================================================
-- Thread A (v.1-4): the deceitful tongue
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-120-deliver-my-soul-from-lying-lips-and-a-deceitful-tongue',
       E'Deliver my soul from lying lips and a deceitful tongue',
       E'The first Song of Ascents opens the pilgrim''s long climb in distress, and the very first thing he must be delivered from is the tongue: *In my distress I cried unto Yahuah (LORD), and he heard me. Deliver my soul, O Yahuah (LORD), from lying lips, and from a deceitful tongue* (Psalm 120:1-2). Its companion psalm sings the same wound — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak* — and promises the answer: *Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:2-3). The psalmist turns and taunts the weapon itself: *What shall be given unto thee? or what shall be done unto thee, thou false tongue? Sharp arrows of the mighty, with coals of juniper* (Psalm 120:3-4). Proverbs names that arrow exactly — *A man that beareth false witness against his neighbour is a maul, and a sword, and a sharp arrow* (Proverbs 25:18) — and steadies him against it: *The lip of truth shall be established for ever: but a lying tongue is but for a moment* (Proverbs 12:19). The apostolic wisdom of James carries the same fire forward: *And the tongue is a fire, a world of iniquity... it defileth the whole body, and setteth on fire the course of nature* (James 3:6); *But the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8) — which is why no son of Adam tames it himself, but cries to be delivered. The restored wisdom of Ben Sira binds the tongue to the exile that the psalm will name in the next breath: *Curse the whisperer and doubletongued: for such have destroyed many that were at peace* (Ecclesiasticus 28:13); *A backbiting tongue has disquieted many, and driven them from nation to nation* (Ecclesiasticus 28:14); and weighs it heavier than any blade — *Many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Ecclesiasticus 28:18). The whole library reads with one voice: the deceitful tongue is the pilgrim''s first enemy, and Yahuah (LORD) hears the cry against it.',
       sv.verse_id, ev.verse_id, 'extras', 24975
  FROM _s302_ps120_lookup sv, _s302_ps120_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=120 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=120 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread B (v.6-7): I am for peace
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-120-i-am-for-peace-but-when-i-speak-they-are-for-war',
       E'I am for peace, but when I speak they are for war',
       E'The pilgrim ends his first ascent with a confession that becomes the whole posture of the covenant walk among hostile nations: *My soul hath long dwelt with him that hateth peace. I am for peace: but when I speak, they are for war* (Psalm 120:6-7). He does not withdraw from the peace-haters; he holds peace from his own side though the answer comes back as war. On the Mount the Formed Son pronounces this very man blessed: *Blessed are the peacemakers: for they shall be called the children of Elohim (God)* (Matthew 5:9) — peace kept among those who hate it is what makes a peacemaker, not peace enjoyed among friends. Paul gives the burden its honest measure: *If it be possible, as much as lieth in you, live peaceably with all men* (Romans 12:18) — *as much as lieth in you* is exactly *I am for peace*, the peace held to the limit of one''s own part even when the other answers with war. And the Son carries it past mere restraint to active love: *Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you* (Matthew 5:44). The one who *long dwelt with him that hateth peace* is not to answer hatred with hatred — the peace-haters are victims of the deceit and the war-spirit, lost sheep to be blessed, never enemies to be cursed in kind. The pilgrim who is *for peace* is already walking the road the Son will name blessed.',
       sv.verse_id, ev.verse_id, 'free', 24978
  FROM _s302_ps120_lookup sv, _s302_ps120_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=120 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=120 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread C (v.5): I sojourn in Mesech, I dwell in the tents of Kedar
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-120-i-sojourn-in-mesech-i-dwell-in-the-tents-of-kedar',
       E'I sojourn in Mesech, I dwell in the tents of Kedar',
       E'At the heart of the first ascent the pilgrim names where he is starting from: *Woe is me, that I sojourn in Mesech, that I dwell in the tents of Kedar!* (Psalm 120:5) — Mesech far to the north, Kedar far to the south, a deliberate geography of exile that means *everywhere among the nations and nowhere home*. This is the two-house dispersion in one breath: Yashar''el (Israel) scattered into the lands, dwelling among peoples not its own, beginning the long climb back toward the gathering. Hebrews names this the faith-confession of the whole cloud of witnesses: *These all died in faith, not having received the promises, but having seen them afar off... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). Peter writes it straight to the scattered of the houses: *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11) — aliens in the nations whose true citizenship is the covenant home. But the scattering is never a casting-off. Paul forbids the thought outright: *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The dwelling in Mesech and Kedar is exile, not rejection — He that scattered Yashar''el (Israel) will gather him, and the pilgrim on the road of ascents is walking that very gathering home.',
       sv.verse_id, ev.verse_id, 'free', 24981
  FROM _s302_ps120_lookup sv, _s302_ps120_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=120 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=120 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- D. thread_members
-- ============================================================
-- Thread A members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',120,2,'canon','psalms',12,2,1,
      E'*They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak* (Psalm 12:2) — the companion psalm''s *double heart* is the *deceitful tongue* of Psalm 120:2.'),
    ('psalms',120,2,'canon','psalms',12,3,2,
      E'*Yahuah (LORD) shall cut off all flattering lips, and the tongue that speaketh proud things* (Psalm 12:3) — Yahuah''s vow to perform the deliverance the pilgrim prays.'),
    ('psalms',120,3,'canon','psalms',12,3,3,
      E'*Yahuah (LORD) shall cut off all flattering lips...* (Psalm 12:3) — the recompense earned by *thou false tongue* (Psalm 120:3).'),
    ('psalms',120,2,'canon','proverbs',12,19,4,
      E'*The lip of truth shall be established for ever: but a lying tongue is but for a moment* (Proverbs 12:19) — the lying tongue endures only a moment; truth, for ever.'),
    ('psalms',120,4,'canon','proverbs',25,18,5,
      E'*A man that beareth false witness against his neighbour is a maul, and a sword, and a sharp arrow* (Proverbs 25:18) — Proverbs names the *sharp arrows* of Psalm 120:4 as the false witness''s own tongue.'),
    ('psalms',120,3,'canon','james',3,8,6,
      E'*But the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8) — the untameable *false tongue* none can govern alone.'),
    ('psalms',120,2,'canon','james',3,6,7,
      E'*And the tongue is a fire, a world of iniquity... it defileth the whole body* (James 3:6) — why the *deceitful tongue* must be cried against.'),
    ('psalms',120,2,'apocrypha','ecclesiasticus',28,13,8,
      E'*Curse the whisperer and doubletongued: for such have destroyed many that were at peace* (Ecclesiasticus 28:13) — Ben Sira names the doubletongued who unmake peace.'),
    ('psalms',120,5,'apocrypha','ecclesiasticus',28,14,9,
      E'*A backbiting tongue has... driven them from nation to nation* (Ecclesiasticus 28:14) — the tongue and the exile bound as one, the very *Mesech... Kedar* scattering.'),
    ('psalms',120,3,'apocrypha','ecclesiasticus',28,18,10,
      E'*Many have fallen by the edge of the sword: but not so many as have fallen by the tongue* (Ecclesiasticus 28:18) — the tongue deadlier than the *sharp arrows* of Psalm 120:4.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-120-deliver-my-soul-from-lying-lips-and-a-deceitful-tongue'
  JOIN _s302_ps120_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps120_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread B members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',120,6,'canon','matthew',5,9,1,
      E'*Blessed are the peacemakers: for they shall be called the children of Elohim (God)* (Matthew 5:9) — peace held among the peace-haters of Psalm 120:6 is the peacemaker''s blessedness.'),
    ('psalms',120,7,'canon','matthew',5,9,2,
      E'*Blessed are the peacemakers...* (Matthew 5:9) — *I am for peace* (Psalm 120:7) is the very posture the Son names blessed.'),
    ('psalms',120,7,'canon','romans',12,18,3,
      E'*If it be possible, as much as lieth in you, live peaceably with all men* (Romans 12:18) — peace held from one''s own side even when the answer is war.'),
    ('psalms',120,7,'canon','matthew',5,44,4,
      E'*Love your enemies, bless them that curse you, do good to them that hate you* (Matthew 5:44) — the peace-haters loved as victims, not cursed as enemies.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-120-i-am-for-peace-but-when-i-speak-they-are-for-war'
  JOIN _s302_ps120_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps120_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread C members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('psalms',120,5,'canon','hebrews',11,13,1,
      E'*...confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13) — the faith-confession of the cloud of witnesses, the pilgrim sojourning among the nations.'),
    ('psalms',120,5,'canon','1-peter',2,11,2,
      E'*I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11) — the scattered of the houses named strangers and pilgrims.'),
    ('psalms',120,5,'canon','romans',11,1,3,
      E'*Hath Elohim (God) cast away his people? Elohim (God) forbid...* (Romans 11:1) — the dispersion is exile, not rejection (two-house guard).'),
    ('psalms',120,5,'canon','romans',11,2,4,
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — scattering, never replacement; the foreknown people gathered home.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-120-i-sojourn-in-mesech-i-dwell-in-the-tents-of-kedar'
  JOIN _s302_ps120_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps120_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
