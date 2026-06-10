-- ----- fragment: minion_romans_02.sql (S219 Romans 2) -----
-- =====================================================================
-- S219 minion — ROMANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 2.  Tag: r02 (temp view _s219_r02_lookup).  Sort band: 6025-6049, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
-- thread tier_required = 'extras' if any member is extras, else 'free'.
--
-- WATCHPOINTS (per brief / Red Lines):
--  * 2:6-11 — *who will render to every man according to his deeds* and judgment *of the
--    Yahudi (Jew) first, and also of the Gentile* (2:9-10): the impartial recompense the
--    Tanakh and the Hebrew library proclaim with one voice — never reward-by-flesh-credential,
--    never reward-by-bare-confession, but *according to his deeds.* No respect of persons.
--  * 2:13 — *not the hearers of the law are just before Elohim (God), but the doers of the law
--    shall be justified.* The anti-sola-fide hinge of the whole book: hearing/saying is not
--    enough; the doer is justified. The Master said the same — not the sayer of *Lord, Lord*
--    but the doer of the Father's will enters the kingdom. NOT a freedom-from-Torah verse;
--    its plain force is the opposite.
--  * 2:14-15 — *a law unto themselves … the work of the law written in their hearts.* The
--    dispersed seed with the law written on the heart (Jeremiah 31:33 / Deut 30 promise), NOT
--    Torah-free morality. Carried within the circumcision-of-the-heart thread; not isolated.
--  * 2:25-29 — circumcision *of the heart, in the spirit, and not in the letter.* The promise
--    of Deuteronomy 30:6 and Jeremiah 4:4 — the inward fulfillment of the covenant sign the
--    prophets foretold (Deut 10:16; Jer 9:25-26), NOT the abolition of the sign. The true
--    Yahudi (Jew) is the one circumcised inwardly; *whose praise is not of men, but of
--    Elohim (God).*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  v.1-5   goodness leadeth to repentance / wrath treasured up
--          Tanakh: none added (forbearance theme carried by extras witnesses below)
--          Extras: Wisdom of Solomon 12:19-21 (forbearance teaches repentance); Ecclesiasticus 5:4-6 (presume not on mercy)
--          NT:     none warranted
--  v.6-11  render according to deeds / to the Jew first / no respect of persons
--          Tanakh: Psalm 62:12; Proverbs 24:12; Deuteronomy 10:17
--          Extras: Ecclesiasticus 16:12; Ecclesiasticus 35:12
--          NT:     none added (the deeds-judgment echoed at Matthew 7 carried in the doers thread)
--  v.12-13 doers, not hearers, justified
--          Tanakh: none added (Deut 30:14 "do it" carried in circumcision thread)
--          Extras: none warranted
--          NT:     Matthew 7:21; Matthew 7:23 (doers vs sayers; *I never knew you*)
--  v.14-16 the work of the law written in their hearts
--          Tanakh: none added (heart-Torah carried in v.25-29 circumcision-of-heart thread)
--          Extras: none warranted
--          NT:     none added
--  v.17-24 boast in the law / dishonour by breaking it / the name blasphemed
--          Tanakh: none warranted (rhetorical indictment; the name-blasphemed echo at v.24 is Isaiah/Ezekiel but not load-bearing as a curated pairing here)
--          Extras: none warranted
--          NT:     none warranted
--  v.25-29 circumcision of the heart, in the spirit
--          Tanakh: Deuteronomy 30:6; Jeremiah 4:4; Jeremiah 9:25-26; Deuteronomy 10:16
--          Extras: none warranted
--          NT:     none added
--
-- THREADS (slug -> target libraries):
--   6025 romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance        (Extras)
--   6028 romans-2-who-will-render-to-every-man-according-to-his-deeds          (Tanakh + Extras)
--   6031 romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified  (NT)
--   6034 romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter    (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance
  ('canon', 'romans', 2, 4, 'apocrypha', 'the-wisdom-of-solomon', 12, 19, 'extras', E'*But by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins.* (Wisdom of Solomon 12:19). Paul asks, *despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The Hebrew library already taught it: the forbearance of Elohim (God) is not indifference to sin but the patient space *that you give repentance* — his deliberate longsuffering with his own sons (Wisdom of Solomon 12:21, *with how great circumspection did you judge your own sons*) is the very goodness meant to lead them home, not a license to presume.'),
  ('canon', 'romans', 2, 5, 'apocrypha', 'ecclesiasticus', 5, 5, 'extras', E'*Concerning propitiation, be not without fear to add sin to sin: And say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners.* (Ecclesiasticus 5:5-6). This is the very heart Paul rebukes: *after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath* (Romans 2:5). To take the longsuffering of Elohim (God) as permission — *His mercy is great, he will be pacified* — is to add sin to sin and store up wrath; for *mercy and wrath come from him,* and the goodness was given to lead to repentance, not to excuse the impenitent.'),
  -- thread: romans-2-who-will-render-to-every-man-according-to-his-deeds
  ('canon', 'romans', 2, 6, 'canon', 'psalms', 62, 12, 'free', E'*Also unto thee, O Yahuah (Lord), belongeth mercy: for thou renderest to every man according to his work.* (Psalm 62:12). Paul states the standard of the judgment plainly — *who will render to every man according to his deeds* (Romans 2:6) — and it is David''s own confession of how Elohim (God) judges. Mercy belongs to Yahuah (Lord), and so does the rendering according to the work; the two are not opposed. The recompense is by deeds, not by claim.'),
  ('canon', 'romans', 2, 6, 'canon', 'proverbs', 24, 12, 'free', E'*If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:12). The judge *that pondereth the heart* renders *to every man according to his works* — the same standard Paul names: *who will render to every man according to his deeds* (Romans 2:6). No plea of ignorance and no boast of standing moves the One who weighs the heart; the deeds are read, and the recompense follows them.'),
  ('canon', 'romans', 2, 11, 'canon', 'deuteronomy', 10, 17, 'free', E'*For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward:* (Deuteronomy 10:17). *For there is no respect of persons with Elohim (God)* (Romans 2:11) is not a new doctrine but the Torah''s own word: Yahuah Elohaychem (the LORD your God) *regardeth not persons.* This is why judgment falls *of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9) — the covenant standing of the house of Yahudah (Judah) does not exempt it; the same impartial Judge weighs all by their deeds.'),
  ('canon', 'romans', 2, 6, 'apocrypha', 'ecclesiasticus', 16, 12, 'extras', E'*As his mercy is great, so is his correction also: he judges a man according to his works.* (Ecclesiasticus 16:12). The Hebrew library says it with Paul: *he judges a man according to his works,* as *Elohim (God) … will render to every man according to his deeds* (Romans 2:6). Mercy and correction are both great in him, set side by side — the same Elohim (God) whose goodness leads to repentance is the one who weighs the deeds; the judgment is not arbitrary nor partial but measured to the work.'),
  ('canon', 'romans', 2, 11, 'apocrypha', 'ecclesiasticus', 35, 12, 'extras', E'*Do not think to corrupt with gifts; for such he will not receive: and trust not to unrighteous sacrifices; for Yahuah (God) is judge, and with him is no respect of persons.* (Ecclesiasticus 35:12). Paul''s *there is no respect of persons with Elohim (God)* (Romans 2:11) is the settled word of the Hebrew library — *with him is no respect of persons.* He cannot be bought with gifts nor moved by standing; he hears the oppressed and weighs the deeds. The judgment *to the Yahudi (Jew) first, and also to the Gentile* (Romans 2:10) flows from this impartiality.'),
  -- thread: romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified
  ('canon', 'romans', 2, 13, 'canon', 'matthew', 7, 21, 'free', E'*Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21). Paul''s hinge — *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13) — is the Master''s own teaching. It is not the one who says *Yahuah (Lord), Yahuah (Lord),* nor the one who merely hears, but the one who *doeth the will of my Father* who enters. Saying and hearing are not the standing; doing is.'),
  ('canon', 'romans', 2, 13, 'canon', 'matthew', 7, 23, 'free', E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23). To the many who said *Yahuah (Lord), Yahuah (Lord)* and prophesied in his name, the word is *I never knew you: depart from me, ye that work iniquity* — workers of lawlessness, hearers and sayers who were not doers. This is exactly the line Paul draws: *the doers of the law shall be justified* (Romans 2:13). The claim of the name without the doing is the iniquity the Master sends away.'),
  -- thread: romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter
  ('canon', 'romans', 2, 29, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). When Paul says *circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:29), he is naming the promise Moses gave at the return from scattering: Yahuah Elohayka (the LORD thy God) himself *will circumcise thine heart … to love* him. The heart-circumcision is not the abolition of the sign but its inward fulfillment — the covenant cut into the heart of the seed so that they may live.'),
  ('canon', 'romans', 2, 29, 'canon', 'jeremiah', 4, 4, 'free', E'*Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem: lest my fury come forth like fire* (Jeremiah 4:4). The prophet already commanded the inward circumcision Paul preaches — *take away the foreskins of your heart.* So *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28); the true circumcision is *of the heart* that Jeremiah demanded of the men of Yahudah (Judah) long before, lest the fury of Yahuah (LORD) fall on the uncircumcised heart.'),
  ('canon', 'romans', 2, 28, 'canon', 'jeremiah', 9, 26, 'free', E'*Egypt, and Yahudah (Judah), and Edom, and the children of Ammon, and Moab, and all that are in the utmost corners, that dwell in the wilderness: for all these nations are uncircumcised, and all the house of Yashar''el (Israel) are uncircumcised in the heart.* (Jeremiah 9:26). Jeremiah names the very condition Paul exposes: the house of Yashar''el (Israel) bears the sign in the flesh yet is *uncircumcised in the heart.* So *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28) — the flesh-mark without the heart-mark is no circumcision at all, the very thing Yahuah (LORD) said he would punish.'),
  ('canon', 'romans', 2, 25, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). Paul says *circumcision verily profiteth, if thou keep the law: but if thou be a breaker of the law, thy circumcision is made uncircumcision* (Romans 2:25). The flesh-sign was never meant to stand alone — Moses commanded in the same breath *circumcise … the foreskin of your heart.* The outward sign profits only with the inward reality; without the circumcised heart and the kept law, the flesh-circumcision is counted as uncircumcision.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance',
       E'The riches of his goodness leadeth thee to repentance',
       E'Paul turns on the one who judges another while doing the same, and presses the question: *despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The longsuffering of Elohim (God) is not indifference; it is the patient space given for return. The Hebrew library taught this plainly: *by such works have you taught your people that the just man should be merciful, and have made your children to be of a good hope that you give repentance for sins* (Wisdom of Solomon 12:19), for *with how great circumspection did you judge your own sons* (Wisdom of Solomon 12:21). But the same library warns against turning that mercy into a license: *say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners* (Ecclesiasticus 5:6). To do so is the hardness Paul names: *after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God)* (Romans 2:5). The goodness is real and it has a direction — it leads to repentance; refuse the direction and the same goodness becomes stored-up wrath.',
       sv.verse_id, ev.verse_id, 'extras', 6025
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-who-will-render-to-every-man-according-to-his-deeds',
       E'Who will render to every man according to his deeds',
       E'Paul states the rule of the judgment without softening it: Elohim (God) *will render to every man according to his deeds* (Romans 2:6), with *tribulation and anguish, upon every soul of man that doeth evil, of the Yahudi (Jew) first, and also of the Gentile* (Romans 2:9) and *glory, honour, and peace, to every man that worketh good, to the Yahudi (Jew) first, and also to the Gentile* (Romans 2:10) — *for there is no respect of persons with Elohim (God)* (Romans 2:11). None of this is new. David confessed it: *thou renderest to every man according to his work* (Psalm 62:12). The proverb pressed it on the one who pleads ignorance: *he that pondereth the heart … shall not he render to every man according to his works?* (Proverbs 24:12). The Torah grounded the impartiality: Yahuah Elohaychem (the LORD your God) *regardeth not persons, nor taketh reward* (Deuteronomy 10:17). And the Hebrew library said it with one voice: *he judges a man according to his works* (Ecclesiasticus 16:12), *for Yahuah (God) is judge, and with him is no respect of persons* (Ecclesiasticus 35:12). The covenant standing of Yahudah (Judah) does not exempt — judgment comes *to the Yahudi (Jew) first* — because the Judge is no respecter of persons and reads the deeds, not the claim.',
       sv.verse_id, ev.verse_id, 'extras', 6028
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified',
       E'Not the hearers but the doers of the law shall be justified',
       E'Here is the hinge of the whole book, and it cuts against every reading that makes standing a matter of claim rather than walk: *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13). To hear is not to be justified; to say is not to be justified; the doer is justified. This is the Master''s own teaching, word for word in substance: *not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21). And to those who pile up the right words and the works done in his name, yet were hearers and sayers and not doers, the verdict is *I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The lawlessness is precisely the gap between the saying and the doing. Paul and the Master draw the same line: the law heard, the name confessed, the boast made — none of it justifies; *the doers of the law shall be justified.*',
       sv.verse_id, ev.verse_id, 'free', 6031
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter',
       E'Circumcision of the heart, in the spirit, not in the letter',
       E'Paul ends the chapter by distinguishing the outward sign from the inward reality: *circumcision verily profiteth, if thou keep the law: but if thou be a breaker of the law, thy circumcision is made uncircumcision* (Romans 2:25), and *he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God)* (Romans 2:29). This is not the abolition of the covenant sign — it is the inward fulfillment the prophets foretold. Moses commanded it in the same breath as the flesh-sign: *circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). At the return from scattering he promised Yahuah Elohayka (the LORD thy God) would do it himself: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart … that thou mayest live* (Deuteronomy 30:6). Jeremiah pressed the same on Yahudah (Judah): *take away the foreskins of your heart, ye men of Yahudah (Judah)* (Jeremiah 4:4), and named the failure exactly — *all the house of Yashar''el (Israel) are uncircumcised in the heart* (Jeremiah 9:26). The flesh-mark without the heart-mark is no circumcision at all. Paul is not cutting the sign away; he is naming the heart-circumcision the whole library always demanded.',
       sv.verse_id, ev.verse_id, 'free', 6034
  FROM _s219_r02_lookup sv, _s219_r02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=2 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 12:19 — *you give repentance for sins* the forbearance of Elohim (God) is the space for return, his goodness leading to repentance (Romans 2:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 5:5-6 — *say not His mercy is great; he will be pacified … for mercy and wrath come from him* the warning against the impenitent heart that treasures up wrath (Romans 2:5).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-the-riches-of-his-goodness-leadeth-thee-to-repentance'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-who-will-render-to-every-man-according-to-his-deeds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 62:12 — *thou renderest to every man according to his work* David''s confession of the standard Paul names (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *shall not he render to every man according to his works?* the One who ponders the heart reads the deeds, no plea of ignorance availing (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:17 — *which regardeth not persons, nor taketh reward* the Torah''s ground for *no respect of persons* and judgment to the Yahudi (Jew) first (Romans 2:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 16:12 — *he judges a man according to his works* mercy and correction both great in him, the deeds weighed (Romans 2:6).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 35:12 — *Yahuah (God) is judge, and with him is no respect of persons* the impartiality Paul names, unbought by gifts or standing (Romans 2:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-who-will-render-to-every-man-according-to-his-deeds'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:21 — *not every one that saith unto me, Yahuah (Lord), Yahuah (Lord) … but he that doeth the will of my Father* the Master''s line: the doer, not the sayer, enters (Romans 2:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:23 — *I never knew you: depart from me, ye that work iniquity* the verdict on hearers and sayers who were not doers (Romans 2:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-not-the-hearers-but-the-doers-of-the-law-shall-be-justified'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart … that thou mayest live* the promise of heart-circumcision at the return, the inward fulfillment of the sign (Romans 2:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 4:4 — *take away the foreskins of your heart, ye men of Yahudah (Judah)* the prophet''s command for the very heart-circumcision Paul preaches (Romans 2:29).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:26 — *all the house of Yashar''el (Israel) are uncircumcised in the heart* the flesh-mark without the heart-mark, exactly what Paul exposes (Romans 2:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 10:16 — *circumcise therefore the foreskin of your heart, and be no more stiffnecked* the heart-sign Moses commanded alongside the flesh-sign, without which circumcision profits nothing (Romans 2:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r02_lookup sv, _s219_r02_lookup tv
 WHERE t.slug='romans-2-circumcision-of-the-heart-in-the-spirit-not-in-the-letter'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
