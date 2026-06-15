-- ----- fragment: minion_psalms_124.sql (Psalm 124) -----
-- Chapter: Psalm 124 — A Song of Ascents (of David): the deliverance confession.
-- Tag: ps124   Session prefix: s302   Sort band base: 25075 (25075,25078,25081,25084)
-- Source rows ALWAYS 'canon','psalms',124,v.  Thread slug prefix SINGULAR: psalm-124-...
-- All targets canon (Tanakh + NT) -> every thread tier_required='free'.
--
-- Psalm 124 coverage:
--   v.1-3  "If it had not been Yahuah who was on our side... swallowed us up quick"
--          NT:     Romans 8:31 (If Elohim be for us, who can be against us) — THREAD 1
--          Extras: none warranted (the covenant-preservation confession is fully witnessed in canon)
--          Tanakh: Psalm 118:6 (Yahuah on my side); Romans 11:1-2 (people not cast away — two-house guard) — THREAD 1
--   v.4-5  "Then the waters had overwhelmed us... the proud waters had gone over our soul"
--          NT:     Revelation 12:15-16 (the serpent's flood after the woman; earth swallows it) — THREAD 2
--          Extras: none warranted (flood-of-the-adversary imagery saturated in canon Psalter/Isaiah)
--          Tanakh: Psalm 69:1-2,15 (waters come in unto my soul); Isaiah 43:2 (thou passest through the waters) — THREAD 2
--   v.6    "Blessed be Yahuah, who hath not given us as a prey to their teeth"
--          NT/Extras/Tanakh: folded into THREAD 3 (prey/snare-deliverance) — no standalone thread warranted
--   v.7    "Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken"
--          NT:     2 Timothy 2:26 (recover out of the snare of the devil) — THREAD 3
--          Extras: none warranted
--          Tanakh: Psalm 91:3 (the snare of the fowler); Proverbs 6:5 (as a bird from the hand of the fowler) — THREAD 3
--   v.8    "Our help is in the name of Yahuah, who made heaven and earth"
--          NT:     John 1:3 / Colossians 1:16 (all things made by the Formed Son); Acts 4:12 (the Name) — THREAD 4
--          Extras: none warranted
--          Tanakh: Psalm 121:2 (my help cometh from Yahuah, which made heaven and earth — lateral Ascent twin) — THREAD 4
--
-- Threads (4):
--   psalm-124-if-it-had-not-been-yahuah-who-was-on-our-side          [Tanakh + NT]   free  band 25075
--   psalm-124-the-waters-had-overwhelmed-us-the-stream-gone-over     [Tanakh + NT]   free  band 25078
--   psalm-124-our-soul-is-escaped-as-a-bird-out-of-the-snare         [Tanakh + NT]   free  band 25081
--   psalm-124-our-help-is-in-the-name-of-yahuah-who-made-heaven      [Tanakh + NT]   free  band 25084
--
-- Framework-load-bearing framing:
--   v.1-3 — "now may Yashar'el say" the covenant-people FRAME the confession; bound to Rom 11:1-2
--           (Elohim hath NOT cast away his people which he foreknew) so the deliverance reads as the
--           TWO-HOUSE people Yahuah does not abandon, never replacement.
--   v.8 — "who made heaven and earth": help in the NAME, the Maker BY the Formed Word (John 1:3 /
--          Col 1:16 all things made BY HIM) — the Formless Father creating through the Formed Son,
--          NOT co-equal-persons grammar; Acts 4:12 the Name that saves.

CREATE TEMP VIEW _s302_ps124_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- B. cross_references
-- =========================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: If it had not been Yahuah who was on our side (v.1-3)
    ('canon','psalms',124,1,'canon','romans',8,31,'free',
     E'*What shall we then say to these things? If Elohim (God) be for us, who can be against us?* (Romans 8:31). Twice the Psalm names the only ground of survival — *If it had not been Yahuah (LORD) who was on our side, now may Yashar''el (Israel) say* (Psalm 124:1) — and Sha''ul (Paul) turns the confession into a question that answers itself: with the Maker on their side, no risen wrath can prevail.'),
    ('canon','psalms',124,2,'canon','psalms',118,6,'free',
     E'*Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). When the Ascent sings *If it had not been Yahuah (LORD) who was on our side, when men rose up against us* (Psalm 124:2), this companion Psalm answers the same threat of *men* with the same confidence — the covenant-people fear no human wrath because Yahuah Himself stands with them.'),
    ('canon','psalms',124,1,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *Now may Yashar''el (Israel) say* (Psalm 124:1) — the people themselves frame the deliverance, and Sha''ul guards the same people from being written off: Yahuah does not abandon the seed He preserved.'),
    ('canon','psalms',124,1,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The Psalm''s *If it had not been Yahuah (LORD) who was on our side* (Psalm 124:1) confesses the very preservation Sha''ul defends — the two-house people foreknown and kept, never swallowed up, never cast away.'),

    -- THREAD 2: Then the waters had overwhelmed us (v.4-5)
    ('canon','psalms',124,4,'canon','psalms',69,1,'free',
     E'*Save me, O Elohim (God); for the waters are come in unto my soul* (Psalm 69:1). The Ascent cries *Then the waters had overwhelmed us, the stream had gone over our soul* (Psalm 124:4); the suffering-Psalm sings the same drowning flood reaching *unto my soul* — the adversary''s waters that only Yahuah holds back.'),
    ('canon','psalms',124,4,'canon','psalms',69,2,'free',
     E'*I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:2). *The stream had gone over our soul* (Psalm 124:4) — the same deep, overflowing waters of the enemy that swallow where there is no standing, but for the help that is in the Name.'),
    ('canon','psalms',124,4,'canon','psalms',69,15,'free',
     E'*Let not the waterflood overflow me, neither let the deep swallow me up, and let not the pit shut her mouth upon me* (Psalm 69:15). Psalm 124''s *the waters had overwhelmed us... the proud waters had gone over our soul* (Psalm 124:4-5) names the very flood Psalm 69 prays against — the deep that would *swallow up* the covenant-people whole.'),
    ('canon','psalms',124,4,'canon','isaiah',43,2,'free',
     E'*When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2). The Psalm''s near-drowning — *Then the waters had overwhelmed us* (Psalm 124:4) — is exactly the flood Yahuah promises His people will pass THROUGH and not be overwhelmed, because He is with them.'),
    ('canon','psalms',124,5,'canon','revelation',12,15,'free',
     E'*And the serpent cast out of his mouth water as a flood after the woman, that he might cause her to be carried away of the flood* (Revelation 12:15). *Then the proud waters had gone over our soul* (Psalm 124:5) — the serpent''s flood is the seed-war''s weapon against the covenant-woman and her seed, the proud waters loosed to carry the people away.'),
    ('canon','psalms',124,5,'canon','revelation',12,16,'free',
     E'*And the earth helped the woman, and the earth opened her mouth, and swallowed up the flood which the dragon cast out of his mouth* (Revelation 12:16). The Psalm''s would-be drowning is reversed: the proud waters that should have *gone over our soul* (Psalm 124:5) are themselves swallowed — deliverance from the dragon''s flood, the help that is in the Name.'),

    -- THREAD 3: Our soul is escaped as a bird out of the snare (v.6-7)
    ('canon','psalms',124,7,'canon','psalms',91,3,'free',
     E'*Surely he shall deliver thee from the snare of the fowler, and from the noisome pestilence* (Psalm 91:3). *Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken, and we are escaped* (Psalm 124:7) is the answered promise of Psalm 91 — the very *snare of the fowler* broken, the soul set free.'),
    ('canon','psalms',124,7,'canon','proverbs',6,5,'free',
     E'*Deliver thyself as a roe from the hand of the hunter, and as a bird from the hand of the fowler* (Proverbs 6:5). The Ascent confesses the deliverance Proverbs urges: *Our soul is escaped as a bird out of the snare of the fowlers* (Psalm 124:7) — the trapped bird of the covenant-people loosed from the hunter''s hand.'),
    ('canon','psalms',124,7,'canon','2-timothy',2,26,'free',
     E'*And that they may recover themselves out of the snare of the devil, who are taken captive by him at his will* (2 Timothy 2:26). *The snare is broken, and we are escaped* (Psalm 124:7) — Sha''ul names the Fowler behind the fowlers: the snare of the adversary, broken so the captive soul escapes, victims of the trap freed and not enemies destroyed.'),

    -- THREAD 4: Our help is in the name of Yahuah who made heaven and earth (v.8)
    ('canon','psalms',124,8,'canon','psalms',121,2,'free',
     E'*My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2). Two Songs of Ascents rest the people''s whole hope on the same ground: *Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8) — help that is the Maker''s own Name, the Creator who keeps His covenant-people.'),
    ('canon','psalms',124,8,'canon','john',1,3,'free',
     E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). The Psalm names the help as the Name of the One *who made heaven and earth* (Psalm 124:8) — and the Maker creates BY the Formed Word, the Son through whom the Formless Father made all things.'),
    ('canon','psalms',124,8,'canon','colossians',1,16,'free',
     E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him* (Colossians 1:16). *Who made heaven and earth* (Psalm 124:8) — the heaven and earth of the Psalm are made BY the Formed Son, the One drawn from the Formless Father as His creating Word, who has a Father and is not a co-equal second person.'),
    ('canon','psalms',124,8,'canon','acts',4,12,'free',
     E'*Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The Psalm rests everything on *the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8); Kepha (Peter) confesses that one saving Name under heaven — the Maker''s Name, the only help.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps124_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps124_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- C. cross_reference_threads
-- =========================================================================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-124-if-it-had-not-been-yahuah-who-was-on-our-side',
       E'If it had not been Yahuah who was on our side',
       E'Twice the Ascent stakes the whole survival of the covenant-people on one ground: *If it had not been Yahuah (LORD) who was on our side, now may Yashar''el (Israel) say; If it had not been Yahuah (LORD) who was on our side, when men rose up against us: Then they had swallowed us up quick, when their wrath was kindled against us* (Psalm 124:1-3). Notice who speaks — *now may Yashar''el (Israel) say* — the people themselves frame the confession. Sha''ul (Paul) turns it into the question that answers itself: *What shall we then say to these things? If Elohim (God) be for us, who can be against us?* (Romans 8:31). A companion Psalm sings the same fearlessness against the same human threat: *Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). And lest the people who *say* this be ever read as cast off, Sha''ul guards them by name: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2). The deliverance is the two-house people Yahuah foreknew and would not let be swallowed up.',
       sv.verse_id, ev.verse_id, 'free', 25075
  FROM _s302_ps124_lookup sv, _s302_ps124_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=124 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-124-the-waters-had-overwhelmed-us-the-stream-gone-over',
       E'Then the waters had overwhelmed us',
       E'The danger turns to a flood: *Then the waters had overwhelmed us, the stream had gone over our soul: Then the proud waters had gone over our soul* (Psalm 124:4-5). This is the Psalter''s drowning-cry: *Save me, O Elohim (God); for the waters are come in unto my soul... I am come into deep waters, where the floods overflow me* (Psalm 69:1-2), and its prayer, *Let not the waterflood overflow me, neither let the deep swallow me up* (Psalm 69:15). Against it stands Yahuah''s promise to His people: *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee* (Isaiah 43:2) — not spared the flood, but carried THROUGH it. And the apocalypse names the source of the proud waters: *the serpent cast out of his mouth water as a flood after the woman, that he might cause her to be carried away of the flood* (Revelation 12:15) — the seed-war''s weapon — yet *the earth helped the woman, and the earth opened her mouth, and swallowed up the flood which the dragon cast out of his mouth* (Revelation 12:16). The proud waters that should have gone over the people''s soul are themselves swallowed up.',
       sv.verse_id, ev.verse_id, 'free', 25078
  FROM _s302_ps124_lookup sv, _s302_ps124_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=124 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-124-our-soul-is-escaped-as-a-bird-out-of-the-snare',
       E'Our soul is escaped as a bird out of the snare',
       E'From the swallowing flood to the hunter''s trap: *Blessed be Yahuah (LORD), who hath not given us as a prey to their teeth. Our soul is escaped as a bird out of the snare of the fowlers: the snare is broken, and we are escaped* (Psalm 124:6-7). This is the answered promise of the shelter-Psalm: *Surely he shall deliver thee from the snare of the fowler, and from the noisome pestilence* (Psalm 91:3); and the counsel of the wise: *Deliver thyself as a roe from the hand of the hunter, and as a bird from the hand of the fowler* (Proverbs 6:5). Sha''ul (Paul) names the Fowler behind every fowler — the people are to *recover themselves out of the snare of the devil, who are taken captive by him at his will* (2 Timothy 2:26). The snare is the adversary''s; the bird is the covenant-soul; and when *the snare is broken*, the captive — a victim of the trap, not an enemy — escapes.',
       sv.verse_id, ev.verse_id, 'free', 25081
  FROM _s302_ps124_lookup sv, _s302_ps124_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=124 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-124-our-help-is-in-the-name-of-yahuah-who-made-heaven',
       E'Our help is in the name of Yahuah, who made heaven and earth',
       E'The whole confession lands on the Name: *Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8). Its twin Ascent rests on the identical ground: *My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2). And the help is the Maker''s — the Creator who keeps His covenant-people — made by the Formed Word: *All things were made by him; and without him was not any thing made that was made* (John 1:3); *For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him* (Colossians 1:16). The heaven and earth of the Psalm are framed by the Formless Father THROUGH the Formed Son, His creating Word who has a Father — not a co-equal second person. And there is no other Name that saves: *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). Our help is in that Name.',
       sv.verse_id, ev.verse_id, 'free', 25084
  FROM _s302_ps124_lookup sv, _s302_ps124_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=124 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- D. cross_reference_thread_members
-- =========================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (1,1,'canon','romans',8,31, E'*If Elohim (God) be for us, who can be against us?* (Romans 8:31) — the Psalm''s confession turned into the question that answers itself.'),
    (2,2,'canon','psalms',118,6, E'*Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6) — the same fearlessness against *men* who rose up.'),
    (3,1,'canon','romans',11,1, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the people who *say* this are not cast off.'),
    (4,1,'canon','romans',11,2, E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the two-house people foreknown and kept.')
  ) AS m(so,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-124-if-it-had-not-been-yahuah-who-was-on-our-side'
  JOIN _s302_ps124_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=m.src_v
  JOIN _s302_ps124_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (1,4,'canon','psalms',69,1, E'*Save me, O Elohim (God); for the waters are come in unto my soul* (Psalm 69:1) — the drowning flood reaching the soul.'),
    (2,4,'canon','psalms',69,2, E'*I am come into deep waters, where the floods overflow me* (Psalm 69:2) — the deep with no standing.'),
    (3,4,'canon','psalms',69,15, E'*Neither let the deep swallow me up* (Psalm 69:15) — the prayer against the very flood Psalm 124 escaped.'),
    (4,4,'canon','isaiah',43,2, E'*When thou passest through the waters, I will be with thee... they shall not overflow thee* (Isaiah 43:2) — carried THROUGH the flood.'),
    (5,5,'canon','revelation',12,15, E'*The serpent cast out of his mouth water as a flood after the woman* (Revelation 12:15) — the seed-war''s proud waters.'),
    (6,5,'canon','revelation',12,16, E'*The earth... swallowed up the flood which the dragon cast out of his mouth* (Revelation 12:16) — the flood itself swallowed, deliverance reversed.')
  ) AS m(so,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-124-the-waters-had-overwhelmed-us-the-stream-gone-over'
  JOIN _s302_ps124_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=m.src_v
  JOIN _s302_ps124_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (1,7,'canon','psalms',91,3, E'*Surely he shall deliver thee from the snare of the fowler* (Psalm 91:3) — the answered promise: the snare broken.'),
    (2,7,'canon','proverbs',6,5, E'*As a bird from the hand of the fowler* (Proverbs 6:5) — the trapped bird loosed from the hunter''s hand.'),
    (3,7,'canon','2-timothy',2,26, E'*Recover themselves out of the snare of the devil* (2 Timothy 2:26) — the Fowler behind the fowlers; the captive freed.')
  ) AS m(so,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-124-our-soul-is-escaped-as-a-bird-out-of-the-snare'
  JOIN _s302_ps124_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=m.src_v
  JOIN _s302_ps124_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (1,8,'canon','psalms',121,2, E'*My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2) — the twin Ascent on the identical ground.'),
    (2,8,'canon','john',1,3, E'*All things were made by him; and without him was not any thing made that was made* (John 1:3) — made BY the Formed Word.'),
    (3,8,'canon','colossians',1,16, E'*By him were all things created, that are in heaven, and that are in earth* (Colossians 1:16) — the Formed Son the Father''s creating Word.'),
    (4,8,'canon','acts',4,12, E'*There is none other name under heaven given among men, whereby we must be saved* (Acts 4:12) — the one saving Name, our help.')
  ) AS m(so,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-124-our-help-is-in-the-name-of-yahuah-who-made-heaven'
  JOIN _s302_ps124_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=124 AND sv.verse_number=m.src_v
  JOIN _s302_ps124_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
