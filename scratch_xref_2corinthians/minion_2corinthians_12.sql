-- ----- fragment: minion_2corinthians_12.sql (S229 2 Corinthians 12) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 12 (21 verses) — caught up to the third heaven / the thorn
--   in the flesh / strength made perfect in weakness.
-- Tag: 2c12 (temp view _s229_2c12_lookup).
-- Sort band: floor 7275, step 3 (7275, 7278, 7281 used; under 7300).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Paul, pressed to glory by the false apostles, will boast only in what abases the
-- flesh. He tells of *a man in Messiah* caught up *to the third heaven... into paradise* (12:2-4) — and
-- will not glory in the ascent but in his infirmities. The thorn in the flesh, *the messenger of Satan
-- to buffet me* (12:7), is given to keep him low, and Yahuah''s (Lord''s) answer is the heart of the
-- chapter: *My grace is sufficient for thee: for my strength is made perfect in weakness* (12:9), so that
-- *when I am weak, then am I strong* (12:10). The paradise/ascent block draws the restored library''s
-- ascent-witness (the Ascension of Isaiah carried through the heavens, *how far will he ascend that
-- dwelleth in the flesh?*) and the canon paradise (Luke 23:43, the tree of life in the paradise of Elohim,
-- Revelation 2:7). The thorn draws Job: Satan permitted to buffet, but bounded by Yahuah (LORD) and
-- serving Yahuah''s (LORD''s) purpose. The strength-in-weakness block draws the Tanakh root that strength
-- belongs to Yahuah (LORD), given to the faint, the boast that is in knowing him, not in might.
--   NOTE ON 2 ENOCH: the brief flags 2 Enoch (pseudepigrapha-charles-vol2) as the natural ascent witness,
--   but the parsed text of 2 Enoch ch.8/22-24 carries heavy Charles critical-apparatus fragments and OCR
--   garble INSIDE the verses (line-headers, footnote text, transliterated Greek/Hebrew). Per the brief''s
--   "do not quote a verse that carries apparatus noise — pick a clean witness instead" rule, 2 Enoch is
--   recorded NONE WARRANTED for this chapter; the Ascension of Isaiah is the clean ascent witness used.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   caught up to the third heaven, into paradise, heard unspeakable words
--           Tanakh: Genesis 2:8-9 (the garden/tree of life in Eden — the paradise root)
--           Extras: Ascension of Isaiah 8:11 (no man returning to a body has ascended/seen this),
--                   9:1 (how far will he ascend that dwelleth in the flesh?), 9:8 (the righteous
--                   stript of the flesh, in garments of glory) — clean ascent witness
--                   [2 Enoch: NONE WARRANTED — apparatus noise inside the parsed verses]
--           NT: Luke 23:43 (to day shalt thou be with me in paradise),
--               Revelation 2:7 (the tree of life in the midst of the paradise of Elohim)
--   v.7-9   a thorn in the flesh, the messenger of Satan to buffet me
--           Tanakh: Job 1:12 (all he hath in thy power; upon himself put not forth thine hand),
--                   Job 2:6-7 (he is in thine hand, but save his life; Satan smote Job)
--           Extras: none warranted   NT: none warranted (carried by the Job root)
--   v.9-10  my grace is sufficient; my strength is made perfect in weakness; when weak, then strong
--           Tanakh: Isaiah 40:29-31 (power to the faint, they that wait renew their strength),
--                   Jeremiah 9:23-24 (glory not in might but in knowing Yahuah),
--                   Zechariah 4:6 (not by might, nor by power, but by my spirit)
--           Extras: none warranted   NT: none warranted (carried by the Tanakh roots)
--   v.11-21 chiefest apostles / signs of an apostle / not burdensome / fear of debates and uncleanness
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--                   (pastoral self-defense and the closing warning; no load-bearing parallel)
--
-- THREADS (slug -> target libraries):
--   7275 2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah  (Tanakh + Extras + NT)
--   7278 2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2     (Tanakh)
--   7281 2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah
  ('canon', '2-corinthians', 12, 4, 'canon', 'luke', 23, 43, 'free', E'*And Yahusha (Jesus) said unto him, Verily I say unto thee, To day shalt thou be with me in paradise.* (Luke 23:43). Paul tells how the man in Messiah (Christ) *was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). The paradise into which Paul was caught up is the very place Yahusha (Jesus) promised the dying thief — *to day shalt thou be with me in paradise.* It is no abstraction but the garden-dwelling of Yahuah (LORD) where the redeemed are received; what Paul glimpsed and could not lawfully utter is the place the Master himself opened to a thief with a word.'),
  ('canon', '2-corinthians', 12, 4, 'canon', 'revelation', 2, 7, 'free', E'*He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* (Revelation 2:7). Paul *was caught up into paradise, and heard unspeakable words* (2 Corinthians 12:4); John names what is in that paradise — *the tree of life, which is in the midst of the paradise of Elohim (God).* The paradise of the ascent is the paradise of the overcomer''s reward, the Eden-garden restored, the tree of life that was barred to Adam given again to them that overcome. Paul was caught up to where the gathered are bound.'),
  ('canon', '2-corinthians', 12, 4, 'canon', 'genesis', 2, 9, 'free', E'*And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). Before paradise was a thing caught up to, it was a garden planted on the earth: Yahuah Elohim (the LORD God) grew *the tree of life also in the midst of the garden.* The *paradise* into which Paul *was caught up* (2 Corinthians 12:4) is that same garden of Yahuah (LORD), from which man was driven and to which the redeemed are restored — the beginning and the end of the covenant story, the Eden lost in Adam and regained in Messiah (Christ).'),
  ('canon', '2-corinthians', 12, 2, 'ascension-isaiah', 'ascension-isaiah', 8, 11, 'extras', E'*I indeed say unto thee, Isaiah; No man about to return into a body of that world has ascended or seen what thou seest or perceived what thou hast perceived and what thou wilt see.* (Ascension of Isaiah 8:11). The restored library tells of a seer carried up through the heavens and told that *no man about to return into a body of that world has ascended or seen* such things. Paul, *caught up to the third heaven* (2 Corinthians 12:2), strikes the same note: *whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth.* What is seen in the ascent is shown to one who must yet return to the body, and *heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4).'),
  ('canon', '2-corinthians', 12, 3, 'ascension-isaiah', 'ascension-isaiah', 9, 1, 'extras', E'*AND he took me into the air of the seventh heaven, and moreover I heard a voice saying: "How far will he ascend that dwelleth in the flesh?" And I feared and trembled.* (Ascension of Isaiah 9:1). As Isaiah is raised, a voice asks *how far will he ascend that dwelleth in the flesh?* — the very question Paul cannot answer of his own ascent: *whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth* (2 Corinthians 12:3). The ascent of a man still bound to flesh is a marvel that makes the seer fear and tremble; Paul refuses to glory in it, *lest any man should think of me above that which he seeth me to be* (2 Corinthians 12:6).'),
  ('canon', '2-corinthians', 12, 4, 'ascension-isaiah', 'ascension-isaiah', 9, 8, 'extras', E'*And there I saw Enoch and all who were with him, stript of the garments of the flesh, and I saw them in their garments of the upper world, and they were like angels, standing there in great glory.* (Ascension of Isaiah 9:8). In the highest heaven the seer beholds the righteous *stript of the garments of the flesh... in their garments of the upper world... in great glory.* This is the company among whom paradise places the redeemed — the place into which Paul *was caught up... and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). The glory laid up for the righteous is real and bodily-clothed in the garments of the upper world, the hope toward which the whole letter strains.'),
  -- thread: 2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2
  ('canon', '2-corinthians', 12, 7, 'canon', 'job', 1, 12, 'free', E'*And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD).* (Job 1:12). The adversary is no free agent: he afflicts only by Yahuah''s (LORD''s) leave and only within Yahuah''s (LORD''s) bounds — *all that he hath is in thy power; only upon himself put not forth thine hand.* So too Paul''s *thorn in the flesh, the messenger of Satan to buffet me* (2 Corinthians 12:7) is a buffeting Yahuah (LORD) permits and governs, given *lest I should be exalted above measure.* The messenger of Satan serves the purpose of Yahuah (LORD), as Satan''s hand against Job served the proving of a righteous man.'),
  ('canon', '2-corinthians', 12, 7, 'canon', 'job', 2, 6, 'free', E'*And Yahuah (LORD) said unto Satan, Behold, he is in thine hand; but save his life.* (Job 2:6). A second time Yahuah (LORD) hands Job over with a fixed limit — *he is in thine hand; but save his life.* The bound adversary may buffet but may not destroy. Paul''s *messenger of Satan to buffet me* (2 Corinthians 12:7) operates under the same governing hand: it presses and humbles but cannot undo, for the One who permits it has already spoken the sufficient word over it — *My grace is sufficient for thee* (2 Corinthians 12:9).'),
  ('canon', '2-corinthians', 12, 7, 'canon', 'job', 2, 7, 'free', E'*So went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown.* (Job 2:7). Satan *smote Job with sore boils* in his very flesh — an affliction in the body, sent under heaven''s permission, that Job might be proved and not destroyed. Paul carries his own affliction in the flesh: *there was given to me a thorn in the flesh, the messenger of Satan to buffet me* (2 Corinthians 12:7). The smiting that fell on Job''s flesh and the thorn that pierced Paul''s are the same kind of bounded buffeting, turned by Yahuah (LORD) to keep the servant low and to make his strength perfect in weakness.'),
  -- thread: 2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9
  ('canon', '2-corinthians', 12, 9, 'canon', 'isaiah', 40, 29, 'free', E'*He giveth power to the faint; and to them that have no might he increaseth strength.* (Isaiah 40:29). The strength Paul is promised is the strength Isaiah declares belongs to Yahuah (LORD) and is given to the weak: *he giveth power to the faint; and to them that have no might he increaseth strength.* So Yahuah (LORD) answers Paul, *My grace is sufficient for thee: for my strength is made perfect in weakness* (2 Corinthians 12:9). The faint and the might-less are exactly the ones Yahuah (LORD) strengthens; Paul''s infirmity is not the absence of power but the place where the power of Messiah (Christ) comes to rest.'),
  ('canon', '2-corinthians', 12, 9, 'canon', 'isaiah', 40, 31, 'free', E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint.* (Isaiah 40:31). Isaiah promises that *they that wait upon Yahuah (LORD) shall renew their strength* — a strength that comes from without, from the One waited upon, not mustered from within. This is the strength *made perfect in weakness* (2 Corinthians 12:9): when Paul takes pleasure *in infirmities* so *that the power of Messiah (Christ) may rest upon me,* and finds that *when I am weak, then am I strong* (2 Corinthians 12:9-10). The renewed strength of the waiting is the strength of the One who is leaned upon.'),
  ('canon', '2-corinthians', 12, 10, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). Yahuah (LORD) forbids the boast in might — *let not the mighty man glory in his might.* Paul lives the prohibition inside out: he glories not in might but *in mine infirmities* (2 Corinthians 12:9), taking pleasure *in infirmities... in distresses for Messiah''s (Christ''s) sake: for when I am weak, then am I strong* (2 Corinthians 12:10). The glory that Jeremiah strips from the mighty Paul finds in weakness, for the strength is not his own.'),
  ('canon', '2-corinthians', 12, 10, 'canon', 'jeremiah', 9, 24, 'free', E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD).* (Jeremiah 9:24). The one boast Yahuah (LORD) allows is the boast in knowing him — *let him that glorieth glory in this, that he understandeth and knoweth me.* Paul''s glorying in weakness is that very boast, for it casts him wholly upon the One who said *My grace is sufficient for thee* (2 Corinthians 12:9); his strength when weak (2 Corinthians 12:10) is the lovingkindness and power of Yahuah (LORD) made known in him, not a credential of his own.'),
  ('canon', '2-corinthians', 12, 9, 'canon', 'zechariah', 4, 6, 'free', E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6). The work of Yahuah (LORD) is accomplished *not by might, nor by power, but by my spirit.* That is the law of Paul''s ministry too: the *strength... made perfect in weakness* (2 Corinthians 12:9) is the strength of the Spirit, not of the flesh, so that *the power of Messiah (Christ) may rest upon* him in his infirmity. What Zechariah said of rebuilding the house, Paul knows of his whole labour — the power is Yahuah''s (LORD''s) Spirit, given where human might fails.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah',
       E'Caught up to the third heaven, into paradise (the Ascension of Isaiah, Luke 23, Revelation 2)',
       E'Pressed to glory, Paul will tell one thing and not glory in it: *I knew a man in Messiah (Christ) above fourteen years ago... such an one caught up to the third heaven* (2 Corinthians 12:2), *caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). He cannot even say how it was — *whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth.* The restored library knew this kind of ascent and its wonder. Isaiah, carried up through the heavens, is told *No man about to return into a body of that world has ascended or seen what thou seest or perceived what thou hast perceived* (Ascension of Isaiah 8:11); a voice asks of him *How far will he ascend that dwelleth in the flesh?* (Ascension of Isaiah 9:1) — the very thing Paul cannot answer of himself. And in the highest heaven Isaiah sees the righteous *stript of the garments of the flesh... in their garments of the upper world, and they were like angels, standing there in great glory* (Ascension of Isaiah 9:8) — the company paradise gathers. The paradise Paul was caught up to is no abstraction: it is the garden of Yahuah (LORD). It is the place Yahusha (Jesus) opened to a dying thief with a word — *To day shalt thou be with me in paradise* (Luke 23:43); it is where *the tree of life... is in the midst of the paradise of Elohim (God)* (Revelation 2:7), the reward of the overcomer; and it is the garden of the beginning, where Yahuah Elohim (the LORD God) grew *the tree of life also in the midst of the garden* (Genesis 2:9). The Eden lost in Adam is the paradise regained in Messiah (Christ) — and Paul, having seen it, will glory not in the seeing but in his infirmities, *lest I should be exalted above measure* (2 Corinthians 12:7).',
       sv.verse_id, ev.verse_id, 'extras', 7275
  FROM _s229_2c12_lookup sv, _s229_2c12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2',
       E'A thorn in the flesh, the messenger of Satan to buffet me (Job 1-2)',
       E'Lest the abundance of the revelations lift him up, Paul is given a burden in the body: *there was given to me a thorn in the flesh, the messenger of Satan to buffet me, lest I should be exalted above measure* (2 Corinthians 12:7). Mark the grammar of it — the messenger is Satan''s, yet the thorn *was given,* and given for a holy end. The book of Job shows the same hand at work. When the adversary would strike Job, Yahuah (LORD) sets the bound: *Behold, all that he hath is in thy power; only upon himself put not forth thine hand* (Job 1:12); and again, *Behold, he is in thine hand; but save his life* (Job 2:6). Satan is no free agent; he buffets only by leave and only within the line Yahuah (LORD) draws. So *went Satan forth from the presence of Yahuah (LORD), and smote Job with sore boils from the sole of his foot unto his crown* (Job 2:7) — an affliction in the very flesh, permitted, bounded, and turned to the proving of a righteous man. Paul''s thorn is that same bounded buffeting: a messenger of Satan that Yahuah (LORD) permits and governs to keep his servant low. And over it Paul hears the sufficient word — *My grace is sufficient for thee* (2 Corinthians 12:9) — the answer that the One who permits the buffeting has already spoken its end.',
       sv.verse_id, ev.verse_id, 'free', 7278
  FROM _s229_2c12_lookup sv, _s229_2c12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9',
       E'My strength is made perfect in weakness (Isaiah 40, Jeremiah 9, Zechariah 4)',
       E'Here is the heart of the chapter and the answer to the thorn: *And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness... for when I am weak, then am I strong* (2 Corinthians 12:9-10). This is no novelty but the settled law of the Tanakh, that strength is Yahuah''s (LORD''s) to give, and he gives it to the weak. Isaiah declares it plainly: *He giveth power to the faint; and to them that have no might he increaseth strength* (Isaiah 40:29), and *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles* (Isaiah 40:31) — a strength that comes from without, from the One waited upon, not mustered from within. So Paul takes pleasure in his infirmities, *that the power of Messiah (Christ) may rest upon* him. The boast that goes with it is the boast Jeremiah allows: *Let not the mighty man glory in his might* (Jeremiah 9:23), *but let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* (Jeremiah 9:24). Paul glories not in might but in weakness, and so glories in knowing the One whose strength is made perfect there. And it is the same word Yahuah (LORD) gave Zerubbabel for the rebuilding of his house: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The power that finishes the work of Yahuah (LORD) is the Spirit, given exactly where human might fails — which is why the weak servant, leaning wholly on grace, is the strong one.',
       sv.verse_id, ev.verse_id, 'free', 7281
  FROM _s229_2c12_lookup sv, _s229_2c12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=12 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ascension of Isaiah 8:11 — *No man about to return into a body of that world has ascended or seen what thou seest* the ascent shown to one who must return to the body; Paul *caught up to the third heaven... whether in the body, I cannot tell* (2 Corinthians 12:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ascension of Isaiah 9:1 — *How far will he ascend that dwelleth in the flesh?* the question Paul cannot answer of his own ascent: *whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth* (2 Corinthians 12:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ascension of Isaiah 9:8 — *the righteous... stript of the garments of the flesh... in their garments of the upper world... in great glory* the company paradise gathers; the place Paul *was caught up into... and heard unspeakable words* (2 Corinthians 12:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 23:43 — *To day shalt thou be with me in paradise* the paradise the Master opened to the dying thief; the place into which Paul *was caught up* (2 Corinthians 12:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 2:7 — *the tree of life, which is in the midst of the paradise of Elohim (God)* the overcomer''s reward in paradise; the paradise into which Paul *was caught up* (2 Corinthians 12:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 2:9 — *the tree of life also in the midst of the garden* the paradise-garden of the beginning; the Eden lost in Adam and the paradise Paul *was caught up into* in Messiah (Christ) (2 Corinthians 12:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-caught-up-to-the-third-heaven-into-paradise-the-ascension-of-isaiah'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 1:12 — *all that he hath is in thy power; only upon himself put not forth thine hand* the adversary bounded by Yahuah (LORD); Paul''s *messenger of Satan to buffet me* permitted and governed (2 Corinthians 12:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 2:6 — *he is in thine hand; but save his life* the fixed limit on the adversary; the thorn that buffets but cannot undo, under the One who said *My grace is sufficient for thee* (2 Corinthians 12:7,9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 2:7 — *smote Job with sore boils from the sole of his foot unto his crown* the bounded affliction in the flesh; the same kind of buffeting as Paul''s *thorn in the flesh* (2 Corinthians 12:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-a-thorn-in-the-flesh-the-messenger-of-satan-to-buffet-me-job-1-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:29 — *He giveth power to the faint; and to them that have no might he increaseth strength* the strength Yahuah (LORD) gives the weak; *my strength is made perfect in weakness* (2 Corinthians 12:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength* strength from the One waited upon, not from within; the strength *made perfect in weakness* (2 Corinthians 12:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:23 — *let not the mighty man glory in his might* the boast in might forbidden; Paul glories instead *in mine infirmities* (2 Corinthians 12:9-10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 9:24 — *let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* the one allowed boast; Paul''s glorying in weakness casts him on the One whose grace is sufficient (2 Corinthians 12:9-10).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Zechariah 4:6 — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* the work done by the Spirit, not the flesh; the strength *made perfect in weakness* (2 Corinthians 12:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c12_lookup sv, _s229_2c12_lookup tv
 WHERE t.slug='2-corinthians-12-my-strength-is-made-perfect-in-weakness-isaiah-40-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
