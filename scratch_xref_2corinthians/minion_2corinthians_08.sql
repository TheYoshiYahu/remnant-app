-- ----- fragment: minion_2corinthians_08.sql (S229 2 Corinthians 8) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 8 (24 verses) — THE COLLECTION (the grace of giving / the manna equality). BLESSING chapter.
-- Tag: 2c08 (temp view _s229_2c08_lookup).
-- Sort band: floor 7175, step 3 (7175, 7178, 7181, 7184, 7187 used; under 7200).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the collection for the saints at Jerusalem is the nations ministering material
-- things to Israel — the same relief of Romans 15:25-27 and 1 Corinthians 16:1-4, NOT charity in the
-- abstract). 8:9 is Christology — the Formed Son's self-emptying: *though he was rich, yet for your
-- sakes he became poor, that ye through his poverty might be rich.* 8:15 grounds the whole appeal in
-- the manna: *He that had gathered much had nothing over; and he that had gathered little had no lack*
-- (Exodus 16:18) — the equality of the gathering, each according to his eating; the abundance of one
-- supplying the want of another. 8:21 echoes Proverbs 3:4, providing honest things in the sight of
-- Yahuah (LORD) and of men. The willing, cheerful, alms-giving heart is witnessed by the restored
-- library (Tobit 4, Sirach 35). No law-vs-grace antithesis: giving is grace AND the keeping of the
-- commandment (Sirach 35:1-10), the liberality that flows from a heart given first to Yahuah (8:5).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   the grace bestowed on Macedonia; deep poverty abounding to riches of liberality; gave
--           their own selves first to Yahuah (Lord)
--           Tanakh: none warranted (the giving roots carried at the cheerful-eye thread, 8:7-12)
--           Extras: Tobit 4:8 (if thou have but a little, be not afraid to give according to that little)
--           NT: carried in the collection thread (Romans 15:26 — Macedonia and Achaia's contribution)
--   v.6-8   abound in this grace also; not by commandment but to prove the sincerity of your love
--           Tanakh: none warranted   Extras: Sirach 35:8-10 (give... with a cheerful eye)
--           NT: none warranted
--   v.9     though he was rich, yet for your sakes he became poor, that ye might be rich [Christology]
--           Tanakh: none warranted (no single verbatim root; the self-emptying carried in prose)
--           Extras: none warranted   NT: carried in the grace-of-giving thread (the pattern of the gift)
--   v.10-12 a willing mind accepted according to that a man hath, not according to that he hath not
--           Tanakh: none warranted   Extras: Tobit 4:7-8 (give alms... if thou have but a little, be
--                   not afraid to give according to that little); Sirach 35:10 (as thou hast gotten,
--                   give with a cheerful eye)   NT: none warranted
--   v.13-15 by an equality... that there may be equality; He that gathered much had nothing over [MANNA]
--           Tanakh: Exodus 16:18 (he that gathered much had nothing over, and he that gathered little
--                   had no lack), Exodus 16:16 (gather... every man according to his eating)
--           Extras: none warranted   NT: none warranted (the citation is the Tanakh root)
--   v.16-21 the administration to the glory of Yahuah; providing honest things in the sight of Yahuah
--           and of men
--           Tanakh: Proverbs 3:4 (so shalt thou find favour and good understanding in the sight of
--                   Elohim and man)
--           Extras: none warranted   NT: none warranted
--   v.18-24 the brethren sent; the collection administered to Jerusalem; the proof of your love
--           Tanakh: none warranted
--           Extras: none warranted   NT: Romans 15:25-27 (I go unto Jerusalem to minister unto the
--                   saints; their duty is to minister unto them in carnal things), 1 Corinthians 16:1-4
--                   (the collection for the saints... bring your liberality unto Jerusalem)
--
-- THREADS (slug -> target libraries):
--   7175 2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16  (Tanakh)  [CENTERPIECE / BLESSING]
--   7178 2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15  (NT)
--   7181 2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3  (Tanakh)
--   7184 2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s229_2c08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16  [CENTERPIECE]
  ('canon', '2-corinthians', 8, 15, 'canon', 'exodus', 16, 18, 'free', E'*And when they did mete it with an omer, he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating.* (Exodus 16:18). This is the verse Paul cites word for word: *As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15). The manna in the wilderness is the pattern of the collection. Yahuah (LORD) rained the bread from heaven and no man''s gathering left him with surplus or with lack — the abundance of the camp was levelled to the need of every household. So Paul appeals to *an equality, that now at this time your abundance may be a supply for their want... that there may be equality* (2 Corinthians 8:14): the nations'' plenty made a supply for the want of the poor saints at Jerusalem, the same gathering-and-sharing the manna taught Yashar''el (Israel).'),
  ('canon', '2-corinthians', 8, 14, 'canon', 'exodus', 16, 16, 'free', E'*This is the thing which Yahuah (LORD) hath commanded, Gather of it every man according to his eating, an omer for every man, according to the number of your persons; take ye every man for them which are in his tents.* (Exodus 16:16). The manna was gathered *every man according to his eating* — measured to the need, not to greed. Paul builds the collection on this measure: *by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14). What Yahuah (LORD) commanded in the wilderness — each gathering to his eating, none keeping a private hoard against his brother''s hunger — is the rule of the ministering to the saints.'),
  -- thread: 2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15
  ('canon', '2-corinthians', 8, 4, 'canon', 'romans', 15, 26, 'free', E'*For it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem.* (Romans 15:26). Paul names the very same collection in both letters. To the Romans he writes of *Macedonia and Achaia* making *a certain contribution for the poor saints which are at Jerusalem*; to the Corinthians he tells how the churches of Macedonia, *Praying us with much intreaty that we would receive the gift, and take upon us the fellowship of the ministering to the saints* (2 Corinthians 8:4). The fellowship of the ministering is the Jerusalem relief — the nations gathered at Corinth and in Macedonia ministering material things to the poor of Yashar''el (Israel).'),
  ('canon', '2-corinthians', 8, 4, 'canon', 'romans', 15, 27, 'free', E'*It hath pleased them verily; and their debtors they are. For if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things.* (Romans 15:27). Paul gives the reason for the collection: the nations are *debtors* to Jerusalem, for *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things.* This is *the fellowship of the ministering to the saints* the Macedonians begged to share (2 Corinthians 8:4) — not a one-way charity but the grafted-in seed rendering carnal things in return for the spiritual riches that came out of Yashar''el (Israel).'),
  ('canon', '2-corinthians', 8, 4, 'canon', 'romans', 15, 25, 'free', E'*But now I go unto Jerusalem to minister unto the saints.* (Romans 15:25). Paul''s own errand was *to minister unto the saints* at Jerusalem — the destination of the gift he is gathering. The Macedonians shared in this by *the fellowship of the ministering to the saints* (2 Corinthians 8:4); the brethren of this chapter are sent to administer the same grace to the same city. The whole apparatus of 2 Corinthians 8 is the carrying of that ministry to Jerusalem.'),
  ('canon', '2-corinthians', 8, 19, 'canon', '1-corinthians', 16, 1, 'free', E'*Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye.* (1 Corinthians 16:1). In his first letter Paul had already set the Corinthians to *the collection for the saints,* ordered to the churches of Galatia and Corinth alike. Now in the second letter the gift is being carried: a brother *was also chosen of the churches to travel with us with this grace, which is administered by us to the glory of the same Yahuah (Lord)* (2 Corinthians 8:19). The *collection for the saints* commanded in the first epistle is the *grace... administered* in the second — one continuous ministry to Jerusalem.'),
  ('canon', '2-corinthians', 8, 19, 'canon', '1-corinthians', 16, 3, 'free', E'*And when I come, whomsoever ye shall approve by your letters, them will I send to bring your liberality unto Jerusalem.* (1 Corinthians 16:3). Paul had told the Corinthians their own approved men would *bring your liberality unto Jerusalem.* So in this chapter the chosen brother travels *with this grace, which is administered by us to the glory of the same Yahuah (Lord), and declaration of your ready mind* (2 Corinthians 8:19) — the very *liberality* of the first letter, now on its way to the holy city, carried by men the churches trust.'),
  -- thread: 2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3
  ('canon', '2-corinthians', 8, 21, 'canon', 'proverbs', 3, 4, 'free', E'*So shalt thou find favour and good understanding in the sight of Elohim (God) and man.* (Proverbs 3:4). Wisdom promises that mercy and truth bound about the neck bring *favour and good understanding in the sight of Elohim (God) and man.* Paul orders the handling of the collection by the same double sight: *Providing for honest things, not only in the sight of Yahuah (Lord), but also in the sight of men* (2 Corinthians 8:21). The relief is carried by many hands and audited openly so that no man can blame the ministers — honest before Yahuah (LORD) who sees the heart, and honest before men who see the conduct, exactly the favour Proverbs sets in the sight of Elohim (God) and man.'),
  ('canon', '2-corinthians', 8, 21, 'canon', 'proverbs', 3, 3, 'free', E'*Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart:* (Proverbs 3:3). The favour in the sight of Elohim (God) and man flows from *mercy and truth* bound about the neck and written on the heart. Paul''s care to provide *honest things, not only in the sight of Yahuah (Lord), but also in the sight of men* (2 Corinthians 8:21) is that mercy and truth made visible in the handling of the saints'' gift — the inward integrity of the heart shown in the outward transparency of the ministry, that the grace might be administered to the glory of Yahuah (Lord) and blameless before all.'),
  -- thread: 2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35
  ('canon', '2-corinthians', 8, 12, 'apocrypha', 'tobit', 4, 8, 'extras', E'*If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little:* (Tobit 4:8). Tobit charges his son to give as he has — *if you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little.* Paul measures the gift the same way: *For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). The willing heart, not the size of the purse, is what is accepted; the Macedonians out of *deep poverty abounded unto the riches of their liberality* (2 Corinthians 8:2), giving according to that little and beyond it.'),
  ('canon', '2-corinthians', 8, 7, 'apocrypha', 'ecclesiasticus', 35, 9, 'extras', E'*In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness.* (Sirach 35:9). The wisdom of the fathers commands a glad giver: *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness.* Paul exhorts the Corinthians, who *abound in every thing, in faith, and utterance, and knowledge,* to *abound in this grace also* (2 Corinthians 8:7) — the grace of giving, given gladly and not grudgingly. The cheerful countenance Sirach names is the spirit of the collection.'),
  ('canon', '2-corinthians', 8, 7, 'apocrypha', 'ecclesiasticus', 35, 10, 'extras', E'*Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye.* (Sirach 35:10). Sirach binds the gift to the riches received: *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye.* This is the pattern of *the grace of our Lord Yahusha HaMashiach (Lord Jesus Christ), that, though he was rich, yet for your sakes he became poor, that ye through his poverty might be rich* (2 Corinthians 8:9) — and Paul calls the Corinthians, enriched in everything, to abound in the same grace of giving (2 Corinthians 8:7) with the cheerful eye.'),
  ('canon', '2-corinthians', 8, 5, 'apocrypha', 'ecclesiasticus', 35, 1, 'extras', E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering.* (Sirach 35:1). Sirach refuses the false split between obedience and offering: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering.* The Macedonians'' giving was just this keeping of the heart''s law — *first gave their own selves to Yahuah (Lord), and unto us by the will of Elohim (God)* (2 Corinthians 8:5). The gift that pleases is the gift of a heart already given to Yahuah (LORD); the keeping of the commandment and the liberal offering are one, not opposed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16',
       E'The equality of the manna: he that gathered much had nothing over (Exodus 16)',
       E'When Paul pleads for the collection, he does not invent a new law of charity — he reaches back to the bread that fell in the wilderness. He asks the Corinthians for *an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14), and seals it with Scripture: *As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15). That is the manna of Exodus 16, quoted word for word: *when they did mete it with an omer, he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating* (Exodus 16:18). Yahuah (LORD) had commanded, *Gather of it every man according to his eating, an omer for every man, according to the number of your persons* (Exodus 16:16) — bread *rained from heaven* and measured to need, where no household''s surplus was hoarded against another''s hunger and no household went without. The collection for the poor saints at Jerusalem is that same gathering. The abundance of the nations at Corinth and Macedonia is poured out to supply the want of the saints in the holy city, so *that there may be equality* — the manna-rule of the camp now binding the gathered seed across the world. And the pattern of the gift is the Master himself: *ye know the grace of our Lord Yahusha HaMashiach (Lord Jesus Christ), that, though he was rich, yet for your sakes he became poor, that ye through his poverty might be rich* (2 Corinthians 8:9) — the Formed Son who emptied his own abundance that the lacking might be filled. The willing heart gives *according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12), each according to his eating, until there is no man with too much over and no man with any lack.',
       sv.verse_id, ev.verse_id, 'free', 7175
  FROM _s229_2c08_lookup sv, _s229_2c08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15',
       E'The collection for the saints: the nations minister to Jerusalem (Romans 15, 1 Corinthians 16)',
       E'The grace of this chapter has a name and a destination. The Macedonians begged Paul *that we would receive the gift, and take upon us the fellowship of the ministering to the saints* (2 Corinthians 8:4), and the chosen brother travels *with this grace, which is administered by us to the glory of the same Yahuah (Lord)* (2 Corinthians 8:19). This is the Jerusalem relief — the same collection Paul names in his other letters. To the Romans he wrote, *now I go unto Jerusalem to minister unto the saints. For it hath pleased them of Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem* (Romans 15:25-26), and he gave its rationale: *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* (Romans 15:27). To the Corinthians earlier he had set the order: *Now concerning the collection for the saints, as I have given order to the churches of Galatia, even so do ye* (1 Corinthians 16:1), and *whomsoever ye shall approve by your letters, them will I send to bring your liberality unto Jerusalem* (1 Corinthians 16:3). One gathering runs through all three letters: the grafted-in nations, made partakers of the spiritual riches that came out of Yashar''el (Israel), now ministering carnal things back to the poor of Yashar''el (Israel). It is not abstract charity but the debt of the nations to Jerusalem, carried by approved and trusted men to the holy city.',
       sv.verse_id, ev.verse_id, 'free', 7178
  FROM _s229_2c08_lookup sv, _s229_2c08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3',
       E'Providing honest things in the sight of Yahuah (LORD) and of men (Proverbs 3)',
       E'Paul is scrupulous about the handling of the saints'' money. He sends the gift by many hands, *Avoiding this, that no man should blame us in this abundance which is administered by us: Providing for honest things, not only in the sight of Yahuah (Lord), but also in the sight of men* (2 Corinthians 8:20-21). That double sight is Solomon''s wisdom: *Let not mercy and truth forsake thee: bind them about thy neck; write them upon the table of thine heart: So shalt thou find favour and good understanding in the sight of Elohim (God) and man* (Proverbs 3:3-4). The favour Proverbs promises comes to the one whose mercy and truth are written on the heart and made visible in conduct. So Paul will not let the grace be carried in a way that any man could blame; it is audited openly, administered by men the churches trust, *to the glory of the same Yahuah (Lord)* (2 Corinthians 8:19). Honest before Yahuah (LORD) who searches the heart, and honest before men who watch the conduct — the inward integrity of Proverbs 3 made plain in the open ministry of the collection.',
       sv.verse_id, ev.verse_id, 'free', 7181
  FROM _s229_2c08_lookup sv, _s229_2c08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35',
       E'The grace of giving: a cheerful eye and a willing mind (Tobit 4, Sirach 35)',
       E'Paul calls the Corinthians, who *abound in every thing, in faith, and utterance, and knowledge,* to *abound in this grace also* (2 Corinthians 8:7) — the grace of giving. He measures it not by the size of the purse but by the willingness of the heart: *For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). The restored library taught this giving long before. Tobit charged his son, *If you have abundance give alms accordingly: if you have but a little, be not afraid to give according to that little* (Tobit 4:8) — exactly the willing mind accepted according to what a man has. And Sirach commands the glad giver: *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness* (Sirach 35:9); *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Sirach 35:10). That is the pattern of the Master himself, *that, though he was rich, yet for your sakes he became poor, that ye through his poverty might be rich* (2 Corinthians 8:9). And the giving is no abandonment of obedience but its very fruit: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1) — the Macedonians *first gave their own selves to Yahuah (Lord)* (2 Corinthians 8:5), and the liberal hand flowed from the heart already given to him. Keeping the commandment and the cheerful offering are one.',
       sv.verse_id, ev.verse_id, 'extras', 7184
  FROM _s229_2c08_lookup sv, _s229_2c08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:18 — *he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating* the manna Paul cites word for word; *He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 16:16 — *Gather of it every man according to his eating, an omer for every man* the manna measured to need; Paul''s appeal *by an equality... that there may be equality* (2 Corinthians 8:14).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-equality-of-the-manna-each-according-to-his-eating-exodus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 15:25 — *now I go unto Jerusalem to minister unto the saints* the errand of the gift; *the fellowship of the ministering to the saints* (2 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 15:26 — *Macedonia and Achaia to make a certain contribution for the poor saints which are at Jerusalem* the same collection named; the Macedonians'' *fellowship of the ministering to the saints* (2 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 15:27 — *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* the nations'' debt to Jerusalem; *the fellowship of the ministering to the saints* (2 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 16:1 — *Now concerning the collection for the saints... even so do ye* the order Paul first gave; the *grace... administered by us to the glory of the same Yahuah (Lord)* (2 Corinthians 8:19).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 16:3 — *them will I send to bring your liberality unto Jerusalem* the approved men who carry the gift; the brother *chosen of the churches to travel with us with this grace* (2 Corinthians 8:19).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-collection-for-the-saints-the-nations-minister-to-jerusalem-romans-15'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:4 — *So shalt thou find favour and good understanding in the sight of Elohim (God) and man* the double sight; Paul provides *honest things, not only in the sight of Yahuah (Lord), but also in the sight of men* (2 Corinthians 8:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:3 — *bind them about thy neck; write them upon the table of thine heart* mercy and truth on the heart; the inward integrity behind *honest things... in the sight of Yahuah (Lord)* and men (2 Corinthians 8:21).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-providing-honest-things-in-the-sight-of-yahuah-and-of-men-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 4:8 — *if you have but a little, be not afraid to give according to that little* the willing heart that gives as it has; *accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 35:9 — *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness* the glad giver; the Corinthians called to *abound in this grace also* (2 Corinthians 8:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 35:10 — *as you have gotten, give with a cheerful eye* giving according as he has enriched you; the grace of him who *though he was rich... became poor, that ye... might be rich* (2 Corinthians 8:9).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 35:1 — *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* giving as the fruit of obedience; the Macedonians *first gave their own selves to Yahuah (Lord)* (2 Corinthians 8:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c08_lookup sv, _s229_2c08_lookup tv
 WHERE t.slug='2-corinthians-8-the-grace-of-giving-with-a-cheerful-eye-and-the-willing-mind-tobit-4-sirach-35'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
