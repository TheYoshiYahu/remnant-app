-- ----- fragment: minion_exodus_7.sql (Exodus 7) -----
-- Chapter: Exodus 7 — Aaron's rod swallows the magicians' rods; the first plague (the Nile
--   turned to blood); Pharaoh's heart hardened.
-- Tag: ex07   Session prefix: s305   Sort band base: 29150 (step 3)
--
-- Exodus 7 coverage:
--   v.3-5  I will harden Pharaoh's heart / that the Egyptians may know that I am Yahuah:
--          NT:     Romans 9:18 (whom he will he hardeneth) — thread 3. [Rom 9:17 BY-NAME quote
--                  of Exod 9:16 reserved for ch9; here the hardening-BEGINS principle only.]
--          Extras: none warranted (Jasher 80:2 narrates the smiting, not the hardening-purpose).
--          Tanakh: none additional warranted here (Psalm signs-and-wonders sit on the blood plague).
--   v.6-7  Moses/Aaron obey; ages fourscore: NT/Extras/Tanakh: none warranted (narrative seam).
--   v.8-13 Aaron's rod a serpent; magicians do in like manner; Aaron's rod swallowed up their rods:
--          NT:     2 Timothy 3:8-9 (Jannes and Jambres withstood Moses... folly manifest) — thread 1.
--          Extras: Jasher 79:38, 79:42 (names Jannes & Jambres v.27; rod of Aaron swallowed up
--                  their rods) — thread 1.
--          Tanakh: none additional warranted (the sign is self-contained).
--   v.14   Pharaoh's heart hardened, refuseth to let the people go: folded into thread 3 (hardening).
--   v.15-18 stand by the river / smite the waters / they shall be turned to blood / fish die:
--          covered with v.19-25 as the first-plague block (thread 2).
--   v.19-25 all the waters that were in the river were turned to blood; fish died; blood throughout:
--          NT:     Revelation 8:8-9 (third part of the sea became blood) + Revelation 16:3-4
--                  (sea... rivers and fountains of waters became blood) — thread 2.
--          Extras: Jasher 80:3 (turned all the waters of Egypt into blood) + Wisdom of Solomon
--                  11:6 (perpetual running river troubled with foul blood = measured recompense) — thread 2.
--          Tanakh: Psalm 78:44 (turned their rivers into blood) + Psalm 105:29 (turned their
--                  waters into blood, slew their fish) — thread 2.
--
-- Threads (slug → target libraries):
--   1. exodus-7-aarons-rod-swallowed-up-the-magicians-rods         [extras: NT 2Tim + Jasher]  29150
--   2. exodus-7-all-the-waters-in-the-river-were-turned-to-blood   [extras: NT Rev + Tanakh Ps + Jasher + Wisdom] 29153
--   3. exodus-7-i-will-harden-pharaohs-heart-that-they-may-know    [free: NT Romans]           29156
--
-- Contested framing notes:
--   * Thread 3 (Rom 9:18): framed as judgment on a self-hardening oppressor displayed FOR THE
--     NAME in all the earth — NOT arbitrary reprobation of a people. The by-name Rom 9:17 quote
--     (of Exod 9:16) is deliberately LEFT for the ch9 thread.
--   * Thread 1: the TRUE sign swallows the counterfeit; the named magicians (Jannes & Jambres)
--     come from the very tradition Jasher preserves — Paul reaches back into it (2 Tim 3:8).

CREATE TEMP VIEW _s305_ex07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Aaron's rod swallowed up the magicians' rods (7:8-13)
    ('canon','exodus',7,12,'canon','2-timothy',3,8,'free',
     E'*Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith* (2 Timothy 3:8). Paul names the two Egyptian magicians by a name the canon never records — he is reaching back into the same preserved tradition. Their counterfeit met Moses rod-for-rod, yet *Aaron''s rod swallowed up their rods* (Exodus 7:12): the true sign devours the imitation.'),
    ('canon','exodus',7,12,'canon','2-timothy',3,9,'free',
     E'*But they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9). The magicians could mimic the serpent but could not undo the swallowing — *Aaron''s rod swallowed up their rods* (Exodus 7:12). Their folly was made manifest the moment the true rod consumed the false, the pattern Paul holds up against every later imitator of the truth.'),
    ('canon','exodus',7,12,'jasher','jasher',79,38,'extras',
     E'*And the serpent of Aaron''s rod lifted up its head and opened its mouth to swallow the rods of the magicians* (Jasher 79:38). Jasher preserves the scene Exodus compresses — and names the sorcerers Balaam, Jannes and Jambres (Jasher 79:27), the very names Paul quotes. The mouth that opened to swallow fulfils *Aaron''s rod swallowed up their rods* (Exodus 7:12).'),
    ('canon','exodus',7,12,'jasher','jasher',79,42,'extras',
     E'*And when they were restored to rods, the rod of Aaron swallowed up their rods* (Jasher 79:42). The witness has the magicians demand the test on their own terms — restore the rods, then let yours swallow ours — and still the true rod devours the counterfeit, exactly as *Aaron''s rod swallowed up their rods* (Exodus 7:12).'),

    -- Thread 2: all the waters were turned to blood (7:14-25)
    ('canon','exodus',7,20,'canon','psalms',78,44,'free',
     E'*And had turned their rivers into blood; and their floods, that they could not drink* (Psalm 78:44). Asaph sings the plague back as covenant memory — the same judgment where *all the waters that were in the river were turned to blood* (Exodus 7:20), so that the Egyptians could not drink. The Psalter keeps the wonders of Egypt before Yashar''el (Israel) as the rehearsal of Yahuah''s (the LORD''s) saving hand.'),
    ('canon','exodus',7,20,'canon','psalms',105,29,'free',
     E'*He turned their waters into blood, and slew their fish* (Psalm 105:29). The Hallel-history names both halves of the first plague — the blood and the dead fish — as one act of Yahuah (the LORD): *all the waters that were in the river were turned to blood* (Exodus 7:20), *and the fish that was in the river died* (Exodus 7:21).'),
    ('canon','exodus',7,20,'canon','revelation',8,8,'free',
     E'*And the second angel sounded, and as it were a great mountain burning with fire was cast into the sea: and the third part of the sea became blood* (Revelation 8:8). The trumpet-judgment recapitulates the first plague onto the whole earth: as *all the waters that were in the river were turned to blood* (Exodus 7:20) over Egypt, so the sea is struck in the day of the Lamb''s reckoning.'),
    ('canon','exodus',7,21,'canon','revelation',8,9,'free',
     E'*And the third part of the creatures which were in the sea, and had life, died; and the third part of the ships were destroyed* (Revelation 8:9). The dying sea-life answers *the fish that was in the river died; and the river stank* (Exodus 7:21). The plague that began in one river is poured out, in the end, on the deep.'),
    ('canon','exodus',7,20,'canon','revelation',16,3,'free',
     E'*And the second angel poured out his vial upon the sea; and it became as the blood of a dead man: and every living soul died in the sea* (Revelation 16:3). The bowl-judgment is the first plague at its full measure — *all the waters that were in the river were turned to blood* (Exodus 7:20) becomes the whole sea as the blood of the dead. The pattern of Egypt is the template of the final deliverance.'),
    ('canon','exodus',7,19,'canon','revelation',16,4,'free',
     E'*And the third angel poured out his vial upon the rivers and fountains of waters; and they became blood* (Revelation 16:4). Yahuah (the LORD) commanded Moses to strike *the waters of Egypt, upon their streams, upon their rivers, and upon their ponds, and upon all their pools of water, that they may become blood* (Exodus 7:19) — and the last plagues reach every river and fountain in the earth with the same word.'),
    ('canon','exodus',7,20,'jasher','jasher',80,3,'extras',
     E'*And Yahuah (the Lord) sent by the hand of Aaron and turned all the waters of Egypt into blood, with all their streams and rivers* (Jasher 80:3). The witness names the same outstretched hand and the same totality — *all the waters that were in the river were turned to blood* (Exodus 7:20) — confirming the plague struck every source of water in the land.'),
    ('canon','exodus',7,20,'apocrypha','the-wisdom-of-solomon',11,6,'extras',
     E'*For instead of a perpetual running river troubled with foul blood* (Wisdom of Solomon 11:6). Wisdom reads the first plague as measured recompense — by what things Egypt''s enemies were punished, by the same Yashar''el (Israel) was later benefited (Wisdom 11:5) — so that the river turned to blood, where *all the waters that were in the river were turned to blood* (Exodus 7:20), answers the blood of the Hebrew infants cast into that same Nile.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 3: hardening + know-Yahuah purpose (7:3-5, 13, 14) — kept separate; Rom 9:18 principle only
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','exodus',7,3,'canon','romans',9,18,'free',
     E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). Paul draws the principle straight from Pharaoh, where Yahuah (the LORD) first declared *I will harden Pharaoh''s heart, and multiply my signs and my wonders in the land of Egypt* (Exodus 7:3). This is judgment confirmed upon a self-hardening oppressor — Pharaoh first *refuseth to let the people go* (Exodus 7:14) — displayed for the Name, not the arbitrary reprobation of a people.'),
    ('canon','exodus',7,5,'canon','romans',9,18,'free',
     E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). The hardening serves a stated end: *the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt* (Exodus 7:5). The Name is made known in all the earth through the very oppressor who set himself against it — mercy and hardening alike bent toward Yahuah''s self-revelation and the deliverance of the children of Yashar''el (Israel).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-7-aarons-rod-swallowed-up-the-magicians-rods',
       E'Aaron''s rod swallowed up the magicians'' rods',
       E'When Pharaoh demands a miracle, Aaron casts down his rod and *it became a serpent* (Exodus 7:10). The court answers in kind — *now the magicians of Egypt, they also did in like manner with their enchantments* (Exodus 7:11) — and *they cast down every man his rod, and they became serpents: but Aaron''s rod swallowed up their rods* (Exodus 7:12). The counterfeit can imitate the form but cannot survive the encounter: the true sign devours the false.\n\nThe restored witness preserves what Exodus compresses. Jasher names the sorcerers — *Pharaoh sent for Balaam the magician and to Jannes and Jambres his sons* (Jasher 79:27) — and shows the serpent of Aaron''s rod that *lifted up its head and opened its mouth to swallow the rods of the magicians* (Jasher 79:38), so that *when they were restored to rods, the rod of Aaron swallowed up their rods* (Jasher 79:42).\n\nPaul reaches back into that same tradition: *Now as Jannes and Jambres withstood Moses, so do these also resist the truth: men of corrupt minds, reprobate concerning the faith* (2 Timothy 3:8). And he reads the swallowing as the verdict on every imitator of the truth — *but they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9).',
       sv.verse_id, ev.verse_id, 'extras', 29150
  FROM _s305_ex07_lookup sv, _s305_ex07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-7-all-the-waters-in-the-river-were-turned-to-blood',
       E'All the waters in the river were turned to blood',
       E'The first plague strikes the lifeblood of Egypt. Yahuah (the LORD) commands the rod stretched out *upon the waters of Egypt, upon their streams, upon their rivers, and upon their ponds, and upon all their pools of water* (Exodus 7:19), and *all the waters that were in the river were turned to blood* (Exodus 7:20). The river that drank the blood of the Hebrew infants now runs with blood itself: *the fish that was in the river died; and the river stank, and the Egyptians could not drink of the water of the river* (Exodus 7:21).\n\nThe Psalter keeps it as covenant memory — *and had turned their rivers into blood; and their floods, that they could not drink* (Psalm 78:44); *He turned their waters into blood, and slew their fish* (Psalm 105:29). The restored witness confirms the totality: *and Yahuah (the Lord) sent by the hand of Aaron and turned all the waters of Egypt into blood, with all their streams and rivers* (Jasher 80:3); and Wisdom reads it as measured recompense — *for instead of a perpetual running river troubled with foul blood* (Wisdom of Solomon 11:6) — the Nile that swallowed the infants paying back its own crime.\n\nThe plague is no spent relic. It is the template of the final deliverance, poured out on the whole earth: *the third part of the sea became blood* (Revelation 8:8), *and the third part of the creatures which were in the sea, and had life, died* (Revelation 8:9); *the second angel poured out his vial upon the sea; and it became as the blood of a dead man* (Revelation 16:3), *and they became blood* upon *the rivers and fountains of waters* (Revelation 16:4). The same hand that struck one river judges the deep.',
       sv.verse_id, ev.verse_id, 'extras', 29153
  FROM _s305_ex07_lookup sv, _s305_ex07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=7 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-7-i-will-harden-pharaohs-heart-that-they-may-know',
       E'I will harden Pharaoh''s heart — that they may know that I am Yahuah',
       E'Before the first sign, Yahuah (the LORD) declares the shape of the whole contest: *I will harden Pharaoh''s heart, and multiply my signs and my wonders in the land of Egypt* (Exodus 7:3), *and the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them* (Exodus 7:5). The hardening is not arbitrary: Pharaoh is a self-hardening oppressor who *refuseth to let the people go* (Exodus 7:14), and the judgment upon him is bent toward one end — that the Name be known in all the earth.\n\nPaul draws the principle from this very Pharaoh: *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). Read in the chapter''s own light, this is judgment displayed for the Name and for the deliverance of Yashar''el (Israel) — not the reprobation of a people, but the unmasking of a tyrant who set himself against Yahuah. The hardening begins here; its by-name declaration awaits the deepening plagues.',
       sv.verse_id, ev.verse_id, 'free', 29156
  FROM _s305_ex07_lookup sv, _s305_ex07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',7,12,'canon','2-timothy',3,8, 1, E'*Now as Jannes and Jambres withstood Moses, so do these also resist the truth* (2 Timothy 3:8) — Paul names the magicians from the tradition; their counterfeit met Moses rod-for-rod.'),
    ('exodus',7,12,'canon','2-timothy',3,9, 2, E'*But they shall proceed no further: for their folly shall be manifest unto all men, as theirs also was* (2 Timothy 3:9) — the swallowing is the verdict on every imitator of the truth.'),
    ('exodus',7,12,'jasher','jasher',79,38, 3, E'*The serpent of Aaron''s rod... opened its mouth to swallow the rods of the magicians* (Jasher 79:38) — the witness that names Jannes & Jambres (79:27) shows the swallowing in full.'),
    ('exodus',7,12,'jasher','jasher',79,42, 4, E'*The rod of Aaron swallowed up their rods* (Jasher 79:42) — tested on the magicians'' own terms, the true rod still devours the counterfeit.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-7-aarons-rod-swallowed-up-the-magicians-rods'
  JOIN _s305_ex07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex07_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',7,20,'canon','psalms',78,44, 1, E'*And had turned their rivers into blood; and their floods, that they could not drink* (Psalm 78:44) — Asaph sings the plague back as covenant memory.'),
    ('exodus',7,20,'canon','psalms',105,29, 2, E'*He turned their waters into blood, and slew their fish* (Psalm 105:29) — the Hallel-history names both halves of the first plague.'),
    ('exodus',7,20,'canon','revelation',8,8, 3, E'*The third part of the sea became blood* (Revelation 8:8) — the trumpet recapitulates the first plague onto the whole earth.'),
    ('exodus',7,21,'canon','revelation',8,9, 4, E'*The third part of the creatures which were in the sea, and had life, died* (Revelation 8:9) — answering the dead fish of the river (Exodus 7:21).'),
    ('exodus',7,20,'canon','revelation',16,3, 5, E'*The sea... became as the blood of a dead man: and every living soul died in the sea* (Revelation 16:3) — the bowl-judgment at full measure.'),
    ('exodus',7,19,'canon','revelation',16,4, 6, E'*The rivers and fountains of waters... became blood* (Revelation 16:4) — every stream and pool struck (Exodus 7:19) reaches the whole earth.'),
    ('exodus',7,20,'jasher','jasher',80,3, 7, E'*Turned all the waters of Egypt into blood, with all their streams and rivers* (Jasher 80:3) — the witness confirms the totality of the plague.'),
    ('exodus',7,20,'apocrypha','the-wisdom-of-solomon',11,6, 8, E'*Instead of a perpetual running river troubled with foul blood* (Wisdom of Solomon 11:6) — read as measured recompense for the infants cast into the Nile.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-7-all-the-waters-in-the-river-were-turned-to-blood'
  JOIN _s305_ex07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex07_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    ('exodus',7,3,'canon','romans',9,18, 1, E'*Whom he will he hardeneth* (Romans 9:18) — Paul draws the principle from the hardening first declared in Exodus 7:3, judgment on a self-hardening oppressor.'),
    ('exodus',7,5,'canon','romans',9,18, 2, E'*He hath mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18) — bent toward the stated end: *the Egyptians shall know that I am Yahuah* (Exodus 7:5), the Name made known in all the earth.')
  ) AS m(src_slug,src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-7-i-will-harden-pharaohs-heart-that-they-may-know'
  JOIN _s305_ex07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s305_ex07_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
