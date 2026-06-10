-- ----- fragment: minion_romans_04.sql (S219 Romans 4) -----
-- =====================================================================
-- S219 minion — ROMANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Range:  ROMANS 4.  Tag: r04 (temp view _s219_r04_lookup).  Sort band: 6075-6099, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #4/#5/#7/#10, faith = faithfulness):
--  Paul is a Torah-keeping Israelite holding up Abraham as the pattern for the gathered
--  assembly at Rome. Abraham *believed Elohim (God), and it was counted unto him for
--  righteousness* (4:3) — but Abraham's faith WAS faithfulness: he *obeyed my voice, and kept
--  my charge, my commandments, my statutes, and my laws* (Genesis 26:5), and *when he was
--  proved, he was found faithful* (Sirach 44:20; 1 Maccabees 2:52). The *not of works* of
--  Romans 4 is against self-justification (the flesh-credential boast, 4:2), NEVER against
--  obedience and never the abolition of Torah. Circumcision is *a seal of the righteousness
--  of the faith* (4:11) — the token of the covenant (Genesis 17:11), not the cause of the
--  righteousness. Abraham is *the father of us all* (4:16), *a father of many nations*
--  (4:17 / Genesis 17:5), and his seed — scattered as the stars and the sand — are reckoned
--  his children, the two houses gathered. The chapter closes on the Formed *raised again for
--  our justification* (4:25): the One who *quickeneth the dead* (4:17) is the God who returned
--  Isaac to Abraham as from the dead (Genesis 22) and who raised up Yahusha (Jesus).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-5   Abraham believed / counted for righteousness / justifieth the ungodly
--          Tanakh: Genesis 15:6 (believed and counted), Genesis 26:5 (kept my commandments — faith as faithfulness)
--          Extras: Sirach 44:19-21 (kept the law, found faithful when proved); 1 Maccabees 2:52 (found faithful in temptation, imputed for righteousness)
--          NT:     Romans 4:22 (Romans<->Romans, the same imputed-for-righteousness restated)
--  v.6-8   the blessedness David describes / Yahuah imputeth not sin
--          Tanakh: Psalm 32:1, Psalm 32:2 (the exact citation, blessed/forgiven/covered/imputeth not iniquity)
--          Extras: none warranted   NT: none warranted
--  v.9-12  reckoned in uncircumcision / a seal of the righteousness of the faith
--          Tanakh: Genesis 17:10, Genesis 17:11 (circumcision a token of the covenant — the seal, not the cause)
--          Extras: none warranted (Sirach 44:20 *established the covenant in his flesh* carried in thread 1)   NT: none warranted
--  v.13-17a the promise to the seed / heir of the world / a father of many nations
--          Tanakh: Genesis 17:4, Genesis 17:5 (a father of many nations); Genesis 15:5 (so shall thy seed be — carried v.18 block); Genesis 22:18 (in thy seed all nations blessed, because thou hast obeyed)
--          Extras: none warranted   NT: none warranted (the law-worketh-wrath / Deut-28-curse weighed; carried in Romans 3 & 5 packs, not re-added)
--  v.17b-22 quickeneth the dead / against hope believed / so shall thy seed be / fully persuaded
--          Tanakh: Genesis 15:5 (look toward heaven, so shall thy seed be); Genesis 17:17 (Abraham's own body / Sarah's deadness)
--          Extras: none warranted   NT: none warranted (4:22 imputed-for-righteousness carried in thread 1)
--  v.23-25 for us also / raised up Yahusha / delivered for offences, raised for justification
--          Tanakh: Genesis 22:8 (Elohim will provide himself a lamb), Genesis 22:13 (the ram in the stead) — the bound son received back as from the dead, the Aqedah figure of the resurrection
--          Extras: none warranted   NT: none added (Isaiah 53 / the Lamb carried in the Isaiah and gospel packs, not re-imported here)
--
-- THREADS (slug -> target libraries):
--   6075 romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness  (Tanakh + Extras + NT)
--   6078 romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth          (Tanakh)
--   6081 romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause                (Tanakh)
--   6084 romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children     (Tanakh)
--   6087 romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification          (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness
  ('canon', 'romans', 4, 3, 'canon', 'genesis', 15, 6, 'free', E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6). This is the very scripture Paul reaches for: *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). The word stands at the moment Yahuah (LORD) brought Abraham forth to number the stars and promised him a seed — Abraham took Yahuah (LORD) at his word, and that trust was reckoned righteousness. Not a flesh-credential earned, but a heart that held fast to the One who spoke.'),
  ('canon', 'romans', 4, 3, 'canon', 'genesis', 26, 5, 'free', E'*Because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* (Genesis 26:5). The faith that *was counted unto him for righteousness* (Romans 4:3) was no bare assent: Yahuah (LORD) himself names what Abraham''s believing looked like — he *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws.* Abraham''s faith was his faithfulness. When Paul says Abraham was not justified *by works* (Romans 4:2), he strikes at the boast of self-justification, never at the obedience Yahuah (LORD) here records with his own mouth.'),
  ('canon', 'romans', 4, 5, 'apocrypha', '1-maccabees', 2, 52, 'extras', E'*Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). Mattathias, charging his sons to give their lives for the covenant, reads Abraham exactly as Paul does — but names the testing the believing endured: Abraham was *found faithful in temptation, and it was imputed to him for righteousness.* This is the same imputing Paul presses — *his faith is counted for righteousness* (Romans 4:5) — and the Maccabean witness shows the faith counted was a faithfulness proved under trial, the binding of Isaac its furnace.'),
  ('canon', 'romans', 4, 3, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Sirach 44:20). Ben Sira praises Abraham as one who *kept the law of the Most High* and *when he was proved, he was found faithful* — and *established the covenant in his flesh,* the circumcision Paul calls a seal. The faith Paul says was *counted unto him for righteousness* (Romans 4:3) is here spelled as law-keeping, covenant-faithfulness, and a faithfulness tested and found true. The Hebrew library knows no faith that is not faithfulness.'),
  ('canon', 'romans', 4, 22, 'canon', 'romans', 4, 3, 'free', E'*Abraham believed Elohim (God), and it was counted unto him for righteousness.* (Romans 4:3). Paul opened the chapter with the scripture and now closes the argument by returning to it: *And therefore it was imputed to him for righteousness* (Romans 4:22). The whole weave — believing the promise, staggering not, being fully persuaded — is gathered back into the single reckoning of Genesis. What was *counted* at the start is *imputed* at the end: one faithfulness, one righteousness, the pattern for all who are reckoned Abraham''s children.'),
  -- thread: romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth
  ('canon', 'romans', 4, 7, 'canon', 'psalms', 32, 1, 'free', E'*Blessed is he whose transgression is forgiven, whose sin is covered.* (Psalm 32:1). Paul says David *describeth the blessedness of the man, unto whom Elohim (God) imputeth righteousness without works* (Romans 4:6), and quotes him: *Blessed are they whose iniquities are forgiven, and whose sins are covered* (Romans 4:7). It is David''s own cry after his sin — the blessedness is not innocence earned but transgression forgiven and covered by the mercy of Yahuah (LORD), the return of the one who confessed.'),
  ('canon', 'romans', 4, 8, 'canon', 'psalms', 32, 2, 'free', E'*Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile.* (Psalm 32:2). Paul completes the citation: *Blessed is the man to whom Yahuah (Lord) will not impute sin* (Romans 4:8). David''s blessedness is the man whose iniquity Yahuah (LORD) does not reckon against him — and the psalm names the other half David lived out, *in whose spirit there is no guile,* the honesty of the one who *acknowledged my sin … and thou forgavest* (Psalm 32:5). Forgiveness reckoned, and a heart turned back without guile: the blessedness Paul sets beside Abraham''s righteousness.'),
  -- thread: romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause
  ('canon', 'romans', 4, 11, 'canon', 'genesis', 17, 11, 'free', E'*And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* (Genesis 17:11). Yahuah (LORD) gave circumcision as *a token of the covenant* — the sign, not the source. Paul reads it just so: Abraham *received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). The righteousness was reckoned in Genesis 15, years before the sign of Genesis 17 was given; the token sealed a righteousness already standing. The covenant sign is honored, not abolished — but it never was the cause of the standing it sealed.'),
  ('canon', 'romans', 4, 11, 'canon', 'genesis', 17, 10, 'free', E'*This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* (Genesis 17:10). The command Yahuah (LORD) gave is *my covenant, which ye shall keep* — a covenant kept, *in your flesh for an everlasting covenant* (Genesis 17:13). Paul does not strike at this; he names what it was for: that Abraham *might be the father of all them that believe, though they be not circumcised … and the father of circumcision to them who … walk in the steps of that faith of our father Abraham* (Romans 4:11-12). The sign marks the covenant; the faithfulness it seals reaches both the circumcised seed and the scattered who walk in Abraham''s steps.'),
  -- thread: romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children
  ('canon', 'romans', 4, 17, 'canon', 'genesis', 17, 5, 'free', E'*Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* (Genesis 17:5). Paul quotes it directly — *(As it is written, I have made thee a father of many nations,)* (Romans 4:17). The new name itself carried the promise: the seed of Abraham would not stay one household but become *many nations,* scattered as the stars across the earth and gathered back as his children. The two houses dispersed among the nations are reckoned to the father whose very name means the multitude of his seed.'),
  ('canon', 'romans', 4, 16, 'canon', 'genesis', 17, 4, 'free', E'*As for me, behold, my covenant is with thee, and thou shalt be a father of many nations.* (Genesis 17:4). The promise was that the seed should *be sure to all the seed … of the faith of Abraham; who is the father of us all* (Romans 4:16) — and Yahuah (LORD) had said it from the first: *my covenant is with thee, and thou shalt be a father of many nations.* The inheritance comes *by grace* through the faithfulness of the father, that it might hold sure for all the seed — the remnant of Yahudah (Judah) and the scattered of the ten tribes alike, the whole multitude promised to Abraham.'),
  ('canon', 'romans', 4, 18, 'canon', 'genesis', 15, 5, 'free', E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). Paul points straight to this night: Abraham *against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). Yahuah (LORD) set the childless man under the stars and named the innumerable seed; Abraham believed the One who *calleth those things which be not as though they were* (Romans 4:17). The seed as the stars is the gathered multitude the prophets traced home.'),
  ('canon', 'romans', 4, 13, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). The promise that Abraham *should be the heir of the world* (Romans 4:13) came not *through the law* as a system of earning but *through the righteousness of faith* — and Yahuah (LORD) sealed it after the binding of Isaac: *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* The promise and the obedience stand together in one breath; the heir-of-the-world blessing rests on the faithfulness of the father who did not withhold his son.'),
  -- thread: romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification
  ('canon', 'romans', 4, 17, 'canon', 'genesis', 22, 13, 'free', E'*And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* (Genesis 22:13). Paul names the God Abraham believed as the One *who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). On Moriah Abraham received Isaac back as from the dead — the knife already raised — when the ram was given *in the stead of his son.* The father who trusted that Yahuah (LORD) could quicken the dead is the pattern for those who trust the God who raised up Yahusha (Jesus).'),
  ('canon', 'romans', 4, 24, 'canon', 'genesis', 22, 8, 'free', E'*And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* (Genesis 22:8). Abraham climbed Moriah saying *Elohim (God) will provide himself a lamb* — trusting the provision before he saw it, as those now believe *on him that raised up Yahusha (Jesus) our Lord from the dead* (Romans 4:24). The lamb Abraham trusted Yahuah (LORD) to provide, and the son received back alive, foreshadow the One *delivered for our offences, and … raised again for our justification* (Romans 4:25) — the provided sacrifice and the life given back.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness',
       E'Abraham believed Elohim (God) — the faith that was faithfulness',
       E'Paul holds up Abraham as the pattern: *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3), and *to him that worketh not, but believeth on him that justifieth the ungodly, his faith is counted for righteousness* (Romans 4:5). The default reading hears this as faith against obedience — but the Hebrew library knows no such split. The word Paul quotes is the night Yahuah (LORD) brought the childless man out to number the stars: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). And Yahuah (LORD) himself names what that believing was: Abraham *obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* (Genesis 26:5). Abraham''s faith was his faithfulness. The restored library says the same with one voice: Ben Sira praises him as one *who kept the law of the Most High … he established the covenant in his flesh; and when he was proved, he was found faithful* (Sirach 44:20), and Mattathias asks his sons, *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52) — the very imputing Paul presses, named as a faithfulness proved in testing, the binding of Isaac its furnace. So when Paul says Abraham was not justified *by works* (Romans 4:2), he strikes at the boast of self-justification — the flesh-credential that would have *whereof to glory* — never at the obedience Yahuah (LORD) records with his own mouth. And the argument closes where it began: *And therefore it was imputed to him for righteousness* (Romans 4:22). One faithfulness, one righteousness, the pattern for all who are reckoned his children.',
       sv.verse_id, ev.verse_id, 'extras', 6075
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth',
       E'Blessed is the man to whom Yahuah (Lord) will not impute sin',
       E'Beside Abraham, Paul sets David: *Even as David also describeth the blessedness of the man, unto whom Elohim (God) imputeth righteousness without works* (Romans 4:6). The words he quotes are David''s own song after his sin: *Blessed are they whose iniquities are forgiven, and whose sins are covered. Blessed is the man to whom Yahuah (Lord) will not impute sin* (Romans 4:7-8). They come straight from the psalm — *Blessed is he whose transgression is forgiven, whose sin is covered. Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile* (Psalm 32:1-2). The blessedness is not innocence earned but transgression forgiven and covered by the mercy of Yahuah (LORD). And the psalm shows the man who receives it: the one who stopped hiding — *I acknowledged my sin unto thee … and thou forgavest the iniquity of my sin* (Psalm 32:5) — the spirit *in whom there is no guile.* Forgiveness reckoned, and a heart turned back without guile. This is the grace that imputes righteousness: the homecoming of the one who confesses and returns, never a covering that leaves the man where he lay.',
       sv.verse_id, ev.verse_id, 'free', 6078
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause',
       E'A seal of the righteousness of the faith — the token, not the cause',
       E'Paul asks whether the blessedness comes *upon the circumcision only, or upon the uncircumcision also* (Romans 4:9), and answers by the timing: the righteousness was reckoned to Abraham *not in circumcision, but in uncircumcision* (Romans 4:10) — in Genesis 15, years before the sign was given in Genesis 17. So circumcision was *the sign … a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). This is exactly what Yahuah (LORD) called it: *it shall be a token of the covenant betwixt me and you* (Genesis 17:11) — the sign of *my covenant, which ye shall keep* (Genesis 17:10), *in your flesh for an everlasting covenant* (Genesis 17:13). The token seals; it does not cause. Paul does not throw down the covenant sign — he names its purpose: that Abraham *might be the father of all them that believe, though they be not circumcised … and the father of circumcision to them who are not of the circumcision only, but who also walk in the steps of that faith of our father Abraham* (Romans 4:11-12). The sign marks the covenant; the faithfulness it seals reaches both the circumcised seed and the scattered who walk in Abraham''s steps and come home to it.',
       sv.verse_id, ev.verse_id, 'free', 6081
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children',
       E'A father of many nations — the promise to the seed, the scattered reckoned his children',
       E'The promise that Abraham *should be the heir of the world* came not *through the law* as a system of earning *but through the righteousness of faith* (Romans 4:13), *that it might be by grace; to the end the promise might be sure to all the seed … who is the father of us all* (Romans 4:16). Paul anchors it in the word Yahuah (LORD) spoke when he changed the name: *(As it is written, I have made thee a father of many nations,)* (Romans 4:17) — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee* (Genesis 17:5), *my covenant is with thee, and thou shalt be a father of many nations* (Genesis 17:4). The new name carried the multitude inside it. It was sealed under the stars — *Look now toward heaven, and tell the stars, if thou be able to number them … So shall thy seed be* (Genesis 15:5) — so that Abraham *against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be* (Romans 4:18). And after the binding of Isaac Yahuah (LORD) sealed it again: *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18) — promise and obedience in one breath. The seed scattered as the innumerable stars across the nations are reckoned the children of the father whose very name means the multitude of his seed: the remnant of Yahudah (Judah) and the dispersed of the ten tribes alike, gathered home as the sure inheritance of the promise.',
       sv.verse_id, ev.verse_id, 'free', 6084
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification',
       E'Who quickeneth the dead — the bound son received back, and raised for our justification',
       E'The God Abraham believed is named by what he does: *even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were* (Romans 4:17). Abraham knew that God on Moriah. He climbed the mountain saying *My son, Elohim (God) will provide himself a lamb for a burnt offering* (Genesis 22:8), trusting the provision before he saw it; and with the knife already raised he received Isaac back as from the dead when *a ram caught in a thicket by his horns* was offered *in the stead of his son* (Genesis 22:13). The father who trusted that Yahuah (LORD) could quicken the dead — and got his son back alive — is the pattern for the faith now reckoned to us: *if we believe on him that raised up Yahusha (Jesus) our Lord from the dead* (Romans 4:24). The provided lamb and the son given back foreshadow the One *who was delivered for our offences, and was raised again for our justification* (Romans 4:25). The God who quickeneth the dead is the same in both: he who returned Isaac to Abraham, and he who raised Yahusha (Jesus) — the Formed who took on flesh, was delivered up, and was given back from the grave that the faithful might be set in right standing.',
       sv.verse_id, ev.verse_id, 'free', 6087
  FROM _s219_r04_lookup sv, _s219_r04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *he believed in Yahuah (LORD); and he counted it to him for righteousness* the scripture Paul quotes, the night of the stars (Romans 4:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:5 — *Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws* Yahuah (LORD) names the believing as faithfulness; the *not of works* strikes self-justification, not obedience (Romans 4:2-3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 44:20 — *who kept the law of the Most High … when he was proved, he was found faithful* the Hebrew library spells the faith as law-keeping and tested faithfulness (Romans 4:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 2:52 — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* the same imputing Paul presses, named as a faithfulness proved in testing (Romans 4:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness* the argument closes by returning to the scripture it opened with: *therefore it was imputed to him for righteousness* (Romans 4:22).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-abraham-believed-elohim-and-it-was-counted-for-righteousness-the-faith-that-was-faithfulness'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 32:1 — *Blessed is he whose transgression is forgiven, whose sin is covered* David''s blessedness, transgression forgiven and covered (Romans 4:7).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 32:2 — *Blessed is the man unto whom Yahuah (LORD) imputeth not iniquity, and in whose spirit there is no guile* iniquity not reckoned, the heart turned back without guile (Romans 4:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-blessed-is-the-man-to-whom-yahuah-imputeth-not-sin-the-blessedness-david-describeth'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:11 — *it shall be a token of the covenant betwixt me and you* circumcision the sign, not the source; the righteousness was reckoned years before in uncircumcision (Romans 4:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:10 — *This is my covenant, which ye shall keep … Every man child among you shall be circumcised* the covenant kept in the flesh; Paul names its purpose, that Abraham be father of both the circumcised and the scattered who walk in his steps (Romans 4:11-12).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-seal-of-the-righteousness-of-the-faith-circumcision-the-token-not-the-cause'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* the heir-of-the-world promise, sealed on promise and obedience together after the binding (Romans 4:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:4 — *my covenant is with thee, and thou shalt be a father of many nations* the inheritance sure to all the seed through the father of us all (Romans 4:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:5 — *a father of many nations have I made thee* the name itself carried the multitude; Paul quotes it directly (Romans 4:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:5 — *tell the stars, if thou be able to number them … So shall thy seed be* the innumerable seed sealed under the stars, believed against hope (Romans 4:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-a-father-of-many-nations-the-promise-to-the-seed-and-the-scattered-reckoned-his-children'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:13 — *a ram caught in a thicket by his horns … offered him up … in the stead of his son* Abraham received Isaac back as from the dead, knowing the God *who quickeneth the dead* (Romans 4:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:8 — *Elohim (God) will provide himself a lamb for a burnt offering* the provision trusted before it was seen; the provided lamb and the son given back foreshadow the One raised for our justification (Romans 4:24-25).'
  FROM cross_reference_threads t, cross_references x, _s219_r04_lookup sv, _s219_r04_lookup tv
 WHERE t.slug='romans-4-who-quickeneth-the-dead-the-bound-son-received-back-and-raised-for-our-justification'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
