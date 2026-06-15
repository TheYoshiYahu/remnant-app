-- ----- fragment: minion_2timothy_02.sql (S236 2 Timothy 2) -----
-- =====================================================================
-- S236 minion — 2 TIMOTHY 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 TIMOTHY 2 (26 verses) — THE CHARGE TO ENDURE: be a good soldier, a
--   workman rightly dividing the word of truth, the foundation standeth sure.
-- Tag: t236c2 (temp view _s236_t236c2_lookup).
-- Sort band: floor 8575, 25-wide (8575, 8576, 8577 used; under 8600).
-- Source is ALWAYS the canon 2 Timothy verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Timothy = the apostle's last words, the charge to guard the deposit and
-- endure; one olive tree, no replacement theology, no law-vs-grace antithesis). Chapter 2 hands
-- Timothy the soldier's, athlete's, and husbandman's labours, then plants the two load-bearing
-- centers: ★★ 2:8 *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was
-- raised from the dead* — the Father raised the Son, the Formed, the promised seed of David per
-- 2 Samuel 7:12 and the Branch of Isaiah 11:1; keep the Father the One who raises and the Son the
-- Formed seed of David, no co-equal-persons grammar. And ★★ 2:19 *the foundation of Elohim (God)
-- standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. And, Let every one
-- that nameth the name of Messiah (Christ) depart from iniquity* — the double seal re-speaks
-- Numbers 16:5 (*Yahuah will shew who are his, and who is holy*) and Isaiah 52:11 (*depart ye,
-- depart ye... be ye clean*), with Yahuah's own knowing of his own confirmed in Nahum 1:7 and
-- Psalm 1:6. The faithful saying of 2:11-13 (*if we be dead with him, we shall also live with
-- him... if we suffer, we shall also reign with him*) is the endurance promise the Hebrew library
-- already held out to the righteous (Wisdom 3:5-8, 5:15-16) and which Paul speaks again in
-- Romans 6:8.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-7   be strong, commit to faithful men, endure as a soldier/athlete/husbandman
--           Tanakh: none warranted (the soldier/athlete/husbandman figures are Paul's own;
--                   no single load-bearing Tanakh root — drop verbal coincidence)
--           Extras: none warranted   NT: none warranted (carried in prose; reign-reward woven at 2:11-13)
--   v.8-10  the risen seed of David, the word of Elohim not bound, the elect's salvation
--           Tanakh: 2 Samuel 7:12 (I will set up thy seed after thee), Isaiah 11:1 (a rod out of
--                   the stem of Jesse), Isaiah 11:10 (a root of Jesse... an ensign of the people)
--           Extras: none warranted
--           NT: Acts 2:30 (of the fruit of his loins... raise up Messiah to sit on his throne),
--               Romans 1:3-4 (made of the seed of David... by the resurrection from the dead)
--   v.11-13 the faithful saying: dead with him -> live with him; suffer -> reign with him
--           Tanakh: none warranted (the die/live/reign promise carried by extras + NT)
--           Extras: Wisdom of Solomon 3:5-8 (a little chastised, greatly rewarded... they shall
--                   judge the nations, and have dominion), Wisdom of Solomon 5:15-16 (the righteous
--                   live for evermore... a glorious kingdom, and a beautiful crown)
--           NT: Romans 6:8 (if we be dead with Messiah... we shall also live with him)
--   v.14-18 strive not about words; rightly dividing the word of truth; resurrection-past error
--           Tanakh: none warranted (the workman/rightly-dividing charge is pastoral, no single root)
--           Extras: none warranted   NT: none warranted
--   v.19    ★★ the foundation standeth sure: Yahuah knoweth them that are his / depart from iniquity
--           Tanakh: Numbers 16:5 (Yahuah will shew who are his, and who is holy), Psalm 1:6
--                   (Yahuah knoweth the way of the righteous), Nahum 1:7 (he knoweth them that
--                   trust in him), Isaiah 52:11 (depart ye, depart ye... be ye clean)
--           Extras: none warranted   NT: none warranted (the seal is the Tanakh double-root)
--   v.20-26 vessels to honour, flee youthful lusts, the servant of Yahuah, the snare of the devil
--           Tanakh: none warranted (vessel-imagery echoes the potter but is not load-bearing here)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8575 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11   (Tanakh + NT)
--   8576 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6  (Extras + NT)
--   8577 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16  (Tanakh)  [BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s236_t236c2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11
  ('canon', '2-timothy', 2, 8, 'canon', '2-samuel', 7, 12, 'free', E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom.* (2 Samuel 7:12). Yahuah (LORD) swore to David a seed out of his own bowels whose kingdom would be established for ever. Paul charges Timothy to *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8) — the very seed the oath named, raised by the Father from the dead to take the throne. Keep the order the texts keep: the Father is the One who set up the seed and raised him; the Son is the Formed, the seed of David, the heir of the established kingdom.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'isaiah', 11, 1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots:* (Isaiah 11:1). Isaiah named the seed of David as a Branch sprung from Jesse''s stem — the very seed Paul bids Timothy remember: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead* (2 Timothy 2:8). The Branch out of Jesse''s root is the risen One, of the seed of David, raised by the Father; the rod from the stem is no felled and forgotten tree but the living heir of the Davidic promise.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'isaiah', 11, 10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* (Isaiah 11:10). The *root of Jesse* stands as an ensign to which the nations gather — the seed of David lifted up. Paul''s gospel rests on this risen root: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The ensign to which the Gentiles seek is the raised seed of David; the gathering of the nations is the gathering to him, not to a new people but to the root of Jesse himself.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'acts', 2, 30, 'free', E'*Therefore being a prophet, and knowing that Elohim (God) had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne;* (Acts 2:30). Peter reads the Davidic oath exactly as Paul does: Elohim (God) *sworn with an oath* that *of the fruit of his loins... he would raise up Messiah (Christ) to sit on his throne* — the seed of David raised to reign. Paul says the same: *Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). Elohim (God) the Father raises the seed; the Son raised is the Formed who sits on David''s throne.'),
  ('canon', '2-timothy', 2, 8, 'canon', 'romans', 1, 4, 'free', E'*And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4). Paul opens Romans with the same two-fold gospel he hands Timothy here: the One *made of the seed of David according to the flesh* (Romans 1:3) and *declared to be the Son of Elohim (God) with power... by the resurrection from the dead* (Romans 1:4). It is the very confession of 2 Timothy 2:8 — *of the seed of David was raised from the dead.* The Father raised the Son and so declared him; the seed of David and the risen Son are one Formed person, raised, not self-raising.')
,
  -- thread: 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6
  ('canon', '2-timothy', 2, 11, 'canon', 'romans', 6, 8, 'free', E'*Now if we be dead with Messiah (Christ), we believe that we shall also live with him:* (Romans 6:8). Paul speaks elsewhere the very faithful saying he cites to Timothy: *It is a faithful saying: For if we be dead with him, we shall also live with him* (2 Timothy 2:11). To die with the Messiah is to be raised with him; the death is not loss but the pledge of the shared life. The same gospel of the risen seed of David (2:8) is the ground of the believer''s own resurrection hope — dead with him, then alive with him.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 5, 'extras', E'*And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself.* (Wisdom of Solomon 3:5). The Hebrew library already held the endurance-and-reward promise Paul speaks: *If we suffer, we shall also reign with him* (2 Timothy 2:12). The righteous *a little chastised* are *greatly rewarded* — the suffering is the proving, and the reward is to share the reign. The light affliction of the soldier of Yahusha HaMashiach (Jesus Christ) is the door to the kingdom, not a sign of abandonment.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 3, 8, 'extras', E'*They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever.* (Wisdom of Solomon 3:8). The righteous who were chastised and proved are given dominion: *they shall judge the nations, and have dominion over the people.* This is the reign Paul promises the enduring: *if we suffer, we shall also reign with him* (2 Timothy 2:12). The dominion of the righteous is not their own but a sharing in the reign of the One whose *Elohim (God) shall reign for ever* — to reign with him is to be where he is.'),
  ('canon', '2-timothy', 2, 12, 'apocrypha', 'the-wisdom-of-solomon', 5, 16, 'extras', E'*Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them.* (Wisdom of Solomon 5:16). The library names the reward of the enduring righteous: *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God).* It is the same crown and reign Paul sets before Timothy — *if we suffer, we shall also reign with him* (2 Timothy 2:12) — and the warning that follows, *if we deny him, he also will deny us* (2 Timothy 2:12), guards the crown: it is from the hand of Yahuah (God), kept for those who endure.')
,
  -- thread: 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16  [BLESSING]
  ('canon', '2-timothy', 2, 19, 'canon', 'numbers', 16, 5, 'free', E'*And he spake unto Korah and unto all his company, saying, Even to morrow Yahuah (LORD) will shew who are his, and who is holy; and will cause him to come near unto him: even him whom he hath chosen will he cause to come near unto him.* (Numbers 16:5). When Korah''s company rose against Moses, the answer was that Yahuah (LORD) himself would *shew who are his, and who is holy.* Paul stamps that very seal on the foundation: *the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). The first half of the seal is Numbers 16:5 spoken again — against every pretender and false teacher, Yahuah (Lord) knows and shews who are truly his.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'isaiah', 52, 11, 'free', E'*Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD).* (Isaiah 52:11). The second half of the seal is Isaiah''s call to the bearers of the vessels: *Depart ye, depart ye... touch no unclean thing... be ye clean.* Paul writes it as the answering side of the seal: *Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19). Yahuah (Lord) knows his own, and his own depart from iniquity — the two halves of the one sure seal: his knowing, and their cleanness; election and holiness held together, never set against each other.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'psalms', 1, 6, 'free', E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:6). The first psalm rests on the same knowing Paul calls the seal: *Yahuah (LORD) knoweth the way of the righteous.* So *the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). The knowing of Yahuah (Lord) is not bare information but the keeping of his own; the way he knows endures, and the way he does not know perishes — the sure foundation against which no resurrection-denying word can prevail.'),
  ('canon', '2-timothy', 2, 19, 'canon', 'nahum', 1, 7, 'free', E'*Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him.* (Nahum 1:7). Nahum joins the knowing of Yahuah (LORD) to the security of his own: *he knoweth them that trust in him.* This is the comfort of the seal Paul stamps on the foundation: *Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19). In the day of trouble, when the word of some is overthrown, the foundation stands because Yahuah (Lord) is the strong hold who knows his own and keeps them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s236_t236c2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s236_t236c2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11',
       E'The risen seed of David, raised from the dead (2 Samuel 7, Isaiah 11)',
       E'Paul hands Timothy the heart of his gospel in a single charge: *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). Two ancient words stand behind it. First the oath to David: *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12) — Yahuah (LORD) himself promising a seed out of David''s own body whose throne would stand. Then the prophet''s naming of that seed: *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), and *in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10). The seed of David is the Branch from Jesse''s stem, the root that becomes the ensign of the nations. The apostles read these texts as one: Peter declared that Elohim (God) *had sworn with an oath... that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30), and Paul opens Romans with the same two-fold confession — *made of the seed of David according to the flesh; And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead* (Romans 1:3-4). Keep the order the whole library keeps: the Father is the One who set up the seed, swore the oath, and raised him from the dead; the Son is the Formed, the seed of David, the Branch of Jesse raised to the throne. He does not raise himself; he is raised — and being raised, declared the Son of Elohim (God) with power. The risen seed of David is the unbroken Davidic promise come to its appointed heir, the gospel for which Paul suffers bonds while *the word of Elohim (God) is not bound* (2 Timothy 2:9).',
       sv.verse_id, ev.verse_id, 'free', 8575
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6',
       E'If we be dead with him, we shall live and reign with him (Wisdom of Solomon 3, 5; Romans 6)',
       E'Paul seals his charge to endure with a faithful saying: *It is a faithful saying: For if we be dead with him, we shall also live with him: If we suffer, we shall also reign with him: if we deny him, he also will deny us: If we believe not, yet he abideth faithful: he can not deny himself* (2 Timothy 2:11-13). The promise that death-with-him is the door to life-with-him is no new thing; Paul speaks it again in Romans: *Now if we be dead with Messiah (Christ), we believe that we shall also live with him* (Romans 6:8) — the death the pledge of the resurrection. And the reign Paul holds out to the suffering, the Hebrew library already set before the righteous. *And having been a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them, and found them worthy for himself* (Wisdom of Solomon 3:5); the proving issues in dominion — *They shall judge the nations, and have dominion over the people, and their Elohim (God) shall reign for ever* (Wisdom of Solomon 3:8). The same library names the reward as a crown: *Therefore shall they receive a glorious kingdom, and a beautiful crown from the hand of Yahuah (God): for with his right hand shall he cover them, and with his arm shall he protect them* (Wisdom of Solomon 5:16). This is the reign Paul promises — *if we suffer, we shall also reign with him* (2 Timothy 2:12) — and the warning that the crown is from the hand of Yahuah (God), kept for those who do not deny. The light chastening of the soldier is the proving; the kingdom and the crown are the reward; and the ground of it all is the faithfulness of the One who *abideth faithful: he can not deny himself* (2 Timothy 2:13).',
       sv.verse_id, ev.verse_id, 'extras', 8576
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16',
       E'The foundation standeth sure: Yahuah knoweth them that are his, and depart from iniquity (Numbers 16, Isaiah 52)',
       E'Against the false teachers whose word *will eat as doth a canker* and who say *the resurrection is past already* (2 Timothy 2:17-18), Paul plants an unshakeable rock: *Nevertheless the foundation of Elohim (God) standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. And, Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19). The seal is double, and both halves are the Tanakh spoken again. The first half is the answer to Korah''s rebellion: when men rose against Moses, Moses said, *Even to morrow Yahuah (LORD) will shew who are his, and who is holy; and will cause him to come near unto him: even him whom he hath chosen will he cause to come near unto him* (Numbers 16:5). Yahuah (Lord) himself shews who are his — no usurper, no resurrection-denier, can counterfeit it. That knowing runs through the Writings and the Prophets: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6); *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him* (Nahum 1:7). His knowing is not bare information but the keeping of his own in the day of trouble. The second half of the seal is Isaiah''s call to the bearers of the holy vessels: *Depart ye, depart ye, go ye out from thence, touch no unclean thing; go ye out of the midst of her; be ye clean, that bear the vessels of Yahuah (LORD)* (Isaiah 52:11). Paul writes it as the answering side: *Let every one that nameth the name of Messiah (Christ) depart from iniquity.* The two halves are one seal and must never be split: Yahuah (Lord) knows his own, and his own depart from iniquity — election and holiness, his knowing and their cleanness, held together. The foundation stands sure not because the teachers are silenced but because Yahuah (Lord) knows whom he has chosen and calls them to be clean, as he has from Sinai to the prophets to this last charge.',
       sv.verse_id, ev.verse_id, 'free', 8577
  FROM _s236_t236c2_lookup sv, _s236_t236c2_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-timothy' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Samuel 7:12 — *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* the Davidic oath; the seed Paul bids Timothy remember, *of the seed of David was raised from the dead* (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:1 — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* the seed of David named as the Branch; the risen One *of the seed of David* (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:10 — *a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* the seed of David lifted as the ensign of the nations; the risen root of Paul''s gospel (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:30 — *of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* Peter reading the Davidic oath as Paul does; Elohim (God) the Father raises the seed (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 1:4 — *declared to be the Son of Elohim (God) with power... by the resurrection from the dead* the same two-fold gospel (seed of David / raised); the Father raises and so declares the Son (2 Timothy 2:8).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-risen-seed-of-david-raised-from-the-dead-2-samuel-7-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:8 — *if we be dead with Messiah (Christ)... we shall also live with him* the same faithful saying spoken again; death-with-him the pledge of life-with-him (2 Timothy 2:11).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:5 — *a little chastised, they shall be greatly rewarded: for Yahuah (God) proved them* the suffering as proving, the door to reward; *if we suffer, we shall also reign with him* (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 3:8 — *They shall judge the nations, and have dominion over the people* the dominion of the proved righteous; the reign Paul promises the enduring (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:16 — *a glorious kingdom, and a beautiful crown from the hand of Yahuah (God)* the crown and kingdom of the enduring righteous; *if we suffer, we shall also reign with him* (2 Timothy 2:12), the crown guarded by *if we deny him, he also will deny us* (2 Timothy 2:12).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-if-we-be-dead-with-him-we-shall-live-and-reign-wisdom-3-5-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 16:5 — *Yahuah (LORD) will shew who are his, and who is holy* the answer to Korah''s rebellion; the first half of the seal, *Yahuah (Lord) knoweth them that are his* (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 52:11 — *Depart ye, depart ye... touch no unclean thing... be ye clean, that bear the vessels of Yahuah (LORD)* the second half of the seal; *Let every one that nameth the name of Messiah (Christ) depart from iniquity* (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* the knowing that keeps his own; the sure seal of the foundation (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nahum 1:7 — *Yahuah (LORD) is good, a strong hold in the day of trouble; and he knoweth them that trust in him* the knowing joined to keeping; the foundation stands because Yahuah (Lord) knows his own (2 Timothy 2:19).'
  FROM cross_reference_threads t, cross_references x, _s236_t236c2_lookup sv, _s236_t236c2_lookup tv
 WHERE t.slug='2-timothy-2-the-foundation-standeth-sure-yahuah-knoweth-them-that-are-his-numbers-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-timothy' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
