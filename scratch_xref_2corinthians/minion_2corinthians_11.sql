-- ----- fragment: minion_2corinthians_11.sql (S229 2 Corinthians 11) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 11 (33 verses) — espoused to one husband / the serpent
--   beguiled Eve / Satan as an angel of light / Paul's sufferings / let down in a basket.
-- Tag: 2c11 (temp view _s229_2c11_lookup).
-- Sort band: floor 7250, step 3 (7250, 7253, 7256 used; under 7275).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul, jealous over the assembly with godly jealousy, has *espoused you to
-- one husband, that I may present you as a chaste virgin to Messiah* (11:2) — the marriage-covenant
-- figure of Yahuah (LORD) betrothing Yashar'el (Israel), *I will betroth thee unto me for ever*
-- (Hosea 2:19), the husband whose covenant they brake (Jeremiah 31:32). His fear is the Eden fear:
-- *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted* (11:3),
-- citing the serpent *more subtil than any beast of the field* (Genesis 3:1) and Eve's confession
-- *The serpent beguiled me, and I did eat* (Genesis 3:13). The false apostles who transform
-- themselves are the serpent's own craft: *Satan himself is transformed into an angel of light*
-- (11:14). The sufferings catalogue (11:23-28) and *through a window in a basket was I let down by
-- the wall* (11:33) are the lived cost of the apostleship, the Damascus escape of Acts 9:25 — the
-- chosen vessel told *how great things he must suffer for my name's sake* (Acts 9:16).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   jealous over you / espoused to one husband / the serpent beguiled Eve
--           Tanakh: Hosea 2:19-20 (I will betroth thee unto me for ever), Jeremiah 31:32 (I was
--                   an husband unto them), Exodus 34:14 (Yahuah whose name is Jealous, a jealous
--                   Elohim); Genesis 3:1,4,13 (the serpent beguiled me, and I did eat)
--           Extras: 1 Enoch 69:6 weighed (committed fornication, led astray, corrupt) — NOT added;
--                   the named-Gadreel verse (69:10) carries Charles bracket-apparatus inside the
--                   verse, so no clean extras witness pulls for the serpent block; none warranted
--           NT: none warranted (the serpent/betrothal roots are the Tanakh)
--   v.5-12  the chiefest apostles / preached the gospel freely / robbed other churches
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral defense)
--   v.13-15 false apostles transformed / Satan transformed into an angel of light
--           Tanakh: carried in the serpent thread (Genesis 3:1, the subtil deceiver) — folded there;
--                   no distinct load-bearing root   Extras: none warranted   NT: none warranted
--   v.16-22 boasting as a fool / Hebrews, Israelites, seed of Abraham
--           Tanakh: none warranted (boast-in-Yahuah carried at ch10:17)   Extras: none   NT: none
--   v.23-31 the sufferings catalogue / stripes, prisons, perils, the care of the churches
--           Tanakh: none warranted (a lived catalogue, not a quotation)
--           Extras: none warranted   NT: Acts 9:16 (how great things he must suffer for my name)
--   v.32-33 let down by the wall in a basket / escaped the governor under Aretas
--           Tanakh: none warranted   Extras: none warranted
--           NT: Acts 9:25 (the disciples let him down by the wall in a basket), Acts 9:23-24
--   v.33 ties to the sufferings thread via Acts 9
--
-- THREADS (slug -> target libraries):
--   7250 2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2  (Tanakh)
--   7253 2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3 (Tanakh)
--   7256 2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9      (NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2
  ('canon', '2-corinthians', 11, 2, 'canon', 'hosea', 2, 19, 'free', E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies.* (Hosea 2:19). This is the marriage-covenant Paul has in view when he says *I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). Yahuah (LORD) betroths Yashar''el (Israel) to himself for ever — not for a season, but in righteousness and faithfulness; and Paul, jealous *over you with godly jealousy,* stands as the friend of the bridegroom guarding that one betrothal. The assembly is the bride espoused to one husband, the Messiah; to be drawn after another is to break the betrothal Yahuah (LORD) swore to keep for ever.'),
  ('canon', '2-corinthians', 11, 2, 'canon', 'hosea', 2, 20, 'free', E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD).* (Hosea 2:20). The betrothal of Yahuah (LORD) to Yashar''el (Israel) is *in faithfulness,* and its end is that the bride *shalt know Yahuah (LORD).* Paul echoes the same single-hearted bond: *I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). The chaste virgin presented to the one husband is the faithful bride of Hosea, who is not divided among lovers but knows Yahuah (LORD) alone.'),
  ('canon', '2-corinthians', 11, 2, 'canon', 'jeremiah', 31, 32, 'free', E'*Not according to the covenant that I made with their fathers in the day that I took them by the hand to bring them out of the land of Egypt; which my covenant they brake, although I was an husband unto them, saith Yahuah (LORD):* (Jeremiah 31:32). Yahuah (LORD) names himself *an husband unto them* — the marriage-bond of the covenant, which the fathers brake. Paul takes up that same figure of the husband: *I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). The one husband of the assembly is the same Yahuah (LORD) who was husband to Yashar''el (Israel); the godly jealousy that guards the betrothal is his own, lest the bride again break covenant with the One who took her by the hand.'),
  ('canon', '2-corinthians', 11, 2, 'canon', 'exodus', 34, 14, 'free', E'*For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God):* (Exodus 34:14). The very name of Yahuah (LORD) is *Jealous,* and his is *a jealous Elohim (God)* — a jealousy bound up with the marriage-covenant, that the bride worship no other. Paul''s jealousy is that jealousy: *I am jealous over you with godly jealousy: for I have espoused you to one husband* (2 Corinthians 11:2). The apostle''s zeal for the chaste virgin is not his own possessiveness but the godly jealousy of the One whose name is Jealous, guarding his espoused from going after other lovers.'),
  -- thread: 2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3
  ('canon', '2-corinthians', 11, 3, 'canon', 'genesis', 3, 13, 'free', E'*And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* (Genesis 3:13). This is the text Paul cites: *I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). Eve''s own confession — *the serpent beguiled me, and I did eat* — is the pattern of the danger at Corinth: a beguiling that turns the mind from the single, simple devotion to the one husband. The same craft that drew the first woman from her Maker''s word is at work in the false apostles who would draw the bride from the simplicity that is in Messiah (Christ).'),
  ('canon', '2-corinthians', 11, 3, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). Paul names the serpent''s *subtilty* (2 Corinthians 11:3), and here is its first stroke: the serpent *more subtil than any beast of the field,* opening with a question that bends the word of Elohim (God) — *Yea, hath Elohim (God) said?* The corruption of the mind begins where the plain word is made to waver. So Paul fears for the assembly''s *minds,* lest the same subtle questioning corrupt them *from the simplicity that is in Messiah (Christ).*'),
  ('canon', '2-corinthians', 11, 3, 'canon', 'genesis', 3, 4, 'free', E'*And the serpent said unto the woman, Ye shall not surely die:* (Genesis 3:4). The serpent''s subtilty ends in a flat contradiction of Elohim (God) — *Ye shall not surely die* — the lie that overturns the word. This is the beguiling Paul sets before the Corinthians: *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). And it is no marvel, for the deceivers serve the deceiver: *Satan himself is transformed into an angel of light* (2 Corinthians 11:14). The serpent who told Eve she would not die wears now the dress of light, and his ministers the dress of righteousness; the same lie, the same craft, against the chaste virgin.'),
  ('canon', '2-corinthians', 11, 14, 'canon', 'genesis', 3, 1, 'free', E'*Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made.* (Genesis 3:1). The serpent''s mark is disguise — the most subtil beast, wearing craft as its covering. Paul unveils the same disguise in the false apostles: *Satan himself is transformed into an angel of light. Therefore it is no great thing if his ministers also be transformed as the ministers of righteousness* (2 Corinthians 11:14-15). The deceiver who beguiled Eve in the garden has not changed his method; he comes clothed as light, his ministers clothed as righteousness, the same subtil serpent against the espoused bride.'),
  -- thread: 2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9
  ('canon', '2-corinthians', 11, 33, 'canon', 'acts', 9, 25, 'free', E'*Then the disciples took him by night, and let him down by the wall in a basket.* (Acts 9:25). Paul closes the catalogue of his sufferings with this very escape: *And through a window in a basket was I let down by the wall, and escaped his hands* (2 Corinthians 11:33). The deed Luke records in Damascus — the disciples lowering him by night through the wall — is the deed Paul names as the lowest point of his boasting *of the things which concern mine infirmities* (2 Corinthians 11:30). The chosen vessel, hunted from the start, glories not in strength but in the basket let down by the wall.'),
  ('canon', '2-corinthians', 11, 32, 'canon', 'acts', 9, 24, 'free', E'*But their laying await was known of Saul. And they watched the gates day and night to kill him.* (Acts 9:24). Luke records the watch set against Saul at Damascus — the gates watched day and night — which Paul recalls: *In Damascus the governor under Aretas the king kept the city of the Damascenes with a garrison, desirous to apprehend me* (2 Corinthians 11:32). The garrison and the watched gates are the same peril; from the first days of his calling the apostle was a hunted man, and the perils he lists — *in perils in the city... in perils among false brethren* (2 Corinthians 11:26) — began at the very wall of Damascus.'),
  ('canon', '2-corinthians', 11, 23, 'canon', 'acts', 9, 16, 'free', E'*For I will shew him how great things he must suffer for my name''s sake.* (Acts 9:16). At Paul''s calling Yahuah (Lord) declared the shape of his whole ministry — *how great things he must suffer for my name''s sake.* The sufferings catalogue fulfils that word: *in labours more abundant, in stripes above measure, in prisons more frequent, in deaths oft* (2 Corinthians 11:23). The chosen vessel sent to bear the name before the Gentiles and kings and the children of Yashar''el (Israel) was sent to suffer; the stripes and prisons and perils Paul recounts are the *great things* the Master foretold he would bear for that name''s sake.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2',
       E'I have espoused you to one husband — the betrothal of Yashar''el (Israel) (Hosea 2)',
       E'Paul guards the assembly as a bride: *I am jealous over you with godly jealousy: for I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). The figure is the oldest covenant figure of all — Yahuah (LORD) the husband of Yashar''el (Israel). In Hosea, after the harlotry and the wilderness wooing, Yahuah (LORD) renews the marriage-bond: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19), *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:20). The betrothal is for ever, in faithfulness, ending in the bride''s knowing of her husband — and that is the chaste virgin Paul would present to the one husband. Jeremiah names the same bond and its breaking: the covenant *which my covenant they brake, although I was an husband unto them, saith Yahuah (LORD)* (Jeremiah 31:32) — Yahuah (LORD) the husband whose marriage Yashar''el (Israel) violated, now restored. And the jealousy Paul feels is no private possessiveness; it is the divine name itself: *Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14) — a jealousy bound to the marriage-covenant, that the bride worship no other. The apostle stands as friend of the bridegroom, watching over the espoused with the very jealousy of the One whose name is Jealous, that the bride not be drawn from the one husband to whom Yahuah (LORD) betrothed her for ever.',
       sv.verse_id, ev.verse_id, 'free', 7250
  FROM _s229_2c11_lookup sv, _s229_2c11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3',
       E'As the serpent beguiled Eve through his subtilty (Genesis 3)',
       E'Paul''s fear for the assembly is the Eden fear: *I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). He cites the garden directly. The serpent was *more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made,* and his first stroke was to bend the word with a question — *Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) — then to deny it outright: *Ye shall not surely die* (Genesis 3:4). And Eve''s own confession is the word Paul echoes: *The serpent beguiled me, and I did eat* (Genesis 3:13). The corruption began in the mind, where the plain word was made to waver; so Paul fears for the *minds* of the assembly, lest the same subtle craft draw them from the single, simple devotion to the one husband. And he names the serpent''s heir: *Satan himself is transformed into an angel of light. Therefore it is no great thing if his ministers also be transformed as the ministers of righteousness* (2 Corinthians 11:14-15). The deceiver who beguiled Eve has not changed his method — disguise was always his mark, the most subtil beast wearing craft as a covering — and now he comes clothed as light, his false apostles clothed as righteousness. The same lie, the same subtilty, against the chaste virgin espoused to Messiah (Christ).',
       sv.verse_id, ev.verse_id, 'free', 7253
  FROM _s229_2c11_lookup sv, _s229_2c11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9',
       E'Let down by the wall in a basket — the sufferings for the name (Acts 9)',
       E'Paul closes his boasting not in strength but in weakness: *If I must needs glory, I will glory of the things which concern mine infirmities* (2 Corinthians 11:30). The lowest point of the catalogue is the Damascus escape — *In Damascus the governor under Aretas the king kept the city of the Damascenes with a garrison, desirous to apprehend me: And through a window in a basket was I let down by the wall, and escaped his hands* (2 Corinthians 11:32-33). Luke records the same flight: *And they watched the gates day and night to kill him. Then the disciples took him by night, and let him down by the wall in a basket* (Acts 9:24-25). The watched gates and the lowered basket are one and the same peril; from the very first days of his calling the apostle was a hunted man. And the whole catalogue — *in labours more abundant, in stripes above measure, in prisons more frequent, in deaths oft* (2 Corinthians 11:23) — fulfils the word spoken at his calling: *For I will shew him how great things he must suffer for my name''s sake* (Acts 9:16). The chosen vessel sent to bear the name before the Gentiles and kings and the children of Yashar''el (Israel) was sent to suffer; the stripes and prisons and perils he recounts, and the basket let down by the wall, are the *great things* the Master foretold he would bear for that name''s sake.',
       sv.verse_id, ev.verse_id, 'free', 7256
  FROM _s229_2c11_lookup sv, _s229_2c11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=11 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 2:19 — *I will betroth thee unto me for ever... in righteousness, and in judgment, and in lovingkindness, and in mercies* Yahuah (LORD) betrothing Yashar''el (Israel) for ever; the one husband to whom Paul espoused the chaste virgin (2 Corinthians 11:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 2:20 — *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* the faithful betrothal whose end is knowing Yahuah (LORD); the chaste virgin presented to the one husband (2 Corinthians 11:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:32 — *which my covenant they brake, although I was an husband unto them, saith Yahuah (LORD)* Yahuah (LORD) the husband of the covenant; the one husband to whom the assembly is espoused (2 Corinthians 11:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:14 — *Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* the divine jealousy of the marriage-covenant; Paul''s *godly jealousy* over the espoused bride (2 Corinthians 11:2).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-espoused-to-one-husband-the-betrothal-of-yasharel-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:13 — *The serpent beguiled me, and I did eat* Eve''s confession, the text Paul cites; *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted* (2 Corinthians 11:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field... Yea, hath Elohim (God) said?* the serpent''s subtilty bending the word; Paul names that *subtilty* corrupting the mind (2 Corinthians 11:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:4 — *Ye shall not surely die* the serpent''s flat denial of the word; the same lie now dressed as light, *Satan... transformed into an angel of light* (2 Corinthians 11:3,14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:1 — *the serpent was more subtil than any beast of the field* disguise the serpent''s mark; *Satan himself is transformed into an angel of light... his ministers... as the ministers of righteousness* (2 Corinthians 11:14-15).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-as-the-serpent-beguiled-eve-through-his-subtilty-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 9:25 — *the disciples took him by night, and let him down by the wall in a basket* the Damascus escape; *in a basket was I let down by the wall, and escaped his hands* (2 Corinthians 11:33).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 9:24 — *they watched the gates day and night to kill him* the watch set against Saul; *the governor under Aretas... kept the city... desirous to apprehend me* (2 Corinthians 11:32).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 9:16 — *I will shew him how great things he must suffer for my name''s sake* the calling-word fulfilled in the catalogue; *in labours more abundant, in stripes above measure, in prisons more frequent* (2 Corinthians 11:23).'
  FROM cross_reference_threads t, cross_references x, _s229_2c11_lookup sv, _s229_2c11_lookup tv
 WHERE t.slug='2-corinthians-11-let-down-by-the-wall-in-a-basket-the-sufferings-acts-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
