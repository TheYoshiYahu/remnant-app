-- ----- fragment: minion_galatians_06.sql (S223 Galatians 6) -----
-- =====================================================================
-- S223 minion — GALATIANS 6 FULL-LIBRARY cross-references (closing chapter)
-- =====================================================================
-- Chapter: GALATIANS 6 (18 verses).  Tag: g06 (temp view _s223_g06_lookup).
-- Sort band: floor 7325, step 3 (7325, 7328, 7331, 7334, 7337 used; under 7350).
-- Source is ALWAYS the canon Galatians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGHEST VOICE-RISK BOOK — "The Galatians Lie"; Red Lines #4/#5/#6/#7/#10):
-- Galatians is written to the scattered seed of Yashar'el (Israel) living among the nations with
-- covenant memory dimmed by exile — NOT pagans who never had Torah. Paul answers the agitators'
-- proselyte gospel (*Except ye be circumcised after the manner of Moses, ye cannot be saved*,
-- Acts 15:1): flesh-credential-as-doorway, NOT Torah-as-such. The closing chapter UPHOLDS Torah
-- at every contested turn. *Bear ye one another's burdens, and so fulfil the law of Messiah*
-- (6:2) — *the law of Messiah* is the Torah lived out in love, the Leviticus 19:18 command Paul
-- already cited at 5:14; fulfil ≠ abolish (HIDDEN TORAH-AFFIRMING). *Be not deceived; Elohim
-- (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (6:7) — the
-- sowing-and-reaping consequence-system is STILL OPERATIVE; grace opened the door home but did not
-- cancel consequence (complete-the-sentence frame). *Neither circumcision availeth any thing, nor
-- uncircumcision, but a new creature* (6:15) is the same teaching as 1 Corinthians 7:19 (*but the
-- keeping of the commandments of Elohim (God)*) — the flesh-mark is nothing, the new heart that
-- keeps the commandments is everything (Ezekiel 36:26). *The Yashar'el (Israel) of Elohim (God)*
-- (6:16) is the covenant people, the gathered seed of Yashar'el coming home — NOT a new or
-- replacement people superseding Yashar'el (the Psalms close every blessing with *peace upon
-- Yashar'el (Israel)*). The mark Paul bears in his body (6:17) is the true mark over against the
-- agitators' circumcision-mark. Christology: Yahusha is the Formed drawn from the Formless, who is
-- Yahuah (Lord) and has a Father. The default trained reading — grace-against-law, Torah-abolished,
-- the-Israel-of-God-is-the-church-replacing-Israel — is the antichrist reading this apparatus exists
-- to dismantle and must surface nowhere.
--
-- PER-VERSE LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     restore in the spirit of meekness; considering thyself lest thou also be tempted
--           Tanakh: none warranted (the restoration-of-the-erring root is carried by the NT pair)
--           Extras: none warranted   NT: Matthew 18:15 (go and tell him his fault... gain thy
--                   brother), James 5:19-20 (convert him from the error of his way, save a soul)
--   v.2-3   bear one another's burdens, and so fulfil the law of Messiah (HIDDEN TORAH-AFFIRMING)
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself) — the very command Paul names
--           Extras: none warranted (the Torah root + NT echoes carry it cleanly)
--           NT: John 13:34 (a new commandment, love one another), Romans 15:1 (bear the infirmities
--                   of the weak)
--   v.4-5   prove his own work; every man shall bear his own burden — carried in prose at v.7-8
--           (the personal-accountability axis of the sowing-and-reaping thread)
--   v.6     communicate to him that teacheth — none warranted (no load-bearing weave)
--   v.7-8   God is not mocked; whatsoever a man soweth, that shall he also reap (consequence-system)
--           Tanakh: Job 4:8 (they that plow iniquity... reap the same), Proverbs 22:8 (he that
--                   soweth iniquity shall reap vanity), Hosea 8:7 (sown the wind, reap the
--                   whirlwind), Hosea 10:12 (sow in righteousness, reap in mercy), Deuteronomy 30:19
--                   (I have set before you life and death... therefore choose life)
--           Extras: none warranted   NT: none warranted (Paul is himself the NT voice here)
--   v.9-10  in due season we shall reap, if we faint not — carried in prose at v.7-8 thread
--   v.11-14 large letter; constrain you to be circumcised; God forbid that I should glory save in
--           the cross — the agitators' flesh-show; carried in prose at v.15 thread (anti-flesh-credential)
--   v.15    neither circumcision nor uncircumcision, but a new creature
--           Tanakh: Ezekiel 36:26 (a new heart... a new spirit) — the new-creature root
--           Extras: none warranted   NT: 1 Corinthians 7:19 (circumcision is nothing... but the
--                   keeping of the commandments of Elohim (God)), 2 Corinthians 5:17 (in Messiah...
--                   a new creature)
--   v.16    the Yashar'el (Israel) of Elohim (God) — the gathered covenant seed, NOT a replacement
--           Tanakh: Psalm 125:5 (peace shall be upon Yashar'el (Israel)), Psalm 128:6 (peace upon
--                   Yashar'el (Israel)) — the benediction Paul echoes
--           Extras: none warranted   NT: none warranted (Galatians 6:16 is itself the NT witness)
--   v.17-18 the marks of the Lord Yahusha; the grace... be with your spirit — none warranted
--           (the true-mark contrast is carried in prose at v.15; no load-bearing external weave)
--
-- THREADS (slug -> target libraries):
--   7325 galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5                    (NT)
--   7328 galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13  (Tanakh + NT)
--   7331 galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8     (Tanakh)
--   7334 galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36 (Tanakh + NT)
--   7337 galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128 (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s223_g06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5
  ('canon', 'galatians', 6, 1, 'canon', 'matthew', 18, 15, 'free', E'*Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* (Matthew 18:15). *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness* (Galatians 6:1). Paul writes nothing new but the way of his Master: the fallen brother is not cast off but sought and gained, the fault answered face to face and *in the spirit of meekness.* The aim of the rebuke is restoration, *that thou mayest gain thy brother.*'),
  ('canon', 'galatians', 6, 1, 'canon', 'james', 5, 19, 'free', E'*Brethren, if any of you do err from the truth, and one convert him* (James 5:19). *Restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1). The brother who has strayed from the truth is not abandoned but turned back; the one who *restores* him does the work of love. The same household charge runs through both letters: to go after the one who has erred and bring him home.'),
  ('canon', 'galatians', 6, 1, 'canon', 'james', 5, 20, 'free', E'*Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* (James 5:20). *Ye which are spiritual, restore such an one in the spirit of meekness* (Galatians 6:1). To restore the one overtaken in a fault is no small thing — it *saves a soul from death.* This is why it must be done gently, *considering thyself, lest thou also be tempted,* for the restorer stands in the same need of mercy as the restored.'),
  -- thread: galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13
  ('canon', 'galatians', 6, 2, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). *The law of Messiah* is no new law set against the old: it is the Torah command *love thy neighbour as thyself* — the very word Paul named at *all the law is fulfilled in one word... Thou shalt love thy neighbour as thyself* (Galatians 5:14). To bear one another''s burdens IS to keep this commandment; to fulfil it is to do it, never to abolish it.'),
  ('canon', 'galatians', 6, 2, 'canon', 'john', 13, 34, 'free', E'*A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* (John 13:34). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). The *law of Messiah* is the Master''s own commandment, *that ye love one another* — new not because it overturns Leviticus 19:18 but because it is now measured by his own love, *as I have loved you.* The Torah command is lifted up and lived out, not laid aside.'),
  ('canon', 'galatians', 6, 2, 'canon', 'romans', 15, 1, 'free', E'*We then that are strong ought to bear the infirmities of the weak, and not to please ourselves.* (Romans 15:1). *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). Paul teaches the same in both letters: the strong carry the weak. The burden-bearing love that fulfils *the law of Messiah* is not a feeling but a doing — to take up the infirmity of another and *not to please ourselves.*'),
  -- thread: galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8
  ('canon', 'galatians', 6, 7, 'canon', 'job', 4, 8, 'free', E'*Even as I have seen, they that plow iniquity, and sow wickedness, reap the same.* (Job 4:8). *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7). The law of the harvest stood before Paul ever wrote it: *they that plow iniquity... reap the same.* Grace opened the door home, but it did not unmake this — the sowing-and-reaping is real because the Way is real, and *Elohim (God) is not mocked.*'),
  ('canon', 'galatians', 6, 7, 'canon', 'proverbs', 22, 8, 'free', E'*He that soweth iniquity shall reap vanity: and the rod of his anger shall fail.* (Proverbs 22:8). *Whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The proverb names the same harvest: *he that soweth iniquity shall reap vanity.* What a man plants in the field of his life he gathers back; the consequence is woven into the order Yahuah (LORD) made, and no man mocks it.'),
  ('canon', 'galatians', 6, 7, 'canon', 'hosea', 8, 7, 'free', E'*For they have sown the wind, and they shall reap the whirlwind: it hath no stalk: the bud shall yield no meal* (Hosea 8:7). *For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). Hosea spoke this judgment over scattered Yashar''el (Israel) — they *sown the wind* and *reap the whirlwind.* Paul presses the same law on the same people now coming home: to sow to the flesh is to *reap corruption,* and grace did not cancel the reaping but opened the way to sow instead *to the Spirit* and reap *life everlasting.*'),
  ('canon', 'galatians', 6, 8, 'canon', 'hosea', 10, 12, 'free', E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you.* (Hosea 10:12). *He that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). The prophet''s call is the door the consequence-system leaves open: *sow to yourselves in righteousness, reap in mercy.* The same hand that warns of the whirlwind calls Yashar''el (Israel) to break up the fallow ground and seek Yahuah (LORD) — to sow to the Spirit and reap the life he rains down.'),
  ('canon', 'galatians', 6, 8, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). *He that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting.* (Galatians 6:8). Moses set the same two harvests before the same people: *life and death, blessing and cursing... therefore choose life.* The sowing-and-reaping of Galatians is the covenant''s ancient either/or — the consequence is real, and the call is the same: choose life, that thou and thy seed may live.'),
  -- thread: galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36
  ('canon', 'galatians', 6, 15, 'canon', '1-corinthians', 7, 19, 'free', E'*Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God).* (1 Corinthians 7:19). *For in HaMashiach Yahusha (Christ Jesus) neither circumcision availeth any thing, nor uncircumcision, but a new creature.* (Galatians 6:15). Paul says the same thing twice, and the Corinthian half supplies the words the Galatian half assumes: the flesh-mark *availeth nothing* — what counts is *the keeping of the commandments of Elohim (God).* The new creature is precisely the one whose new heart keeps the commandments; the agitators'' circumcision-credential is nothing, the Torah is not.'),
  ('canon', 'galatians', 6, 15, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *Neither circumcision availeth any thing, nor uncircumcision, but a new creature.* (Galatians 6:15). The *new creature* is the new heart Yahuah (LORD) promised the scattered house — the stony heart taken away, the heart of flesh given. And the next breath of the promise tells what the new heart is for: *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The new creature is the Torah-keeping heart, not a heart set free from Torah.'),
  ('canon', 'galatians', 6, 15, 'canon', '2-corinthians', 5, 17, 'free', E'*Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new.* (2 Corinthians 5:17). *For in HaMashiach Yahusha (Christ Jesus)... a new creature.* (Galatians 6:15). The same phrase stands in both letters: *a new creature.* Standing before Yahuah (LORD) does not turn on the flesh-mark of circumcision or its absence but on being *in Messiah (Christ)* — remade, the old passed away, all things become new.'),
  -- thread: galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128
  ('canon', 'galatians', 6, 16, 'canon', 'psalms', 125, 5, 'free', E'*As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel).* (Psalm 125:5). *And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God).* (Galatians 6:16). Paul closes with the psalmist''s own benediction: *peace shall be upon Yashar''el (Israel).* He does not invent a new people to bless in Israel''s place — he pronounces the ancient covenant peace over the gathered seed of Yashar''el (Israel), the scattered now walking according to the rule and brought home.'),
  ('canon', 'galatians', 6, 16, 'canon', 'psalms', 128, 6, 'free', E'*Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel).* (Psalm 128:6). *Peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God).* (Galatians 6:16). The Psalms of Ascent end as Paul ends: *peace upon Yashar''el (Israel).* *The Yashar''el (Israel) of Elohim (God)* is not a replacement for that Israel but its fullness — the covenant people of Yahuah (LORD), the gathered children walking in his way, upon whom the old benediction of peace now rests.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s223_g06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s223_g06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5',
       E'Restore such an one in the spirit of meekness — Matthew 18, James 5',
       E'The closing chapter opens with the work of the household: not the casting off of the fallen but the seeking of them. *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted* (Galatians 6:1). This is the Master''s own way. *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15) — the fault answered face to face, the aim the gaining of the brother, not his exposure. And James names the weight of it: *Brethren, if any of you do err from the truth, and one convert him; let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:19-20). To restore the one overtaken is to *save a soul from death* — which is why it must be done *in the spirit of meekness,* the restorer remembering his own frailty, *considering thyself, lest thou also be tempted.* The strong do not stand over the weak but stoop to lift them.',
       sv.verse_id, ev.verse_id, 'free', 7325
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13',
       E'Bear one another''s burdens, and so fulfil the law of Messiah — Leviticus 19, John 13',
       E'Here the inherited reading hears *the law of Messiah* as a new law set against the old, and the hearing is exactly wrong. *Bear ye one another''s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2). What is *the law of Messiah?* Paul has already told us, two breaths earlier: *all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). It is the Torah command itself — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To bear one another''s burdens IS to keep this commandment; to *fulfil* it is to do it, never to do away with it. The Master gave the same word and measured it by his own love: *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another* (John 13:34) — new not because it overturns Leviticus but because the standard is now his own laying-down of himself. And Paul teaches the doing of it plainly in his other letter: *We then that are strong ought to bear the infirmities of the weak, and not to please ourselves* (Romans 15:1). The burden-bearing love that fulfils *the law of Messiah* is the Torah lived out — the commandment carried, not cancelled.',
       sv.verse_id, ev.verse_id, 'free', 7328
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8',
       E'Whatsoever a man soweth, that shall he also reap — Job 4, Proverbs 22, Hosea',
       E'Grace opened the door home; it did not unmake the law of the harvest. *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:7-8). The sowing-and-reaping is no new threat but the oldest order of the Way, and the whole Tanakh stands behind Paul''s word. *Even as I have seen, they that plow iniquity, and sow wickedness, reap the same* (Job 4:8). *He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). Over scattered Yashar''el (Israel) the prophet thundered it: *For they have sown the wind, and they shall reap the whirlwind* (Hosea 8:7). The consequence is real because the Way is real — *Elohim (God) is not mocked.* Yet the same law that warns leaves the door open, for the harvest turns on what is sown: *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). And Moses set the two harvests before the people from the first: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). To sow to the flesh is to reap corruption; to sow to the Spirit is to reap life everlasting — the cross opened the way to sow to the Spirit, but it did not cancel the reaping. *And let us not be weary in well doing: for in due season we shall reap, if we faint not* (Galatians 6:9).',
       sv.verse_id, ev.verse_id, 'free', 7331
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36',
       E'Neither circumcision nor uncircumcision, but a new creature — 1 Corinthians 7, Ezekiel 36',
       E'The agitators *desire to make a fair shew in the flesh* and *constrain you to be circumcised* (Galatians 6:12), glorying in the flesh-mark as the doorway to covenant standing. Paul answers the whole flesh-credential system: *For in HaMashiach Yahusha (Christ Jesus) neither circumcision availeth any thing, nor uncircumcision, but a new creature* (Galatians 6:15). His own letter to Corinth supplies the words this verse assumes, and it is decisive against the Torah-abolished reading: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The flesh-mark counts for nothing — what counts is *the keeping of the commandments of Elohim (God).* The new creature is not the one freed from the commandments but the one given a heart that keeps them, exactly as Yahuah (LORD) promised the scattered house: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26) — and the very next word names its purpose, *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The new heart is the Torah-keeping heart. So standing before Yahuah (LORD) turns not on the flesh but on being remade in Messiah: *Therefore if any man be in Messiah (Christ), he is a new creature: old things are passed away; behold, all things are become new* (2 Corinthians 5:17). Not circumcision, not uncircumcision — a new creature whose new heart walks in his statutes.',
       sv.verse_id, ev.verse_id, 'free', 7334
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128',
       E'The Yashar''el (Israel) of Elohim (God) — the gathered seed, not a replacement people (Psalm 125, 128)',
       E'This is the verse the replacement reading seizes, and the seizing reverses Paul''s own words. *And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16). The inherited reading hears *the Israel of God* as a new people — the church — pronounced in the place of Yashar''el (Israel), the old Israel set aside. But Paul is closing his letter to the scattered seed of Yashar''el (Israel) come home, and he closes it with the Psalms'' own benediction. *As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel)* (Psalm 125:5). *Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel)* (Psalm 128:6). The benediction of the gathered covenant people ends, always, *peace upon Yashar''el (Israel)* — and that is the very blessing Paul pronounces. *The Yashar''el (Israel) of Elohim (God)* is not a people who replace Israel but Israel in its fullness: the covenant people of Yahuah (LORD), the scattered now *walking according to this rule,* the gathered seed upon whom the ancient peace at last rests. He does not bless a new Israel over the grave of the old; he blesses the old Israel restored. And he seals it with his own body: *From henceforth let no man trouble me: for I bear in my body the marks of the Lord Yahusha (Lord Jesus)* (Galatians 6:17) — the true mark of belonging, over against the agitators'' mark in the flesh.',
       sv.verse_id, ev.verse_id, 'free', 7337
  FROM _s223_g06_lookup sv, _s223_g06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='galatians' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:15 — *go and tell him his fault between thee and him alone... thou hast gained thy brother* the Master''s own way of restoration, the fault answered to gain the brother (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:19 — *if any of you do err from the truth, and one convert him* the strayed brother sought and turned back, not abandoned (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:20 — *he which converteth the sinner from the error of his way shall save a soul from death* the weight of restoration, why it is done in meekness (Galatians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-restore-in-the-spirit-of-meekness-matthew-18-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the Torah command that IS *the law of Messiah*; fulfil means do, not abolish (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you* the Master''s command, the Torah love measured by his own love (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:1 — *we then that are strong ought to bear the infirmities of the weak* Paul teaches the same burden-bearing love elsewhere, the law of Messiah in deed (Galatians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-bear-one-anothers-burdens-and-fulfil-the-law-of-messiah-leviticus-19-john-13'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 4:8 — *they that plow iniquity, and sow wickedness, reap the same* the law of the harvest stood before Paul wrote it; grace did not unmake it (Galatians 6:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:8 — *he that soweth iniquity shall reap vanity* the same harvest, woven into the order Yahuah (LORD) made (Galatians 6:7).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 8:7 — *they have sown the wind, and they shall reap the whirlwind* the judgment over scattered Yashar''el (Israel), the consequence Paul presses on them now (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 10:12 — *sow to yourselves in righteousness, reap in mercy... for it is time to seek Yahuah (LORD)* the door the consequence-system leaves open: sow to the Spirit (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life* the two harvests set before the same people from the first (Galatians 6:8).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-whatsoever-a-man-soweth-that-shall-he-reap-job-4-proverbs-22-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 7:19 — *circumcision is nothing... but the keeping of the commandments of Elohim (God)* the words Galatians 6:15 assumes: the new creature keeps the commandments (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you* the new creature is the new heart promised the scattered house, to walk in his statutes (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 5:17 — *if any man be in Messiah (Christ), he is a new creature: old things are passed away* the same phrase; standing turns on being in Messiah, not the flesh-mark (Galatians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-neither-circumcision-nor-uncircumcision-but-a-new-creature-1-corinthians-7-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 125:5 — *but peace shall be upon Yashar''el (Israel)* the psalmist''s benediction Paul echoes; he blesses Israel restored, not a people in its place (Galatians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=125 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 128:6 — *and peace upon Yashar''el (Israel)* the Psalms close as Paul closes; *the Israel of God* is Israel in its fullness, the gathered seed (Galatians 6:16).'
  FROM cross_reference_threads t, cross_references x, _s223_g06_lookup sv, _s223_g06_lookup tv
 WHERE t.slug='galatians-6-the-israel-of-god-the-gathered-seed-not-a-replacement-people-psalm-125-128'
   AND sv.edition_slug='canon' AND sv.book_slug='galatians' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
