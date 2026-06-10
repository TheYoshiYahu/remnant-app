-- ----- fragment: minion_romans_03.sql (S219 Romans 3) -----
-- =====================================================================
-- S219 minion — ROMANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 3.  Tag: r03 (temp view _s219_r03_lookup).  Sort band: 6050, step 3 (<6075).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #2/#4/#5/#6/#7/#10): Paul, a Torah-keeping Yashar'elite, presses
-- the indictment of all flesh — *both Yahudim (Jews) and Gentiles, that they are all under sin*
-- (3:9) — by stringing a chain of his own Tanakh (Psalm 14/53, Psalm 5, Psalm 140, Psalm 10,
-- Isaiah 59, Psalm 36). The advantage of the Yahudi (Jew) is real: *unto them were committed the
-- oracles of Elohim (God)* (3:2) — the dispersed seed still entrusted with the word. "The law"
-- that justifies no flesh (3:20) is the law as a system of self-justification apart from the
-- faithfulness of Messiah — NEVER the law as Yahuah's righteous instruction to be discarded.
-- *Justified freely by his grace* (3:24) is grace as the means of return, never a standalone
-- freedom-from-Torah formula. The righteousness of Elohim is *witnessed by the law and the
-- prophets* (3:21) — rooted in the Tanakh. And the verse that governs the whole book seals it:
-- *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law*
-- (3:31) — faith establishes Torah, it never abolishes it.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   advantage of the Yahudi / oracles committed   Tanakh: Deuteronomy 4:7-8, Psalm 147:19-20  Extras: none warranted  NT: none added (entrusting carried by Tanakh targets)
--   v.5-8   shall their unbelief make Elohim's faith void  Tanakh: Psalm 51:4 (justified in thy sayings, judged)  Extras: none warranted  NT: none warranted (rhetorical objection answered in-chapter)
--   v.9-18  none righteous — the catena                    Tanakh: Psalm 14:1-3 / Psalm 53, Psalm 5:9, Psalm 140:3, Psalm 10:7, Isaiah 59:7-8, Psalm 36:1  Extras: none warranted  NT: none warranted
--   v.19-20 no flesh justified by deeds of the law         Tanakh: Psalm 143:2  Extras: none warranted  NT: Galatians 2:16 (no flesh justified by works of law)
--   v.21-26 righteousness witnessed by law and prophets / justified freely by grace / propitiation  Tanakh: Psalm 51:1, Psalm 32:1-2 weighed→carried at Romans 4 by sibling; Psalm 51 chosen  Extras: none warranted  NT: none added (kept Tanakh + the grace/propitiation read in summary)
--   v.27-30 boasting excluded / one Elohim of both          Tanakh: Deuteronomy 6:4 (one Elohim) weighed; Deuteronomy 9:5 (not for thy righteousness)  Extras: none warranted  NT: none added (two-house one-Elohim read carried in prose)
--   v.31    do we make void the law? we establish the law   Tanakh: none added (the establishing is of the Tanakh law itself)  Extras: none warranted  NT: Romans 6:15, Romans 8:4, Matthew 5:17
--
-- THREADS (slug -> target libraries):
--   6050 romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage          (Tanakh)
--   6053 romans-3-there-is-none-righteous-no-not-one-the-catena                      (Tanakh)
--   6056 romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight            (Tanakh + NT)
--   6059 romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets  (Tanakh)
--   6062 romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both     (Tanakh)
--   6065 romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law            (NT / Romans-Romans + Matthew)
-- =====================================================================

CREATE TEMP VIEW _s219_r03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage
  ('canon', 'romans', 3, 2, 'canon', 'deuteronomy', 4, 8, 'free', E'*And what nation is there so great, that hath statutes and judgments so righteous as all this law, which I set before you this day?* (Deuteronomy 4:8). Paul answers his own question — *What advantage then hath the Yahudi (Jew)?* (Romans 3:1) — with *Much every way: chiefly, because that unto them were committed the oracles of Elohim (God)* (Romans 3:2). The advantage is precisely the thing Moses named: the righteous statutes and judgments of the law, given to no other nation. The word entrusted to Yashar''el (Israel) is the dignity, not a thing outgrown.'),
  ('canon', 'romans', 3, 2, 'canon', 'deuteronomy', 4, 7, 'free', E'*For what nation is there so great, who hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God) is in all things that we call upon him for?* (Deuteronomy 4:7). The oracles *committed* to the Yahudi (Jew) (Romans 3:2) are the nearness Moses celebrated — no nation had Elohim so nigh, because no nation was given his word. The advantage of the Yahudi is the covenant nearness carried in the entrusted oracles.'),
  ('canon', 'romans', 3, 2, 'canon', 'psalms', 147, 19, 'free', E'*He sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel).* (Psalm 147:19). The oracles *committed* to the Yahudi (Jew) (Romans 3:2) are this very gift — the word, the statutes, the judgments shewn to Jacob and to no nation besides (Psalm 147:20). The dispersed seed remains the keeper of the deposit; the entrusting is not revoked by some who *did not believe* (Romans 3:3).'),
  -- thread: romans-3-shall-their-unbelief (woven into the oracles thread via 3:4)
  ('canon', 'romans', 3, 4, 'canon', 'psalms', 51, 4, 'free', E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest.* (Psalm 51:4). *Let Elohim (God) be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings, and mightest overcome when thou art judged* (Romans 3:4). Paul quotes David''s confession word for word: the unbelief of men cannot *make the faith of Elohim (God) without effect* (Romans 3:3) — Elohim stands justified in his sayings, true though every man be a liar.'),
  -- thread: romans-3-there-is-none-righteous-no-not-one-the-catena
  ('canon', 'romans', 3, 10, 'canon', 'psalms', 14, 1, 'free', E'*The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good.* (Psalm 14:1). *As it is written, There is none righteous, no, not one* (Romans 3:10). Paul opens his chain with the psalm''s own verdict: the heart that says *There is no Elohim* leaves none that doeth good. The indictment falls on all flesh, *both Yahudim (Jews) and Gentiles* (Romans 3:9).'),
  ('canon', 'romans', 3, 11, 'canon', 'psalms', 14, 2, 'free', E'*Yahuah (LORD) looked down from heaven upon the children of men, to see if there were any that did understand, and seek Elohim (God).* (Psalm 14:2). *There is none that understandeth, there is none that seeketh after Elohim (God)* (Romans 3:11). Paul presses the psalm''s search: Yahuah looked down to find the understanding heart that seeks him, and the verdict is the one Paul carries — none that understandeth, none that seeketh.'),
  ('canon', 'romans', 3, 12, 'canon', 'psalms', 14, 3, 'free', E'*They are all gone aside, they are all together become filthy: there is none that doeth good, no, not one.* (Psalm 14:3). *They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one* (Romans 3:12). Paul takes the psalm''s words nearly intact — all gone aside, none that doeth good, no, not one. The sweep is total, that *every mouth may be stopped* (Romans 3:19).'),
  ('canon', 'romans', 3, 12, 'canon', 'psalms', 53, 3, 'free', E'*Every one of them is gone back: they are altogether become filthy; there is none that doeth good, no, not one.* (Psalm 53:3). The twin psalm carries the same verdict Paul cites — *there is none that doeth good, no, not one* (Romans 3:12) — and ends, like its companion, longing for *the salvation of Yashar''el (Israel) … out of Zion* (Psalm 53:6). The universal indictment is the ground on which the gathering of the scattered is announced.'),
  ('canon', 'romans', 3, 13, 'canon', 'psalms', 5, 9, 'free', E'*For there is no faithfulness in their mouth; their inward part is very wickedness; their throat is an open sepulchre; they flatter with their tongue.* (Psalm 5:9). *Their throat is an open sepulchre; with their tongues they have used deceit* (Romans 3:13). Paul lifts the psalm''s figure straight off the page — the open sepulchre, the deceiving tongue — to show the corruption that reaches even the mouth.'),
  ('canon', 'romans', 3, 13, 'canon', 'psalms', 140, 3, 'free', E'*They have sharpened their tongues like a serpent; adders'' poison is under their lips. Selah.* (Psalm 140:3). *the poison of asps is under their lips* (Romans 3:13). Paul joins David''s next image to the open sepulchre: the serpent''s venom under the lips. The tongue that flatters and the lips that poison are one witness against all flesh.'),
  ('canon', 'romans', 3, 14, 'canon', 'psalms', 10, 7, 'free', E'*His mouth is full of cursing and deceit and fraud: under his tongue is mischief and vanity.* (Psalm 10:7). *Whose mouth is full of cursing and bitterness* (Romans 3:14). Paul draws the cursing mouth from the psalm of the wicked who says *Elohim (God) hath forgotten* (Psalm 10:11). The bitterness on the lips is the overflow of the heart that will not seek Elohim.'),
  ('canon', 'romans', 3, 15, 'canon', 'isaiah', 59, 7, 'free', E'*Their feet run to evil, and they make haste to shed innocent blood: their thoughts are thoughts of iniquity; wasting and destruction are in their paths.* (Isaiah 59:7). *Their feet are swift to shed blood: Destruction and misery are in their ways* (Romans 3:15-16). Paul moves from the psalms to the prophet, and Isaiah''s words become his — feet that run to blood, destruction in the paths. The same indictment the prophet brought against Yashar''el''s own sins Paul brings against all flesh.'),
  ('canon', 'romans', 3, 17, 'canon', 'isaiah', 59, 8, 'free', E'*The way of peace they know not; and there is no judgment in their goings: they have made them crooked paths: whosoever goeth therein shall not know peace.* (Isaiah 59:8). *And the way of peace have they not known* (Romans 3:17). Paul carries Isaiah''s very phrase. And Isaiah''s chapter ends where Paul''s whole letter is heading: *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob* (Isaiah 59:20) — the indictment is the ground of the redemption, not the last word.'),
  ('canon', 'romans', 3, 18, 'canon', 'psalms', 36, 1, 'free', E'*The transgression of the wicked saith within my heart, that there is no fear of Elohim (God) before his eyes.* (Psalm 36:1). *There is no fear of Elohim (God) before their eyes* (Romans 3:18). Paul seals the catena with the psalm''s diagnosis: the root of the whole descent is the missing fear of Elohim. From the corrupt heart to the poisoned tongue to the bloody feet, it all traces to eyes that hold no fear of him.'),
  -- thread: romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight
  ('canon', 'romans', 3, 20, 'canon', 'psalms', 143, 2, 'free', E'*And enter not into judgment with thy servant: for in thy sight shall no man living be justified.* (Psalm 143:2). *Therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). Paul echoes David''s plea: no man living is justified in Yahuah''s sight by his own performance. The law gives the *knowledge of sin* — it shows the man his guilt; it was never the ladder by which flesh climbs into right standing.'),
  ('canon', 'romans', 3, 20, 'canon', 'galatians', 2, 16, 'free', E'*Knowing that a man is not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ), even we have believed in HaMashiach Yahusha (Christ Jesus), that we might be justified by the faith of Messiah (Christ), and not by the works of the law: for by the works of the law shall no flesh be justified.* (Galatians 2:16). The same word stands here as at *by the deeds of the law there shall no flesh be justified in his sight* (Romans 3:20). The *works of the law* that justify no flesh are the flesh-performance system of self-justification apart from the faithfulness of Messiah — not the righteous instruction of Yahuah, which the same Paul will say faith *establishes* (Romans 3:31).'),
  -- thread: romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets
  ('canon', 'romans', 3, 21, 'canon', 'isaiah', 59, 16, 'free', E'*And he saw that there was no man, and wondered that there was no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him.* (Isaiah 59:16). *But now the righteousness of Elohim (God) without the law is manifested, being witnessed by the law and the prophets* (Romans 3:21). Isaiah saw it: when there was no man, Yahuah''s own arm brought salvation and his own righteousness sustained him. The righteousness manifested apart from law-as-self-justification is the very righteousness the prophet witnessed — Yahuah himself supplying what no flesh could.'),
  ('canon', 'romans', 3, 24, 'canon', 'psalms', 51, 1, 'free', E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions.* (Psalm 51:1). *Being justified freely by his grace through the redemption that is in HaMashiach Yahusha (Christ Jesus)* (Romans 3:24). David already knew the ground of pardon was not his merit but Elohim''s lovingkindness — *blot out my transgressions* by tender mercy. Grace is the means of return to him: the unmerited mercy that brings the guilty home, not a license to walk on.'),
  ('canon', 'romans', 3, 25, 'canon', 'psalms', 51, 17, 'free', E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise.* (Psalm 51:17). Elohim *set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past* (Romans 3:25). The propitiation does not bypass the broken and contrite heart the psalm names — it is the blood that declares Elohim''s righteousness even as he remits, so that he is *just, and the justifier* (Romans 3:26), receiving the contrite without winking at the sin.'),
  -- thread: romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both
  ('canon', 'romans', 3, 27, 'canon', 'deuteronomy', 9, 5, 'free', E'*Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land … that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob.* (Deuteronomy 9:5). *Where is boasting then? It is excluded* (Romans 3:27). The exclusion of boasting is no new doctrine — Moses already told Yashar''el (Israel) the land was not earned by their righteousness but given on the oath to the fathers. The covenant was always grace toward the seed of promise; the flesh never had ground to boast.'),
  ('canon', 'romans', 3, 30, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). *Seeing it is one Elohim (God), which shall justify the circumcision by faith, and uncircumcision through faith* (Romans 3:30). Paul grounds the justifying of both in the Shema''s own confession: there is one Elohim. The circumcision (the house of Yahudah) and the uncircumcision (the scattered seed living among the nations) are justified by the one Elohim through one faithfulness — not two gods, not two gospels, the one covenant Elohim gathering his own.'),
  -- thread: romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law
  ('canon', 'romans', 3, 31, 'canon', 'romans', 6, 15, 'free', E'*What then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid.* (Romans 6:15). The same *Elohim (God) forbid* answers the same false inference: faith does not *make void the law* (Romans 3:31), and grace does not license sin (Romans 6:15). *Not under the law* means not under the law''s condemnation as a justifying system — never freedom to transgress it. The faithful are *made free from sin* to *become servants to Elohim (God)* (Romans 6:22).'),
  ('canon', 'romans', 3, 31, 'canon', 'romans', 8, 4, 'free', E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* (Romans 8:4). This is how faith *establishes the law* (Romans 3:31): the Spirit writes and fulfils the righteousness of the law in the one who walks after the Spirit. What the law could not do through weak flesh, Elohim does by sending his Son and his Spirit — the Torah is not abolished but fulfilled in the walker. Faith and Spirit-led obedience are one work.'),
  ('canon', 'romans', 3, 31, 'canon', 'matthew', 5, 17, 'free', E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* (Matthew 5:17). The Master said it first, and Paul echoes it exactly: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). The gospel does not destroy the law — not one jot or tittle passes (Matthew 5:18). Faith confirms the very instruction the King came to fulfil; to read Paul as voiding Torah is to set him against his own Master and his own word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage',
       E'The oracles of Elohim (God) committed to the Yahudi (Jew) — the advantage',
       E'Paul opens the chapter with the question the whole book must answer: *What advantage then hath the Yahudi (Jew)? or what profit is there of circumcision?* (Romans 3:1). His answer is emphatic: *Much every way: chiefly, because that unto them were committed the oracles of Elohim (God)* (Romans 3:2). The advantage is the deposit of the word — the very thing Moses celebrated: *what nation is there so great, who hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God) is in all things that we call upon him for?* (Deuteronomy 4:7), and *what nation is there so great, that hath statutes and judgments so righteous as all this law?* (Deuteronomy 4:8). The psalmist named the same gift to no nation besides: *he sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* (Psalm 147:19). And the unbelief of some does not annul the trust: *shall their unbelief make the faith of Elohim (God) without effect? Elohim (God) forbid* (Romans 3:3-4) — *let Elohim (God) be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings* (Romans 3:4), David''s own confession: *that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). The entrusted word stands; the dispersed seed remains its keeper.',
       sv.verse_id, ev.verse_id, 'free', 6050
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-there-is-none-righteous-no-not-one-the-catena',
       E'There is none righteous, no, not one — the catena',
       E'Having *before proved both Yahudim (Jews) and Gentiles, that they are all under sin* (Romans 3:9), Paul proves it not by his own authority but by stringing together his own Tanakh — a chain of psalms and the prophet, every link quoted from the scriptures Yashar''el (Israel) already held. *As it is written, There is none righteous, no, not one* (Romans 3:10): the psalm''s verdict, *the fool hath said in his heart, There is no Elohim (God) … there is none that doeth good* (Psalm 14:1). *There is none that understandeth, there is none that seeketh after Elohim (God)* (Romans 3:11) — *Yahuah (LORD) looked down from heaven … to see if there were any that did understand, and seek Elohim (God)* (Psalm 14:2). *They are all gone out of the way … there is none that doeth good, no, not one* (Romans 3:12) — *they are all gone aside … there is none that doeth good, no, not one* (Psalm 14:3), the twin of *every one of them is gone back* (Psalm 53:3). Then the mouth: *their throat is an open sepulchre; with their tongues they have used deceit* (Romans 3:13) — *their throat is an open sepulchre; they flatter with their tongue* (Psalm 5:9) — *the poison of asps is under their lips* — *adders'' poison is under their lips* (Psalm 140:3). *Whose mouth is full of cursing and bitterness* (Romans 3:14) — *his mouth is full of cursing and deceit and fraud* (Psalm 10:7). Then the feet and the way: *their feet are swift to shed blood* (Romans 3:15) — *their feet run to evil, and they make haste to shed innocent blood* (Isaiah 59:7); *the way of peace have they not known* (Romans 3:17) — *the way of peace they know not* (Isaiah 59:8). And the root of it all: *there is no fear of Elohim (God) before their eyes* (Romans 3:18) — *there is no fear of Elohim (God) before his eyes* (Psalm 36:1). The indictment is total and it is the Tanakh''s own — and the psalms and the prophet that carry it each end looking toward home: *oh that the salvation of Yashar''el (Israel) were come out of Zion!* (Psalm 53:6); *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob* (Isaiah 59:20). The charge of all flesh is the ground on which the gathering is announced.',
       sv.verse_id, ev.verse_id, 'free', 6053
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight',
       E'By the deeds of the law no flesh justified in his sight',
       E'*Now we know that what things soever the law saith, it saith to them who are under the law: that every mouth may be stopped, and all the world may become guilty before Elohim (God)* (Romans 3:19). The catena has done its work — every mouth stopped — and Paul draws the conclusion: *therefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin* (Romans 3:20). This is David''s own plea: *enter not into judgment with thy servant: for in thy sight shall no man living be justified* (Psalm 143:2). No man stands acquitted before Yahuah on the strength of his own performance — the law''s work here is to *give the knowledge of sin,* to show the man his guilt, never to be the ladder flesh climbs into right standing. Paul says the same word to the Galatians: *a man is not justified by the works of the law … for by the works of the law shall no flesh be justified* (Galatians 2:16). The *works of the law* that justify no flesh are the flesh-performance system of self-justification apart from the faithfulness of Messiah (Christ) — not the righteous instruction of Yahuah, which the same Paul will say faith *establishes* (Romans 3:31). The deeds-of-the-law that cannot justify and the law that faith establishes are not the same thing read two ways; they are self-justification rejected and the covenant instruction upheld.',
       sv.verse_id, ev.verse_id, 'free', 6056
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets',
       E'The righteousness of Elohim (God) witnessed by the law and the prophets',
       E'*But now the righteousness of Elohim (God) without the law is manifested, being witnessed by the law and the prophets* (Romans 3:21). The righteousness that justifies is *without the law* — apart from the system of flesh-performance — yet it is *witnessed by the law and the prophets:* it is no new thing, but the very righteousness the Tanakh foretold. Isaiah saw it: when *there was no man, and … no intercessor: therefore his arm brought salvation unto him; and his righteousness, it sustained him* (Isaiah 59:16) — Yahuah himself supplying what no flesh could. And so *all have sinned, and come short of the glory of Elohim (God); being justified freely by his grace through the redemption that is in HaMashiach Yahusha (Christ Jesus)* (Romans 3:23-24). The grace is not a standalone freedom-from-Torah formula — it is the means of return, the unmerited mercy that brings the guilty home, which David already knew: *have mercy upon me, O Elohim (God), according to thy lovingkindness … blot out my transgressions* (Psalm 51:1). Elohim *set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past* (Romans 3:25) — and the propitiation does not bypass the contrite heart the psalm names: *the sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart … thou wilt not despise* (Psalm 51:17). The blood declares Elohim''s righteousness even as he remits, so that he is *just, and the justifier of him which believeth in Yahusha (Jesus)* (Romans 3:26) — receiving the contrite without ever winking at the sin.',
       sv.verse_id, ev.verse_id, 'free', 6059
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both',
       E'Not for thy righteousness — boasting excluded, one Elohim (God) of both',
       E'*Where is boasting then? It is excluded. By what law? of works? Nay: but by the law of faith* (Romans 3:27). The exclusion of boasting is no novelty Paul invents — Moses had already told Yashar''el (Israel) the inheritance was never earned: *not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land … that he may perform the word which Yahuah (LORD) sware unto thy fathers, Abraham, Isaac, and Jacob* (Deuteronomy 9:5). The covenant was always grace toward the seed of promise; the flesh never had ground to boast. *Therefore we conclude that a man is justified by faith without the deeds of the law* (Romans 3:28) — justified by the faithfulness that lays hold of the promise, not by a performance-credential. And the one Elohim justifies both houses: *is he the Elohim (God) of the Yahudim (Jews) only? is he not also of the Gentiles?* (Romans 3:29) — *seeing it is one Elohim (God), which shall justify the circumcision by faith, and uncircumcision through faith* (Romans 3:30). This is the Shema''s own confession: *Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The circumcision is the house of Yahudah (Judah); the uncircumcision is the scattered seed living among the nations, the dispersed of the ten tribes. One covenant Elohim justifies them by one faithfulness — not two gods, not two gospels, but the one Elohim gathering his own from both houses.',
       sv.verse_id, ev.verse_id, 'free', 6062
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law',
       E'Do we make void the law? Elohim (God) forbid — we establish the law',
       E'This single verse governs the entire epistle: *Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). Paul anticipates the lie that has been read into him for seventeen centuries — that faith abolishes the Torah — and he slams the door on it with the same *Elohim (God) forbid* he uses against every false inference in the letter. Faith does not void the law; faith *establishes* it. The Master said it first and Paul echoes him exactly: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17) — *one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18). To read Paul as voiding Torah is to set him against his own Master and his own word. And Paul walks the same ground again: when the inference returns — *shall we sin, because we are not under the law, but under grace?* — the answer is the same, *Elohim (God) forbid* (Romans 6:15); *not under the law* means not under its condemnation as a justifying system, never freedom to transgress, for the faithful are *made free from sin* to *become servants to Elohim (God)* (Romans 6:22). And he shows how faith establishes the law: *that the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). The Spirit writes and fulfils the very Torah in the walker — what the law could not do through weak flesh, Elohim does by his Son and his Spirit. Faith establishes the law; grace is the means of return to it; the Spirit fulfils it. The book never abolishes the commandments — it brings the faithful home to walk in them.',
       sv.verse_id, ev.verse_id, 'free', 6065
  FROM _s219_r03_lookup sv, _s219_r03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:8 — *what nation … hath statutes and judgments so righteous as all this law?* the advantage of the Yahudi (Jew): the righteous law given to no other nation (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:7 — *what nation … hath Elohim (God) so nigh unto them, as Yahuah Eloheinu (the LORD our God)* the covenant nearness carried in the entrusted oracles (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 147:19 — *he sheweth his word unto Jacob, his statutes and his judgments unto Yashar''el (Israel)* the oracles committed: the word shewn to Jacob and no nation besides (Romans 3:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 51:4 — *that thou mightest be justified when thou speakest, and be clear when thou judgest* quoted at Romans 3:4: Elohim true though every man a liar; unbelief cannot void his faith (Romans 3:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-oracles-of-elohim-committed-to-the-jew-the-advantage'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-there-is-none-righteous-no-not-one-the-catena
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 14:1 — *the fool hath said in his heart, There is no Elohim (God) … there is none that doeth good* the catena''s opening verdict (Romans 3:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 14:2 — *Yahuah (LORD) looked down … to see if there were any that did understand, and seek Elohim (God)* none that understandeth, none that seeketh (Romans 3:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 14:3 — *they are all gone aside … there is none that doeth good, no, not one* taken nearly intact: the total sweep (Romans 3:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 53:3 — *every one of them is gone back … there is none that doeth good, no, not one* the twin psalm, ending toward salvation out of Zion (Romans 3:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 5:9 — *their throat is an open sepulchre; they flatter with their tongue* the open sepulchre and deceiving tongue (Romans 3:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 140:3 — *adders'' poison is under their lips* the serpent''s venom joined to the open sepulchre (Romans 3:13).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=140 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Psalm 10:7 — *his mouth is full of cursing and deceit and fraud* the cursing mouth of the wicked who says Elohim hath forgotten (Romans 3:14).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Isaiah 59:7 — *their feet run to evil, and they make haste to shed innocent blood … destruction are in their paths* feet swift to blood, destruction in the ways (Romans 3:15-16).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Isaiah 59:8 — *the way of peace they know not* the prophet''s phrase carried; his chapter ends with the Redeemer come to Zion (Romans 3:17).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Psalm 36:1 — *there is no fear of Elohim (God) before his eyes* the root of the whole descent, sealing the catena (Romans 3:18).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-there-is-none-righteous-no-not-one-the-catena'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 143:2 — *in thy sight shall no man living be justified* David''s plea: no flesh acquitted by its own performance (Romans 3:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=143 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 2:16 — *by the works of the law shall no flesh be justified* the same word: works-of-law is self-justification, not Torah, which faith establishes (Romans 3:20).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-by-the-deeds-of-the-law-no-flesh-justified-in-his-sight'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:16 — *his arm brought salvation unto him; and his righteousness, it sustained him* the righteousness the prophet witnessed: Yahuah supplying what no flesh could (Romans 3:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 51:1 — *have mercy upon me … according to thy lovingkindness … blot out my transgressions* grace as the means of return: pardon grounded in mercy, not merit (Romans 3:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:17 — *a broken and a contrite heart … thou wilt not despise* the propitiation does not bypass the contrite heart; just and justifier together (Romans 3:25).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-the-righteousness-of-elohim-witnessed-by-the-law-and-the-prophets'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 9:5 — *not for thy righteousness … but … that he may perform the word which Yahuah (LORD) sware unto thy fathers* boasting excluded: the inheritance was always grace, not merit (Romans 3:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:4 — *Yahuah Eloheinu (the LORD our God) is one Yahuah (LORD)* the Shema: one Elohim justifies circumcision and uncircumcision, both houses, by one faithfulness (Romans 3:30).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-not-for-thy-righteousness-boasting-excluded-one-elohim-of-both'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *I am not come to destroy, but to fulfil* the Master said it first; Paul echoes him: faith does not void the law (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 6:15 — *shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* the same false inference, the same answer; not-under-law is not freedom to transgress (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:4 — *that the righteousness of the law might be fulfilled in us, who walk … after the Spirit* how faith establishes the law: the Spirit fulfils the Torah in the walker (Romans 3:31).'
  FROM cross_reference_threads t, cross_references x, _s219_r03_lookup sv, _s219_r03_lookup tv
 WHERE t.slug='romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
