-- ----- fragment: minion_ephesians_06.sql (S230 Ephesians 6) -----
-- =====================================================================
-- S230 minion — EPHESIANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 6 (24 verses) — the household code grounded IN the Ten (children honour
--   father and mother, the Torah AFFIRMED), and ★ THE WHOLE ARMOUR OF ELOHIM (the Isaiah catena).
-- Tag: ep06 (temp view _s230_ep06_lookup).
-- Sort band: floor 7525, step 3 (7525, 7528, 7531 used; under 7550).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, the two houses made one new
-- man; same Yahuah, same Torah, same betrothed Yashar'el restored; NOT replacement, NOT law-vs-grace).
-- Chapter 6 closes the letter on the practical walk and the warfare. Paul grounds household obedience
-- IN the fifth word of the Ten: *Honour thy father and mother; (which is the first commandment with
-- promise;)* (6:2-3) quotes Exodus 20:12 / Deuteronomy 5:16 as STANDING LAW with its promise intact —
-- the Torah affirmed, not abolished; the household code does not float free of the commandment, it
-- rests on it. Then *the whole armour of Elohim (God)* (6:11-17) is an Isaiah catena: the loins girt
-- with truth (Isaiah 11:5), the breastplate of righteousness + helmet of salvation (Isaiah 59:17),
-- the feet shod with the gospel of peace (Isaiah 52:7), the sword = the word (Isaiah 49:2 / 11:4).
-- The armour the believer puts on is the armour Yahuah (LORD) HIMSELF puts on in Isaiah 59 — the
-- saint is clothed in the armour of his Elohim (God), not a private kit. The restored library
-- re-speaks the SAME Isaiah-59 armour: Wisdom of Solomon 5:17-20 (*put on righteousness as a
-- breastplate, and true judgment instead of an helmet... a sword*). And the war is not against flesh
-- and blood but against the spirit-powers (6:12) — 1 Enoch 15:8-10 names that very war: the evil
-- spirits whose dwelling is the earth, who rise up against the children of men. No Trinitarian
-- co-equal grammar arises here; the Father is *Elohim (God) the Father* and the Son *the Lord Yahusha
-- HaMashiach* (6:23). The pull's name-renderings (including the ethical *Yahuah (Lord)* at 6:1,4,7,8,
-- 10) are preserved exactly as dump_canon returns them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     children, obey your parents in Yahuah (Lord)
--           Tanakh: carried in the honour-thy-parents thread (Exodus 20:12 / Deuteronomy 5:16)
--           Extras: Sirach 3:1-7 (children, hear your father; he that fears Yahuah will honour his
--                   father) — carried in the honour thread   NT: none warranted
--   v.2-3   honour thy father and mother; (the first commandment with promise) [EXPLICIT CITATION]
--           Tanakh: Exodus 20:12 (honour thy father and thy mother: that thy days may be long),
--                   Deuteronomy 5:16 (honour thy father and thy mother... that it may go well with thee)
--           Extras: Sirach 3:6 (he that honoureth his father shall have a long life), Sirach 3:8
--                   (honour your father and mother... that a blessing may come upon you)
--           NT: none warranted (the citation IS the Tanakh root; gospel honour-parents at Matthew
--               15:4 is itself a re-quote of the same commandment — carried in the prose)
--   v.4     fathers, provoke not your children to wrath; nurture and admonition of Yahuah (Lord)
--           Tanakh: none warranted (the load-bearing weight is the commandment at v.2-3)
--           Extras: none warranted (Sirach honour-block is child-to-parent)   NT: none warranted
--   v.5-9   servants/masters; doing the will of Elohim from the heart; no respect of persons
--           Tanakh: none warranted (respect-of-persons root carried in prose; not a curated thread)
--           Extras: none warranted   NT: none warranted (Colossians 3:22-4:1 is the twin household
--                   code — noted in prose, not a separate Tanakh thread)
--   v.10-11 be strong in Yahuah; put on the whole armour of Elohim
--           Tanakh: carried in the armour thread (the armour is Yahuah's own, Isaiah 59:17)
--           Extras: carried in the armour thread (Wisdom 5:17)   NT: none warranted
--   v.12    we wrestle not against flesh and blood, but against principalities... powers... rulers
--           of the darkness... spiritual wickedness in high places
--           Tanakh: none warranted (no clean Tanakh witness names this spirit-war directly)
--           Extras: 1 Enoch 15:8-10 (the spirits of heaven; these spirits shall rise up against the
--                   children of men) — the war with the spirit-powers
--           NT: none warranted (carried by the extras witness)
--   v.13-17 the whole armour: loins girt with truth, breastplate of righteousness, feet shod with the
--           gospel of peace, shield of faith, helmet of salvation, the sword of the Spirit (the word)
--           [the Isaiah catena]
--           Tanakh: Isaiah 59:17 (righteousness as a breastplate, helmet of salvation), Isaiah 11:5
--                   (righteousness the girdle of his loins, faithfulness the girdle of his reins),
--                   Isaiah 52:7 (the feet of him that bringeth good tidings, that publisheth peace),
--                   Isaiah 49:2 (made my mouth like a sharp sword), Isaiah 11:4 (he shall smite the
--                   earth with the rod of his mouth)
--           Extras: Wisdom of Solomon 5:17-20 (he shall put on righteousness as a breastplate, and
--                   true judgment instead of an helmet... a sword) — the SAME Isaiah-59 armour
--           NT: none warranted (the catena IS the Tanakh root)
--   v.18-20 praying always in the Spirit; the mystery of the gospel; ambassador in bonds
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.21-24 Tychicus; peace and grace to the brethren (epistolary close)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7525 ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20  (Tanakh + Extras)
--   7528 ephesians-6-the-whole-armour-of-elohim-isaiah-59                                        (Tanakh + Extras)  [★ BLESSING]
--   7531 ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20
  ('canon', 'ephesians', 6, 2, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). When Paul writes *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2), he is quoting the fifth word of the Ten spoken at Sinai, with its promise still attached. He calls it *the first commandment with promise* — not an abolished ordinance but standing law he grounds household obedience IN. The Torah is not set aside in the household code; it is the foundation of it.'),
  ('canon', 'ephesians', 6, 3, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). Paul carries the very promise of the commandment forward: *That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The promise of long days that Yahuah (LORD) bound to honouring father and mother at Sinai is the promise Paul holds out still — the commandment intact, promise and all.'),
  ('canon', 'ephesians', 6, 3, 'canon', 'deuteronomy', 5, 16, 'free', E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Deuteronomy 5:16). Moses'' second giving of the Ten carries the doubled promise Paul echoes word for word: *that it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The *that it may go well with thee* of Deuteronomy is the *that it may be well with thee* of Ephesians — Paul is not improvising a maxim; he is reciting the commandment as Moses gave it, the Torah affirmed.'),
  ('canon', 'ephesians', 6, 2, 'apocrypha', 'ecclesiasticus', 3, 6, 'extras', E'*He that honoureth his father shall have a long life; and he that is obedient to Yahuah (God) shall be a comfort to his mother.* (Sirach 3:6). The Hebrew library already read the fifth commandment as Paul reads it — a commandment WITH PROMISE: *he that honoureth his father shall have a long life.* This is the very logic of *the first commandment with promise* (Ephesians 6:2); the long life promised at Sinai for honouring father and mother is the long life the wisdom of the fathers held out, the standing word Paul affirms.'),
  ('canon', 'ephesians', 6, 1, 'apocrypha', 'ecclesiasticus', 3, 7, 'extras', E'*He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* (Sirach 3:7). The fear of Yahuah (God) shows itself in honouring father and mother — and Paul writes *Children, obey your parents in Yahuah (Lord): for this is right* (Ephesians 6:1). To obey one''s parents *in Yahuah (Lord)* is exactly the service to parents that flows from the fear of Yahuah (God); the household obedience Paul commands is the obedience the restored library taught, rooted in the commandment.'),
  ('canon', 'ephesians', 6, 3, 'apocrypha', 'ecclesiasticus', 3, 8, 'extras', E'*Honour your father and mother both in word and deed, that a blessing may come upon you from them.* (Sirach 3:8). The wisdom of the fathers joins the honour to the blessing it brings — *that a blessing may come upon you.* So Paul joins the commandment to its promise: *That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The blessing that follows honouring father and mother is no New-Covenant novelty; it is the promise carried in the commandment from the first, affirmed and not annulled.'),
  -- thread: ephesians-6-the-whole-armour-of-elohim-isaiah-59  [★ BLESSING]
  ('canon', 'ephesians', 6, 14, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). This is Yahuah (LORD) himself, arming to bring salvation when there was no man and no intercessor. The armour Paul tells the saints to put on is HIS armour: *having on the breastplate of righteousness* (Ephesians 6:14) and *the helmet of salvation* (Ephesians 6:17). The believer is not issued a private kit; he is clothed in the very righteousness-breastplate and salvation-helmet of his Elohim (God), standing in the strength of the One who armed himself to save.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). Yahuah (LORD) puts *an helmet of salvation upon his head,* and Paul bids the saint *take the helmet of salvation* (Ephesians 6:17). The salvation that is Yahuah''s (LORD) own headpiece becomes the believer''s; what the Redeemer wore to come to Zion is what guards the head of those who stand in him.'),
  ('canon', 'ephesians', 6, 14, 'canon', 'isaiah', 11, 5, 'free', E'*And righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins.* (Isaiah 11:5). The Branch out of the stem of Jesse wears righteousness and faithfulness girded about his loins; Paul tells the saint to stand *having your loins girt about with truth* (Ephesians 6:14). The girdle of truth and righteousness that belts the Messiah-King of Isaiah 11 is the girdle the believer puts on — the loins of the soldier of Elohim (God) belted with the same faithfulness that belts the Branch.'),
  ('canon', 'ephesians', 6, 15, 'canon', 'isaiah', 52, 7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). The feet that carry the good news of peace to Zion are the feet Paul shods the saint with: *your feet shod with the preparation of the gospel of peace* (Ephesians 6:15). The gospel of peace is no new errand; it is the good tidings Isaiah''s herald already ran to publish — *Thy Elohim (God) reigneth* — now the footing on which the saint stands and goes.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 49, 2, 'free', E'*And he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft; in his quiver hath he hid me;* (Isaiah 49:2). The Servant''s weapon is his word: Yahuah (LORD) *hath made my mouth like a sharp sword.* Paul names the soldier''s one offensive weapon the same way: *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The sword of the believer is not steel but the word — the very sword that is the mouth of the Servant whom Yahuah (LORD) hid in his quiver and now sends forth.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 11, 4, 'free', E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). The Branch *shall smite the earth with the rod of his mouth* — the word itself is the weapon that judges and slays the wicked. So Paul arms the saint with *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The word that is the Messiah''s rod of judgment is the word the believer wields against the wiles of the devil.'),
  ('canon', 'ephesians', 6, 14, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). The restored library re-speaks the very armour of Isaiah 59: Yahuah (God) arming to repay his enemies *shall put on righteousness as a breastplate.* It is the same breastplate Paul gives the saint — *having on the breastplate of righteousness* (Ephesians 6:14). The Hebrew library, the prophet, and the apostle agree: the breastplate is righteousness, and it is first the LORD''s own armour before it is the believer''s.'),
  ('canon', 'ephesians', 6, 17, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). Where Isaiah 59:17 sets *an helmet of salvation* upon the LORD''s head, the wisdom of the fathers sets *true judgment instead of an helmet* — the same head-piece of the armed Elohim (God). Paul bids the saint *take the helmet of salvation* (Ephesians 6:17): the helmet of the One who arms himself to judge and save is the helmet handed to those who stand in him.'),
  ('canon', 'ephesians', 6, 17, 'apocrypha', 'the-wisdom-of-solomon', 5, 20, 'extras', E'*His severe wrath shall he sharpen for a sword, and the world shall fight with him against the unwise.* (Wisdom of Solomon 5:20). The armed Elohim (God) of the restored library sharpens a sword for the day of recompence — the same figure as the Servant whose *mouth* Yahuah (LORD) made *like a sharp sword* (Isaiah 49:2). Paul names the saint''s sword *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17): the sword in the believer''s hand is the LORD''s own sword, the word that fights for him against the unwise.'),
  ('canon', 'ephesians', 6, 11, 'apocrypha', 'the-wisdom-of-solomon', 5, 17, 'extras', E'*He shall take to him his jealousy for complete armour, and make the creature his weapon for the revenge of his enemies.* (Wisdom of Solomon 5:17). The phrase *complete armour* — the whole panoply of the armed Elohim (God) — is the very figure Paul opens with: *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11). The complete armour the LORD takes to himself in the day of vengeance is the whole armour the saint is told to put on; one and the same panoply, the LORD''s, now the believer''s defence.'),
  -- thread: ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15
  ('canon', 'ephesians', 6, 12, 'enoch', '1-enoch', 15, 8, 'extras', E'*And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* (1 Enoch 15:8). Paul says the conflict is not what it seems: *we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12). The restored library tells where these spirit-foes came from and where they dwell — evil spirits whose dwelling is the earth, born of the rebellion of the Watchers; the war is against these, not against mortal men.'),
  ('canon', 'ephesians', 6, 12, 'enoch', '1-enoch', 15, 10, 'extras', E'*And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* (1 Enoch 15:10). The library names the very warfare Paul names: spirits that *rise up against the children of men.* This is why *we wrestle not against flesh and blood, but against principalities, against powers* (Ephesians 6:12) — the true adversary is the spirit-power, the unseen wickedness in high places, and the children of men stand against it not in the flesh but in the whole armour of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20',
       E'Honour thy father and mother, the first commandment with promise (Exodus 20, Deuteronomy 5)',
       E'Paul grounds the whole household code in the Ten. *Children, obey your parents in Yahuah (Lord): for this is right. Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:1-3). He is not coining a maxim — he is quoting the fifth word spoken at Sinai, and he quotes it as STANDING LAW, *the first commandment with promise,* its promise still attached. The commandment is Exodus 20:12: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* And Moses'' second giving carries the doubled promise Paul echoes word for word: *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee* (Deuteronomy 5:16) — the *that it may go well with thee* that becomes Paul''s *that it may be well with thee.* This is the Torah affirmed, not abolished: Paul does not say the commandment is past; he says it is *first... with promise* and reaches for its very promise of long days. The wisdom of the fathers had read it the same way: *he that honoureth his father shall have a long life* (Sirach 3:6); *he that fears Yahuah (God) will honour his father, and will do service to his parents* (Sirach 3:7); *Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8). Commandment, promise, and blessing stand together — the same word from Sinai to the sages to the apostle, the Instruction kept whole.',
       sv.verse_id, ev.verse_id, 'extras', 7525
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-the-whole-armour-of-elohim-isaiah-59',
       E'The whole armour of Elohim (God): the armour Yahuah (LORD) himself put on (Isaiah 59, 11, 52, 49)',
       E'*Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11). Mark whose armour it is: not a private kit issued to the soldier, but the armour of Elohim (God) — the very armour Yahuah (LORD) HIMSELF put on. When there was no man and no intercessor, *he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17). Paul takes that armour off the LORD and puts it on the saint piece by piece. *Having on the breastplate of righteousness* (Ephesians 6:14) is the LORD''s righteousness-breastplate of Isaiah 59:17; *the helmet of salvation* (Ephesians 6:17) is the salvation-helmet upon his head. *Having your loins girt about with truth* (Ephesians 6:14) is the Branch of Jesse whose belt is faithfulness: *righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins* (Isaiah 11:5). *Your feet shod with the preparation of the gospel of peace* (Ephesians 6:15) is the herald of Zion: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace... that saith unto Zion, Thy Elohim (God) reigneth* (Isaiah 52:7). And *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17) is the Servant''s mouth — *he hath made my mouth like a sharp sword* (Isaiah 49:2) — and the Branch''s rod: *he shall smite the earth with the rod of his mouth* (Isaiah 11:4). The one offensive weapon is the word, the same word that is the Messiah''s rod of judgment. The restored library re-speaks this exact armour of the LORD: the armed Elohim (God) who *shall take to him his jealousy for complete armour* (Wisdom of Solomon 5:17), who *shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18), whose *severe wrath shall he sharpen for a sword* (Wisdom of Solomon 5:20). The *complete armour* of Wisdom is the *whole armour of Elohim (God)* of Paul; the breastplate, the helmet, the sword are first the LORD''s own panoply before they are ever the believer''s. To stand against the wiles of the devil is to stand clothed in the armour of Yahuah (LORD) — his righteousness, his salvation, his truth, his gospel of peace, his word — for the battle is his, and the saint fights in his strength and in his armour, not his own.',
       sv.verse_id, ev.verse_id, 'extras', 7528
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15',
       E'We wrestle not against flesh and blood: the war with the spirit-powers (1 Enoch 15)',
       E'*For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12). Paul names the true adversary: not mortal men but unseen spirit-powers. The restored library tells where these spirit-foes came from and where they dwell. From the rebellion of the Watchers came a brood whose offspring became evil spirits: *the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:8). And their war is exactly the war Paul names: *these spirits shall rise up against the children of men and against the women, because they have proceeded from them* (1 Enoch 15:10). This is why the saint puts on the whole armour of Elohim (God): the fight is not flesh against flesh but the children of men against the spirit-powers that rise up against them. The wrestling is real and the enemy is real, but he is *not flesh and blood* — and so the weapons are not flesh and blood either, but the truth, the righteousness, the salvation, and the word of the armed Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 7531
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land* the fifth word of the Ten, the commandment Paul quotes as *the first commandment with promise* (Ephesians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:12 — *that thy days may be long upon the land* the promise of the commandment, carried forward in *that... thou mayest live long on the earth* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 5:16 — *that it may go well with thee, in the land* Moses'' second giving of the Ten, echoed word for word in *that it may be well with thee* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 3:6 — *he that honoureth his father shall have a long life* the wisdom of the fathers reading the fifth word as a commandment with promise, the very logic of *the first commandment with promise* (Ephesians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 3:7 — *He that fears Yahuah (God) will honour his father, and will do service to his parents* the fear of Yahuah (God) shown in honouring parents; Paul''s *obey your parents in Yahuah (Lord): for this is right* (Ephesians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 3:8 — *Honour your father and mother both in word and deed, that a blessing may come upon you* the honour joined to its blessing, as Paul joins the commandment to *that it may be well with thee* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-6-the-whole-armour-of-elohim-isaiah-59
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 5:17 — *He shall take to him his jealousy for complete armour* the *complete armour* of the armed Elohim (God) re-spoken; Paul''s *Put on the whole armour of Elohim (God)* (Ephesians 6:11).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:5 — *righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins* the Branch''s belt; *your loins girt about with truth* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 59:17 — *he put on righteousness as a breastplate, and an helmet of salvation upon his head* the armour Yahuah (LORD) himself put on; *the breastplate of righteousness* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the same Isaiah-59 armour of the LORD re-spoken; *the breastplate of righteousness* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 52:7 — *the feet of him that bringeth good tidings, that publisheth peace* the herald of Zion; *your feet shod with the preparation of the gospel of peace* (Ephesians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 59:17 — *an helmet of salvation upon his head* the salvation-helmet of the armed LORD; *take the helmet of salvation* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Isaiah 49:2 — *he hath made my mouth like a sharp sword* the Servant''s word the weapon; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Isaiah 11:4 — *he shall smite the earth with the rod of his mouth* the word as the Messiah''s rod of judgment; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Wisdom of Solomon 5:20 — *His severe wrath shall he sharpen for a sword* the sword of the armed Elohim (God) re-spoken; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the helmet of the armed Elohim (God) re-spoken; *take the helmet of salvation* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *the giants... shall be called evil spirits upon the earth, and on the earth shall be their dwelling* the origin of the spirit-foes; *we wrestle not against flesh and blood, but against principalities, against powers* (Ephesians 6:12).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *these spirits shall rise up against the children of men* the very spirit-war Paul names; *against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
