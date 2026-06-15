-- ----- fragment: minion_1peter_04.sql (S240 1 Peter 4) -----
-- =====================================================================
-- S240 minion — 1 PETER (Kepha Aleph) CHAPTER 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 PETER 4 (19 verses).
-- Tag: p240c4 (temp view _s240_p240c4_lookup).
-- Sort band: floor 9690, step 3 (9690, 9693, 9696, 9699, 9702, 9705, 9708 used; under 9720).
-- Source is ALWAYS the canon 1 Peter verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 Peter = the letter to the SCATTERED ELECT, the dispersed two-house remnant;
-- holiness in suffering; the Torah in force and honored; NO replacement theology, NO law-vs-grace
-- antithesis). Chapter 4 carries: the gospel preached also to them that are dead (4:6) — which
-- CONTINUES the ch3 proclamation to the spirits in prison, the imprisoned WATCHERS of the days of
-- Noah (Genesis 6 / 1 Enoch 10); ★ charity shall cover the multitude of sins (4:8 = Proverbs 10:12,
-- the James 5:20 twin); the fiery trial that tries you as gold in the furnace (4:12 = Proverbs 17:3 /
-- Sirach 2:5 / Malachi 3:3); rejoicing as partakers of Messiah's sufferings, the Spirit of glory
-- resting on the reproached (4:13-14 = Isaiah 11:2 the Spirit of Yahuah rests on the Branch); ★
-- judgment must begin at the house of Elohim, the righteous scarcely saved (4:17-18 = Ezekiel 9:6
-- begin at my sanctuary / Jeremiah 25:29 / Proverbs 11:31 the righteous recompensed in the earth).
-- Christology: it is the Formed Son who *suffered for us in the flesh* (4:1) and through whom *Elohim
-- in all things may be glorified* (4:11) — the Father is glorified through the Son; the Son the
-- faithful Creator's servant. No co-equal-persons grammar, no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   Messiah suffered in the flesh, arm yourselves, ceased from sin / will of Elohim
--           Tanakh: none warranted (the suffering-in-the-flesh root carried in ch2/ch3 Isaiah-53
--                   and spirits-in-prison apparatus; the *arm yourselves* is exhortation, not quote)
--           Extras: none warranted   NT: none warranted
--   v.3-5   the will of the Gentiles past; ready to judge the quick and the dead
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.6     for this cause was the gospel preached also to them that are dead
--           Tanakh: Genesis 6:5 (the wickedness in the days of Noah — the Watchers' corruption)
--           Extras: 1 Enoch 10:4,12-13 (Azazel and Semjaza bound, the prison of fire, judgment)
--           NT: none warranted (self-link the ch3 spirits-in-prison Watchers thread when live)
--   v.7-8   ★ above all have fervent charity; charity shall cover the multitude of sins
--           Tanakh: Proverbs 10:12 (love covereth all sins)
--           Extras: none warranted   NT: James 5:20 (shall hide a multitude of sins)
--   v.9-11  use hospitality; minister the gift as good stewards; that Elohim be glorified
--           Tanakh: none warranted (stewardship exhortation; no load-bearing single root)
--           Extras: none warranted   NT: none warranted
--   v.12    think it not strange concerning the fiery trial which is to try you
--           Tanakh: Proverbs 17:3 (the furnace for gold; Yahuah trieth the hearts), Malachi 3:3
--                   (he shall sit as a refiner and purify... as gold and silver)
--           Extras: Sirach (Ecclesiasticus) 2:5 (gold is tried in the fire, acceptable men in the
--                   furnace of adversity)
--           NT: none warranted
--   v.13-14 rejoice partakers of Messiah's sufferings; the spirit of glory resteth upon you
--           Tanakh: Isaiah 11:2 (the spirit of Yahuah shall rest upon him)
--           Extras: none warranted   NT: none warranted
--   v.15-16 suffer not as evildoer; if any suffer as a Christian, glorify Elohim
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.17-18 ★ judgment must begin at the house of Elohim; the righteous scarcely saved
--           Tanakh: Ezekiel 9:6 (begin at my sanctuary), Jeremiah 25:29 (I begin to bring evil on
--                   the city called by my name), Proverbs 11:31 (the righteous shall be recompensed
--                   in the earth: much more the wicked and the sinner)
--           Extras: none warranted   NT: none warranted
--   v.19    commit the keeping of their souls to him in well doing, as unto a faithful Creator
--           Tanakh: none warranted (the faithful-Creator commitment is doxological, not a quote)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   9690 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch   (Tanakh + Extras)
--   9693 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10                                     (Tanakh + NT)
--   9696 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2 (Tanakh + Extras)
--   9699 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11                                            (Tanakh)
--   9702 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11              (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s240_p240c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch
  ('canon', '1-peter', 4, 6, 'canon', 'genesis', 6, 5, 'free', E'*And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* (Genesis 6:5). Peter''s *for this cause was the gospel preached also to them that are dead* (1 Peter 4:6) does not float free — it returns to the proclamation he has just described, *he went and preached unto the spirits in prison; Which sometime were disobedient... in the days of Noah* (1 Peter 3:19-20). The days of Noah are the days of Genesis 6, when *the sons of Elohim (God) came in unto the daughters of men* (Genesis 6:4) and the earth was filled with the corruption the Watchers wrought; the wickedness *only evil continually* is the corruption Messiah''s Spirit went to confront. The gospel preached and the dead judged belong to the same Flood-and-judgment frame.'),
  ('canon', '1-peter', 4, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4). The Hebrew library tells exactly what the days of Noah were and where the disobedient spirits were put: Azazel *bound hand and foot* and cast into darkness, the very *spirits in prison* to whom the proclamation came (1 Peter 3:19). Peter''s *the gospel preached also to them that are dead* (1 Peter 4:6) continues that announcement of judgment to the bound Watchers. The same library that names the imprisonment names also the judgment Peter says they await — *that they might be judged according to men in the flesh* (1 Peter 4:6).'),
  ('canon', '1-peter', 4, 6, 'enoch', '1-enoch', 10, 12, 'extras', E'*And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* (1 Enoch 10:12). Semjaza and his associates are *bound fast... in the valleys of the earth, till the day of their judgement* — the imprisoned spirits Messiah went and *preached unto* (1 Peter 3:19), held until the judgment Peter now invokes when he says the gospel was *preached also to them that are dead, that they might be judged* (1 Peter 4:6). The proclamation is the announcement of that appointed judgment to those bound since the days of Noah. *In those days they shall be led off to the abyss of fire... the prison in which they shall be confined for ever* (1 Enoch 10:13).'),
  -- thread: 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10
  ('canon', '1-peter', 4, 8, 'canon', 'proverbs', 10, 12, 'free', E'*Hatred stirreth up strifes: but love covereth all sins.* (Proverbs 10:12). Peter quotes the proverb almost word for word: *above all things have fervent charity among yourselves: for charity shall cover the multitude of sins* (1 Peter 4:8). Where Solomon set hatred that stirs up strife against the love that *covereth all sins,* Peter sets fervent charity *above all things* — the love that, instead of exposing and multiplying offence, covers it. The wisdom of the Tanakh is the apostle''s rule; the love that covers is the Torah''s own *thou shalt love thy neighbour as thyself* working among the scattered elect.'),
  ('canon', '1-peter', 4, 8, 'canon', 'james', 5, 20, 'free', E'*Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* (James 5:20). James, the twin epistle to the scattered twelve tribes, closes with the same proverb Peter cites: turning a sinner back *shall hide a multitude of sins.* Peter says *charity shall cover the multitude of sins* (1 Peter 4:8); James says love that restores *shall hide a multitude of sins* — both reading Proverbs 10:12 (*love covereth all sins*) as the law of love among the brethren. The two letters to the dispersion speak with one voice: the love that covers, that restores, that hides offence, is the mark of the gathered remnant.'),
  -- thread: 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2
  ('canon', '1-peter', 4, 12, 'canon', 'proverbs', 17, 3, 'free', E'*The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts.* (Proverbs 17:3). Peter tells the suffering elect, *think it not strange concerning the fiery trial which is to try you, as though some strange thing happened unto you* (1 Peter 4:12). The fiery trial is no strange thing but the ancient furnace of the proverb — as *the furnace for gold,* so Yahuah (LORD) *trieth the hearts.* The fire that tests is the Refiner''s own appointed means; the trial is not the absence of his hand but its working, proving the heart as gold is proved in the furnace.'),
  ('canon', '1-peter', 4, 12, 'canon', 'malachi', 3, 3, 'free', E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* (Malachi 3:3). Malachi sees Yahuah (LORD) coming *like a refiner''s fire* to *sit as a refiner and purifier of silver,* purging his people *as gold and silver.* This is the *fiery trial which is to try you* (1 Peter 4:12) — not destruction but purification, the Refiner sitting over the fire until the offering is brought *in righteousness.* The trial of the scattered elect is the same refining Malachi promised, that the people might be made fit to offer rightly unto Yahuah (LORD).'),
  ('canon', '1-peter', 4, 12, 'apocrypha', 'ecclesiasticus', 2, 5, 'extras', E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach / Ecclesiasticus 2:5). The Hebrew library set the same wisdom that Peter speaks: *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), for *gold is tried in the fire, and acceptable men in the furnace of adversity.* Peter''s counsel — *think it not strange concerning the fiery trial which is to try you* (1 Peter 4:12) — is this very teaching: the furnace of adversity is where the acceptable are proved, as gold in the fire. The scattered elect are not to count the trial strange, for it is the appointed proving of those who come to serve.'),
  -- thread: 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11
  ('canon', '1-peter', 4, 14, 'canon', 'isaiah', 11, 2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2). Of the Branch from the stem of Jesse Isaiah says *the spirit of Yahuah (LORD) shall rest upon him.* Peter tells the reproached, *If ye be reproached for the name of Messiah (Christ), happy are ye; for the spirit of glory and of Elohim (God) resteth upon you* (1 Peter 4:14). The same resting Spirit that anointed the Messiah rests now upon those who suffer for his name — the elect made partakers of Messiah''s sufferings are made partakers also of the Spirit that rested on him, the spirit of glory abiding on the reproached.'),
  -- thread: 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11
  ('canon', '1-peter', 4, 17, 'canon', 'ezekiel', 9, 6, 'free', E'*Slay utterly old and young, both maids, and little children, and women: but come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house.* (Ezekiel 9:6). When Yahuah (LORD) sent the slaughter through Jerusalem, the command was *begin at my sanctuary* — and they began at the house. Peter speaks the same order of judgment: *the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)?* (1 Peter 4:17). Judgment falls first on the house of Elohim (God), upon his own; the visitation that begins at the sanctuary is the pattern Peter sees coming upon the scattered elect, and how much more upon the disobedient.'),
  ('canon', '1-peter', 4, 17, 'canon', 'jeremiah', 25, 29, 'free', E'*For, lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished: for I will call for a sword upon all the inhabitants of the earth, saith Yahuah Tseva''ot (LORD of hosts).* (Jeremiah 25:29). Yahuah (LORD) declares the order of his judgment: *I begin to bring evil on the city which is called by my name* — judgment begins at his own, and from there reaches all the earth. Peter reads the suffering of the elect by this rule: *judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel* (1 Peter 4:17). If those called by his name are not spared the beginning of judgment, the wicked shall by no means escape its end.'),
  ('canon', '1-peter', 4, 18, 'canon', 'proverbs', 11, 31, 'free', E'*Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner.* (Proverbs 11:31). Peter''s *if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18) is Proverbs 11:31 spoken aloud — *the righteous shall be recompensed in the earth: much more the wicked and the sinner.* If even the righteous are recompensed, refined, and brought through with difficulty, the ungodly and the sinner have no standing at all. The proverb is the ground of the apostle''s argument from the house of Elohim (God) outward: judgment beginning with the righteous is the surest warning to the wicked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s240_p240c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s240_p240c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch',
       E'For this cause was the gospel preached also to them that are dead — the days of Noah, the Watchers (Genesis 6, 1 Enoch 10)',
       E'*For for this cause was the gospel preached also to them that are dead, that they might be judged according to men in the flesh, but live according to Elohim (God) in the spirit* (1 Peter 4:6). This verse does not stand alone; it returns to what Peter has just declared — that Messiah, *quickened by the Spirit... went and preached unto the spirits in prison; Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing* (1 Peter 3:18-20). The days of Noah are the days of Genesis 6, when *the sons of Elohim (God) came in unto the daughters of men* (Genesis 6:4) and *GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5) — the corruption the Watchers wrought. The Hebrew library names exactly what became of those disobedient spirits and where they are held: *Bind Azâzêl hand and foot, and cast him into the darkness... and cover his face that he may not see light* (1 Enoch 10:4-5), and of Semjaza''s host, *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation... In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:12-13). These are the *spirits in prison* to whom the proclamation came — and the gospel *preached also to them that are dead* (1 Peter 4:6) is the announcement of that appointed judgment, *that they might be judged.* The Christology stands clear: it is the Formed Son, put to death in the flesh and *quickened by the Spirit,* who proclaims — and the Father is the One who raised him. The Flood-and-judgment frame of Genesis 6 and the bound Watchers of the restored library are the very furniture of Peter''s words.',
       sv.verse_id, ev.verse_id, 'extras', 9690
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10',
       E'Charity shall cover the multitude of sins (Proverbs 10, James 5)',
       E'*And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins* (1 Peter 4:8). Peter quotes the proverb of Solomon almost word for word: *Hatred stirreth up strifes: but love covereth all sins* (Proverbs 10:12). Where hatred exposes, multiplies, and stirs up strife, love *covereth* — it bears, restores, and hides the offence rather than broadcasting it. This is no soft sentiment but the Torah''s own *thou shalt love thy neighbour as thyself* working among the scattered elect, set *above all things.* And mark the twin: James, the companion letter to the dispersed twelve tribes, closes with the very same proverb — *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:20). Peter says charity *shall cover the multitude of sins*; James says restoring love *shall hide a multitude of sins.* The two letters to the dispersion read Proverbs 10:12 with one voice: the love that covers, that restores, that hides offence, is the mark of the gathered remnant of Yashar''el (Israel).',
       sv.verse_id, ev.verse_id, 'free', 9693
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2',
       E'The fiery trial which is to try you — as gold in the furnace (Proverbs 17, Malachi 3, Sirach 2)',
       E'*Beloved, think it not strange concerning the fiery trial which is to try you, as though some strange thing happened unto you* (1 Peter 4:12). The fiery trial is no strange thing but the ancient furnace of the wisdom of the Tanakh. *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* (Proverbs 17:3) — the fire that tests is the Refiner''s own appointed means, proving the heart as gold is proved. Malachi sees the Refiner sitting over that fire: *he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3) — the trial is not destruction but purification, that the people may offer rightly. And the Hebrew library set the same teaching plainly: *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1), *for gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The scattered elect are not to count the trial strange, for the furnace of adversity is the very place where the acceptable are proved — the same fire that refines gold, the Refiner''s hand upon his own.',
       sv.verse_id, ev.verse_id, 'extras', 9696
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11',
       E'The spirit of glory and of Elohim resteth upon you (Isaiah 11)',
       E'*If ye be reproached for the name of Messiah (Christ), happy are ye; for the spirit of glory and of Elohim (God) resteth upon you: on their part he is evil spoken of, but on your part he is glorified* (1 Peter 4:14). Peter takes the very language of Isaiah''s prophecy of the Branch. Of the rod out of the stem of Jesse Isaiah says, *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). The same resting Spirit that anointed the Messiah now *resteth upon* those who suffer for his name. To be made *partakers of Messiah''s (Christ''s) sufferings* (1 Peter 4:13) is to be made partakers also of the Spirit that rested on him — the spirit of glory abiding upon the reproached, so that what men speak against is in truth the glory of Elohim (God) resting on his elect.',
       sv.verse_id, ev.verse_id, 'free', 9699
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11',
       E'Judgment must begin at the house of Elohim — the righteous scarcely saved (Ezekiel 9, Jeremiah 25, Proverbs 11)',
       E'*For the time is come that judgment must begin at the house of Elohim (God): and if it first begin at us, what shall the end be of them that obey not the gospel of Elohim (God)? And if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:17-18). Peter reads the suffering of the scattered elect by an order of judgment written deep in the prophets. When Yahuah (LORD) sent the slaughter through Jerusalem the command was *come not near any man upon whom is the mark; and begin at my sanctuary. Then they began at the ancient men which were before the house* (Ezekiel 9:6) — judgment falls first upon the house of Elohim (God), upon his own. Jeremiah declares the same rule and draws out its consequence for the wicked: *lo, I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished? Ye shall not be unpunished* (Jeremiah 25:29) — if those called by his name are not spared the beginning of judgment, the disobedient shall by no means escape its end. And Peter''s second sentence is Solomon''s proverb spoken aloud: *Behold, the righteous shall be recompensed in the earth: much more the wicked and the sinner* (Proverbs 11:31). If even the righteous are recompensed, refined, and brought through with difficulty, the ungodly and the sinner have no standing at all. The visitation that begins at the sanctuary is the warning Peter holds before the elect — and the surest warning to those who obey not the gospel of Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 9702
  FROM _s240_p240c4_lookup sv, _s240_p240c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-peter' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *GOD saw that the wickedness of man was great in the earth... every imagination of the thoughts of his heart was only evil continually* the corruption of the days of Noah, the frame of the gospel preached *also to them that are dead* (1 Peter 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *Bind Azâzêl hand and foot, and cast him into the darkness* the binding of the disobedient Watcher, the *spirits in prison* to whom the proclamation came (1 Peter 3:19; 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* the imprisoned Watchers held until the judgment Peter invokes: *that they might be judged* (1 Peter 4:6).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-gospel-preached-to-them-that-are-dead-the-days-of-noah-the-watchers-genesis-6-enoch'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:12 — *Hatred stirreth up strifes: but love covereth all sins* the proverb Peter quotes: *charity shall cover the multitude of sins* (1 Peter 4:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:20 — *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* the twin epistle to the dispersion quoting the same Proverbs 10:12 (1 Peter 4:8).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-charity-shall-cover-the-multitude-of-sins-proverbs-10'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:3 — *The fining pot is for silver, and the furnace for gold: but Yahuah (LORD) trieth the hearts* the furnace of the wisdom of the Tanakh; the *fiery trial which is to try you* (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:3 — *he shall sit as a refiner and purifier of silver... and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* the trial as purification, not destruction; the Refiner over the *fiery trial* (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach (Ecclesiasticus) 2:5 — *gold is tried in the fire, and acceptable men in the furnace of adversity* the Hebrew library''s same teaching, *if you come to serve Yahuah (God), prepare your soul for temptation* (Sirach 2:1); think the trial not strange (1 Peter 4:12).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-fiery-trial-which-is-to-try-you-as-gold-in-the-furnace-proverbs-17-malachi-3-sirach-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:2 — *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding* the resting Spirit on the Branch; *the spirit of glory and of Elohim (God) resteth upon you* the reproached (1 Peter 4:14).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-the-spirit-of-glory-resteth-upon-you-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 9:6 — *begin at my sanctuary. Then they began at the ancient men which were before the house* judgment falling first on the house; *judgment must begin at the house of Elohim (God)* (1 Peter 4:17).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 25:29 — *I begin to bring evil on the city which is called by my name, and should ye be utterly unpunished?* judgment beginning at his own, the wicked not escaping; *what shall the end be of them that obey not the gospel* (1 Peter 4:17).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:31 — *the righteous shall be recompensed in the earth: much more the wicked and the sinner* the proverb behind Peter''s second sentence; *if the righteous scarcely be saved, where shall the ungodly and the sinner appear?* (1 Peter 4:18).'
  FROM cross_reference_threads t, cross_references x, _s240_p240c4_lookup sv, _s240_p240c4_lookup tv
 WHERE t.slug='1-peter-4-judgment-must-begin-at-the-house-of-elohim-ezekiel-9-jeremiah-25-proverbs-11'
   AND sv.edition_slug='canon' AND sv.book_slug='1-peter' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
