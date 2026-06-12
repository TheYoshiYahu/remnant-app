-- ----- fragment: minion_2corinthians_05.sql (S229 2 Corinthians 5) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 5 (21 verses) — the house not made with hands, the new creature/new
--   creation, the ministry of reconciliation. WATCHPOINT chapter.
-- Tag: 2c05 (temp view _s229_2c05_lookup).
-- Sort band: floor 7100, step 3 (7100, 7103, 7106, 7109 used; under 7125).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. The *house not made with hands, eternal in the heavens* (5:1) and the longing
-- *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of
-- life* (5:4) are the BODILY resurrection hope — NOT a disembodied/platonic escape from the body.
-- Paul does not want to be UNCLOTHED (stripped of the body) but CLOTHED UPON (the mortal swallowed
-- by life) — the same hope as Isaiah 25:8 (*he will swallow up death in victory*) and 1 Corinthians
-- 15:53-54 (*this mortal must put on immortality... Death is swallowed up in victory*). Wisdom 9:15
-- (*the corruptible body presseth down the soul*) names the present groaning that 5:4 answers — it
-- is weighed as an extras witness to the burden, NOT as a platonic flight from the body; Paul's
-- answer is resurrection, the mortal clothed upon. The *new creature / new creation* (5:17) is the
-- prophets' renewal: Isaiah 43:18-19 (*behold, I will do a new thing*) and Isaiah 65:17 (*I create
-- new heavens and a new earth*); the new creature walks in the renewed obedience the prophets
-- promised, not a lawless liberty. The *ministry of reconciliation* (5:18-19) is the same
-- reconciliation Romans names — Elohim reconciling enemies by the death of his Son. *He hath made
-- him to be sin for us, who knew no sin* (5:21) is the Isaiah 53 servant who *bore their iniquities*
-- (Christology: the Formed Son who knew no sin, on whom Yahuah laid the iniquity of us all). No
-- replacement theology, no law-vs-grace antithesis, no platonic hope.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   earthly house dissolved / house not made with hands / mortality swallowed up of life /
--           the earnest of the Spirit
--           Tanakh: Isaiah 25:8 (he will swallow up death in victory); Ezekiel 36:27 (the earnest of
--                   the Spirit / I will put my spirit within you) — carried in prose at v.5, the
--                   load-bearing root is Isaiah 25:8
--           Extras: Wisdom 9:15 (the corruptible body presseth down the soul — the groaning 5:4
--                   answers; VERIFIED clean by dump_canon)
--           NT: 1 Corinthians 15:53-54 (this mortal must put on immortality... Death is swallowed up
--               in victory — the same Isaiah 25 hope, same congregation)
--   v.6-10  we walk by faith not by sight / present with the Lord / the judgment seat of Messiah
--           Tanakh: none warranted (allusive; faith-walk root carried elsewhere in the book)
--           Extras: none warranted   NT: none warranted (the bodily-hope weight sits at v.1-4)
--   v.11-16 the love of Messiah constraineth / one died for all / know no man after the flesh
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral/allusive)
--   v.17    if any man be in Messiah he is a new creature: behold all things are become new
--           Tanakh: Isaiah 43:18-19 (behold, I will do a new thing); Isaiah 65:17 (I create new
--                   heavens and a new earth)
--           Extras: none warranted   NT: none warranted (the new-creation root is the Tanakh witness)
--   v.18-20 the ministry/word of reconciliation / Elohim reconciling the world / ambassadors
--           Tanakh: none warranted   Extras: none warranted
--           NT: Romans 5:10-11 (when we were enemies, we were reconciled to Elohim by the death of
--               his Son... received the atonement)
--   v.21    he hath made him to be sin for us, who knew no sin
--           Tanakh: Isaiah 53:6 (Yahuah hath laid on him the iniquity of us all); 53:9 (he had done
--                   no violence, neither was any deceit in his mouth — who knew no sin); 53:11 (by his
--                   knowledge shall my righteous servant justify many; for he shall bear their
--                   iniquities)
--           Extras: none warranted   NT: none warranted (the servant-Christology root is Isaiah 53)
--
-- THREADS (slug -> target libraries):
--   7100 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25  (Tanakh + Extras + NT)
--   7103 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43  (Tanakh)
--   7106 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5  (NT)
--   7109 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25
  ('canon', '2-corinthians', 5, 4, 'canon', 'isaiah', 25, 8, 'free', E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* (Isaiah 25:8). Paul''s groaning is not a wish to be rid of the body but to have it overtaken by life: *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life* (2 Corinthians 5:4). The word is Isaiah''s own — Yahuah (LORD) *will swallow up death in victory.* The hope is bodily: the mortal not stripped away but swallowed by the life Yahuah (LORD) gives, the tears wiped from every face. This is resurrection, not escape.'),
  ('canon', '2-corinthians', 5, 4, 'canon', '1-corinthians', 15, 54, 'free', E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory.* (1 Corinthians 15:54). To the same assembly Paul had already named the hope in the same words: *this mortal must put on immortality,* and so *Death is swallowed up in victory* — Isaiah 25:8 again. It answers exactly the longing of *that mortality might be swallowed up of life* (2 Corinthians 5:4): not the soul fleeing an evil body, but *this* mortal putting on incorruption, *clothed upon* with the building of Elohim (God) that is *an house not made with hands, eternal in the heavens* (2 Corinthians 5:1).'),
  ('canon', '2-corinthians', 5, 4, 'apocrypha', 'the-wisdom-of-solomon', 9, 15, 'extras', E'*For the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind that museth upon many things.* (Wisdom of Solomon 9:15). The wisdom of Solomon names the present burden of the perishable body — the *corruptible body* that *presseth down,* the *earthy tabernacle* that *weigheth down.* This is the very groaning Paul owns: *we that are in this tabernacle do groan, being burdened* (2 Corinthians 5:4). But Paul does not answer the burden with a platonic flight from the flesh — he answers it with resurrection: *not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life.* The earthy tabernacle is not despised and abandoned; it is *clothed upon* with the house from heaven.'),
  -- thread: 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43
  ('canon', '2-corinthians', 5, 17, 'canon', 'isaiah', 43, 19, 'free', E'*Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert.* (Isaiah 43:19). When Paul writes *if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17), he speaks the prophet''s own promise. Yahuah (LORD) said *Behold, I will do a new thing,* and bid Yashar''el (Israel) *Remember ye not the former things, neither consider the things of old* (Isaiah 43:18) — the very pattern of *old things are passed away; behold, all things are become new.* The new creature is the springing-forth of the new thing Yahuah (LORD) promised, the way made in the wilderness for his people.'),
  ('canon', '2-corinthians', 5, 17, 'canon', 'isaiah', 65, 17, 'free', E'*For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* (Isaiah 65:17). The new creature in Messiah (Christ) is the firstfruit of the whole new creation Yahuah (LORD) promised: *I create new heavens and a new earth: and the former shall not be remembered.* Paul echoes the prophet exactly — *old things are passed away; behold, all things are become new* (2 Corinthians 5:17). The renewal of the man who is in Messiah (Christ) and the renewal of heaven and earth are one work of the one Creator; the former things not remembered, all things become new.'),
  -- thread: 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5
  ('canon', '2-corinthians', 5, 19, 'canon', 'romans', 5, 10, 'free', E'*For if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life.* (Romans 5:10). Paul tells the Romans the same reconciliation he ministers to Corinth: *when we were enemies, we were reconciled to Elohim (God) by the death of his Son.* It is the work of *the ministry of reconciliation* (2 Corinthians 5:18) — *that Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses unto them* (2 Corinthians 5:19). Reconciliation is from Elohim (God)''s side, while we were yet enemies; the not-imputing of trespasses at Corinth is the being-reconciled-by-his-death at Rome.'),
  ('canon', '2-corinthians', 5, 20, 'canon', 'romans', 5, 11, 'free', E'*And not only so, but we also joy in Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ), by whom we have now received the atonement.* (Romans 5:11). The atonement *received* in Romans is the reconciliation Paul pleads in his embassy: *Now then we are ambassadors for Messiah (Christ), as though Elohim (God) did beseech you by us: we pray you in Messiah''s (Christ''s) stead, be ye reconciled to Elohim (God)* (2 Corinthians 5:20). The same atonement, the same Lord Yahusha HaMashiach (Lord Jesus Christ) through whom it comes — at Rome it is joy already received, at Corinth it is the appeal still pressed: be ye reconciled.'),
  -- thread: 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). *He hath made him to be sin for us, who knew no sin* (2 Corinthians 5:21) is the servant of Isaiah on whom *Yahuah (LORD) hath laid... the iniquity of us all.* The one *made... to be sin* did not become a sinner — he bore what was laid on him; the iniquity of the straying sheep was set upon the Formed Son who himself *knew no sin,* that *we might be made the righteousness of Elohim (God) in him.*'),
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 9, 'free', E'*And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* (Isaiah 53:9). The one who *knew no sin* (2 Corinthians 5:21) is the servant of whom Isaiah testifies *he had done no violence, neither was any deceit in his mouth.* This is the Christology of the Formed Son: sinless himself, *made... to be sin for us* — numbered with the wicked though guiltless, that the righteousness of Elohim (God) might be ours in him.'),
  ('canon', '2-corinthians', 5, 21, 'canon', 'isaiah', 53, 11, 'free', E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities.* (Isaiah 53:11). The exchange of 2 Corinthians 5:21 — *made him to be sin for us... that we might be made the righteousness of Elohim (God) in him* — is the work of Isaiah''s righteous servant who *shall justify many; for he shall bear their iniquities.* He bears the iniquities; the many are justified; the righteous servant makes the unrighteous the righteousness of Elohim (God). The bearing and the justifying are the two sides of the one cross.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25',
       E'The house not made with hands: mortality swallowed up of life (Isaiah 25)',
       E'*For we know that if our earthly house of this tabernacle were dissolved, we have a building of Elohim (God), an house not made with hands, eternal in the heavens* (2 Corinthians 5:1). The hope is not a soul escaping an evil body — it is bodily. Paul is careful: *For in this we groan, earnestly desiring to be clothed upon with our house which is from heaven... not for that we would be unclothed, but clothed upon, that mortality might be swallowed up of life* (2 Corinthians 5:2,4). He does not long to be UNCLOTHED, stripped of the body, but CLOTHED UPON — the mortal overtaken by life. The word *swallowed up* is the prophet''s: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces... for Yahuah (LORD) hath spoken it* (Isaiah 25:8). Death itself is swallowed; the tears are wiped from every face. To the same assembly Paul had already spoken the same hope in the same words: *this corruptible must put on incorruption, and this mortal must put on immortality... then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:53-54). The present burden is real — the Hebrew library names it: *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind* (Wisdom of Solomon 9:15), and Paul owns it, *we that are in this tabernacle do groan, being burdened.* But the answer to the pressing-down body is not flight from it; it is resurrection — the earthy tabernacle *clothed upon* with the building of Elohim (God), the mortal swallowed up of life. And the pledge of it is already given: *he that hath wrought us for the selfsame thing is Elohim (God), who also hath given unto us the earnest of the Spirit* (2 Corinthians 5:5) — the down-payment of the body to come.',
       sv.verse_id, ev.verse_id, 'extras', 7100
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43',
       E'A new creature: behold, all things are become new (Isaiah 43, 65)',
       E'*Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17). The new creature is no novelty Paul invented — it is the prophets'' promised renewal breaking into a man. Yahuah (LORD) said through Isaiah, *Remember ye not the former things, neither consider the things of old. Behold, I will do a new thing; now it shall spring forth* (Isaiah 43:18-19) — the very shape of *old things are passed away; behold, all things are become new.* And the new thing is no less than a new creation: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17). The renewal of the one who is in Messiah (Christ) is the firstfruit of that whole new creation; the former things not remembered in the man are the former things not remembered in the cosmos. This new creature is not loosed from the renewed obedience the prophets promised — the same Spirit that makes him new writes the law on his heart and causes him to walk in the statutes (Ezekiel 36:26-27). The new creation is the springing-forth of the new thing Yahuah (LORD) spoke; the man in Messiah (Christ) is where it begins.',
       sv.verse_id, ev.verse_id, 'free', 7103
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5',
       E'The ministry of reconciliation: be ye reconciled to Elohim (God) (Romans 5)',
       E'*And all things are of Elohim (God), who hath reconciled us to himself by Yahusha HaMashiach (Jesus Christ), and hath given to us the ministry of reconciliation; To wit, that Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses unto them; and hath committed unto us the word of reconciliation* (2 Corinthians 5:18-19). The reconciliation is wholly from Elohim (God)''s side, and Paul names it to the Romans in the same breath: *if, when we were enemies, we were reconciled to Elohim (God) by the death of his Son, much more, being reconciled, we shall be saved by his life* (Romans 5:10). We were enemies; Elohim (God) reconciled us by the death of his Son; the trespasses are not imputed. And the thing the Romans have already received is the thing Paul still pleads at Corinth: *we also joy in Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ), by whom we have now received the atonement* (Romans 5:11). So the apostle takes up his embassy: *Now then we are ambassadors for Messiah (Christ), as though Elohim (God) did beseech you by us: we pray you in Messiah''s (Christ''s) stead, be ye reconciled to Elohim (God)* (2 Corinthians 5:20). The atonement received at Rome is the reconciliation pressed at Corinth — one work of the one Elohim (God), through the one Lord Yahusha HaMashiach (Lord Jesus Christ), the Formed Son by whose death the enemies are brought near.',
       sv.verse_id, ev.verse_id, 'free', 7106
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53',
       E'He made him to be sin who knew no sin: the servant of Isaiah 53',
       E'*For he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21). The whole verse is the servant-song of Isaiah 53 in a sentence. The one *made... to be sin* did not become a sinner — he bore what was laid upon him: *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). And the one who bore it *knew no sin,* for of the servant Isaiah testified *he had done no violence, neither was any deceit in his mouth* (Isaiah 53:9). The exchange — our sin laid on him, his righteousness made ours — is the servant''s own work: *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). He bears the iniquities; the many are justified; the sinless one is made sin that the sinners might be made *the righteousness of Elohim (God) in him.* This is the Christology of the Formed Son: not a guilty man, but the spotless servant on whom Yahuah (LORD) laid the iniquity of us all, that we might stand righteous in him.',
       sv.verse_id, ev.verse_id, 'free', 7109
  FROM _s229_2c05_lookup sv, _s229_2c05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:8 — *He will swallow up death in victory... will wipe away tears from off all faces* the bodily hope behind *that mortality might be swallowed up of life* (2 Corinthians 5:4); the mortal overtaken by life, not the soul escaping the body.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:54 — *this mortal must put on immortality... Death is swallowed up in victory* the same Isaiah 25 hope spoken to the same assembly; this mortal clothed upon, not unclothed (2 Corinthians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 9:15 — *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind* names the present groaning of *we that are in this tabernacle do groan, being burdened* (2 Corinthians 5:4) — answered not by escape but by the body clothed upon.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-house-not-made-with-hands-and-mortality-swallowed-up-of-life-isaiah-25'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:19 — *Behold, I will do a new thing; now it shall spring forth* the prophet''s promise behind *behold, all things are become new* (2 Corinthians 5:17); the new creature is the springing-forth of the new thing Yahuah (LORD) spoke.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:17 — *I create new heavens and a new earth: and the former shall not be remembered* the whole new creation whose firstfruit is the man in Messiah (Christ): *old things are passed away; behold, all things are become new* (2 Corinthians 5:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-new-creature-and-the-new-creation-isaiah-43'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:10 — *when we were enemies, we were reconciled to Elohim (God) by the death of his Son* the same reconciliation Paul ministers: *Elohim (God) was in Messiah (Christ), reconciling the world unto himself, not imputing their trespasses* (2 Corinthians 5:19).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:11 — *we have now received the atonement* through *our Lord Yahusha HaMashiach (Lord Jesus Christ)*; the atonement received at Rome is the reconciliation pleaded at Corinth: *be ye reconciled to Elohim (God)* (2 Corinthians 5:20).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-the-ministry-of-reconciliation-elohim-reconciling-the-world-romans-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* the servant bore what was laid on him; *he hath made him to be sin for us, who knew no sin* (2 Corinthians 5:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:9 — *he had done no violence, neither was any deceit in his mouth* the sinless servant, the One *who knew no sin* yet *made... to be sin for us* (2 Corinthians 5:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:11 — *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* the exchange of *that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21); he bears, the many are justified.'
  FROM cross_reference_threads t, cross_references x, _s229_2c05_lookup sv, _s229_2c05_lookup tv
 WHERE t.slug='2-corinthians-5-he-made-him-to-be-sin-who-knew-no-sin-the-servant-of-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
