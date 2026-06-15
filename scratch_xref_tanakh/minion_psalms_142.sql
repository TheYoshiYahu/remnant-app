-- ----- fragment: minion_psalms_142.sql (Psalm 142) -----
-- Chapter: Psalm 142 ("Maschil of David; A Prayer when he was in the cave" — the cave-prayer of the hunted)
-- Tag: ps142   Session prefix: s302   Sort band base: 25525   Temp view: _s302_ps142_lookup
-- Slug prefix: psalm-142-  (SINGULAR)   |  verse-lookup book_slug stays PLURAL 'psalms'
--
-- Psalm 142 coverage:
--   v.1-2  NT:     Hebrews 5:7 (the Formed Son in the days of his flesh, strong crying) — USED
--          Extras: none warranted (cave-lament; no extra-canonical witness adds)
--          Tanakh: Psalm 62:8 (pour out your heart before him) — USED
--   v.3    NT:     none warranted (covered laterally by Ps 139)
--          Extras: none warranted
--          Tanakh: Psalm 139:1-3 (thou knowest my path); Psalm 56:13 (walk before Elohim in the light) — Ps 139 USED
--   v.3-4  NT:     Matthew 26:56 (all the disciples forsook him) — USED
--          Extras: none warranted
--          Tanakh: Psalm 31:11 (a reproach, they fled from me); Psalm 88:18 (lover and friend put far) ;
--                  1 Samuel 22:1 (the cave Adullam — the historical frame of the superscription) — all USED
--   v.5    NT:     none warranted (the portion-figure is filled laterally and held for the gathering theme)
--          Extras: none warranted
--          Tanakh: Psalm 16:5 (Yahuah the portion of mine inheritance); Psalm 73:26 (my portion for ever);
--                  Lamentations 3:24 (Yahuah is my portion, saith my soul) — all USED
--   v.6    NT:     none warranted
--          Extras: none warranted
--          Tanakh: covered within v.6-7 thread (Ps 143:11)
--   v.7    NT:     none warranted (Acts 16 prison-deliverance NOT warranted — eisegetical leap; held)
--          Extras: none warranted
--          Tanakh: Psalm 143:11 (bring my soul out of trouble) — USED ; Psalm 62:8 already bound above
--
-- THREADS (4):
--   psalm-142-i-poured-out-my-complaint-before-him          [Tanakh + NT]  vv.1-2  (Ps 62:8; Heb 5:7)
--   psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous [Tanakh + NT] vv.3-4  (1 Sam 22:1; Ps 139:1; Ps 31:11; Ps 88:18; Matt 26:56)
--   psalm-142-thou-art-my-refuge-and-my-portion             [Tanakh]       v.5     (Ps 16:5; Ps 73:26; Lam 3:24)
--   psalm-142-bring-my-soul-out-of-prison-the-righteous-compass-me [Tanakh] vv.6-7 (Ps 143:11)
--
-- FRAMEWORK / LOAD-BEARING NOTES:
--   * v.1-2 strong crying → Hebrews 5:7 reads the cave-lament FORWARD onto the Formed Son
--     "in the days of his flesh... with strong crying and tears" — the type fulfilled (Christology lens 4/5).
--   * v.3-4 "no man cared for my soul / refuge failed me" → Matthew 26:56 "all the disciples forsook him"
--     framed as VICTIM-not-enemy: the forsaken righteous, not a curse on any people (lens 7). The cave
--     itself (1 Sam 22:1, the cave Adullam) is the superscription's own historical anchor — bound laterally.
--   * v.5 "my refuge and my portion in the land of the living" → the Levite's lot (Lam 3:24, Yahuah my portion),
--     the inheritance-portion (Ps 16:5) — Yahuah-as-inheritance, the covenant heritage figure.
--   * vv.6-7 "bring my soul out of prison... the righteous shall compass me about" — the prison/pit →
--     deliverance figure, ending in the GATHERED righteous = the congregation restored (two-house ingathering
--     read soberly: the righteous compassing him about as the restored assembly). Acts 16 deliberately NOT
--     bound (literal-prison leap unwarranted).

CREATE TEMP VIEW _s302_ps142_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- vv.1-2 pour out the complaint
    ('canon','psalms',142,2,'canon','psalms',62,8,'free',
     E'*Trust in him at all times; ye people, pour out your heart before him: Elohim (God) is a refuge for us. Selah.* (Psalm 62:8). David''s *I poured out my complaint before him; I shewed before him my trouble* (Psalm 142:2) is this very counsel obeyed from inside the cave — the hunted soul emptying itself before Yahuah (LORD), who is named here a refuge, the same word the cave-prayer climbs toward in v.5.'),
    ('canon','psalms',142,1,'canon','hebrews',5,7,'free',
     E'*Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared;* (Hebrews 5:7). The cave-cry *I cried unto Yahuah (LORD) with my voice; with my voice unto Yahuah (LORD) did I make my supplication* (Psalm 142:1) is read FORWARD onto the Formed Son — Yahusha (Jesus) in the days of his flesh, the hunted righteous one whose strong crying was heard. The type David bears, the Son fills.'),

    -- vv.3-4 the snare hid + no man cared (the forsaken righteous)
    ('canon','psalms',142,3,'canon','psalms',139,1,'free',
     E'*O Yahuah (LORD), thou hast searched me, and known me.* (Psalm 139:1). When David says *When my spirit was overwhelmed within me, then thou knewest my path* (Psalm 142:3), he leans on the same knowledge the companion psalm unfolds — Yahuah (LORD) who has *searched me, and known me*, who *compassest my path* (139:3). The snare is hidden from the man but never from the One who knows the path.'),
    ('canon','psalms',142,4,'canon','psalms',31,11,'free',
     E'*I was a reproach among all mine enemies, but especially among my neighbours, and a fear to mine acquaintance: they that did see me without fled from me.* (Psalm 31:11). This is the same desolation as *I looked on my right hand, and beheld, but there was no man that would know me... no man cared for my soul* (Psalm 142:4) — the righteous man abandoned, watched, deserted; the victim, never the enemy.'),
    ('canon','psalms',142,4,'canon','psalms',88,18,'free',
     E'*Lover and friend hast thou put far from me, and mine acquaintance into darkness.* (Psalm 88:18). The bleakest of the laments echoes the cave-prayer''s *refuge failed me; no man cared for my soul* (Psalm 142:4) — every human refuge stripped away so that Yahuah (LORD) alone remains the refuge of v.5.'),
    ('canon','psalms',142,4,'canon','matthew',26,56,'free',
     E'*But all this was done, that the scriptures of the prophets might be fulfilled. Then all the disciples forsook him, and fled.* (Matthew 26:56). The forsaken-righteous figure of *there was no man that would know me... no man cared for my soul* (Psalm 142:4) is filled in the Formed Son, deserted by all in his hour — the type of the abandoned just one carried forward.'),
    ('canon','psalms',142,4,'canon','1-samuel',22,1,'free',
     E'*David therefore departed thence, and escaped to the cave Adullam: and when his brethren and all his father''s house heard it, they went down thither to him.* (1 Samuel 22:1). This is the cave the superscription names — *A Prayer when he was in the cave*. The lament''s *no man cared for my soul* (Psalm 142:4) is spoken from this hiding place, where the hunted David, refuge failing, cried out to Yahuah (LORD).'),

    -- v.5 refuge and portion in the land of the living
    ('canon','psalms',142,5,'canon','psalms',16,5,'free',
     E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot.* (Psalm 16:5). David''s confession *Thou art my refuge and my portion in the land of the living* (Psalm 142:5) names Yahuah (LORD) himself the inheritance — not land, not deliverance, but the covenant Elohim (God) as the lot, the heritage that holds when every earthly refuge has failed.'),
    ('canon','psalms',142,5,'canon','psalms',73,26,'free',
     E'*My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever.* (Psalm 73:26). The same word — Yahuah (LORD) as *my portion* — answers *Thou art my refuge and my portion in the land of the living* (Psalm 142:5): the portion that outlasts failing flesh, in the land of the living and beyond it.'),
    ('canon','psalms',142,5,'canon','lamentations',3,24,'free',
     E'*Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him.* (Lamentations 3:24). This is the Levite''s lot — the tribe with no land-inheritance because Yahuah (LORD) himself is their portion — and David claims it as his own in the cave: *Thou art my refuge and my portion in the land of the living* (Psalm 142:5).'),

    -- vv.6-7 out of prison, the righteous compass me about
    ('canon','psalms',142,7,'canon','psalms',143,11,'free',
     E'*Quicken me, O Yahuah (LORD), for thy name''s sake: for thy righteousness'' sake bring my soul out of trouble.* (Psalm 143:11). The twin cry — *Bring my soul out of prison, that I may praise thy name* (Psalm 142:7) — is the same plea for the Name''s sake: deliverance from the pit unto praise, the prison-figure opened so the rescued soul can magnify Yahuah (LORD).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps142_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps142_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1: vv.1-2 — I poured out my complaint before him
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-142-i-poured-out-my-complaint-before-him',
       E'I poured out my complaint before him',
       E'From inside the cave the hunted David does the one thing left to a man whose every refuge has failed: *I cried unto Yahuah (LORD) with my voice; with my voice unto Yahuah (LORD) did I make my supplication. I poured out my complaint before him; I shewed before him my trouble* (Psalm 142:1-2). This is the counsel of the companion psalm obeyed — *Trust in him at all times; ye people, pour out your heart before him: Elohim (God) is a refuge for us* (Psalm 62:8). And the cave-cry reaches FORWARD: the Formed Son fills the type — *Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared* (Hebrews 5:7). The hunted righteous one, emptying his soul before Yahuah (LORD), heard.',
       sv.verse_id, ev.verse_id, 'free', 25525
  FROM _s302_ps142_lookup sv, _s302_ps142_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=142 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2: vv.3-4 — no man cared for my soul (the forsaken righteous)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous',
       E'No man cared for my soul — the forsaken righteous',
       E'The superscription anchors the whole prayer: *A Prayer when he was in the cave* — *David therefore departed thence, and escaped to the cave Adullam* (1 Samuel 22:1). From that hiding place comes the loneliest verse in the psalter: *When my spirit was overwhelmed within me, then thou knewest my path. In the way wherein I walked have they privily laid a snare for me. I looked on my right hand, and beheld, but there was no man that would know me: refuge failed me; no man cared for my soul* (Psalm 142:3-4). The snare is hidden from the man but never from the One who knows the path — *O Yahuah (LORD), thou hast searched me, and known me* (Psalm 139:1). The desolation is the same as *they that did see me without fled from me* (Psalm 31:11) and *Lover and friend hast thou put far from me, and mine acquaintance into darkness* (Psalm 88:18). This is the VICTIM, never the enemy — and the Formed Son fills it: *Then all the disciples forsook him, and fled* (Matthew 26:56). Every human refuge stripped away, so that Yahuah (LORD) alone may be the refuge of the next verse.',
       sv.verse_id, ev.verse_id, 'free', 25526
  FROM _s302_ps142_lookup sv, _s302_ps142_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=142 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3: v.5 — Thou art my refuge and my portion
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-142-thou-art-my-refuge-and-my-portion',
       E'Thou art my refuge and my portion in the land of the living',
       E'When every man has failed him, David turns and names what does not fail: *I cried unto thee, O Yahuah (LORD): I said, Thou art my refuge and my portion in the land of the living* (Psalm 142:5). The word *portion* is covenant-weighted — it is Yahuah (LORD) himself claimed as the inheritance: *Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). It is the portion that outlasts failing flesh — *My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26). And it is the Levite''s very lot, the tribe given no land because Yahuah (LORD) is their inheritance — *Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). In the cave, with no land and no friend, David takes the Levite''s portion: Yahuah (LORD) himself.',
       sv.verse_id, ev.verse_id, 'free', 25527
  FROM _s302_ps142_lookup sv, _s302_ps142_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=142 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4: vv.6-7 — bring my soul out of prison, the righteous shall compass me about
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-142-bring-my-soul-out-of-prison-the-righteous-compass-me',
       E'Bring my soul out of prison — the righteous shall compass me about',
       E'The cave-prayer ends not in despair but in the assurance of deliverance and the gathered congregation: *Attend unto my cry; for I am brought very low: deliver me from my persecutors; for they are stronger than I. Bring my soul out of prison, that I may praise thy name: the righteous shall compass me about; for thou shalt deal bountifully with me* (Psalm 142:6-7). The prison is the pit, the cave, the closing-in of the hunters — and the plea is for the Name''s sake, the same twin cry that closes the companion psalm: *Quicken me, O Yahuah (LORD), for thy name''s sake: for thy righteousness'' sake bring my soul out of trouble* (Psalm 143:11). Deliverance opens unto praise; and the rescued soul is not left solitary — *the righteous shall compass me about*, the scattered hunted one set in the midst of the gathered assembly, the congregation restored about him.',
       sv.verse_id, ev.verse_id, 'free', 25528
  FROM _s302_ps142_lookup sv, _s302_ps142_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=142 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS — Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 62:8 — *pour out your heart before him: Elohim (God) is a refuge for us* — the counsel David obeys in the cave.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=2
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-i-poured-out-my-complaint-before-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 5:7 — the Formed Son *in the days of his flesh... with strong crying and tears... was heard* — the type filled.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=1
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-i-poured-out-my-complaint-before-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 22:1 — *escaped to the cave Adullam* — the cave the superscription names.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=4
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 139:1 — *thou hast searched me, and known me* — the path the snare-layers cannot hide from Yahuah (LORD).'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=3
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 31:11 — *they that did see me without fled from me* — the same deserted-righteous desolation.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=4
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 88:18 — *Lover and friend hast thou put far from me* — every human refuge stripped away.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=4
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=88 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Matthew 26:56 — *all the disciples forsook him, and fled* — the forsaken-righteous type filled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=4
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-no-man-cared-for-my-soul-the-forsaken-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 16:5 — *Yahuah (LORD) is the portion of mine inheritance and of my cup* — Yahuah himself claimed as the lot.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=5
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-thou-art-my-refuge-and-my-portion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 73:26 — *Elohim (God) is... my portion for ever* — the portion that outlasts failing flesh.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=5
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-thou-art-my-refuge-and-my-portion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lamentations 3:24 — *Yahuah (LORD) is my portion, saith my soul* — the Levite''s lot, claimed in the cave.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=5
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-thou-art-my-refuge-and-my-portion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 143:11 — *for thy name''s sake... bring my soul out of trouble* — the twin cry: deliverance unto praise of the Name.'
  FROM cross_reference_threads t
  JOIN _s302_ps142_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=142 AND sv.verse_number=7
  JOIN _s302_ps142_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-142-bring-my-soul-out-of-prison-the-righteous-compass-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
