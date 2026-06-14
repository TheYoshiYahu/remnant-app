-- ----- fragment: minion_ephesians_02.sql (S230 Ephesians 2) -----
-- =====================================================================
-- S230 minion — EPHESIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 2 (22 verses) — THE LOAD-BEARING CHAPTER of the letter
--   (the two made one / the middle wall of partition broken down / grace through faith
--   unto the good works ordained / the household and holy temple of Elohim).
-- Tag: ep02 (temp view _s230_ep02_lookup).
-- Sort band: floor 7425, step 3 (7425, 7428, 7431 used; under 7450).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (GUARDED — this is the most abuse-prone chapter in the letter):
--   * 2:8-10 grace through faith is ONE movement with 2:10: saved by grace UNTO the good works
--     Elohim ordained that we should walk in them. Grace is the means of the dead being quickened
--     and brought home (the regathering, Ezekiel 37 dry bones; the Spirit put within to walk in the
--     statutes, Ezekiel 36:26-27). The excluded *works* are the flesh-credential boast (the
--     *Circumcision in the flesh made by hands,* 2:11), NOT the obedience written on the heart.
--     NEVER render this as "the Torah is abolished / works don't matter."
--   * 2:14-15 the *middle wall of partition* and *the law of commandments contained in ordinances*
--     abolished = the DIVIDING BARRIER / the enmity / the hedge that fenced the nations OUT — NOT the
--     moral Torah, NOT the Sabbath/feasts/commandments. The *both/twain* made *one new man* are the
--     TWO HOUSES — Yahudah (Judah) and scattered Yashar'el (Israel)/the nations among whom Israel was
--     sown — reconciled into one body per Ezekiel 37's two sticks made one nation; the *aliens from
--     the commonwealth of Yashar'el (Israel)* brought INTO it (grafted, Romans 11), NOT the Church
--     replacing Israel. NEVER render 2:15 as "the Torah is abolished."
--   * 2:21-22 the *holy temple in Yahuah (Lord)* / *habitation of Elohim (God)* = the Leviticus 26 /
--     Ezekiel 37:27 indwelling promise consummated — the gathered, not a substitute people.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   quickened, who were dead in trespasses and sins; the prince of the power of the air
--           Tanakh: Ezekiel 37:1-14 (the dry bones raised — the whole house of Yashar'el)
--           Extras: none warranted as own member (the air-powers belong to ch6's war thread)
--           NT: Colossians 2:13 (you, being dead in your sins... hath he quickened together with him)
--   v.4-5   Elohim rich in mercy, for his great love... quickened us together with Messiah (by grace)
--           Tanakh: carried in the Ezekiel 37/36 roots   Extras: Wisdom of Solomon 11:23 (you have
--                   mercy upon all... you lovest all the things that are)   NT: Colossians 2:13
--   v.6-7   raised us up together, ages to come, exceeding riches of his grace
--           Tanakh: none warranted (carried in the resurrection/Spirit roots)
--           Extras: none warranted   NT: none warranted (carried in prose)
--   v.8-10  by grace through faith, the gift of Elohim, not of works, UNTO good works ordained
--           Tanakh: Ezekiel 36:26-27 (a new heart... my spirit within you, cause you to walk in my
--                   statutes); Ezekiel 37 the raising   Extras: Wisdom 11:23 (mercy upon all)
--           NT: Colossians 2:13 (quickened together... forgiven all trespasses)
--   v.11-13 Gentiles in the flesh / Circumcision made by hands; aliens from the commonwealth; far off
--           made nigh by the blood of Messiah
--           Tanakh: Isaiah 57:19 (peace to him that is far off, and to him that is near)
--           Extras: Baruch 4:36-37 (your sons come... gathered together from the east to the west)
--           NT: Colossians 2:11 (circumcised with the circumcision made without hands); Romans 11:17
--                   (a wild olive tree, wert graffed in)
--   v.14-18 he is our peace, made both one, broke the middle wall, abolished the enmity/ordinances,
--           of twain one new man, reconciled both in one body, preached peace to far and near
--           Tanakh: Ezekiel 37:16-22 (two sticks made one nation, one king, no more two kingdoms);
--                   Isaiah 57:19 (peace, peace to far and near)
--           Extras: Baruch 4:36-37 (sons gathered east to west by the word of the Holy One)
--           NT: Romans 11:17 (graffed in among them, partakest of the root); Colossians 2:14
--                   (blotting out the handwriting of ordinances that was against us)
--   v.19-22 no more strangers but fellowcitizens, the household, built on the foundation, the chief
--           corner stone, an holy temple, an habitation of Elohim
--           Tanakh: Isaiah 28:16 (a tried stone, a precious corner stone); Psalm 118:22 (the stone
--                   the builders refused... the head stone of the corner); Leviticus 26:11-12 (I will
--                   set my tabernacle among you... walk among you); Ezekiel 37:27 (my tabernacle also
--                   shall be with them)
--           Extras: none warranted   NT: none warranted (the temple roots are the Tanakh weight)
--
-- THREADS (slug -> target libraries):
--   7425 ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36  (Tanakh + Extras + NT)  [BLESSING]
--   7428 ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37            (Tanakh + Extras + NT)  [BLESSING]
--   7431 ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s230_ep02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36
  ('canon', 'ephesians', 2, 1, 'canon', 'ezekiel', 37, 5, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live:* (Ezekiel 37:5). Paul says the assembly were once *dead in trespasses and sins* (Ephesians 2:1) — and the figure for that death is Ezekiel''s valley of dry bones, *the whole house of Yashar''el (Israel)* who said *Our bones are dried, and our hope is lost* (Ezekiel 37:11). The breath that enters the slain and makes them stand *an exceeding great army* is the same quickening Paul names: grace is the means of the dead being raised and brought home. The new-covenant return of the dead house of Yashar''el (Israel) is what *by grace ye are saved* (Ephesians 2:5) re-speaks.'),
  ('canon', 'ephesians', 2, 5, 'canon', 'ezekiel', 37, 14, 'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). Ezekiel''s promise is resurrection and homecoming together — the Spirit put within, and the placing back in the land. Paul gathers that same word into one breath: *Even when we were dead in sins, hath quickened us together with Messiah (Christ), (by grace ye are saved;)* (Ephesians 2:5). To be quickened by grace is to be the dry-bone house raised and regathered; grace does the very thing Yahuah (LORD) said he would do for the scattered house of Yashar''el (Israel).'),
  ('canon', 'ephesians', 2, 10, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). Here is the completion of the sentence Paul will not sever: grace does not end the obedience, it creates it. *For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:10). The *good works... ordained that we should walk in them* are the very statutes Ezekiel said the Spirit would *cause you to walk in* — not a new law and not no law, but the Torah written on the heart of flesh, the renewed obedience the prophets promised. Saved by grace, *unto* the walking Yahuah (LORD) prepared beforehand.'),
  ('canon', 'ephesians', 2, 10, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). The *workmanship, created in HaMashiach Yahusha (Christ Jesus)* (Ephesians 2:10) is the heart of stone made a heart of flesh — Elohim''s own making, *not of yourselves: it is the gift of Elohim (God)* (Ephesians 2:8). The new creation Paul names is the new heart Ezekiel promised; the gift and the obedience are one work of Yahuah (LORD), the dead raised and remade to walk in his ways.'),
  ('canon', 'ephesians', 2, 4, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'*But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* (Wisdom of Solomon 11:23). The Hebrew library confesses the same mercy Paul exalts: *But Elohim (God), who is rich in mercy, for his great love wherewith he loved us, Even when we were dead in sins, hath quickened us together with Messiah (Christ)* (Ephesians 2:4-5). The mercy that *winkest at the sins of men, because they should amend* — and the love that *abhorrest nothing which you have made* (Wisdom 11:24) — is the very mercy *rich* enough to raise the dead and turn them toward the ordained works; mercy aims at amendment, not at lawlessness.'),
  ('canon', 'ephesians', 2, 5, 'canon', 'colossians', 2, 13, 'free', E'*And you, being dead in your sins and the uncircumcision of your flesh, hath he quickened together with him, having forgiven you all trespasses;* (Colossians 2:13). The twin letter says it in the same words: dead in sins, *quickened together with him,* trespasses forgiven. Paul writes to Ephesus, *Even when we were dead in sins, hath quickened us together with Messiah (Christ), (by grace ye are saved;)* (Ephesians 2:5). The raising of the dead by grace in Colosse and in Ephesus is one act — the same death, the same quickening, the same Messiah (Christ) in whom the dead are made alive.'),
  -- thread: ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37
  ('canon', 'ephesians', 2, 14, 'canon', 'ezekiel', 37, 17, 'free', E'*And join them one to another into one stick; and they shall become one in thine hand.* (Ezekiel 37:17). Ezekiel takes two sticks — one for Yahudah (Judah), one for Joseph the stick of Ephraim and all the house of Yashar''el (Israel) his companions — and joins them into one. This is the *both* Paul says Messiah (Christ) *hath made... one,* having *broken down the middle wall of partition between us* (Ephesians 2:14). The two made one are the two houses of Yashar''el (Israel) — Yahudah (Judah) and scattered Ephraim sown among the nations — joined in the Messiah''s hand; not a Church replacing Israel, but the divided kingdom regathered into one.'),
  ('canon', 'ephesians', 2, 15, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). *One nation... one king... no more two kingdoms* — this is what Paul means by *to make in himself of twain one new man, so making peace* (Ephesians 2:15). The thing *abolished* is not the Instruction of Yahuah (LORD) but the division: the *enmity,* the *middle wall,* the ordinances that fenced the two houses apart and fenced the nations out. The *one new man* is the one nation Ezekiel saw, no longer two kingdoms, made one in the Messiah.'),
  ('canon', 'ephesians', 2, 13, 'canon', 'isaiah', 57, 19, 'free', E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him.* (Isaiah 57:19). Yahuah (LORD) speaks peace to two — *to him that is far off, and to him that is near.* Paul takes the very pair: *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13), and *came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The far-off scattered house and the near house of Yahudah (Judah) are the two Yahuah (LORD) heals and makes peace between; the blood of Messiah (Christ) is the healing Isaiah promised.'),
  ('canon', 'ephesians', 2, 17, 'canon', 'hosea', 1, 10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). The scattered, divorced house — once *Lo-ammi, not my people* — is named again *the sons of the living Elohim (God),* and *the children of Yahudah (Judah) and the children of Yashar''el (Israel) [shall] be gathered together, and appoint themselves one head* (Hosea 1:11). This is the far-off made nigh and the two made one: those who were *aliens from the commonwealth of Yashar''el (Israel)* (Ephesians 2:12) are made *fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19) — the not-my-people gathered home under one head.'),
  ('canon', 'ephesians', 2, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37, 'extras', E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* (Baruch 4:37). The restored library beholds the scattered sons *gathered together from the east to the west by the word of the Holy One* — the very regathering Paul declares accomplished in the Messiah: *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13). The sons sent away into the nations are brought home; the far-off made nigh is the homecoming Baruch saw, the gathering of the dispersed into one rejoicing people.'),
  ('canon', 'ephesians', 2, 13, 'canon', 'romans', 11, 17, 'free', E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree;* (Romans 11:17). Paul''s own picture of how the far-off are made nigh: the nations are *graffed in among* the natural branches, partaking of the one root — not a new tree, but the same olive tree of Yashar''el (Israel). So the *aliens from the commonwealth of Yashar''el (Israel)* (Ephesians 2:12) are *made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) and brought INTO the commonwealth, grafted, never a replacement of it. *Boast not against the branches* (Romans 11:18) is the same warning as *not of works, lest any man should boast* (Ephesians 2:9).'),
  ('canon', 'ephesians', 2, 15, 'canon', 'colossians', 2, 14, 'free', E'*Blotting out the handwriting of ordinances that was against us, which was contrary to us, and took it out of the way, nailing it to his cross;* (Colossians 2:14). The twin letter names what was abolished: *the handwriting of ordinances that was against us* — the certificate of debt, the indictment, the decrees of separation that stood as enmity — *nailed to his cross.* Paul tells Ephesus the same: Messiah (Christ) *abolished in his flesh the enmity, even the law of commandments contained in ordinances* (Ephesians 2:15). What is taken out of the way is the barrier of hostility that fenced the nations out, *blotted out* and nailed up — not the Instruction written on the heart, but the wall of partition that kept the two apart.'),
  -- thread: ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26
  ('canon', 'ephesians', 2, 20, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Yahuah (LORD) lays in Zion *a tried stone, a precious corner stone, a sure foundation.* Paul builds upon it: the household is *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20). The corner stone Isaiah promised for Zion is the Messiah; the house of the gathered rests on the very stone Yahuah (LORD) laid, *he that believeth shall not make haste.*'),
  ('canon', 'ephesians', 2, 20, 'canon', 'psalms', 118, 22, 'free', E'*The stone which the builders refused is become the head stone of the corner.* (Psalm 118:22). The rejected stone *become the head stone of the corner* is the Messiah, refused by the builders and made the corner of the whole house. So Paul names *Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), *in whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21). The stone the builders set at nought is the very corner that binds the two houses into one building.'),
  ('canon', 'ephesians', 2, 21, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). The covenant promise of the indwelling: *I will set my tabernacle among you... And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12). Paul says it is now fulfilled in the gathered: they grow *unto an holy temple in Yahuah (Lord): In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:21-22). The tabernacle Yahuah (LORD) promised to set among his people is the holy temple the two-made-one have become; not a substitute people, but the dwelling-place of Elohim (God) at last among them.'),
  ('canon', 'ephesians', 2, 22, 'canon', 'ezekiel', 37, 27, 'free', E'*My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people.* (Ezekiel 37:27). The same Ezekiel 37 that made the two sticks one closes on the indwelling: *My tabernacle also shall be with them.* This is the *habitation of Elohim (God) through the Spirit* (Ephesians 2:22) that the gathered are built into. The two houses made one nation become the one temple where Yahuah (LORD) sets his sanctuary in the midst of them for evermore — the household of Elohim (God), his dwelling, the consummation of *I will be their Elohim (God), and they shall be my people.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36',
       E'By grace through faith, unto the good works ordained that we should walk in them (Ezekiel 37, 36)',
       E'Read the sentence whole, for it does not stop where men love to stop it. *For by grace are ye saved through faith; and that not of yourselves: it is the gift of Elohim (God): Not of works, lest any man should boast. For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them* (Ephesians 2:8-10). Grace and the works are not enemies; grace is the means, and the ordained walking is the end. The works excluded from boasting are the flesh-credential — *the Circumcision in the flesh made by hands* (Ephesians 2:11), the self-made claim — not the obedience the prophets promised would be written on the heart. And what is grace the means of? Of the dead being raised and brought home. Paul says the assembly were *dead in trespasses and sins* (Ephesians 2:1), then *Even when we were dead in sins, hath quickened us together with Messiah (Christ), (by grace ye are saved;)* (Ephesians 2:5) — and the figure for that death-and-raising is Ezekiel''s valley: *the whole house of Yashar''el (Israel)* who said *Our bones are dried, and our hope is lost,* into whom Yahuah (LORD) says *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5,11), and *shall put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14). To be quickened by grace is to be the dry-bone house raised and regathered. The end of that raising is the new heart that walks: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26), *and I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The *good works... before ordained that we should walk in them* ARE the statutes the Spirit was promised to cause us to walk in — the Torah written on the heart, not abolished and not replaced. The Hebrew library confessed the mercy that does this: *But you have mercy upon all... because they should amend* (Wisdom of Solomon 11:23) — mercy that aims at amendment, the very *Elohim (God), who is rich in mercy, for his great love wherewith he loved us* (Ephesians 2:4). And the twin letter says it in the same words: *And you, being dead in your sins and the uncircumcision of your flesh, hath he quickened together with him, having forgiven you all trespasses* (Colossians 2:13). Saved by grace, the dead made alive, remade in heart — unto the walking Yahuah (LORD) prepared beforehand.',
       sv.verse_id, ev.verse_id, 'extras', 7425
  FROM _s230_ep02_lookup sv, _s230_ep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37',
       E'The middle wall broken down, of twain one new man — the two houses made one (Ezekiel 37, Isaiah 57)',
       E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us; Having abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make in himself of twain one new man, so making peace* (Ephesians 2:14-15). Guard this verse, for it is bent into a hammer against the Torah, and it is no such thing. The *both,* the *twain* made *one new man,* are the two houses of Yashar''el (Israel) — Yahudah (Judah) and scattered Ephraim sown among the nations. Ezekiel saw it as two sticks: one for Yahudah (Judah), one for *Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions,* and Yahuah (LORD) said, *join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:16-17), *and I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). That is *of twain one new man.* So the thing *abolished* is not the Instruction of Yahuah (LORD), not the Sabbath, not the feasts, not the commandments written on the heart — it is the *enmity,* the *middle wall of partition,* the ordinances of separation that fenced the two apart and fenced the nations out. The twin letter names it exactly: *Blotting out the handwriting of ordinances that was against us, which was contrary to us... nailing it to his cross* (Colossians 2:14) — the indictment, the certificate of debt, the decrees of hostility, taken out of the way. What is left standing is peace. And peace is spoken to two: *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19) — exactly Paul''s *ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians 2:13) and *came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The far-off scattered house and the near house of Yahudah (Judah) are healed and joined. Hosea saw the same homecoming: the divorced *not my people* named again *the sons of the living Elohim (God),* when *the children of Yahudah (Judah) and the children of Yashar''el (Israel) [shall] be gathered together, and appoint themselves one head* (Hosea 1:10-11). The restored library beheld it too: *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One* (Baruch 4:37). And lest any think this a new people swallowing the old, Paul''s own olive tree settles it: the nations are *graffed in among them, and with them partakest of the root and fatness of the olive tree* (Romans 11:17) — the same tree, the same root, the *aliens from the commonwealth of Yashar''el (Israel)* (Ephesians 2:12) brought INTO the commonwealth and *made nigh,* never a replacement of it. The middle wall is the hostility; the two made one are the two houses regathered; the result is *one body by the cross* (Ephesians 2:16), the divided kingdom of Yashar''el (Israel) made one in the Messiah, who is himself our peace.',
       sv.verse_id, ev.verse_id, 'extras', 7428
  FROM _s230_ep02_lookup sv, _s230_ep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26',
       E'The household of Elohim, the holy temple, and the chief corner stone (Leviticus 26, Ezekiel 37, Isaiah 28)',
       E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God); And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone; In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord): In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:19-22). The two made one are now a building, and every stone of it is from the Tanakh. The corner stone is the stone Yahuah (LORD) promised for Zion: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16) — and the stone the builders set at nought: *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The Messiah refused and made the corner binds the whole house. And the house itself is the dwelling Yahuah (LORD) covenanted to make among his people: *And I will set my tabernacle among you: and my soul shall not abhor you. And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12). The same Ezekiel 37 that joined the two sticks ends on this indwelling: *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* (Ezekiel 37:27). So the *holy temple in Yahuah (Lord)* and *habitation of Elohim (God) through the Spirit* is the consummation of the oldest promise — the tabernacle set among the people, the sanctuary in the midst of them for evermore. Not a substitute people, but the gathered two-made-one become at last the dwelling-place of Elohim (God); the strangers made fellowcitizens, the scattered made the temple where Yahuah (LORD) walks among his people.',
       sv.verse_id, ev.verse_id, 'free', 7431
  FROM _s230_ep02_lookup sv, _s230_ep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=2 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:5 — *Behold, I will cause breath to enter into you, and ye shall live* the dry-bone house raised; the figure for those *dead in trespasses and sins* (Ephesians 2:1) quickened by grace.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:14 — *And shall put my spirit in you, and ye shall live, and I shall place you in your own land* resurrection and homecoming together; the quickening *by grace* (Ephesians 2:5) is the dry-bone house raised and regathered.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you... I will give you an heart of flesh* the new creation of *his workmanship, created in HaMashiach Yahusha (Christ Jesus)* (Ephesians 2:10), the gift not of ourselves.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *and cause you to walk in my statutes, and ye shall keep my judgments, and do them* the very *good works... before ordained that we should walk in them* (Ephesians 2:10); grace creates the obedience, it does not abolish it.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 11:23 — *But you have mercy upon all... because they should amend* the mercy that aims at amendment; *Elohim (God), who is rich in mercy, for his great love* (Ephesians 2:4) raising the dead toward the ordained works.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Colossians 2:13 — *being dead in your sins... hath he quickened together with him, having forgiven you all trespasses* the twin letter''s same words for the dead raised by grace (Ephesians 2:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-by-grace-through-faith-unto-the-good-works-ordained-ezekiel-37-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:17 — *join them one to another into one stick; and they shall become one in thine hand* the two sticks of Yahudah (Judah) and Ephraim made one; the *both* Messiah *hath made... one* (Ephesians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:22 — *one nation... one king... no more two kingdoms* this is *of twain one new man, so making peace* (Ephesians 2:15); the division abolished, not the Instruction.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 57:19 — *Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* the two healed and joined; *far off... made nigh by the blood of Messiah* (Ephesians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 1:10 — *Ye are the sons of the living Elohim (God)* the divorced *not my people* named again and gathered under one head (Hosea 1:11); the aliens made *fellowcitizens* (Ephesians 2:17,19).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 4:37 — *your sons come... gathered together from the east to the west by the word of the Holy One* the scattered brought home; the *far off... made nigh* (Ephesians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:17 — *a wild olive tree, wert graffed in among them... partakest of the root* the nations brought INTO the one tree of Yashar''el (Israel), grafted not replacing; the aliens made nigh (Ephesians 2:12-13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Colossians 2:14 — *Blotting out the handwriting of ordinances that was against us... nailing it to his cross* the indictment of separation taken away; the *enmity, even the law of commandments contained in ordinances* abolished (Ephesians 2:15), not the Torah on the heart.'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-middle-wall-broken-down-the-two-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone* the corner stone Yahuah (LORD) laid in Zion; *Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 118:22 — *The stone which the builders refused is become the head stone of the corner* the rejected stone made the corner; the chief corner stone of the household (Ephesians 2:20).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:11 — *I will set my tabernacle among you... And I will walk among you, and will be your Elohim (God)* the covenant indwelling; grown *unto an holy temple in Yahuah (Lord)* (Ephesians 2:21).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:27 — *My tabernacle also shall be with them: yea, I will be their Elohim (God), and they shall be my people* the same Ezekiel 37 indwelling; the *habitation of Elohim (God) through the Spirit* (Ephesians 2:22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep02_lookup sv, _s230_ep02_lookup tv
 WHERE t.slug='ephesians-2-the-household-of-elohim-the-holy-temple-and-the-corner-stone-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=2 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
