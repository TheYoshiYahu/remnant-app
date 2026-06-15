-- ----- fragment: minion_psalms_123.sql (Psalm 123) -----
-- Chapter: Psalm 123 — A Song of Ascents, the upward look of the servant (4 verses)
-- Tag: ps123   Session prefix: s302   Sort band base: 25050 (25050, 25053, 25056)
-- View: _s302_ps123_lookup
-- All targets canon Tanakh + NT → every thread tier 'free'. No extras warranted (short ascent psalm).
--
-- Per-chapter coverage checklist:
--   v.1  (Unto thee lift I up mine eyes, O thou that dwellest in the heavens)
--        NT:     Colossians 3:1-2 (set affection above) — WARRANTED (thread 1)
--        Extras: none warranted
--        Tanakh: Psalm 121:1 (lift up mine eyes), Psalm 2:4 (he that sitteth in the heavens) — WARRANTED (thread 1)
--   v.2  (As the eyes of servants look unto the hand of their masters... so our eyes wait upon Yahuah... until... mercy)
--        NT:     Matthew 6:24 (no man can serve two masters) — WARRANTED (thread 2)
--        Extras: none warranted
--        Tanakh: Psalm 145:15 (the eyes of all wait upon thee) — WARRANTED (thread 2)
--   v.3  (Have mercy upon us, O Yahuah... for we are exceedingly filled with contempt)
--        NT:     Luke 18:13-14 (publican: be merciful to me a sinner / abased-exalted) — WARRANTED (thread 3)
--        Extras: none warranted
--        Tanakh: Psalm 44:13 (a reproach to our neighbours, a scorn and a derision) — WARRANTED (thread 3)
--   v.4  (Our soul is exceedingly filled with the scorning of those that are at ease, and with the contempt of the proud)
--        NT:     James 4:6 (Elohim resisteth the proud, giveth grace to the humble); Matthew 5:5 (the meek inherit) — WARRANTED (thread 3)
--        Extras: none warranted
--        Tanakh: Proverbs 3:34 (he scorneth the scorners, giveth grace to the lowly) — WARRANTED (thread 3)
--
-- Threads (3):
--   1. psalm-123-unto-thee-lift-i-up-mine-eyes-o-thou-that-dwellest-in-the-heavens  [Tanakh + NT]
--   2. psalm-123-as-the-eyes-of-servants-so-our-eyes-wait-upon-yahuah-for-mercy     [Tanakh + NT]
--   3. psalm-123-filled-with-the-scorning-of-those-at-ease-and-the-contempt-of-the-proud  [Tanakh + NT]

CREATE TEMP VIEW _s302_ps123_lookup AS
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
    -- THREAD 1: v.1 — the upward look to the One who dwells in the heavens
    ('canon','psalms',123,1,'canon','psalms',121,1,'free',
      E'*I will lift up mine eyes unto the hills, from whence cometh my help* (Psalm 121:1). The sister ascent lifts the eyes laterally to the hills for help; Psalm 123 lifts them higher still — past the hills to the throne above them: *Unto thee lift I up mine eyes, O thou that dwellest in the heavens* (Psalm 123:1). The pilgrim''s gaze climbs from the help that comes from Yahuah (LORD) to Yahuah himself.'),
    ('canon','psalms',123,1,'canon','psalms',2,4,'free',
      E'*He that sitteth in the heavens shall laugh: Yahuah (LORD) shall have them in derision* (Psalm 2:4). The same enthroned One who *dwellest in the heavens* (Psalm 123:1) is the unmoved King over the raging nations. The servant who lifts up his eyes to him looks to the throne the proud cannot reach.'),
    ('canon','psalms',123,1,'canon','colossians',3,1,'free',
      E'*If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1). The upward look of Psalm 123 — *Unto thee lift I up mine eyes, O thou that dwellest in the heavens* (Psalm 123:1) — is the same posture the apostle commands: the affection lifted off the earth and set on the One enthroned above, the Formed Son seated at the Father''s right hand.'),
    ('canon','psalms',123,1,'canon','colossians',3,2,'free',
      E'*Set your affection on things above, not on things on the earth* (Colossians 3:2). Psalm 123 enacts the command before it is spoken: the eyes lifted *unto thee... that dwellest in the heavens* (Psalm 123:1) are the affection fixed above, the heart of the servant raised from the dust of contempt to the throne of mercy.'),

    -- THREAD 2: v.2 — the eyes of servants waiting on the master's hand
    ('canon','psalms',123,2,'canon','psalms',145,15,'free',
      E'*The eyes of all wait upon thee; and thou givest them their meat in due season* (Psalm 145:15). What Psalm 123 sees in the single waiting servant — *so our eyes wait upon Yahuah Eloheinu (the LORD our God), until that he have mercy upon us* (Psalm 123:2) — Psalm 145 sees in all creation: every dependent eye turned to the open hand that feeds in due season. The posture of patient dependence is the creature''s whole life.'),
    ('canon','psalms',123,2,'canon','matthew',6,24,'free',
      E'*No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). Psalm 123 fixes *the eyes of servants* upon *the hand of their masters* (Psalm 123:2) — one Master, one undivided gaze. The Formed Son names the test: the servant''s eye cannot wait on two hands at once.'),

    -- THREAD 3: v.3-4 — the reproach of the remnant; grace to the humble, scorn to the proud
    ('canon','psalms',123,3,'canon','psalms',44,13,'free',
      E'*Thou makest us a reproach to our neighbours, a scorn and a derision to them that are round about us* (Psalm 44:13). The covenant people''s lament in Psalm 44 is the very burden of Psalm 123 — *we are exceedingly filled with contempt* (Psalm 123:3) — the faithful remnant of Yashar''el (Israel) bearing the scorn of the nations, crying not for vengeance but for mercy.'),
    ('canon','psalms',123,3,'canon','luke',18,13,'free',
      E'*And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13). The thrice-cried plea of Psalm 123 — *Have mercy upon us, O Yahuah (LORD), have mercy upon us* (Psalm 123:3) — is the publican''s whole prayer. The contrite who beg mercy stand where the proud cannot.'),
    ('canon','psalms',123,3,'canon','luke',18,14,'free',
      E'*I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14). Psalm 123 sets the humbled servant who waits for mercy over against *the scorning of those that are at ease, and... the contempt of the proud* (Psalm 123:4); the Formed Son names the outcome — the abased proud, the exalted lowly.'),
    ('canon','psalms',123,4,'canon','proverbs',3,34,'free',
      E'*Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Psalm 123 groans under *the scorning of those that are at ease, and... the contempt of the proud* (Psalm 123:4); Proverbs answers that the scorn is repaid in kind — Yahuah scorns the scorners — while the lowly who wait on his hand receive grace.'),
    ('canon','psalms',123,4,'canon','james',4,6,'free',
      E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). The apostle quotes the very law Psalm 123 leans on: the *proud* whose *contempt* fills the servant''s soul (Psalm 123:4) are the ones Elohim resists, while the humble who lift their eyes for mercy are the ones he lifts up.'),
    ('canon','psalms',123,4,'canon','matthew',5,5,'free',
      E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). The servant of Psalm 123, filled with *the contempt of the proud* (Psalm 123:4) yet waiting in meekness for mercy, is heir to the very earth the proud-at-ease now hold; the Formed Son pronounces the reversal as blessing.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps123_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps123_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-123-unto-thee-lift-i-up-mine-eyes-o-thou-that-dwellest-in-the-heavens',
       E'Unto thee lift I up mine eyes, O thou that dwellest in the heavens',
       E'The Song of Ascents opens with the pilgrim''s upward look: *Unto thee lift I up mine eyes, O thou that dwellest in the heavens* (Psalm 123:1). The companion ascent had lifted the eyes to the hills — *I will lift up mine eyes unto the hills, from whence cometh my help* (Psalm 121:1) — but Psalm 123 climbs past the hills to the throne above them, to the One enthroned in the heavens. That enthroned One is the same King the second psalm sees unmoved over the raging nations: *He that sitteth in the heavens shall laugh: Yahuah (LORD) shall have them in derision* (Psalm 2:4). To lift the eyes to him is to look past every earthly power to the throne the proud cannot reach. The apostle later makes this upward gaze a command: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1); *Set your affection on things above, not on things on the earth* (Colossians 3:2). The Formed Son, drawn from the Formless and now seated at the Father''s right hand, is the One the lifted eyes seek; Psalm 123 enacts the command before it is spoken.',
       sv.verse_id, ev.verse_id, 'free', 25050
  FROM _s302_ps123_lookup sv, _s302_ps123_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=123 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=123 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-123-as-the-eyes-of-servants-so-our-eyes-wait-upon-yahuah-for-mercy',
       E'As the eyes of servants — so our eyes wait upon Yahuah for mercy',
       E'The heart of the psalm is the posture of the servant''s eye: *Behold, as the eyes of servants look unto the hand of their masters, and as the eyes of a maiden unto the hand of her mistress; so our eyes wait upon Yahuah Eloheinu (the LORD our God), until that he have mercy upon us* (Psalm 123:2). The servant watches one hand — for command, for provision, for the gesture of mercy — and so the covenant people watch Yahuah. This is patient dependence, the creature''s whole life turned toward the open hand. Psalm 145 widens the single watching servant to all creation: *The eyes of all wait upon thee; and thou givest them their meat in due season* (Psalm 145:15) — every dependent eye fixed on the hand that feeds. And the Formed Son names the test hidden in the image: the servant''s gaze cannot be divided — *No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). One Master, one hand, one undivided eye, waiting until mercy comes.',
       sv.verse_id, ev.verse_id, 'free', 25053
  FROM _s302_ps123_lookup sv, _s302_ps123_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=123 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=123 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-123-filled-with-the-scorning-of-those-at-ease-and-the-contempt-of-the-proud',
       E'Filled with the scorning of those at ease and the contempt of the proud',
       E'The psalm closes in the reproach of the faithful remnant: *Have mercy upon us, O Yahuah (LORD), have mercy upon us: for we are exceedingly filled with contempt. Our soul is exceedingly filled with the scorning of those that are at ease, and with the contempt of the proud* (Psalm 123:3-4). This is the burden of Yashar''el (Israel) under the mockery of the nations, the same lament Psalm 44 raises — *Thou makest us a reproach to our neighbours, a scorn and a derision to them that are round about us* (Psalm 44:13) — yet the cry is not for vengeance but, twice over, for mercy. The Formed Son draws the very posture into his parable of the abased and the exalted: *And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13); *for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14). The proud-at-ease who scorn are answered in their own coin: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34), the law the apostle quotes — *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). And to the meek who wait under contempt for mercy the Formed Son gives the proud-held earth itself: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5).',
       sv.verse_id, ev.verse_id, 'free', 25056
  FROM _s302_ps123_lookup sv, _s302_ps123_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=123 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=123 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (123,1,'psalms',121,1,1,E'*I will lift up mine eyes unto the hills, from whence cometh my help* (Psalm 121:1) — the sister ascent lifts the eyes to the hills; Psalm 123 climbs past them to the throne above.'),
    (123,1,'psalms',2,4,2,E'*He that sitteth in the heavens shall laugh: Yahuah (LORD) shall have them in derision* (Psalm 2:4) — the One who *dwellest in the heavens* is the unmoved King over the raging nations.'),
    (123,1,'colossians',3,1,3,E'*If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1) — the upward look made command: seek the Formed Son enthroned above.'),
    (123,1,'colossians',3,2,4,E'*Set your affection on things above, not on things on the earth* (Colossians 3:2) — Psalm 123 enacts the command before it is spoken, eyes lifted off the earth to the throne of mercy.')
  ) AS m(src_v_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-123-unto-thee-lift-i-up-mine-eyes-o-thou-that-dwellest-in-the-heavens'
  JOIN _s302_ps123_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_v_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps123_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (123,2,'psalms',145,15,1,E'*The eyes of all wait upon thee; and thou givest them their meat in due season* (Psalm 145:15) — the single waiting servant widened to all creation, every dependent eye on the open hand.'),
    (123,2,'matthew',6,24,2,E'*No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24) — the Formed Son names the test: the servant''s eye cannot wait on two hands at once.')
  ) AS m(src_v_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-123-as-the-eyes-of-servants-so-our-eyes-wait-upon-yahuah-for-mercy'
  JOIN _s302_ps123_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_v_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps123_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (123,3,'psalms',44,13,1,E'*Thou makest us a reproach to our neighbours, a scorn and a derision to them that are round about us* (Psalm 44:13) — the covenant people''s lament, the remnant filled with contempt yet crying for mercy.'),
    (123,3,'luke',18,13,2,E'*The publican... smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — the thrice-cried *have mercy upon us* is the publican''s whole prayer.'),
    (123,3,'luke',18,14,3,E'*Every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 18:14) — the Formed Son names the reversal: the proud abased, the lowly servant exalted.'),
    (123,4,'proverbs',3,34,4,E'*Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34) — the scorn of the proud repaid in kind, grace to the lowly who wait.'),
    (123,4,'james',4,6,5,E'*Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — the apostle quotes the very law the psalm leans on.'),
    (123,4,'matthew',5,5,6,E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — to the meek under contempt the Formed Son gives the proud-held earth itself.')
  ) AS m(src_v_ch,src_v,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-123-filled-with-the-scorning-of-those-at-ease-and-the-contempt-of-the-proud'
  JOIN _s302_ps123_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_v_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps123_lookup tv ON tv.edition_slug='canon' AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
