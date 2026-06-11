-- ----- fragment: minion_1corinthians_08.sql (S228 1 Corinthians 8) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 8 (13 verses) — idol-food, the weak conscience, and the one Elohim.
-- Tag: co08 (temp view _s228_co08_lookup).
-- Sort band: floor 6775, step 3 (6775, 6778, 6781 used; under 6800).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: this chapter is Paul on meat sacrificed to IDOLS and the weak conscience — it is
-- NOT a repeal of the clean/unclean food law (Leviticus 11), and it must not read as dietary-law
-- abolition. *Knowledge puffeth up, but charity edifieth* (8:1). The centerpiece is the confession
-- that *there is none other Elohim (God) but one... to us there is but one Elohim (God), the Father,
-- of whom are all things... and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all
-- things* (8:4-6) — the Shema (Deuteronomy 6:4) and *Yahuah (LORD) he is Elohim (God)... there is
-- none else* (Deuteronomy 4:35,39). CHRISTOLOGY (the Formed): the Father is the One, Yahusha is the
-- Formed Son through whom are all things, bearing the divine name — NOT a co-equal-persons second
-- person, NOT a modalist collapse, NOT a mere man. Preserve the pull's distinction. The idols are
-- nothing in the world (8:4) → the idol-polemic of Psalm 115:4-8 and Isaiah 44 (idols of wood and
-- stone, nothing). The weak brother for whom Messiah died (8:11) is the same charge as Romans 14 —
-- the meat is not the issue; the conscience of the brother is.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   knowledge puffeth up, but charity edifieth; if any man love Elohim, the same is known
--           Tanakh: none warranted (the charity/knowledge contrast is carried in the prose; no single
--                   load-bearing Tanakh verse is quoted, not forced)
--           Extras: none warranted   NT: none warranted
--   v.4-6   an idol is nothing; none other Elohim but one; one Elohim the Father, one Lord Yahusha
--           Tanakh: Deuteronomy 6:4 (Hear, O Yashar'el: Yahuah our Elohim is one Yahuah),
--                   Deuteronomy 4:35 (Yahuah he is Elohim; there is none else beside him),
--                   Deuteronomy 4:39 (Yahuah he is Elohim in heaven above and upon the earth; none else)
--           Extras: none warranted (the idols-nothing extras carried in the idol-polemic thread)
--           NT: Mark 12:29 (the first commandment: Hear, O Yashar'el; Yahuah our Elohim is one Yahuah),
--               Mark 12:32 (there is one Elohim; and there is none other but he)
--   v.4-5   an idol is nothing in the world; though there be that are called gods, gods many
--           Tanakh: Psalm 115:4 (their idols are silver and gold, the work of men's hands),
--                   Psalm 115:8 (they that make them are like unto them), Isaiah 44:9 (they that make
--                   a graven image are all of them vanity), Isaiah 44:17 (Deliver me; for thou art my god)
--           Extras: Wisdom of Solomon 13:10 (in dead things is their hope, who call them gods, the
--                   works of men's hands), Wisdom of Solomon 14:8 (that which is made with hands is
--                   cursed... being corruptible, it was called god)
--           NT: carried in the Shema thread
--   v.7-13  the weak conscience defiled; meat commendeth us not; the stumblingblock; the weak brother
--           for whom Messiah died; I will eat no flesh while the world standeth
--           Tanakh: none warranted (the temple/idol-food root carried at v.4; the weak-brother charge
--                   is a NT-internal apostolic matter, no load-bearing Tanakh verse)
--           Extras: none warranted
--           NT: Romans 14:13 (no man put a stumblingblock in his brother's way), Romans 14:15
--               (Destroy not him with thy meat, for whom Messiah died), Romans 14:21 (it is good
--               neither to eat flesh... whereby thy brother stumbleth)
--
-- THREADS (slug -> target libraries):
--   6775 1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6   (Tanakh + NT)  [CHRISTOLOGY CENTERPIECE]
--   6778 1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115   (Tanakh + Extras)
--   6781 1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14    (NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6  [CHRISTOLOGY CENTERPIECE]
  ('canon', '1-corinthians', 8, 4, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). The Shema is the ground of Paul''s whole argument about idol-food: *we know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4). The assembly at Corinth confesses what Yashar''el (Israel) was commanded to hear and keep — Yahuah (LORD) is one. The idol is nothing precisely because the one Yahuah (LORD) is the only Elohim (God); to confess the Shema is to know that the meat laid before a no-god has been laid before nothing.'),
  ('canon', '1-corinthians', 8, 6, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). Paul confesses the one Yahuah (LORD) of the Shema in the fulness of the Formed: *to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him* (1 Corinthians 8:6). The Father is the One of whom are all things; Yahusha HaMashiach (Jesus Christ) is the Formed Son through whom are all things, bearing the divine name. This does not break the oneness of the Shema but unfolds it — the one Yahuah (LORD) and the Formed who came from him by whom all things were made, the Rock that followed Yashar''el (Israel), not a second separate God and not a mere man.'),
  ('canon', '1-corinthians', 8, 4, 'canon', 'deuteronomy', 4, 35, 'free', E'*Unto thee it was shewed, that thou mightest know that Yahuah (LORD) he is Elohim (God); there is none else beside him.* (Deuteronomy 4:35). At Horeb Yashar''el (Israel) was made to know *that Yahuah (LORD) he is Elohim (God); there is none else beside him* — the very knowledge Paul presses: *there is none other Elohim (God) but one* (1 Corinthians 8:4). The called-out ones at Corinth stand on the same revelation Yashar''el (Israel) received in the fire: beside the one Yahuah (LORD) there is no other, so the so-called gods of the idol-temple are nothing.'),
  ('canon', '1-corinthians', 8, 6, 'canon', 'deuteronomy', 4, 39, 'free', E'*Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* (Deuteronomy 4:39). Moses charged Yashar''el (Israel) to know *that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* — and Paul answers the many so-called gods *in heaven or in earth* with the same confession: *to us there is but one Elohim (God), the Father, of whom are all things* (1 Corinthians 8:6). Whatever be named god in heaven above or earth beneath, there is none else; the one Elohim (God) of Deuteronomy is the one Elohim (God) the Father, and the one Lord through whom are all things.'),
  ('canon', '1-corinthians', 8, 4, 'canon', 'mark', 12, 29, 'free', E'*And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* (Mark 12:29). Yahusha (Jesus) himself names the Shema the first of all the commandments — *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* — the same oneness Paul rests the idol-food teaching upon: *there is none other Elohim (God) but one* (1 Corinthians 8:4). The Messiah did not set aside the confession of the one Yahuah (LORD); he laid it down as the first commandment, and Paul builds the whole chapter on it.'),
  ('canon', '1-corinthians', 8, 6, 'canon', 'mark', 12, 32, 'free', E'*And the scribe said unto him, Well, Master, thou hast said the truth: for there is one Elohim (God); and there is none other but he:* (Mark 12:32). The scribe answers Yahusha (Jesus) rightly — *there is one Elohim (God); and there is none other but he* — and Yahusha (Jesus) commends him as not far from the kingdom. Paul speaks the same creed to Corinth: *to us there is but one Elohim (God), the Father, of whom are all things... and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things* (1 Corinthians 8:6). The one Elohim (God) the Father and the one Lord the Formed Son are confessed without breaking the oneness the scribe and the Messiah affirmed: there is none other but he.'),
  -- thread: 1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115
  ('canon', '1-corinthians', 8, 4, 'canon', 'psalms', 115, 4, 'free', E'*Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4). The psalm names the idols for what they are — *silver and gold, the work of men''s hands* — which is why Paul can say *we know that an idol is nothing in the world* (1 Corinthians 8:4). A thing fashioned by a craftsman''s hand is no god; it is nothing, because beside the one Yahuah (LORD) there is no other Elohim (God).'),
  ('canon', '1-corinthians', 8, 5, 'canon', 'psalms', 115, 8, 'free', E'*They that make them are like unto them; so is every one that trusteth in them.* (Psalm 115:8). The idols *have mouths, but they speak not; eyes have they, but they see not* — and *they that make them are like unto them.* So though Paul grants *there be that are called gods... as there be gods many, and lords many* (1 Corinthians 8:5), these are the lifeless works the psalm derides; the many so-called gods are no gods at all, and they that trust them are made as empty as the stone they bow to.'),
  ('canon', '1-corinthians', 8, 4, 'canon', 'isaiah', 44, 9, 'free', E'*They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* (Isaiah 44:9). Isaiah strips the idol bare: *they that make a graven image are all of them vanity.* The smith forges it, the carpenter shapes it after the figure of a man, half the tree he burns for warmth and of the residue he makes a god — and it is nothing. This is the *idol* Paul says *is nothing in the world* (1 Corinthians 8:4); the workman''s vanity cannot be a rival to the one Elohim (God) who formed Yashar''el (Israel) from the womb.'),
  ('canon', '1-corinthians', 8, 5, 'canon', 'isaiah', 44, 17, 'free', E'*And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* (Isaiah 44:17). The idolater bows to the leftover wood — *Deliver me; for thou art my god* — to a block that cannot save. These are the *gods many, and lords many* that *are called gods* (1 Corinthians 8:5), the no-gods of Isaiah''s mockery; for the called-out ones there is but one Elohim (God), and the carved residue of a tree is nothing in the world.'),
  ('canon', '1-corinthians', 8, 4, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'*But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* (Wisdom of Solomon 13:10). The restored library joins the same polemic: those who *call them gods* set their hope *in dead things... the works of men''s hands... a stone good for nothing.* This is precisely Paul''s ground — *an idol is nothing in the world* (1 Corinthians 8:4) — for a stone good for nothing cannot be a god, and the meat set before it has been set before nothing at all.'),
  ('canon', '1-corinthians', 8, 5, 'apocrypha', 'the-wisdom-of-solomon', 14, 8, 'extras', E'*But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god.* (Wisdom of Solomon 14:8). The library names the absurdity: a corruptible thing made with hands *was called god.* These are the *gods many, and lords many* that are merely *called gods* (1 Corinthians 8:5) — a name laid on a perishable image, no true divinity. The one Elohim (God) the Father, of whom are all things, is no work of hands; beside him the made-with-hands god is nothing.'),
  -- thread: 1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14
  ('canon', '1-corinthians', 8, 9, 'canon', 'romans', 14, 13, 'free', E'*Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way.* (Romans 14:13). To the same kind of dispute over meat Paul gives the same charge in Romans: *that no man put a stumblingblock... in his brother''s way.* So here he warns *take heed lest by any means this liberty of yours become a stumblingblock to them that are weak* (1 Corinthians 8:9). The knowledge that the idol is nothing is true, but love, not liberty, governs the table; the brother''s conscience, not the meat, is the matter.'),
  ('canon', '1-corinthians', 8, 11, 'canon', 'romans', 14, 15, 'free', E'*But if thy brother be grieved with thy meat, now walkest thou not charitably. Destroy not him with thy meat, for whom Messiah (Christ) died.* (Romans 14:15). The words are nearly Paul''s own here: *through thy knowledge shall the weak brother perish, for whom Messiah (Christ) died* (1 Corinthians 8:11). In both letters the weight is the same — *Destroy not him with thy meat, for whom Messiah (Christ) died.* The brother is one for whom the Messiah gave his life; to wound his conscience over food is to set knowledge above the love that *edifieth* (8:1), and to sin against the Messiah himself (8:12).'),
  ('canon', '1-corinthians', 8, 13, 'canon', 'romans', 14, 21, 'free', E'*It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.* (Romans 14:21). Paul''s resolve in Corinth answers his rule in Rome: *if meat make my brother to offend, I will eat no flesh while the world standeth, lest I make my brother to offend* (1 Corinthians 8:13). It is good, says Romans, to forgo *flesh... or any thing whereby thy brother stumbleth.* This is not the abolishing of any food-law — the question is never whether the meat is clean, but whether the eating wounds a weak brother; love lays down the liberty for his sake.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6',
       E'But to us one Elohim (God) the Father, and one Lord Yahusha HaMashiach (Jesus Christ) — the Shema (Deuteronomy 6, 4)',
       E'Paul settles the question of idol-food on the bedrock of the Shema. *We know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4); and though the nations name *gods many, and lords many* (8:5), *to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him* (8:6). This is the confession Yashar''el (Israel) was commanded to hear: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4), and to know *that Yahuah (LORD) he is Elohim (God); there is none else beside him* (Deuteronomy 4:35), *in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). The many so-called gods *in heaven or in earth* are answered by the one Yahuah (LORD) who fills heaven above and earth beneath. Yahusha (Jesus) himself laid this same Shema down as *the first of all the commandments* — *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* (Mark 12:29) — and commended the scribe who confessed *there is one Elohim (God); and there is none other but he* (Mark 12:32). Mark the Christology, and do not flatten it: the Father is the One *of whom are all things,* and Yahusha HaMashiach (Jesus Christ) is the Formed Son *by whom are all things,* bearing the divine name and the divine making. This is not a second separate God set beside the Father, nor the Father wearing a mask, nor a mere man exalted — it is the one Yahuah (LORD) of the Shema confessed in the fulness of the Formed, the One and the Son who came from him by whom the worlds were made and through whom the called-out ones are gathered home. The oneness is not broken; it is unfolded.',
       sv.verse_id, ev.verse_id, 'free', 6775
  FROM _s228_co08_lookup sv, _s228_co08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115',
       E'An idol is nothing in the world — the gods of wood and stone (Psalm 115, Isaiah 44)',
       E'When Paul says *an idol is nothing in the world* (1 Corinthians 8:4), and grants only that there *be that are called gods... as there be gods many, and lords many* (8:5), he stands in the long Tanakh polemic against the lifeless idol. The psalmist mocked them: *their idols are silver and gold, the work of men''s hands* (Psalm 115:4) — they have mouths and speak not, eyes and see not — and *they that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Isaiah drew it out further: *they that make a graven image are all of them vanity* (Isaiah 44:9); the smith forges, the carpenter shapes a block after the figure of a man, burns half the tree for warmth, and of the residue *maketh a god... and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17) — to a thing that cannot save. The restored library presses the same scorn: those who *call them gods* set their hope *in dead things... the works of men''s hands... a stone good for nothing* (Wisdom of Solomon 13:10), for *that which is made with hands is cursed... being corruptible, it was called god* (Wisdom of Solomon 14:8). A name laid on perishable wood and stone makes no god. This is why the idol is nothing and the meat set before it has been set before nothing — for beside the one Yahuah (LORD) there is no other Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 6778
  FROM _s228_co08_lookup sv, _s228_co08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14',
       E'The weak brother for whom Messiah (Christ) died — the stumblingblock, not the meat (Romans 14)',
       E'Knowing the idol is nothing, the strong at Corinth ate freely; but Paul will not let liberty trample the conscience of the weak. *Take heed lest by any means this liberty of yours become a stumblingblock to them that are weak* (1 Corinthians 8:9); for *through thy knowledge shall the weak brother perish, for whom Messiah (Christ) died* (8:11), and to wound his weak conscience is to *sin against Messiah (Christ)* (8:12). It is the very rule Paul gives the assembly at Rome over the same kind of dispute about meat: *judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13), and *Destroy not him with thy meat, for whom Messiah (Christ) died* (Romans 14:15), and *It is good neither to eat flesh... nor any thing whereby thy brother stumbleth, or is offended, or is made weak* (Romans 14:21). So Paul resolves: *if meat make my brother to offend, I will eat no flesh while the world standeth, lest I make my brother to offend* (1 Corinthians 8:13). Read this rightly: it is no abolishing of any food-law, no setting aside of clean and unclean — the question is never whether the meat is lawful, but whether the eating wounds a brother for whom the Messiah died. *Knowledge puffeth up, but charity edifieth* (8:1); here love lays down its liberty for the sake of the weak, and that is the higher law of the table.',
       sv.verse_id, ev.verse_id, 'free', 6781
  FROM _s228_co08_lookup sv, _s228_co08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema, the ground for *there is none other Elohim (God) but one* (1 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema unfolded in the Formed: *one Elohim (God), the Father... and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things* (1 Corinthians 8:6).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:35 — *that Yahuah (LORD) he is Elohim (God); there is none else beside him* the Horeb revelation behind *there is none other Elohim (God) but one* (1 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 4:39 — *Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* answering the gods-many *in heaven or in earth* with *one Elohim (God), the Father, of whom are all things* (1 Corinthians 8:6).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Mark 12:29 — *The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* Yahusha (Jesus) laying down the Shema as first; Paul builds the idol-food teaching on it (1 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Mark 12:32 — *there is one Elohim (God); and there is none other but he* the scribe''s creed Yahusha (Jesus) commends; the same confessed to Corinth as *one Elohim (God), the Father... and one Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Corinthians 8:6).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:4 — *their idols are silver and gold, the work of men''s hands* why *an idol is nothing in the world* (1 Corinthians 8:4): a thing made by hands is no god.'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:8 — *they that make them are like unto them; so is every one that trusteth in them* the lifeless *gods many, and lords many* that *are called gods* (1 Corinthians 8:5).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *they that make a graven image are all of them vanity... they see not, nor know* the workman''s vanity behind *an idol is nothing in the world* (1 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:17 — *the residue thereof he maketh a god... and saith, Deliver me; for thou art my god* the carved block that cannot save, the no-gods only *called gods* (1 Corinthians 8:5).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 13:10 — *in dead things is their hope, who call them gods, which are the works of men''s hands... a stone good for nothing* the library''s witness that *an idol is nothing in the world* (1 Corinthians 8:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 14:8 — *that which is made with hands is cursed... being corruptible, it was called god* a name laid on perishable wood, the *gods many* only *called gods* (1 Corinthians 8:5).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-an-idol-is-nothing-in-the-world-the-gods-of-wood-and-stone-psalm-115'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 14:13 — *that no man put a stumblingblock or an occasion to fall in his brother''s way* the same charge as *take heed lest... this liberty of yours become a stumblingblock to them that are weak* (1 Corinthians 8:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 14:15 — *Destroy not him with thy meat, for whom Messiah (Christ) died* nearly verbatim with *the weak brother perish, for whom Messiah (Christ) died* (1 Corinthians 8:11).'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 14:21 — *It is good neither to eat flesh... nor any thing whereby thy brother stumbleth* the rule Paul keeps: *I will eat no flesh while the world standeth, lest I make my brother to offend* (1 Corinthians 8:13) — love laying down liberty, not abolishing a food-law.'
  FROM cross_reference_threads t, cross_references x, _s228_co08_lookup sv, _s228_co08_lookup tv
 WHERE t.slug='1-corinthians-8-the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
