-- ----- fragment: minion_philippians_03.sql (S231 Philippians 3) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 3 (21 verses) — the flesh-credential / "the righteousness which is of the law."
-- Tag: ph03 (temp view _s231_ph03_lookup).
-- Sort band: floor 7610, step 3 (7610, 7613, 7616, 7619, 7622 used; under 7635).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + NT, woven (no extras warranted this chapter).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (BLESSING CHAPTER). Paul writes from prison to the called-out ones — Yashar'el (Israel)
-- and the grafted-in seed of the nations. ★★ What Paul counts loss in 3:4-9 is the FLESH-CREDENTIAL BOAST
-- — pedigree and Torah-keeping wielded as a self-made claim that boasts before Elohim — NOT Torah-obedience
-- itself and NOT the Torah abolished. He says he WAS *blameless* touching the law (3:6); he counts his OWN
-- righteousness (self-achieved legal standing) loss, set against *the righteousness which is of Elohim (God)
-- by faith* (3:9) — the gift-righteousness of Genesis 15:6, Habakkuk 2:4, Jeremiah 23:6 (Yahuah our
-- righteousness). The *concision* / *dogs* (3:2) = the mutilation/credential party (same opponents as
-- Galatians). This is the SIBLING of Ephesians 2:8-9 (the boast excluded) and Galatians works-of-the-flesh.
-- 3:9 is NEVER "the Torah is dung/abolished"; the excluded thing is the self-righteous boast, the embraced
-- thing is the faith-righteousness the prophets promised. *Our conversation (citizenship) is in heaven*
-- (3:20) = the Jerusalem above, the gathered commonwealth, not a new institution replacing Yashar'el (Israel).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     Finally, my brethren, rejoice in Yahuah (Lord)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (carried in ch4 rejoice block)
--   v.2-3   beware of the concision; we are the circumcision, worship in the spirit, no confidence in the flesh
--           Tanakh: Deuteronomy 10:16 (circumcise the foreskin of your heart), Jeremiah 9:23-26 (let him that
--                   glorieth glory in knowing me; all the house of Yashar'el uncircumcised in the heart)
--           Extras: none warranted   NT: none warranted (the concision/Galatians weight carried in prose)
--   v.4-6   the flesh-catalogue: circumcised the eighth day... touching the righteousness in the law, blameless
--           Tanakh: Genesis 17:12 (he that is eight days old shall be circumcised), Leviticus 12:3 (in the
--                   eighth day the flesh of his foreskin shall be circumcised)
--           Extras: none warranted   NT: none warranted
--   v.7-9   I count all things loss... not having mine own righteousness, but the righteousness of Elohim by faith
--           Tanakh: Genesis 15:6 (he believed in Yahuah; he counted it for righteousness), Habakkuk 2:4 (the
--                   just shall live by his faith), Jeremiah 23:6 (Yahuah Tsidkenu, THE LORD OUR RIGHTEOUSNESS)
--           Extras: none warranted   NT: Romans 10:3 (going about to establish their own righteousness),
--                   Romans 4:3-5 (Abraham believed, counted for righteousness; to him that worketh not),
--                   Romans 9:30-32 (the righteousness which is of faith vs the law sought by works)
--   v.10-16 that I may know him and the power of his resurrection; I press toward the mark
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (resurrection-body carried at v.21)
--   v.17-19 the enemies of the cross, whose Elohim is their belly, whose glory is in their shame
--           Tanakh: none warranted (Hosea 4:7 weighed; a single allusive phrase, not load-bearing)
--           Extras: none warranted   NT: none warranted
--   v.20    our conversation is in heaven; from whence we look for the Saviour
--           Tanakh: none warranted   Extras: none warranted   NT: Galatians 4:26 (Jerusalem which is above
--                   is free, the mother of us all), Hebrews 11:10 (a city which hath foundations), Hebrews
--                   11:16 (a better country, an heavenly; he hath prepared for them a city)
--   v.21    who shall change our vile body, fashioned like unto his glorious body
--           Tanakh: Daniel 12:2-3 (many that sleep in the dust shall awake; the wise shall shine)
--           Extras: 2 Esdras / 2 Baruch transformed body weighed — none warranted (canon witnesses carry it cleanly)
--           NT: 1 Corinthians 15:42-53 (sown in corruption, raised in incorruption; we shall all be changed)
--
-- THREADS (slug -> target libraries):
--   7610 philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9   (Tanakh)
--   7613 philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12  (Tanakh)
--   7616 philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2  (Tanakh + NT)  [BLESSING]
--   7619 philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11  (NT)
--   7622 philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s231_ph03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9
  ('canon', 'philippians', 3, 3, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). The command of the Torah itself was never the outward sign alone but the heart it pointed to — *circumcise... the foreskin of your heart.* Paul says *we are the circumcision, which worship Elohim (God) in the spirit, and rejoice in HaMashiach Yahusha (Christ Jesus), and have no confidence in the flesh* (Philippians 3:3). This is not the abolition of circumcision but its truest meaning: the people of the heart-circumcision, who serve in the spirit and lay down the flesh-boast. Paul stands on Moses, not against him — the inward circumcision the Torah always required.'),
  ('canon', 'philippians', 3, 3, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). Yahuah (LORD) forbids the flesh-boast and names the only true ground: *But let him that glorieth glory in this, that he understandeth and knoweth me* (Jeremiah 9:24). Paul speaks the same word when he says we *have no confidence in the flesh* (Philippians 3:3) but *rejoice in HaMashiach Yahusha (Christ Jesus)* — the glorying transferred from wisdom, might, and pedigree to the knowledge of Yahuah (LORD) himself. The credential-boast of v.4-6 is exactly the wise-man''s and mighty-man''s glory Jeremiah condemned.'),
  ('canon', 'philippians', 3, 3, 'canon', 'jeremiah', 9, 26, 'free', E'*Egypt, and Yahudah (Judah), and Edom, and the children of Ammon, and Moab, and all that are in the utmost corners, that dwell in the wilderness: for all these nations are uncircumcised, and all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26). Jeremiah declares that outward circumcision profits nothing while the heart stays *uncircumcised* — even *all the house of Yashar''el (Israel)* are reckoned uncircumcised when the heart is not. This is the very distinction Paul presses: the circumcision that counts is they *which worship Elohim (God) in the spirit... and have no confidence in the flesh* (Philippians 3:3), against the *concision* (Philippians 3:2) who trust the cut flesh as a credential. The prophet already taught that the flesh-mark without the heart is no circumcision at all.'),
  -- thread: philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12
  ('canon', 'philippians', 3, 5, 'canon', 'genesis', 17, 12, 'free', E'*And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed.* (Genesis 17:12). The eighth-day circumcision is the very *token of the covenant* (Genesis 17:11) Yahuah (LORD) gave Abraham. Paul names it first in his flesh-catalogue: *Circumcised the eighth day, of the stock of Yashar''el (Israel)* (Philippians 3:5). He recites it not to despise the covenant-sign but to show that even the fullest pedigree — kept exactly to the Torah''s day — is *loss* when wielded as a self-made claim. The sign is honourable; the boast in the sign is the thing counted loss.'),
  ('canon', 'philippians', 3, 5, 'canon', 'leviticus', 12, 3, 'free', E'*And in the eighth day the flesh of his foreskin shall be circumcised.* (Leviticus 12:3). The Torah fixes the day exactly — *in the eighth day* — and Paul''s credential is that he was *circumcised the eighth day* (Philippians 3:5), Torah-perfect from infancy, *touching the righteousness which is in the law, blameless* (Philippians 3:6). The point is not that the eighth-day command fell away but that flawless Torah-keeping, held as a flesh-boast, cannot stand as one''s *own righteousness.* Paul kept the day; he counts the boast in the day loss for the excellency of the knowledge of HaMashiach (Christ).'),
  -- thread: philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2  [BLESSING]
  ('canon', 'philippians', 3, 9, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). The faith-righteousness Paul embraces is no new thing — it is the righteousness Abraham received before any work, when *he believed in Yahuah (LORD); and he counted it to him for righteousness.* Paul desires to *be found in him, not having mine own righteousness, which is of the law, but that which is through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:9). What he sets aside is *mine own righteousness* — legal standing achieved as a credential — not the Instruction; what he embraces is the gift-righteousness counted to Abraham, the righteousness *of Elohim (God),* reckoned to faith.'),
  ('canon', 'philippians', 3, 9, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). Against *his soul which is lifted up* — the proud, self-exalted man — stands the word *the just shall live by his faith.* This is the very contrast Paul draws: not his own lifted-up righteousness *which is of the law,* but *the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The prophet already set the proud flesh-boast over against the life that comes by trusting Yahuah (LORD); Paul counts the flesh-credential *dung* (Philippians 3:8) precisely so he may live the just-by-faith life Habakkuk named.'),
  ('canon', 'philippians', 3, 9, 'canon', 'jeremiah', 23, 6, 'free', E'*In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS).* (Jeremiah 23:6). The righteous Branch raised unto David bears the name *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* — the righteousness that is Yahuah''s own gift, not man''s achievement. This is *the righteousness which is of Elohim (God) by faith* (Philippians 3:9) that Paul will not trade for *mine own righteousness, which is of the law.* The prophet promised a King whose very name is the people''s righteousness; Paul is *found in him,* clothed not in his flesh-credential but in the righteousness Yahuah (LORD) himself supplies.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 10, 3, 'free', E'*For they being ignorant of Elohim''s (God''s) righteousness, and going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God).* (Romans 10:3). Paul names the exact error elsewhere: *going about to establish their own righteousness,* refusing to submit to *the righteousness of Elohim (God).* It is word-for-word the choice of Philippians: *not having mine own righteousness, which is of the law, but... the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The fault was never zeal for Torah — Yashar''el (Israel) *have a zeal of Elohim (God)* (Romans 10:2) — but the self-made standing wielded in place of the gift. The thing rejected is the *own righteousness,* not the law.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 4, 5, 'free', E'*But to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness.* (Romans 4:5). The pattern of Abraham — *his faith is counted for righteousness* — is the same gift Paul seeks to *be found in,* the righteousness *through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:9). And Abraham received it *not in circumcision, but in uncircumcision* (Romans 4:10), before the flesh-sign — proof that the credential never earned it. The righteousness Paul will not surrender for pedigree is the reckoned righteousness of faith that came to Abraham as a gift.'),
  ('canon', 'philippians', 3, 9, 'canon', 'romans', 9, 31, 'free', E'*But Yashar''el (Israel), which followed after the law of righteousness, hath not attained to the law of righteousness. Wherefore? Because they sought it not by faith, but as it were by the works of the law.* (Romans 9:31-32). The failure was in the seeking — *not by faith, but as it were by the works of the law,* the law turned into a flesh-credential. The same diagnosis governs Philippians: Paul lays down *mine own righteousness, which is of the law,* for *the righteousness which is of Elohim (God) by faith* (Philippians 3:9). The Gentiles *attained to righteousness, even the righteousness which is of faith* (Romans 9:30) — the gift Paul presses toward — while the works-credential, however blameless, *attained* nothing.'),
  -- thread: philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11
  ('canon', 'philippians', 3, 20, 'canon', 'galatians', 4, 26, 'free', E'*But Jerusalem which is above is free, which is the mother of us all.* (Galatians 4:26). Paul names the homeland of the called-out ones: *Jerusalem which is above is free, which is the mother of us all.* This is the citizenship he means when he writes *For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). Not an escape from the earth nor a new people replacing Yashar''el (Israel), but the free Jerusalem above — the gathered commonwealth of the children of promise, awaiting the Saviour who will come down from it.'),
  ('canon', 'philippians', 3, 20, 'canon', 'hebrews', 11, 10, 'free', E'*For he looked for a city which hath foundations, whose builder and maker is Elohim (God).* (Hebrews 11:10). Abraham, a stranger in the land of promise, *looked for a city which hath foundations, whose builder and maker is Elohim (God)* — the same forward look Paul describes: *our conversation is in heaven; from whence also we look for the Saviour* (Philippians 3:20). The patriarchs and the called-out ones share one citizenship and one hope: the city Elohim (God) himself builds, from which the Saviour comes. To have one''s conversation in heaven is to be of Abraham''s pilgrim company, seeking the founded city.'),
  ('canon', 'philippians', 3, 20, 'canon', 'hebrews', 11, 16, 'free', E'*But now they desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city.* (Hebrews 11:16). The faithful *desire a better country, that is, an heavenly,* for which Elohim (God) *hath prepared for them a city.* This is the homeland of Paul''s citizens whose *conversation is in heaven* (Philippians 3:20) — strangers and pilgrims on the earth, belonging to the heavenly country and the prepared city. The heavenly citizenship is not a status that erases Yashar''el (Israel) but the consummation of the very promise the fathers died still believing.'),
  -- thread: philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15
  ('canon', 'philippians', 3, 21, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel saw the resurrection of the body — *many of them that sleep in the dust of the earth shall awake* — and the wise who *shall shine as the brightness of the firmament* (Daniel 12:3). Paul names the same hope: the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The dust-sleepers raised to everlasting life and the transformed glorious body are one promise; the citizens of heaven await not a fleshless escape but the awakening and glorifying of the body Daniel foretold.'),
  ('canon', 'philippians', 3, 21, 'canon', 'daniel', 12, 3, 'free', E'*And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). The raised wise *shall shine as the brightness of the firmament... as the stars for ever and ever* — bodies transfigured in glory. This is *his glorious body* unto which the vile body is *fashioned like* when the Saviour *shall change our vile body* (Philippians 3:21). Daniel''s shining ones and Paul''s glorified citizens are the same: the bodily resurrection brought to the brightness of the stars, by the power whereby he is *able even to subdue all things unto himself.*'),
  ('canon', 'philippians', 3, 21, 'canon', '1-corinthians', 15, 43, 'free', E'*It is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power:* (1 Corinthians 15:43). Paul unfolds the change of the body: *sown in dishonour; raised in glory... sown in weakness; raised in power.* This is the very transformation of Philippians — the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The vile body of dishonour and weakness is raised glorious and powerful; the *natural body* sown becomes the *spiritual body* (1 Corinthians 15:44), conformed to the risen Messiah (Christ).'),
  ('canon', 'philippians', 3, 21, 'canon', '1-corinthians', 15, 52, 'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). At the last trump *the dead shall be raised incorruptible, and we shall be changed* — *this corruptible must put on incorruption, and this mortal must put on immortality* (1 Corinthians 15:53). This is the changing of the body Paul promises the Philippians: the Saviour *shall change our vile body, that it may be fashioned like unto his glorious body* (Philippians 3:21). The corruptible, mortal, vile body is changed and clothed in the incorruption of his glorious body — the one hope of the citizens who look for the Saviour from heaven.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9',
       E'No confidence in the flesh: circumcise the heart and glory in knowing Yahuah (Deuteronomy 10, Jeremiah 9)',
       E'Paul warns *Beware of dogs, beware of evil workers, beware of the concision* (Philippians 3:2) — the mutilation party who preach the cut flesh as a credential — and answers, *For we are the circumcision, which worship Elohim (God) in the spirit, and rejoice in HaMashiach Yahusha (Christ Jesus), and have no confidence in the flesh* (Philippians 3:3). This is not the abolition of circumcision but its truest meaning, taught by the Torah itself: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). The command always pointed past the flesh-mark to the heart. Jeremiah pressed it further: outward circumcision profits nothing while the heart stays uncircumcised — *all the house of Yashar''el (Israel) are uncircumcised in the heart* (Jeremiah 9:26). And against every flesh-boast Yahuah (LORD) set the only true ground of glorying: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches: But let him that glorieth glory in this, that he understandeth and knoweth me* (Jeremiah 9:23-24). Paul''s catalogue of pedigree in the next verses is exactly the wise-man''s and mighty-man''s glory Jeremiah condemned; the people of the heart-circumcision lay it down and glory instead in knowing Yahuah (LORD). Paul stands on Moses and the prophets, not against them — the inward circumcision the Torah always required, the worship in the spirit, the glorying transferred from the flesh to the knowledge of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 7610
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12',
       E'Circumcised the eighth day: the token of the covenant kept Torah-perfect (Genesis 17, Leviticus 12)',
       E'Paul opens his flesh-catalogue with the covenant-sign, kept to the very day the Torah commands: *Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee* (Philippians 3:5). The eighth day is no accident of memory but the exact command Yahuah (LORD) gave Abraham: *And he that is eight days old shall be circumcised among you, every man child in your generations* (Genesis 17:12), the sign Yahuah (LORD) called *a token of the covenant betwixt me and you* (Genesis 17:11). The Torah fixes it again: *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). Paul was Torah-perfect from infancy, *touching the righteousness which is in the law, blameless* (Philippians 3:6) — and that is precisely the point. He recites the flawless credential not to despise the covenant-sign, which is honourable, but to show that even the fullest, most exact obedience cannot stand as one''s *own righteousness* when it is wielded as a self-made claim before Elohim (God). *But what things were gain to me, those I counted loss for Messiah (Christ)* (Philippians 3:7). He kept the eighth-day sign; what he counts loss is the boast in it. The Instruction is not refuse — the flesh-credential held against the gift-righteousness of Elohim (God) is.',
       sv.verse_id, ev.verse_id, 'free', 7613
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2',
       E'The righteousness which is of Elohim by faith, not the flesh-credential (Genesis 15, Habakkuk 2, Jeremiah 23)',
       E'This is the heart of the chapter, and the reading must be guarded. Paul writes, *Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things, and do count them but dung, that I may win Messiah (Christ), And be found in him, not having mine own righteousness, which is of the law, but that which is through the faith of Messiah (Christ), the righteousness which is of Elohim (God) by faith* (Philippians 3:8-9). What Paul counts loss and dung is the FLESH-CREDENTIAL BOAST — pedigree and Torah-keeping wielded as a self-made claim that boasts before Elohim (God) — NOT Torah-obedience itself, and NOT the Torah abolished. He has just said he was *blameless* touching the law (Philippians 3:6); he does not call the law refuse, he calls *mine own righteousness* — legal standing achieved as a credential — refuse, and sets it against *the righteousness which is of Elohim (God) by faith.* That faith-righteousness is no new thing the prophets did not know. It is the righteousness Abraham received before any work: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). It is the life Habakkuk named over against the proud, self-exalted soul: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). It is the King whose very name is the people''s righteousness: *this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). Paul names the same choice elsewhere word-for-word: Yashar''el (Israel), *going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* (Romans 10:3) — and the fault was never their zeal for Torah but the self-made standing wielded in place of the gift, *not by faith, but as it were by the works of the law* (Romans 9:32). Abraham himself received the reckoned righteousness *not in circumcision, but in uncircumcision* (Romans 4:10), *his faith... counted for righteousness* (Romans 4:5), proof the credential never earned it. So the excluded thing is the self-righteous boast; the embraced thing is the faith-righteousness the prophets promised. Paul kept the law blameless and counts the BOAST loss, not the Instruction — that he may be found in HaMashiach (Christ), clothed in the righteousness Yahuah (LORD) himself supplies.',
       sv.verse_id, ev.verse_id, 'free', 7616
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11',
       E'Our conversation is in heaven: the free Jerusalem above and the city whose builder is Elohim (Galatians 4, Hebrews 11)',
       E'*For our conversation is in heaven; from whence also we look for the Saviour, the Lord Yahusha HaMashiach (Lord Jesus Christ)* (Philippians 3:20). The citizenship Paul names is the Jerusalem above — *But Jerusalem which is above is free, which is the mother of us all* (Galatians 4:26) — not an escape from the earth nor a new people replacing Yashar''el (Israel), but the free homeland of the children of promise, the gathered commonwealth. It is the same forward look the fathers had: Abraham *looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10), and all the faithful *desire a better country, that is, an heavenly: wherefore Elohim (God) is not ashamed to be called their Elohim (God): for he hath prepared for them a city* (Hebrews 11:16). To have one''s conversation in heaven is to belong to Abraham''s pilgrim company — strangers and pilgrims on the earth, citizens of the heavenly country, awaiting the Saviour who comes down from it. The heavenly citizenship is not a status that erases Yashar''el (Israel) but the consummation of the very promise the patriarchs died still believing.',
       sv.verse_id, ev.verse_id, 'free', 7619
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15',
       E'Who shall change our vile body: the dust-sleepers raised and made to shine (Daniel 12, 1 Corinthians 15)',
       E'The Saviour we look for from heaven *shall change our vile body, that it may be fashioned like unto his glorious body, according to the working whereby he is able even to subdue all things unto himself* (Philippians 3:21). The hope of the heavenly citizens is not a fleshless escape but the resurrection and glorifying of the body, exactly as Daniel foretold: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life... And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:2-3). The dust-sleepers raised to everlasting life and made to shine as the stars are the transformed glorious body Paul names. Paul unfolds the change in full: *It is sown in dishonour; it is raised in glory: it is sown in weakness; it is raised in power* (1 Corinthians 15:43); and *In a moment, in the twinkling of an eye, at the last trump... the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52), *for this corruptible must put on incorruption, and this mortal must put on immortality* (1 Corinthians 15:53). The vile body of dishonour, weakness, and corruption is raised glorious, powerful, and incorruptible — *fashioned like unto his glorious body,* conformed to the risen Messiah (Christ). Daniel''s shining ones and Paul''s glorified citizens are one promise: the bodily resurrection brought to the brightness of the stars, by the power whereby he subdues all things unto himself.',
       sv.verse_id, ev.verse_id, 'free', 7622
  FROM _s231_ph03_lookup sv, _s231_ph03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* the Torah''s own demand for the inward circumcision; the people who *worship Elohim (God) in the spirit... and have no confidence in the flesh* (Philippians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might* the flesh-boast Yahuah (LORD) forbids; *no confidence in the flesh,* the glorying transferred to knowing him (Philippians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:26 — *all the house of Yashar''el (Israel) are uncircumcised in the heart* the flesh-mark without the heart is no circumcision; the *concision* (Philippians 3:2) who trust the cut flesh as a credential.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-no-confidence-in-the-flesh-circumcise-the-heart-deuteronomy-10-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:12 — *he that is eight days old shall be circumcised among you* the covenant-sign Yahuah (LORD) gave Abraham; Paul *circumcised the eighth day* (Philippians 3:5), Torah-perfect from infancy.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:3 — *in the eighth day the flesh of his foreskin shall be circumcised* the Torah fixes the exact day; Paul kept it, yet counts the boast in it loss, *touching the righteousness which is in the law, blameless* (Philippians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-circumcised-the-eighth-day-the-token-of-the-covenant-genesis-17-leviticus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the gift-righteousness Abraham received before any work; *the righteousness which is of Elohim (God) by faith* (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:4 — *the just shall live by his faith,* set against *his soul which is lifted up*; the proud flesh-boast vs the life of faith Paul embraces (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 23:6 — *this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* the King whose name is the people''s righteousness; the gift Paul will not trade for *mine own righteousness, which is of the law* (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 10:3 — *going about to establish their own righteousness, have not submitted themselves unto the righteousness of Elohim (God)* the exact parallel; the rejected thing is the *own righteousness,* not the law (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:5 — *to him that worketh not, but believeth... his faith is counted for righteousness* Abraham''s pattern, received before the flesh-sign; the reckoned righteousness Paul seeks (Philippians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 9:31 — *Yashar''el (Israel), which followed after the law of righteousness... sought it not by faith, but as it were by the works of the law* the law turned into a credential; the same diagnosis as Philippians 3:9.'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-the-righteousness-which-is-of-elohim-by-faith-not-the-flesh-genesis-15-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 4:26 — *Jerusalem which is above is free, which is the mother of us all* the homeland of the called-out ones; *our conversation is in heaven* (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:10 — *a city which hath foundations, whose builder and maker is Elohim (God)* Abraham''s forward look, shared by the heavenly citizens (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:16 — *they desire a better country, that is, an heavenly... he hath prepared for them a city* the heavenly homeland of the pilgrim faithful; the citizenship whose *conversation is in heaven* (Philippians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-our-conversation-is-in-heaven-the-city-whose-builder-is-elohim-galatians-4-hebrews-11'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the bodily resurrection; the *vile body* changed by the Saviour (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *they that be wise shall shine as the brightness of the firmament... as the stars for ever and ever* the transfigured glory; *his glorious body* unto which the vile body is fashioned (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:43 — *sown in dishonour; raised in glory: sown in weakness; raised in power* the change of the body; the vile body *fashioned like unto his glorious body* (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:52 — *the dead shall be raised incorruptible, and we shall be changed* at the last trump; the corruptible, mortal, vile body changed and clothed in incorruption (Philippians 3:21).'
  FROM cross_reference_threads t, cross_references x, _s231_ph03_lookup sv, _s231_ph03_lookup tv
 WHERE t.slug='philippians-3-who-shall-change-our-vile-body-the-raised-who-shine-daniel-12-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
