-- ----- fragment: minion_exodus_33.sql (Exodus 33) -----
-- Chapter: Exodus 33 — the presence, the tent of meeting, "show me thy glory"
-- Session prefix: s305   TAG: ex33   temp view: _s305_ex33_lookup
-- sort_order BAND: 29800 start, step 3
-- SOURCE always 'canon','exodus',33,<v>. Thread tier 'free' unless any member is extras.
--
-- Exodus 33 coverage:
--   v.1-3  (go up to the land sworn to Abraham/Isaac/Jacob; "I will not go up in the midst";
--           the Angel sent before; stiffnecked people)
--          NT:     none warranted as own thread (the Angel-before is carried in the
--                  presence/rest thread via Exod 23:20-21; v.1 "unto thy seed" is the seed-
--                  promise but better held in Genesis source-chapters)
--          Extras: none warranted
--          Tanakh: Angel-before woven into the presence thread (Exod 23:20-21)
--   v.4-6  (the people strip off their ornaments, mourning by Horeb after the calf)
--          NT:     none warranted   Extras: none warranted   Tanakh: none warranted
--                  (penitential strip-down; no clean framework-bearing forward weave; left
--                  unthreaded deliberately)
--   v.7-11 (tent of meeting without the camp; cloudy pillar; Yahuah talked with Moses;
--           v.11 face to face as a man speaketh unto his friend; Joshua departs not)
--          NT:     John 15:14-15 (ye are my friends); James 2:23 (friend of Elohim)
--          Extras: none warranted (clean canon witnesses suffice)
--          Tanakh: Numbers 12:6-8 (mouth to mouth, similitude of Yahuah he beholds);
--                  Deuteronomy 34:10 (no prophet like Moses, known face to face)
--                  → THREAD 2 face-to-face / friend
--   v.12-17 (my presence shall go with thee + I will give thee rest; I know thee by name;
--            I and thy people separated from all the people on the face of the earth)
--          NT:     Matthew 28:20 (lo I am with you alway); Hebrews 4:8-9 (Yahusha/rest)
--          Extras: none warranted
--          Tanakh: Exodus 23:20-21 (the Angel who bears the Name); Isaiah 63:9 (the angel
--                  of his presence saved them) → THREAD 3 presence/rest;
--                  Deuteronomy 7:6 + Leviticus 20:26 (separated/severed from all people)
--                  → THREAD 5 I-and-thy-people
--   v.18-20,22-23 ("shew me thy glory" / "I will proclaim the name" / "gracious to whom I
--            will be gracious" / v.20 no man see my face and live / back parts seen)
--          NT:     John 1:18 (no man hath seen Elohim, the only begotten Son declared him);
--                  1 Timothy 6:16 (whom no man hath seen nor can see); John 6:46 (not that
--                  any man hath seen the Father); Romans 9:15 (mercy clause quoted)
--          Extras: none warranted in THREAD 1 (Wisdom 7:26 held for the Rock/glory thread)
--          Tanakh: Exodus 34:5-6 (the Name proclaimed, the goodness passing) → THREAD 1
--   v.21-22 (stand upon a rock; the clift of the rock; cover thee with my hand; glory passeth)
--          NT:     1 Corinthians 10:4 (that Rock was Messiah) → THREAD 4
--          Extras: Wisdom of Solomon 7:26 (brightness of the everlasting light, image of his
--                  goodness) → THREAD 4 (extras member → thread tier 'extras')
--          Tanakh: held with the glory thread
--
-- THREADS (5):
--   1 exodus-33-show-me-thy-glory-no-man-see-my-face  → NT (John, 1 Timothy) + Tanakh (Exodus 34, Romans 9)  [free]
--   2 exodus-33-face-to-face-as-a-man-speaketh-unto-his-friend → NT (John, James) + Tanakh (Numbers, Deuteronomy)  [free]
--   3 exodus-33-my-presence-shall-go-with-thee-and-give-thee-rest → NT (Matthew, Hebrews) + Tanakh (Exodus 23, Isaiah 63)  [free]
--   4 exodus-33-the-rock-and-the-passing-glory → NT (1 Corinthians) + Extras (Wisdom of Solomon)  [extras]
--   5 exodus-33-i-and-thy-people-separated-from-all-people → Tanakh (Deuteronomy 7, Leviticus 20)  [free]
--
-- Framework-load-bearing / contested framing:
--   ★★★ v.20 "no man see my face and live" beside v.11 "face to face" is the Formed/Formless
--       keystone: the Formless Father is unseeable (John 1:18, 1 Tim 6:16, John 6:46); what
--       Moses is granted is the Formed Son's passing GOODNESS and the proclaimed NAME (Exod
--       34:5-6), not the Father's face. The "face to face" of v.11 is the visible Formed One;
--       the unseeable face of v.20 is the Formless Source — one passage holds both.
--   ★ v.19 mercy clause is quoted verbatim by Paul (Rom 9:15) — sovereign mercy of Yahuah,
--       NOT a replacement-election proof-text; framed as the same covenant Elohim showing
--       mercy to his own people.
--   ★ v.21-22 the Rock = the Formed Messiah (1 Cor 10:4); Wisdom 7:26 the "image of his
--       goodness" set beside "all my goodness pass before thee" (v.19) as the extra-canonical
--       witness to the radiant Formed glory drawn from the Formless.

CREATE TEMP VIEW _s305_ex33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ B. cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: show me thy glory / no man see my face (Formed/Formless)
    ('canon','exodus',33,18,'canon','john',1,18,'free',
      E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18). Moses pleads *shew me thy glory* — but the Formless Father has never been seen by any man. What can be declared is the Formed Son drawn out of the Father''s bosom; the glory Moses is granted is the passing goodness of the One who later took flesh, not the unseeable Source.'),
    ('canon','exodus',33,20,'canon','john',1,18,'free',
      E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18). *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20) is the same word: the Formless Father is unseeable, and only the Formed Son declares him.'),
    ('canon','exodus',33,20,'canon','1-timothy',6,16,'free',
      E'*Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* (1 Timothy 6:16). Paul states flatly what Yahuah tells Moses — *there shall no man see me, and live*: the Formless Source cannot be seen, then or ever, by mortal eyes.'),
    ('canon','exodus',33,20,'canon','john',6,46,'free',
      E'*Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father.* (John 6:46). The face Moses may not see is the Father''s; only the One who is of Elohim — the Formed Son — has seen the Father, which is why he alone can let his *goodness pass before thee* (Exodus 33:19).'),
    ('canon','exodus',33,19,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The promise *I will make all my goodness pass before thee, and I will proclaim the name of Yahuah* (Exodus 33:19) is kept in the very next chapter: the goodness that passes by IS the proclaimed Name.'),
    ('canon','exodus',33,19,'canon','romans',9,15,'free',
      E'*For he saith to Moses, I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion.* (Romans 9:15). Paul quotes this verse word for word — *will be gracious to whom I will be gracious, and will shew mercy on whom I will shew mercy* (Exodus 33:19): the sovereign mercy of the covenant Elohim toward his own people, never a casting-off of them.'),
    -- THREAD 2: face to face, as a man speaketh unto his friend
    ('canon','exodus',33,11,'canon','numbers',12,8,'free',
      E'*With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold: wherefore then were ye not afraid to speak against my servant Moses?* (Numbers 12:8). The *face to face, as a man speaketh unto his friend* of Exodus 33:11 is the same singular intimacy — Moses beholds the *similitude*, the visible Formed One, not the Formless face of verse 20.'),
    ('canon','exodus',33,11,'canon','deuteronomy',34,10,'free',
      E'*And there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face,* (Deuteronomy 34:10). Moses'' epitaph names this very gift: *Yahuah (LORD) spake unto Moses face to face* (Exodus 33:11) — no prophet after him stood in that nearness to the One who bore the Name.'),
    ('canon','exodus',33,11,'canon','john',15,15,'free',
      E'*Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* (John 15:15). The Formed Son who spoke to Moses *as a man speaketh unto his friend* (Exodus 33:11) opens that same friendship to his disciples — made known, not held in dark speeches.'),
    ('canon','exodus',33,11,'canon','james',2,23,'free',
      E'*And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* (James 2:23). Abraham before Moses was the Friend of Elohim; the *as a man speaketh unto his friend* of Exodus 33:11 places Moses in the same covenant friendship — believing trust answered by face-to-face nearness.'),
    -- THREAD 3: my presence shall go with thee, and I will give thee rest
    ('canon','exodus',33,14,'canon','exodus',23,21,'free',
      E'*Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* (Exodus 23:21). The *presence* that shall go with them (Exodus 33:14) is the Angel who bears the Name — the Formed Son leading Yashar''el (Israel); to go without his presence is to go without Yahuah himself.'),
    ('canon','exodus',33,14,'canon','isaiah',63,9,'free',
      E'*In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old.* (Isaiah 63:9). Isaiah names the *presence* that goes with them: *the angel of his presence* — the Formed One who *I will give thee rest* (Exodus 33:14) by bearing and carrying his people.'),
    ('canon','exodus',33,14,'canon','matthew',28,20,'free',
      E'*Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen.* (Matthew 28:20). The same Formed Presence who told Moses *My presence shall go with thee* (Exodus 33:14) says it again in flesh — *I am with you alway* — the going-with-them that defines his people.'),
    ('canon','exodus',33,14,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God).* (Hebrews 4:9). The rest promised at Sinai — *I will give thee rest* (Exodus 33:14) — is not exhausted in Canaan; Hebrews holds it open as the Sabbath-rest that still *remaineth* for the people of Elohim, the appointed rest never abolished.'),
    ('canon','exodus',33,16,'canon','hebrews',4,8,'free',
      E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day.* (Hebrews 4:8). The plea *so shall we be separated, I and thy people* (Exodus 33:16) leans on the going-with-them that grants rest; Hebrews reads that very rest forward to the Formed Son, Yahusha, and the day still kept for his people.'),
    -- THREAD 4: the Rock and the passing glory
    ('canon','exodus',33,22,'canon','1-corinthians',10,4,'free',
      E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ).* (1 Corinthians 10:4). Moses is hidden *in a clift of the rock* (Exodus 33:22) while the glory passes — and Paul names the wilderness Rock: it *was Messiah*, the Formed One who is both the shelter and the passing glory.'),
    ('canon','exodus',33,19,'apocrypha','the-wisdom-of-solomon',7,26,'extras',
      E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26). When Yahuah makes *all my goodness pass before thee* (Exodus 33:19), the witness of Wisdom answers: the radiance is *the image of his goodness* — the Formed brightness drawn from the everlasting light of the Formless.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 5 cross_references (separate block; Tanakh-only)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','exodus',33,16,'canon','deuteronomy',7,6,'free',
      E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). Moses pleads *so shall we be separated, I and thy people, from all the people that are upon the face of the earth* (Exodus 33:16); Deuteronomy names that separation as election — a *special people* set apart, never replaced.'),
    ('canon','exodus',33,13,'canon','leviticus',20,26,'free',
      E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* (Leviticus 20:26). *Consider that this nation is thy people* (Exodus 33:13): the severing is so *that ye should be mine* — Yahuah''s distinct possession, the two-house people set apart for himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ C. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-33-show-me-thy-glory-no-man-see-my-face',
  E'Shew Me Thy Glory: No Man Shall See My Face',
  E'Moses dares the highest ask — *I beseech thee, shew me thy glory* (Exodus 33:18) — and Yahuah answers with a goodness and a Name, but a guarded face: *I will make all my goodness pass before thee, and I will proclaim the name of Yahuah (LORD) before thee* (Exodus 33:19), then *Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). This is the Formed and the Formless held in one breath. The Formless Father is unseeable: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18); *whom no man hath seen, nor can see* (1 Timothy 6:16); *Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46). What passes before Moses is the Formed Son''s glory — and the proclaimed Name is kept the very next chapter: *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The mercy-clause Paul takes up word for word: *For he saith to Moses, I will have mercy on whom I will have mercy, and I will have compassion on whom I will have compassion* (Romans 9:15) — sovereign covenant mercy toward his own people, not a casting-off of them.',
  sv.verse_id, ev.verse_id, 'free', 29800
  FROM _s305_ex33_lookup sv, _s305_ex33_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=33 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=33 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-33-face-to-face-as-a-man-speaketh-unto-his-friend',
  E'Face to Face, As a Man Speaketh Unto His Friend',
  E'In the tent of meeting *Yahuah (LORD) spake unto Moses face to face, as a man speaketh unto his friend* (Exodus 33:11) — and this same chapter says *there shall no man see me, and live* (Exodus 33:20). The tension is the Formed and the Formless: Moses beholds the visible Formed One, not the unseeable face of the Source. Numbers names the gift: *With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8), and his epitaph seals it: *there arose not a prophet since in Yashar''el (Israel) like unto Moses, whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10). The Formed Son who met Moses in friendship opens that friendship wider in flesh: *but I have called you friends; for all things that I have heard of my Father I have made known unto you* (John 15:15). And Abraham before Moses bore the same name — *he was called the Friend of Elohim (God)* (James 2:23) — covenant trust answered by face-to-face nearness.',
  sv.verse_id, ev.verse_id, 'free', 29818
  FROM _s305_ex33_lookup sv, _s305_ex33_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=33 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=33 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-33-my-presence-shall-go-with-thee-and-give-thee-rest',
  E'My Presence Shall Go With Thee, and I Will Give Thee Rest',
  E'When Yahuah threatens to send an angel but not go up *in the midst* (Exodus 33:3), Moses will not move without him — and the answer comes: *My presence shall go with thee, and I will give thee rest* (Exodus 33:14). That Presence is no lesser messenger; it is the Angel who bears the Name: *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). Isaiah names him plainly — *the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9). The Formed Son who promised *My presence shall go with thee* says it again in flesh: *lo, I am with you alway, even unto the end of the world* (Matthew 28:20). And the rest he gives is not spent in Canaan — *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8); *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9): the Sabbath-rest still kept for his people, never abolished.',
  sv.verse_id, ev.verse_id, 'free', 29833
  FROM _s305_ex33_lookup sv, _s305_ex33_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=33 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=33 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-33-the-rock-and-the-passing-glory',
  E'The Rock and the Passing Glory',
  E'Yahuah sets Moses where the glory can pass without consuming him: *Behold, there is a place by me, and thou shalt stand upon a rock... I will put thee in a clift of the rock, and will cover thee with my hand while I pass by* (Exodus 33:21-22). Paul names that wilderness Rock: *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — the Formed One is both the shelter that hides Moses and the glory that passes by. And what passes is the goodness Yahuah promised: *I will make all my goodness pass before thee* (Exodus 33:19); the witness of Wisdom answers, *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26) — the radiant Formed glory drawn out of the everlasting light of the Formless.',
  sv.verse_id, ev.verse_id, 'extras', 29848
  FROM _s305_ex33_lookup sv, _s305_ex33_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=33 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=33 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-33-i-and-thy-people-separated-from-all-people',
  E'I and Thy People, Separated From All the People',
  E'Moses presses the plea that ties Yahuah to a distinct people: *consider that this nation is thy people* (Exodus 33:13), and *so shall we be separated, I and thy people, from all the people that are upon the face of the earth* (Exodus 33:16). The separation he asks for is the election Yahuah had already declared: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6), and *I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). It is the going-with-them that marks them off — Yahuah''s own possession, the covenant people set apart for himself, never to be exchanged for another.',
  sv.verse_id, ev.verse_id, 'free', 29863
  FROM _s305_ex33_lookup sv, _s305_ex33_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=33 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=33 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ D. thread_members
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (33,18,'canon','john',1,18,1,E'*the only begotten Son... he hath declared him* (John 1:18) — the Formless Father unseen; the Formed Son declares him.'),
    (33,20,'canon','john',1,18,2,E'*No man hath seen Elohim (God) at any time* (John 1:18) — the same word as *no man see me, and live* (Exodus 33:20).'),
    (33,20,'canon','1-timothy',6,16,3,E'*whom no man hath seen, nor can see* (1 Timothy 6:16) — Paul states the Formless Source cannot be seen, then or ever.'),
    (33,20,'canon','john',6,46,4,E'*Not that any man hath seen the Father* (John 6:46) — only the One who is of Elohim has seen the Father.'),
    (33,19,'canon','exodus',34,6,5,E'*proclaimed... merciful and gracious... abundant in goodness* (Exodus 34:6) — the promised goodness and Name kept the next chapter.'),
    (33,19,'canon','romans',9,15,6,E'*I will have mercy on whom I will have mercy* (Romans 9:15) — Paul quotes verse 19; sovereign covenant mercy, not casting-off.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-33-show-me-thy-glory-no-man-see-my-face'
  JOIN _s305_ex33_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (33,11,'canon','numbers',12,8,1,E'*I will speak mouth to mouth... the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8) — the visible Formed One, not the Formless face.'),
    (33,11,'canon','deuteronomy',34,10,2,E'*whom Yahuah (LORD) knew face to face* (Deuteronomy 34:10) — no prophet after Moses stood in that nearness.'),
    (33,11,'canon','john',15,15,3,E'*I have called you friends* (John 15:15) — the Formed Son opens the same friendship to his disciples.'),
    (33,11,'canon','james',2,23,4,E'*he was called the Friend of Elohim (God)* (James 2:23) — Abraham bore the name before Moses; covenant friendship.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-33-face-to-face-as-a-man-speaketh-unto-his-friend'
  JOIN _s305_ex33_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (33,14,'canon','exodus',23,21,1,E'*for my name is in him* (Exodus 23:21) — the Presence is the Angel who bears the Name, the Formed Son.'),
    (33,14,'canon','isaiah',63,9,2,E'*the angel of his presence saved them... he bare them, and carried them* (Isaiah 63:9) — Isaiah names the Presence.'),
    (33,14,'canon','matthew',28,20,3,E'*lo, I am with you alway* (Matthew 28:20) — the going-with-them said again in flesh.'),
    (33,14,'canon','hebrews',4,9,4,E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the rest still kept, never abolished.'),
    (33,16,'canon','hebrews',4,8,5,E'*if Yahusha (Jesus) had given them rest... another day* (Hebrews 4:8) — the rest read forward to the Formed Son.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-33-my-presence-shall-go-with-thee-and-give-thee-rest'
  JOIN _s305_ex33_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (33,22,'canon','1-corinthians',10,4,1,E'*that Rock was Messiah (Christ)* (1 Corinthians 10:4) — the Formed One is both the shelter and the passing glory.'),
    (33,19,'apocrypha','the-wisdom-of-solomon',7,26,2,E'*the brightness of the everlasting light... the image of his goodness* (Wisdom of Solomon 7:26) — the radiant Formed glory from the Formless.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-33-the-rock-and-the-passing-glory'
  JOIN _s305_ex33_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (33,16,'canon','deuteronomy',7,6,1,E'*chosen thee to be a special people unto himself, above all people* (Deuteronomy 7:6) — the separation Moses asks is the election already declared.'),
    (33,13,'canon','leviticus',20,26,2,E'*have severed you from other people, that ye should be mine* (Leviticus 20:26) — Yahuah''s own possession, set apart, never replaced.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-33-i-and-thy-people-separated-from-all-people'
  JOIN _s305_ex33_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex33_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
