-- ----- fragment: minion_romans_07.sql (S219 Romans 7) -----
-- =====================================================================
-- S219 minion — ROMANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 7.  Tag: r07 (temp view _s219_r07_lookup).  Sort band: 6150, step 3 (<6175).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#6/#10): Romans 7 EXONERATES the law and locates the problem
-- in the flesh/sin, never in Torah. *The law is holy, and the commandment holy, and just, and
-- good* (7:12); *the law is spiritual* (7:14); *I delight in the law of Elohim (God) after the
-- inward man* (7:22). The commandment Paul cites is *Thou shalt not covet* (7:7) = Exodus 20:17 /
-- Deuteronomy 5:21 — the tenth word, the law itself naming the sin. The "dead to the law" /
-- "married to another" (7:1-6) is release from the law's CONDEMNING VERDICT to serve *in newness
-- of spirit* — NOT Torah-abolition; it is the believer freed to keep the law from the heart, the
-- promise of Jeremiah 31:33 internalised. Delight-in-the-law echoes Psalm 119 / Psalm 1 / Psalm
-- 40:8. The inner war — the wretched-man cry — is the war between the inward man that loves Torah
-- and the flesh sold under sin; the Second-Temple library names the same diagnosis (the wicked
-- heart of the first Adam, not the law). The cry resolves in Romans 8: the Spirit FULFILS the
-- righteousness of the law in the walker. Never read this chapter as the law being the enemy.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   dead to the law / married to another / newness of spirit
--           Tanakh: Jeremiah 31:33 (law written on the heart — the newness of spirit)
--           Extras: none warranted
--           NT: Romans 6:14 (not under the law as condemning system), Romans 8:2 (free from the law of sin and death)
--   v.7-12  Is the law sin? God forbid / Thou shalt not covet / the law is holy and good
--           Tanakh: Exodus 20:17, Deuteronomy 5:21 (the very commandment Paul cites)
--           Extras: none warranted
--           NT: none added (the vindication carried by the cited commandment + the delight thread)
--   v.13-23 the law is spiritual / I delight in the law of Elohim after the inward man / inner war
--           Tanakh: Psalm 1:2, Psalm 40:8, Psalm 119:97 (delight in the law)
--           Extras: 2 Esdras 3:21-22 + 7:48 (the wicked heart of the first Adam is the problem, not the law)
--           NT: none added (the inner-war resolution carried by the Romans 8 thread)
--   v.24-25 O wretched man / who shall deliver me / the resolution
--           Tanakh: none warranted
--           Extras: none warranted
--           NT: Romans 8:1, 8:2, 8:4 (no condemnation; the Spirit fulfils the righteousness of the law)
--
-- THREADS (slug -> target libraries):
--   6150 romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart   (Tanakh + NT)
--   6153 romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet                                (Tanakh)
--   6156 romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good                    (Tanakh)
--   6159 romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man                           (Tanakh)
--   6162 romans-7-the-wicked-heart-of-the-first-adam-not-the-law                                (Extras)
--   6165 romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8               (NT)
-- =====================================================================

CREATE TEMP VIEW _s219_r07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart
  ('canon', 'romans', 7, 6, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *But now we are delivered from the law, that being dead wherein we were held; that we should serve in newness of spirit, and not in the oldness of the letter* (Romans 7:6). The deliverance is not from the law but from the bondage of the letter that held and condemned; the *newness of spirit* is exactly the covenant the prophet promised — the law no longer outside as a verdict against the flesh but *in their inward parts,* written on the heart. To serve in newness of spirit is to keep the law from within, not to be loosed from it.'),
  ('canon', 'romans', 7, 4, 'canon', 'romans', 6, 14, 'free', E'*For sin shall not have dominion over you: for ye are not under the law, but under grace.* (Romans 6:14). *Wherefore, my brethren, ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4). To be *dead to the law* and *not under the law* is one thing said twice: released from the law''s condemning dominion over the flesh — its verdict of death against the transgressor — so that, joined to the risen One, the believer *should bring forth fruit unto Elohim.* It is not freedom to transgress but freedom from condemnation, that the law might be kept in fruitfulness instead of death.'),
  ('canon', 'romans', 7, 4, 'canon', 'romans', 8, 2, 'free', E'*For the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death.* (Romans 8:2). Joined *to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4), the believer is set free — but the freedom is named precisely: *free from the law of sin and death,* not free from the holy commandment. The dominion broken is sin''s death-grip on the flesh; the marriage is to the living One, that the fruit unto Elohim might come where only death came before.'),
  -- thread: romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet
  ('canon', 'romans', 7, 7, 'canon', 'exodus', 20, 17, 'free', E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* (Exodus 20:17). *Is the law sin? Elohim (God) forbid. Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). The very commandment Paul names is the tenth word spoken from Sinai. The law is not sin — it is the lamp that exposes sin; without *Thou shalt not covet* the covetousness in the flesh would never be known for what it is. The commandment diagnoses the disease; it does not cause it.'),
  ('canon', 'romans', 7, 7, 'canon', 'deuteronomy', 5, 21, 'free', E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* (Deuteronomy 5:21). Paul cites this same word — *except the law had said, Thou shalt not covet* (Romans 7:7) — the tenth commandment that reaches past the hand to the heart, naming desire itself. It is the commandment that lays the inward man bare; by it Paul *had not known lust.* The law that names the hidden sin is the law that is *holy, and the commandment holy, and just, and good* (Romans 7:12).'),
  -- thread: romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good
  ('canon', 'romans', 7, 12, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). The verdict Paul reaches is the psalmist''s own: the law of Yahuah is *perfect,* the testimony *sure,* the statutes *right,* the commandment *pure* (Psalm 19:7-8). Where men would put the law on trial, both psalm and apostle acquit it utterly and put the flesh on trial instead — the law converts the soul; sin works death by that which is good.'),
  ('canon', 'romans', 7, 14, 'canon', 'nehemiah', 9, 13, 'free', E'*Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments:* (Nehemiah 9:13). *For we know that the law is spiritual: but I am carnal, sold under sin* (Romans 7:14). What came down at Sinai were *true laws, good statutes and commandments* — the law is spiritual because it is from heaven, given by the Spirit''s own hand. The fault Paul confesses is never in the law but in the carnal man *sold under sin;* the spiritual law meets the carnal flesh, and the flesh is found wanting, not the law.'),
  -- thread: romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 1, 2, 'free', E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). Paul''s inward man is the blessed man of the first psalm — the one whose *delight is in the law of Yahuah,* who meditates in it day and night, planted like a tree by the rivers of water. The Torah is not the enemy of the regenerate heart but its joy; the believer delights in the very law the flesh wars against.'),
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The psalmist speaks Paul''s inward man exactly: *thy law is within my heart.* This is the law internalised, the delight of the renewed man — the same law-within-the-heart that Jeremiah promised and that Romans 7 confesses against the warring flesh. To delight in the law after the inward man is to carry the law within, not to stand outside it.'),
  ('canon', 'romans', 7, 22, 'canon', 'psalms', 119, 97, 'free', E'*O how love I thy law! it is my meditation all the day.* (Psalm 119:97). *For I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The whole of the great psalm is the inward man''s love of the Torah, and this verse is its cry: *O how love I thy law!* Paul''s delight is no new posture but the ancient love of the righteous for the commandment. The man at war in Romans 7 is at war precisely because he loves the law the flesh resists — the conflict proves the love, and the love proves the law good.'),
  -- thread: romans-7-the-wicked-heart-of-the-first-adam-not-the-law
  ('canon', 'romans', 7, 17, 'apocrypha', '2-esdras', 3, 21, 'extras', E'*For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him.* (2 Esdras 3:21). *Now then it is no more I that do it, but sin that dwelleth in me* (Romans 7:17). The library names the same diagnosis Paul confesses: the wicked heart inherited from the first Adam, *and so be all they that are born of him* — the indwelling sin, the flesh sold under sin, not the law. The transgression came of the wicked heart that was *not taken away,* and that heart, not the holy commandment, is the thing that *dwelleth in me.*'),
  ('canon', 'romans', 7, 18, 'apocrypha', '2-esdras', 3, 22, 'extras', E'*Thus infirmity was made permanent; and the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still.* (2 Esdras 3:22). *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not* (Romans 7:18). Here is Romans 7 in the older book: the law set in the heart, yet *the malignity of the root* remaining, *so that the good departed away, and the evil abode still.* The will to good is present; the flesh with its inherited root will not perform it. The law is good; the infirmity made permanent in the flesh is the failure.'),
  ('canon', 'romans', 7, 24, 'apocrypha', '2-esdras', 7, 48, 'extras', E'*O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you.* (2 Esdras 7:48). *O wretched man that I am! who shall deliver me from the body of this death?* (Romans 7:24). The wretched cry has the same root the library names: the fall of the first Adam carried into all who come of him, *the body of this death.* It is not the law that holds the man captive to death but the Adamic flesh; the deliverance sought is from the body, not from the commandment — and the answer comes in the One who undoes what Adam did.'),
  -- thread: romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8
  ('canon', 'romans', 7, 24, 'canon', 'romans', 8, 1, 'free', E'*There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit.* (Romans 8:1). *O wretched man that I am! who shall deliver me from the body of this death?* (Romans 7:24). The cry of the wretched man is answered in the next breath: the deliverance from *the body of this death* is that there is *now no condemnation* to those in the Messiah who *walk not after the flesh, but after the Spirit.* The captivity to the law of sin in the members is broken — not by abolishing the law of Elohim, but by the Spirit setting the man free to walk.'),
  ('canon', 'romans', 7, 25, 'canon', 'romans', 8, 2, 'free', E'*For the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death.* (Romans 8:2). *I thank Elohim (God) through Yahusha HaMashiach (Jesus Christ) our Lord. So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:25). The thanks is the turn of the whole chapter: the divided man who serves the law of Elohim with the mind while the flesh serves the law of sin is set free by *the law of the Spirit of life* — freed from *the law of sin and death* that warred in his members. The Spirit does not loose him from the law of Elohim he loves but from the sin that captured him.'),
  ('canon', 'romans', 7, 25, 'canon', 'romans', 8, 4, 'free', E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:4). *So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:25). The mind that serves *the law of Elohim* is brought through to its end in the Spirit: *the righteousness of the law … fulfilled in us, who walk … after the Spirit.* What the inward man delighted in but the flesh could not perform, the Spirit now fulfils in the walker. The Spirit and the Torah are one work — the chapter that confessed the war ends with the law of Elohim kept, not cast off.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart',
       E'Dead to the law — to serve in newness of spirit, the law written on the heart',
       E'The opening of Romans 7 is the most twisted passage in the chapter, and the marriage figure governs it: as a woman is loosed from the law of her husband when he dies, so *ye also are become dead to the law by the body of Messiah (Christ); that ye should be married to another, even to him who is raised from the dead, that we should bring forth fruit unto Elohim (God)* (Romans 7:4). What is broken is not the holy commandment but the law''s condemning verdict against the flesh — the death-grip under which the transgressor stood. Paul says the same thing two ways: *for sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14), and *the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death* (Romans 8:2). The dominion broken is sin''s, the death-grip broken is death''s; the marriage is to the living One that fruit might come where only death came before. And the end of the matter is the covenant the prophet promised: *now we are delivered from the law, that being dead wherein we were held; that we should serve in newness of spirit, and not in the oldness of the letter* (Romans 7:6) — exactly *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). To serve in newness of spirit is not to be loosed from the law but to keep it from within, the letter that condemned now written on the heart that loves it.',
       sv.verse_id, ev.verse_id, 'free', 6150
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet',
       E'Is the law sin? Elohim (God) forbid — Thou shalt not covet',
       E'Paul asks the question the antichrist reading wants answered yes, and he slams the door on it: *What shall we say then? Is the law sin? Elohim (God) forbid* (Romans 7:7). Far from being sin, the law is what reveals sin: *Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). The commandment he names is the tenth word spoken from Sinai — *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife … nor any thing that is thy neighbour''s* (Exodus 20:17), repeated in the second giving: *neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house … or any thing that is thy neighbour''s* (Deuteronomy 5:21). This is the commandment that reaches past the hand to the heart, naming desire itself. Sin took occasion *by the commandment* and wrought all manner of concupiscence, but the commandment did not make the sin — it exposed it. The lamp is not the darkness it reveals. The law that lays the inward man bare is the holy diagnostic of the disease in the flesh, never its cause.',
       sv.verse_id, ev.verse_id, 'free', 6153
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good',
       E'The law is holy, and the commandment holy, and just, and good',
       E'This is the verse the whole chapter is built to reach, and it is the verdict no twisting can overturn: *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). And again, lest it be missed: *for we know that the law is spiritual: but I am carnal, sold under sin* (Romans 7:14). Where men would put the Torah on trial, Paul acquits it utterly and arraigns the flesh instead. The psalmist had already pronounced the same acquittal: *the law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7). And the law is spiritual because of where it came from — *thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments* (Nehemiah 9:13). The law is holy because the One who gave it is holy; it is spiritual because it descended from heaven by the Spirit''s own hand. The fault is never in the commandment but in the carnal man sold under sin. Sin worked death *by that which is good* — and so the good is proved good, and sin proved exceeding sinful, the law standing innocent over the grave it never dug.',
       sv.verse_id, ev.verse_id, 'free', 6156
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man',
       E'I delight in the law of Elohim (God) after the inward man',
       E'At the heart of the inner war stands the line that settles which side the regenerate man is on: *I delight in the law of Elohim (God) after the inward man* (Romans 7:22). The man at war does not hate the law — he loves it; the war is between the inward man that delights in the Torah and *another law in my members, warring against the law of my mind* (Romans 7:23). This delight is the ancient posture of the righteous. The first psalm opens with it: *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). David carried it within: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8) — the law internalised, the very law-in-the-heart Jeremiah promised. And the great psalm cries it outright: *O how love I thy law! it is my meditation all the day* (Psalm 119:97). The inward man of Romans 7 is the blessed man of Psalm 1, the law-loving heart of Psalm 40, the lover of the commandment in Psalm 119. The conflict proves the love, and the love proves the law good: a man does not war against his flesh to keep what is evil. He wars to keep what he delights in — the holy, just, and good law of Elohim.',
       sv.verse_id, ev.verse_id, 'free', 6159
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-the-wicked-heart-of-the-first-adam-not-the-law',
       E'The wicked heart of the first Adam — not the law',
       E'Romans 7 locates the captivity precisely: *now then it is no more I that do it, but sin that dwelleth in me* (Romans 7:17); *for I know that in me (that is, in my flesh,) dwelleth no good thing* (Romans 7:18). The diagnosis is the indwelling sin of the flesh, never the law — and the restored library names the same root in the same terms. The wicked heart inherited from the first Adam is the thing that dwells in the man: *for the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21). The library even sets the law within the heart and still finds the flesh failing: *the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still* (2 Esdras 3:22) — the will to good present, the flesh with its inherited root refusing to perform it, which is Romans 7:18 word for word in an older book. And the wretched cry has the same Adamic root: *O you Adam, what have you done? for though it was you that sinned, you are not fallen alone, but we all that come of you* (2 Esdras 7:48) — *the body of this death* (Romans 7:24) is the Adamic flesh carried into all who come of him. The law set in the heart is good; the malignity of the root is the failure; the deliverance sought is from the body of death, not from the commandment — and it comes in the One who undoes what the first Adam did.',
       sv.verse_id, ev.verse_id, 'extras', 6162
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8',
       E'O wretched man — who shall deliver me — the resolution in Romans 8',
       E'The chapter ends not in despair but in thanksgiving, and the cry is answered before the page turns: *O wretched man that I am! who shall deliver me from the body of this death? I thank Elohim (God) through Yahusha HaMashiach (Jesus Christ) our Lord. So then with the mind I myself serve the law of Elohim (God); but with the flesh the law of sin* (Romans 7:24-25). The divided man — mind serving the law of Elohim, flesh serving the law of sin — is delivered in the very next breath. *There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* (Romans 8:1). The captivity to the law of sin in the members is broken: *the law of the Spirit of life in HaMashiach Yahusha (Christ Jesus) hath made me free from the law of sin and death* (Romans 8:2) — freed not from the law of Elohim he loves but from the sin that captured him. And the deliverance has a destination that vindicates the whole chapter: *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). What the inward man delighted in but the flesh could not perform, the Spirit now fulfils in the walker. The Spirit and the Torah are one work. The chapter that confessed the war ends with the law of Elohim kept — not cast off — by the power of the Spirit of life.',
       sv.verse_id, ev.verse_id, 'free', 6165
  FROM _s219_r07_lookup sv, _s219_r07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:14 — *ye are not under the law, but under grace* the same thing as dead to the law: released from the law''s condemning dominion over the flesh, not freed to transgress (Romans 7:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:2 — *made me free from the law of sin and death* the freedom named precisely: from sin''s death-grip on the flesh, not from the holy commandment (Romans 7:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the newness of spirit is the law internalised, not abolished — the covenant promised (Romans 7:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-dead-to-the-law-to-serve-in-newness-of-spirit-the-law-written-on-the-heart'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house … nor any thing that is thy neighbour''s* the tenth word from Sinai, the very commandment Paul cites; the law exposes sin, it is not sin (Romans 7:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:21 — *neither shalt thou desire thy neighbour''s wife … or any thing that is thy neighbour''s* the same commandment in the second giving, reaching past the hand to the heart, naming desire itself (Romans 7:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-is-the-law-sin-god-forbid-thou-shalt-not-covet'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect, converting the soul* the psalmist''s acquittal of the law that Paul reaches: holy, just, and good (Romans 7:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:13 — *gavest them … true laws, good statutes and commandments* the law is spiritual because it came down from heaven by the Spirit''s hand; the fault is in the carnal flesh (Romans 7:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-law-is-holy-and-the-commandment-holy-and-just-and-good'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* the inward man of Romans 7 is the blessed man of the first psalm (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 40:8 — *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* the law internalised, the inward man''s delight Paul confesses (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:97 — *O how love I thy law! it is my meditation all the day* the ancient love of the righteous for the commandment; the war proves the love (Romans 7:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-i-delight-in-the-law-of-elohim-after-the-inward-man'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=97
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-the-wicked-heart-of-the-first-adam-not-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 3:21 — *the first Adam bearing a wicked heart transgressed … and so be all they that are born of him* the indwelling sin Paul confesses, the inherited wicked heart, not the law (Romans 7:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 3:22 — *the law (also) in the heart … with the malignity of the root; so that the good departed away, and the evil abode still* the will to good present, the flesh''s root refusing to perform it (Romans 7:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 7:48 — *O you Adam, what have you done? … you are not fallen alone, but we all that come of you* the Adamic flesh carried into all, the body of this death (Romans 7:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-the-wicked-heart-of-the-first-adam-not-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 8:1 — *there is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* the wretched cry answered: deliverance from the body of this death (Romans 7:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:2 — *the law of the Spirit of life … hath made me free from the law of sin and death* the divided man freed from the sin that captured him, not from the law of Elohim he loves (Romans 7:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:4 — *that the righteousness of the law might be fulfilled in us, who walk … after the Spirit* what the inward man delighted in but the flesh could not perform, the Spirit fulfils; the law kept, not cast off (Romans 7:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r07_lookup sv, _s219_r07_lookup tv
 WHERE t.slug='romans-7-o-wretched-man-who-shall-deliver-me-the-resolution-in-romans-8'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
