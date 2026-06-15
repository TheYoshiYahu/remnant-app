-- ----- fragment: minion_psalms_6.sql (Psalm 6) -----
-- Chapter: Psalm 6 — THE FIRST of the seven Penitential Psalms. A Davidic cry under the chastening
-- hand: *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure*
-- (v.1, the exact twin of Psalm 38:1) — covenant CORRECTION sought without the consuming wrath; the
-- rod of a Father, never the curse. *Have mercy upon me, O Yahuah (LORD)... heal me; for my bones are
-- vexed* (v.2). At the floor of the prayer is the Sheol-silence motif: *For in death there is no
-- remembrance of thee: in the grave who shall give thee thanks?* (v.5) — the same plea sung across the
-- psalter (Ps 30:9, 88:10-12, 115:17) and by Hezekiah at the gates of the grave (Isaiah 38:18-19), and
-- echoed in the restored wisdom-witnesses (Sirach 17:27-28; Baruch 2:17-18): the living praise, the
-- dead are silent — so spare me to praise thee. Then the turn: the prayer is heard — *Depart from me,
-- all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (v.8), the very
-- word Yahusha (Jesus) takes on his own lips in the judgment — *depart from me, ye that work iniquity*
-- (Matthew 7:23) / *depart from me, all ye workers of iniquity* (Luke 13:27).
-- Tag: ps006   Temp view: _s302_ps006_lookup
-- Sort band: base 22125, step 3 -> threads at 22125, 22128, 22131 (3 threads)
-- Source of EVERY row: 'canon','psalms',6,v
--
-- Psalm 6 coverage:
--   ★ v.1 (O Yahuah, rebuke me not in thine anger, neither chasten me in thy hot displeasure)
--        NT:     none warranted — the chastening-not-in-wrath weave is the psalter's own twin (Ps 38:1);
--                no NT verse quotes it; the Hebrews-12 fatherly-chastening theme is carried in prose, not
--                forced as a member.
--        Extras: none warranted (no clean restored witness adds to the chastening-not-in-anger plea here)
--        Tanakh: ★ Psalm 38:1 (rebuke me not in thy wrath: neither chasten me in thy hot displeasure —
--                the verbatim twin, the other penitential opening) — THREAD 1
--   v.2 (Have mercy upon me, O Yahuah; for I am weak: O Yahuah, heal me; for my bones are vexed)
--        NT/Extras/Tanakh: none warranted distinct — the cry for mercy and healing; gathered into the
--          chastening-prayer of THREAD 1 (the same vexed bones, the same plea for the Father's hand to
--          heal rather than crush).
--   v.3 (My soul is also sore vexed: but thou, O Yahuah, how long?)
--        NT/Extras/Tanakh: none warranted distinct — the *how long?* lament; carried in THREAD 1 prose.
--   v.4 (Return, O Yahuah, deliver my soul: oh save me for thy mercies' sake)
--        NT/Extras/Tanakh: none warranted distinct — the appeal to mercy that grounds v.5's argument;
--          carried in THREAD 2 prose (saved for mercy's sake = spared to praise).
--   ★ v.5 (For in death there is no remembrance of thee: in the grave who shall give thee thanks?)
--        NT:     none warranted — the Sheol-silence plea is wholly a Tanakh/Second-Temple motif; its NT
--                answer is the resurrection, carried in prose, not a verbatim member here.
--        Extras: ★ Sirach 17:27-28 (Who shall praise the Most High in the grave... Thanksgiving perishes
--                from the dead... the living and sound in heart shall praise Yahuah), ★ Baruch 2:17-18
--                (the dead that are in the graves... will give to Yahuah neither praise nor righteousness:
--                But the soul that is greatly vexed... will give you praise) — THREAD 2
--        Tanakh: ★ Psalm 30:9 (What profit is there in my blood, when I go down to the pit? Shall the dust
--                praise thee?), ★ Psalm 88:10-12 (shall the dead arise and praise thee?... Shall thy
--                lovingkindness be declared in the grave?... in the land of forgetfulness?), ★ Psalm
--                115:17 (The dead praise not Yahuah, neither any that go down into silence), ★ Isaiah
--                38:18-19 (the grave cannot praise thee... The living, the living, he shall praise thee) —
--                THREAD 2
--   v.6 (I am weary with my groaning; all the night make I my bed to swim; I water my couch with my tears)
--        NT/Extras/Tanakh: none warranted distinct — the night of tears; gathered into THREAD 3 (the
--          *voice of my weeping* Yahuah hears, v.8).
--   v.7 (Mine eye is consumed because of grief; it waxeth old because of all mine enemies)
--        NT/Extras/Tanakh: none warranted distinct — the grief-worn eye and the enemies; carried into
--          THREAD 3 (the workers of iniquity put to flight when the weeping is heard).
--   ★ v.8 (Depart from me, all ye workers of iniquity; for Yahuah hath heard the voice of my weeping)
--        NT:     ★★ Matthew 7:23 (then will I profess unto them, I never knew you: depart from me, ye that
--                work iniquity), ★★ Luke 13:27 (I know you not whence ye are; depart from me, all ye workers
--                of iniquity) — Yahusha takes the psalmist's own word onto his lips in the judgment —
--                THREAD 3 (load-bearing)
--        Extras: none warranted
--        Tanakh: none warranted distinct — the *depart from me* is fulfilled FORWARD on the Formed Son's
--                lips; no closer Tanakh lateral than the psalm's own turn.
--   v.9 (Yahuah hath heard my supplication; Yahuah will receive my prayer)
--        NT/Extras/Tanakh: none warranted distinct — the answered-prayer refrain; carried in THREAD 3
--          prose (the weeping heard, the prayer received).
--   v.10 (Let all mine enemies be ashamed and sore vexed: let them return and be ashamed suddenly)
--        NT/Extras/Tanakh: none warranted distinct — the closing reversal upon the enemies; the *sore
--          vexed* turned back on them (v.10) answers the psalmist's own *bones are vexed* (v.2); gathered
--          into THREAD 3 prose, not a separate add.
--
-- Threads (slug — target libraries):
--   1. psalm-6-rebuke-me-not-in-thine-anger — Tanakh (Psalm 38) [free] (the chastening-not-in-wrath;
--      covenant correction, the Father's rod, never the curse — twin of Ps 38:1)
--   2. psalm-6-in-death-there-is-no-remembrance-of-thee — Tanakh (Psalm 30, Psalm 88, Psalm 115, Isaiah
--      38) + Extras (Sirach 17, Baruch 2) [extras] (★ the Sheol-silence motif: the living praise, the
--      dead are silent — spare me to praise thee)
--   3. psalm-6-depart-from-me-all-ye-workers-of-iniquity — NT (Matthew 7, Luke 13) [free] (★★ the
--      psalmist's own word on the Formed Son's lips in the judgment)
--
-- Framing notes:
--   ★ THE CHASTENING NOT IN WRATH (THREAD 1): *O Yahuah (LORD), rebuke me not in thine anger, neither
--      chasten me in thy hot displeasure* (6:1) is the verbatim twin of *O Yahuah (LORD), rebuke me not
--      in thy wrath: neither chasten me in thy hot displeasure* (Psalm 38:1) — the two penitential psalms
--      open with the SAME plea. Read through the framework: the psalmist does NOT ask to escape correction
--      — he asks that the correction come as a Father's rod and not as the consuming covenant-wrath. The
--      curse is the Deuteronomy-28 wrath upon covenant-breaking; the chastening is the Father's love that
--      heals the *bones... vexed* (6:2) rather than crushing them. *Return, O Yahuah (LORD), deliver my
--      soul: oh save me for thy mercies' sake* (6:4): mercy, not merit, is the ground. The same hand that
--      wounds binds up.
--   ★ THE SHEOL-SILENCE (THREAD 2): *For in death there is no remembrance of thee: in the grave who shall
--      give thee thanks?* (6:5). This is the psalter's recurring argument from the edge of the pit: the
--      living are the ones who praise, so spare me to praise thee. *What profit is there in my blood, when
--      I go down to the pit? Shall the dust praise thee? shall it declare thy truth?* (Psalm 30:9); *Wilt
--      thou shew wonders to the dead? shall the dead arise and praise thee?... Shall thy lovingkindness be
--      declared in the grave?... and thy righteousness in the land of forgetfulness?* (Psalm 88:10-12);
--      *The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17). Hezekiah
--      prays it at the gates of the grave and is given fifteen years: *the grave cannot praise thee, death
--      can not celebrate thee... The living, the living, he shall praise thee, as I do this day* (Isaiah
--      38:18-19). The restored wisdom-witnesses sing the same: *Who shall praise the Most High in the
--      grave, instead of them which live and give thanks? Thanksgiving perishes from the dead... the living
--      and sound in heart shall praise Yahuah (God)* (Sirach 17:27-28); *the dead that are in the graves...
--      will give to Yahuah (God) neither praise nor righteousness: But the soul that is greatly vexed...
--      will give you praise* (Baruch 2:17-18) — Baruch's *soul that is greatly vexed* is the psalmist's
--      own *soul... sore vexed* (6:3). The whole canon holds one motif here: praise belongs to the living;
--      the resurrection of the body (carried in prose, the NT answer) is what finally fills the silence.
--   ★★ DEPART FROM ME, YE WORKERS OF INIQUITY (THREAD 3): the prayer turns when it is heard — *Depart from
--      me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (6:8). Yahusha
--      (Jesus) takes the psalmist's very word onto his own lips in the judgment: *And then will I profess
--      unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23); *But he shall
--      say, I tell you, I know you not whence ye are; depart from me, all ye workers of iniquity* (Luke
--      13:27). Read through the Formed and the Formless: the One who speaks the dismissal in the judgment
--      speaks the psalmist's own line — the Formed Son who *hath heard the voice of my weeping* is the same
--      Yahuah to whom Psalm 6 cried. And note the Torah-filter (1 John 2:3-4): in Matthew 7 the dismissed
--      are the ones who prophesied and worked wonders in the Name yet *work iniquity* (anomia, lawlessness)
--      — it is the lawless, not the law-keepers, who are sent away; the psalm's *workers of iniquity* are
--      named by the same standard.
--   EXTRAS: warranted and taken at v.5 (Sirach 17:27-28, Baruch 2:17-18 — both clean Sheol-silence
--      witnesses, Baruch's *soul... greatly vexed* a direct echo). NONE WARRANTED elsewhere, a deliberate
--      recorded answer; SKIP 1En62:5 per brief. The thread carrying any extras member is tier 'extras'.
--   VERSES WITH NO DISTINCT ADD: v.2-4 (mercy/healing/return — gathered into THREAD 1/2 prose), v.6-7
--      (the night of tears and grief-worn eye — gathered into THREAD 3, the *voice of my weeping* heard),
--      v.9-10 (the answered-prayer refrain + the reversal on the enemies — gathered into THREAD 3): the
--      frame the three keystones rise from; no separate framework-bearing target warranted beyond the
--      gathered prose.

CREATE TEMP VIEW _s302_ps006_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Rebuke me not in thine anger (the chastening-not-in-wrath; twin of Ps 38:1)
    ('canon','psalms',6,1,'canon','psalms',38,1,'free',
      E'*O Yahuah (LORD), rebuke me not in thy wrath: neither chasten me in thy hot displeasure* (Psalm 38:1). The first penitential psalm''s opening is the verbatim twin of this one: *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure* (Psalm 6:1). The psalmist does not ask to escape correction but that it come as a Father''s rod and not as the consuming covenant-wrath — the chastening that heals the *bones... vexed* (6:2), never the curse that crushes.'),

    -- THREAD 2 (★): In death there is no remembrance of thee (the Sheol-silence motif)
    ('canon','psalms',6,5,'canon','psalms',30,9,'free',
      E'*What profit is there in my blood, when I go down to the pit? Shall the dust praise thee? shall it declare thy truth?* (Psalm 30:9). *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalm 6:5) is the psalter''s own recurring argument from the edge of the pit — the dust cannot praise, so spare the living to praise thee. The plea is the same: there is no profit in the silence of the grave.'),
    ('canon','psalms',6,5,'canon','psalms',88,10,'free',
      E'*Wilt thou shew wonders to the dead? shall the dead arise and praise thee? Selah* (Psalm 88:10). The Sheol-silence of *in the grave who shall give thee thanks?* (Psalm 6:5) is the darkest penitential psalm''s very question — *shall the dead arise and praise thee?* The dead do not declare His wonders; the living do, and so the psalmist begs to be kept among them.'),
    ('canon','psalms',6,5,'canon','psalms',88,11,'free',
      E'*Shall thy lovingkindness be declared in the grave? or thy faithfulness in destruction?* (Psalm 88:11). *In the grave who shall give thee thanks?* (Psalm 6:5): the grave declares no lovingkindness, the place of destruction no faithfulness. The argument is one — praise and proclamation belong to the living, not to *the land of forgetfulness* (88:12).'),
    ('canon','psalms',6,5,'canon','psalms',115,17,'free',
      E'*The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17). This is the motif of *in death there is no remembrance of thee* (Psalm 6:5) stated plainest: *the dead praise not Yahuah (LORD), neither any that go down into silence.* The grave is silence; praise is the breath of the living — *But we will bless Yahuah (LORD) from this time forth* (115:18).'),
    ('canon','psalms',6,5,'canon','isaiah',38,18,'free',
      E'*For the grave cannot praise thee, death can not celebrate thee: they that go down into the pit cannot hope for thy truth. The living, the living, he shall praise thee, as I do this day* (Isaiah 38:18-19). Hezekiah, sick unto death, prays the very plea of Psalm 6:5 — *in the grave who shall give thee thanks?* — and is given fifteen years to praise: *the grave cannot praise thee... The living, the living, he shall praise thee.* The penitent''s argument at the gates of the grave, answered with added days.'),
    ('canon','psalms',6,5,'apocrypha','ecclesiasticus',17,27,'extras',
      E'*Who shall praise the Most High in the grave, instead of them which live and give thanks? Thanksgiving perishes from the dead, as from one that is not: the living and sound in heart shall praise Yahuah (God)* (Sirach 17:27-28). The restored wisdom-witness sings the very motif of *in death there is no remembrance of thee* (Psalm 6:5): praise belongs to the living, not the dead — *the living and sound in heart shall praise Yahuah (God).* The same Second-Temple instinct that grounds the penitent''s plea.'),
    ('canon','psalms',6,5,'apocrypha','baruch-with-the-letter-of-jeremiah',2,17,'extras',
      E'*Open your eyes, and behold; for the dead that are in the graves, whose souls are taken from their bodies, will give to Yahuah (God) neither praise nor righteousness: But the soul that is greatly vexed, which goes stooping and feeble, and the eyes that fail, and the hungry soul, will give you praise* (Baruch 2:17-18). Baruch pleads the same ground as Psalm 6:5 — *in the grave who shall give thee thanks?* — and his *soul that is greatly vexed... the eyes that fail* is the psalmist''s own *soul... sore vexed* (6:3) and *mine eye is consumed because of grief* (6:7). The vexed living praise; the dead in the graves are silent.'),

    -- THREAD 3 (★★): Depart from me, all ye workers of iniquity (Yahusha takes the psalmist's word)
    ('canon','psalms',6,8,'canon','matthew',7,23,'free',
      E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The psalmist''s turn when his prayer is heard — *Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8) — is the very word Yahusha (Jesus) speaks in the judgment: *depart from me, ye that work iniquity.* Read through the Formed and the Formless, the One who dismisses the lawless in that day speaks Psalm 6''s own line; and note who is sent away — those who prophesied and cast out devils in the Name yet *work iniquity* (anomia, lawlessness), not the law-keepers.'),
    ('canon','psalms',6,8,'canon','luke',13,27,'free',
      E'*But he shall say, I tell you, I know you not whence ye are; depart from me, all ye workers of iniquity* (Luke 13:27). Yahusha (Jesus) takes the psalmist''s word almost unaltered: *depart from me, all ye workers of iniquity* — the exact cry of *Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8). The Formed Son who hears the voice of the weeping is the same Yahuah to whom Psalm 6 cried; the dismissal at the shut door is the psalm''s own turn made the judgment of the world.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps006_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps006_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-6-rebuke-me-not-in-thine-anger',
       E'Rebuke me not in thine anger — the chastening that heals, never the curse',
       E'The first of the seven Penitential Psalms opens with a plea that is the verbatim twin of the next penitential psalm: *O Yahuah (LORD), rebuke me not in thine anger, neither chasten me in thy hot displeasure* (Psalm 6:1) — *O Yahuah (LORD), rebuke me not in thy wrath: neither chasten me in thy hot displeasure* (Psalm 38:1). Read through the framework, this is not a request to escape correction but to receive it as a Father''s rod and not as the consuming covenant-wrath. The curse is the Deuteronomy-28 wrath upon covenant-breaking; the chastening is the love that heals rather than crushes: *Have mercy upon me, O Yahuah (LORD); for I am weak: O Yahuah (LORD), heal me; for my bones are vexed* (6:2). The ground of the appeal is mercy, never merit: *Return, O Yahuah (LORD), deliver my soul: oh save me for thy mercies'' sake* (6:4). The same hand that wounds in correction binds up — the psalmist asks the Father to temper the rod, not to lay it down.',
       sv.verse_id, ev.verse_id, 'free', 22125
  FROM _s302_ps006_lookup sv, _s302_ps006_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★) — carries extras members -> tier 'extras'
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-6-in-death-there-is-no-remembrance-of-thee',
       E'In death there is no remembrance of thee — the living praise, the dead are silent',
       E'At the floor of the penitent''s prayer is the Sheol-silence motif: *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalm 6:5). It is the psalter''s recurring argument from the edge of the pit — praise belongs to the living, so spare me to praise thee. *What profit is there in my blood, when I go down to the pit? Shall the dust praise thee? shall it declare thy truth?* (Psalm 30:9); *Wilt thou shew wonders to the dead? shall the dead arise and praise thee?... Shall thy lovingkindness be declared in the grave? or thy faithfulness in destruction?... in the land of forgetfulness?* (Psalm 88:10-12); *The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17). Hezekiah prays it at the gates of the grave and is granted fifteen years: *the grave cannot praise thee, death can not celebrate thee... The living, the living, he shall praise thee, as I do this day* (Isaiah 38:18-19). The restored wisdom-witnesses sing the same: *Who shall praise the Most High in the grave, instead of them which live and give thanks? Thanksgiving perishes from the dead... the living and sound in heart shall praise Yahuah (God)* (Sirach 17:27-28); *the dead that are in the graves... will give to Yahuah (God) neither praise nor righteousness: But the soul that is greatly vexed... will give you praise* (Baruch 2:17-18) — and Baruch''s *soul that is greatly vexed* is the psalmist''s own *soul... sore vexed* (6:3). The whole canon holds one motif: praise is the breath of the living; the resurrection of the body is what finally fills the silence — the answer Psalm 6 reaches toward but does not yet see.',
       sv.verse_id, ev.verse_id, 'extras', 22128
  FROM _s302_ps006_lookup sv, _s302_ps006_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-6-depart-from-me-all-ye-workers-of-iniquity',
       E'Depart from me, all ye workers of iniquity — the psalmist''s word on the Formed Son''s lips',
       E'The penitent''s prayer turns the moment it is heard: *Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8); *Yahuah (LORD) hath heard my supplication; Yahuah (LORD) will receive my prayer* (6:9). And Yahusha (Jesus) takes the psalmist''s very word onto his own lips in the judgment: *And then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23); *But he shall say, I tell you, I know you not whence ye are; depart from me, all ye workers of iniquity* (Luke 13:27). Read through the Formed and the Formless: the One who speaks the dismissal at the shut door speaks Psalm 6''s own line — the Formed Son who *hath heard the voice of my weeping* is the same Yahuah to whom this psalm cried, and he has a Father. And the Torah-filter (1 John 2:3-4) names who is sent away: in Matthew 7 the dismissed are those who prophesied and cast out devils in the Name yet *work iniquity* — anomia, lawlessness — not the law-keepers. The psalm''s *workers of iniquity* and the judgment''s *workers of iniquity* are measured by the same standard, and the weeping that is heard is the cry that is received.',
       sv.verse_id, ev.verse_id, 'free', 22131
  FROM _s302_ps006_lookup sv, _s302_ps006_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *rebuke me not in thy wrath: neither chasten me in thy hot displeasure* (Psalm 38:1) — the verbatim twin penitential opening; correction as a Father''s rod, not the consuming covenant-wrath (6:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=1
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=38 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-rebuke-me-not-in-thine-anger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Shall the dust praise thee? shall it declare thy truth?* (Psalm 30:9) — the same plea from the edge of the pit: no profit in the silence of the grave (6:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*shall the dead arise and praise thee?* (Psalm 88:10) — the darkest penitential psalm''s own question; the dead declare no wonders (6:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=88 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Shall thy lovingkindness be declared in the grave? or thy faithfulness in destruction?* (Psalm 88:11) — the grave declares no lovingkindness; praise belongs to the living (6:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=88 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalm 115:17) — the motif stated plainest: the grave is silence, praise the breath of the living (6:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the grave cannot praise thee... The living, the living, he shall praise thee, as I do this day* (Isaiah 38:18-19) — Hezekiah prays the very plea of 6:5 at the gates of the grave and is granted fifteen years to praise.'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Thanksgiving perishes from the dead... the living and sound in heart shall praise Yahuah (God)* (Sirach 17:27-28) — the restored wisdom-witness sings the same Sheol-silence as 6:5.'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the dead that are in the graves... will give to Yahuah (God) neither praise nor righteousness: But the soul that is greatly vexed... will give you praise* (Baruch 2:17-18) — Baruch''s *soul... greatly vexed* is the psalmist''s own *soul... sore vexed* (6:3); the vexed living praise (6:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-in-death-there-is-no-remembrance-of-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I never knew you: depart from me, ye that work iniquity* (Matthew 7:23) — Yahusha takes the psalmist''s own word (6:8) onto his lips in the judgment; the lawless (anomia), not the law-keepers, are sent away.'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-depart-from-me-all-ye-workers-of-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *depart from me, all ye workers of iniquity* (Luke 13:27) — the psalmist''s line (6:8) almost unaltered on the Formed Son''s lips at the shut door; the One who hears the weeping is the Yahuah Psalm 6 cried to.'
  FROM cross_reference_threads t
  JOIN _s302_ps006_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s302_ps006_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-6-depart-from-me-all-ye-workers-of-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
