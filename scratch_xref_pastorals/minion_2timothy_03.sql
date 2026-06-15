-- ----- fragment: minion_2timothy_03.sql (S236 2 Timothy 3) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 3 (17 verses) — the perilous last days, Jannes and Jambres
--          the deceivers, and ★★ THE HOLY SCRIPTURES known from a child = the TANAKH,
--          GIVEN BY INSPIRATION and profitable (HIGHEST watchpoint / BLESSING chapter).
-- Tag: t236c3 (temp view _s236_t236c3_lookup).
-- Sort band: floor 8600, 25-wide (8600, 8601, 8602 used; under 8625).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical, woven.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the charge to ENDURE; the apostle's last words. Ch3 sets the
-- perilous last days and the Jannes-and-Jambres deceivers AGAINST the inspired Tanakh that
-- Timothy knew from a child. ★★ The *holy scriptures* of 3:15 and the *all scripture* of 3:16
-- are THE TANAKH — the Law, the Prophets, and the Writings, the ONLY scripture then in
-- existence. Paul declares it *given by inspiration of Elohim (God)* and *profitable for
-- doctrine, for reproof, for correction, for instruction in righteousness* — the Tanakh is
-- AFFIRMED as the living, profitable word, the standard for the man of Elohim (God), NOT
-- superseded by a later NT. The Tanakh makes its own claim: *the law of Yahuah (LORD) is
-- perfect* (Psalm 19:7), *for ever, O Yahuah (LORD), thy word is settled in heaven*
-- (Psalm 119:89), *every word of Elohim (God) is pure* (Proverbs 30:5). Do NOT read 3:16 as
-- proof the NT replaced/completes the OT — the scripture in view IS the Tanakh, declared
-- inspired and profitable. And 3:8 Jannes and Jambres = the magicians who withstood Moses
-- before Pharaoh (Exodus 7), named in the Hebrew library — Jasher names them by name.
-- No replacement theology, no law-vs-grace antithesis. The inspired word belongs to the one
-- olive tree.)
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   in the last days perilous times shall come; ever learning, never able to come
--           to the knowledge of the truth
--           Tanakh: none warranted (the moral catalogue vv.2-5 is a list, not a quotation;
--                   the load-bearing last-days witness here is the extras layer)
--           Extras: 2 Esdras 5:1-2 (the days shall come... the way of truth shall be hidden,
--                   and the land shall be barren of faith... iniquity shall be increased)
--           NT: none warranted (no specific NT verse re-spoken; carried in prose)
--   v.8-9   as Jannes and Jambres withstood Moses, so do these also resist the truth
--           Tanakh: Exodus 7:11 (the magicians of Egypt... did in like manner with their
--                   enchantments), Exodus 7:22 (the magicians of Egypt did so with their
--                   enchantments)
--           Extras: Jasher 79:27 (Pharaoh sent for Balaam the magician and to Jannes and
--                   Jambres his sons... and all the magicians) — names them by name
--           NT: none warranted
--   v.10-13 my doctrine, persecutions which came unto me at Antioch, Iconium, Lystra; all
--           that will live godly shall suffer persecution
--           Tanakh: none warranted (Paul's own biography; no Tanakh verse re-spoken)
--           Extras: none warranted   NT: none warranted
--   v.14-17 ★★ from a child thou hast known the holy scriptures... All scripture is given by
--           inspiration of Elohim (God), and is profitable... that the man of Elohim be perfect
--           Tanakh: Psalm 19:7 (the law of Yahuah is perfect... making wise the simple),
--                   Psalm 119:89 (for ever, O Yahuah, thy word is settled in heaven),
--                   Proverbs 30:5 (every word of Elohim is pure)
--           Extras: 2 Esdras 14:22 (send the Ruach HaKodesh... I shall write all... which were
--                   written in your law, that men may find your path) — scripture by inspiration,
--                   anchored in the law
--           NT: none warranted (the scripture in view IS the Tanakh — the guard, not an NT echo)
--
-- THREADS (slug -> target libraries):
--   8600 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5  (Extras)
--   8601 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher      (Tanakh + Extras)
--   8602 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19 (Tanakh + Extras)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s236_t236c3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5
  ('canon', '2-timothy', 3, 1, 'apocrypha', '2-esdras', 5, 1, 'extras', E'*Nevertheless as concerning the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.* (2 Esdras 5:1). Paul warns *This know also, that in the last days perilous times shall come* (2 Timothy 3:1). The Hebrew library had already set the shape of those days: the *way of truth shall be hidden, and the land shall be barren of faith.* It is the same hour Paul describes — a people *ever learning, and never able to come to the knowledge of the truth* (2 Timothy 3:7), the truth hidden and faith grown scarce. The perilous times are not a new prophecy but the last-days reckoning the restored library long foretold.'),
  ('canon', '2-timothy', 3, 2, 'apocrypha', '2-esdras', 5, 2, 'extras', E'*But iniquity shall be increased above that which now you see, or that you have heard long ago.* (2 Esdras 5:2). The catalogue of the last days follows: *For men shall be lovers of their own selves, covetous, boasters, proud, blasphemers, disobedient to parents, unthankful, unholy* (2 Timothy 3:2). The library said *iniquity shall be increased above that which now you see* — and Paul lists the swelling of that iniquity, men who multiply in self-love and lawlessness as the truth is hidden. The increase of iniquity foretold is the very flood of corruption Timothy is charged to turn away from (*from such turn away,* 2 Timothy 3:5).')
  ,
  -- thread: 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher
  ('canon', '2-timothy', 3, 8, 'canon', 'exodus', 7, 11, 'free', E'*Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments.* (Exodus 7:11). When Paul writes *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith* (2 Timothy 3:8), this is the scene he names: the *magicians of Egypt* who matched the sign of Moses *with their enchantments,* counterfeiting the rod-and-serpent before Pharaoh. The last-days deceivers are cast in the type of Pharaoh''s magicians — a *form of godliness* aping the power, resisting the truth as the sorcerers resisted Moses.'),
  ('canon', '2-timothy', 3, 8, 'canon', 'exodus', 7, 22, 'free', E'*And the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened, neither did he hearken unto them; as Yahuah (LORD) had said.* (Exodus 7:22). The magicians could copy the wonder for a time, *but they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9). Exodus shows the end of their craft: their enchantments only hardened Pharaoh''s heart and could not stand, for at the plague of lice *the magicians did so... but they could not* (Exodus 8:18), and their folly was made manifest. So Paul promises the resisters of the truth the same exposure the magicians of Egypt met — their counterfeit shall not prevail.'),
  ('canon', '2-timothy', 3, 8, 'jasher', 'jasher', 79, 27, 'extras', E'*And when they had gone Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians and conjurors and counsellors which belonged to the king, and they all came and sat before the king.* (Jasher 79:27). The Hebrew library names them — *Jannes and Jambres,* the sons of Balaam the magician, summoned by Pharaoh against Moses and Aaron when *Yahuah Elohim (Lord God) of the Hebrews* sent them to demand *Send forth my people that they may serve me* (Jasher 79:25). Paul names the very pair: *as Jannes and Jambres withstood Moses, so do these also resist the truth* (2 Timothy 3:8). The witness Paul reaches for is preserved in the restored library, the named magicians who stood before the king to counterfeit the sign of the rod and resist the word of Yahuah (LORD) — the type of the last-days deceivers.')
  ,
  -- thread: 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19  [BLESSING]
  ('canon', '2-timothy', 3, 15, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). Paul says *from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation* (2 Timothy 3:15) — and the *holy scriptures* Timothy knew from a child are the Tanakh, the only scripture that then existed. The Tanakh''s own testimony names what Paul affirms: *the law of Yahuah (LORD) is perfect... making wise the simple.* The word that makes the simple wise is the very word that makes Timothy *wise unto salvation* — the perfect law of Yahuah (LORD), not superseded but profitable, the standard for the man of Elohim (God).'),
  ('canon', '2-timothy', 3, 16, 'canon', 'psalms', 119, 89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven.* (Psalm 119:89). Paul declares *All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness* (2 Timothy 3:16) — and the scripture so given is the Tanakh, whose word is *settled in heaven* for ever. The inspired word is not a passing fixture to be replaced by a later book; it is the abiding word, settled and enduring, the same word Paul calls profitable for every correction. The settled word of Psalm 119 is the inspired and profitable scripture of 2 Timothy 3.'),
  ('canon', '2-timothy', 3, 16, 'canon', 'proverbs', 30, 5, 'free', E'*Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him.* (Proverbs 30:5). When Paul writes *All scripture is given by inspiration of Elohim (God), and is profitable* (2 Timothy 3:16), the Tanakh has already said why: *every word of Elohim (God) is pure.* Each word breathed out by Elohim (God) is pure and a shield — exactly the scripture profitable *for doctrine, for reproof, for correction, for instruction in righteousness.* The purity Proverbs names is the inspiration Paul names; the scripture in view is the Tanakh, the pure word of Elohim (God), affirmed and not abolished.'),
  ('canon', '2-timothy', 3, 16, 'apocrypha', '2-esdras', 14, 22, 'extras', E'*But if I have found grace before you, send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all that has been done in the world since the beginning, which were written in your law, that men may find your path, and that they which will live in the latter days may live.* (2 Esdras 14:22). Ezra prays for the *Ruach HaKodesh (Holy Spirit)* to write the scriptures *which were written in your law, that men may find your path* — and Elohim answers, *I shall light a candle of understanding in yours heart* (2 Esdras 14:25). This is scripture *given by inspiration of Elohim (God)* (2 Timothy 3:16), breathed out by the Spirit and anchored in the law, that men may find the path and live. The Hebrew library bears the same witness Paul affirms: the inspired word is the law, the Tanakh, given so the people may walk in the way unto salvation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5',
       E'In the last days perilous times shall come, the way of truth hidden (2 Esdras 5)',
       E'Paul opens the chapter with a warning for Timothy and for all who come after: *This know also, that in the last days perilous times shall come* (2 Timothy 3:1), followed by the catalogue of swelling corruption — *men shall be lovers of their own selves, covetous, boasters, proud, blasphemers... Having a form of godliness, but denying the power thereof* (2 Timothy 3:2,5), a generation *ever learning, and never able to come to the knowledge of the truth* (2 Timothy 3:7). The Hebrew library had already set the shape of those days. *Behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith* (2 Esdras 5:1); *but iniquity shall be increased above that which now you see, or that you have heard long ago* (2 Esdras 5:2). The way of truth hidden, faith grown barren, iniquity increased — this is the very hour Paul names: a people who cannot come to the knowledge of the truth because the truth has been hidden from them, and a flood of lawlessness from which Timothy is charged to turn away (*from such turn away,* 2 Timothy 3:5). The perilous last days are not a new prophecy but the long-foretold reckoning of the restored library, the days of hidden truth and increased iniquity that Paul tells Timothy to know and to stand against.',
       sv.verse_id, ev.verse_id, 'extras', 8600
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher',
       E'Jannes and Jambres withstood Moses, the magicians of Egypt (Exodus 7, Jasher 79)',
       E'*Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith. But they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:8-9). Paul reaches for a scene from the Exodus and a pair of names the Tanakh tells but does not name. The scene is the magicians'' contest before Pharaoh: *Then Pharaoh also called the wise men and the sorcerers: now the magicians of Egypt, they also did in like manner with their enchantments* (Exodus 7:11); *and the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened* (Exodus 7:22). They could counterfeit the rod-and-serpent and the first plagues for a season, but their craft came to its end — at the plague of lice *the magicians did so... but they could not* (Exodus 8:18), and their folly was manifest, just as Paul says the deceivers'' folly *shall be manifest unto all men, as theirs also was.* And the names Paul knows are preserved in the Hebrew library: *Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians and conjurors and counsellors which belonged to the king* (Jasher 79:27), summoned against Moses and Aaron when *Yahuah Elohim (Lord God) of the Hebrews* demanded *Send forth my people that they may serve me* (Jasher 79:25). The named magicians who resisted the word of Yahuah (LORD) with their enchantments are Paul''s type of the last-days deceivers — a form of godliness aping the power, withstanding the truth, but bound to be exposed and to proceed no further.',
       sv.verse_id, ev.verse_id, 'extras', 8601
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19',
       E'All scripture given by inspiration: the holy scriptures are the Tanakh (Psalm 19, Psalm 119, Proverbs 30)',
       E'This is the keystone of the chapter, and the framework must hold it exactly. *And that from a child thou hast known the holy scriptures, which are able to make thee wise unto salvation through faith which is in HaMashiach Yahusha (Christ Jesus). All scripture is given by inspiration of Elohim (God), and is profitable for doctrine, for reproof, for correction, for instruction in righteousness: That the man of Elohim (God) may be perfect, throughly furnished unto all good works* (2 Timothy 3:15-17). The *holy scriptures* Timothy knew *from a child* are the Tanakh — the Law, the Prophets, and the Writings — the only scripture that then existed; there was no New Testament for a child to learn. Paul declares this Tanakh *given by inspiration of Elohim (God)* and *profitable... for instruction in righteousness* — it is affirmed as the living, profitable, God-breathed word, the standard for the man of Elohim (God), NOT superseded by a later book. The Tanakh makes the same claim of itself that Paul makes of it. *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7) — the word that makes the simple wise is the word that makes Timothy *wise unto salvation.* *For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89) — the inspired word is the abiding word, settled and enduring, not a passing fixture awaiting replacement. *Every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* (Proverbs 30:5) — the purity Proverbs names is the inspiration Paul names. And the Hebrew library bears the same witness to scripture given by the Spirit and anchored in the law: Ezra prays *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all... which were written in your law, that men may find your path, and that they which will live in the latter days may live* (2 Esdras 14:22), and Elohim answers, *I shall light a candle of understanding in yours heart* (2 Esdras 14:25). The scripture given by inspiration, profitable, perfect, settled for ever, and pure is the Tanakh — the law of Yahuah (LORD) that makes wise unto salvation, affirmed by the apostle and not abolished. Hold this verse against every reading that would make it prove the word of Elohim (God) was replaced: Paul calls the Tanakh inspired and profitable, the furnishing of the man of Elohim (God) unto all good works.',
       sv.verse_id, ev.verse_id, 'extras', 8602
  FROM _s236_t236c3_lookup sv, _s236_t236c3_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:1 — *the days shall come... and the way of truth shall be hidden, and the land shall be barren of faith* the last-days shape behind *in the last days perilous times shall come* (2 Timothy 3:1); a people who cannot come to the knowledge of the truth (3:7).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 5:2 — *but iniquity shall be increased above that which now you see* the swelling of lawlessness Paul catalogues: *men shall be lovers of their own selves, covetous, boasters, proud* (2 Timothy 3:2); from such turn away (3:5).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-in-the-last-days-perilous-times-shall-come-the-way-of-truth-hidden-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 7:11 — *the magicians of Egypt, they also did in like manner with their enchantments* the scene Paul names: *as Jannes and Jambres withstood Moses, so do these also resist the truth* (2 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 7:22 — *the magicians of Egypt did so with their enchantments: and Pharaoh''s heart was hardened* their craft hardened the king and could not stand; *their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 79:27 — *Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons, and to all the magicians* the Hebrew library names the very pair Paul names; the named magicians summoned against Moses (2 Timothy 3:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-jannes-and-jambres-withstood-moses-the-magicians-of-egypt-exodus-7-jasher'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect... making wise the simple* the holy scriptures known from a child = the Tanakh, *able to make thee wise unto salvation* (2 Timothy 3:15); affirmed, not superseded.'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:89 — *for ever, O Yahuah (LORD), thy word is settled in heaven* the inspired word is the abiding word, not a passing fixture; *All scripture is given by inspiration of Elohim (God), and is profitable* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:5 — *every word of Elohim (God) is pure: he is a shield unto them that put their trust in him* the purity that is the inspiration Paul names; scripture profitable *for instruction in righteousness* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 14:22 — *send the Ruach HaKodesh (Holy Spirit) into me, and I shall write all... which were written in your law, that men may find your path* scripture by inspiration, anchored in the law; *given by inspiration of Elohim (God)* (2 Timothy 3:16).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c3_lookup sv, _s236_t236c3_lookup tv
 WHERE t.slug='2-timothy-3-all-scripture-given-by-inspiration-the-holy-scriptures-are-the-tanakh-psalm-19'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
