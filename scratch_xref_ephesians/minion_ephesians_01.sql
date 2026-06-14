-- ----- fragment: minion_ephesians_01.sql (S230 Ephesians 1) -----
-- =====================================================================
-- S230 minion — EPHESIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 1 (23 verses). Tag: ep01 (temp view _s230_ep01_lookup).
-- Sort band: floor 7400, step 3 (7400, 7403, 7406, 7409, 7412 used; under 7425).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the RE-GATHERING of the one olive tree, not a new institution).
-- Chapter 1 opens the letter on the eternal counsel: the assembly is the called-out, chosen seed —
-- the same set-apart people Yahuah (LORD) chose at Sinai (Deut 7:6-8), Yahuah''s portion and the lot
-- of his inheritance (Deut 32:9). The *mystery of his will* is to *gather together in one all things
-- in Messiah (Christ)* (1:10) — the two-house regathering of Ezekiel 37 (the two sticks made one
-- nation) and Hosea 1:10-11 (the children of the living Elohim gathered under one head), NOT a Church
-- that replaced Israel. The *sealing with the holy Spirit of promise* (1:13-14) is the Spirit put
-- within of Ezekiel 36:27 — the covenant promise, the earnest of the inheritance. The Christology is
-- the Formed: *the Elohim (God) of our Lord Yahusha HaMashiach* (1:17) is the Father, the One, who
-- raised the Formed Son and *set him at his own right hand* (1:20, Psalm 110:1) and *put all things
-- under his feet* (1:22, Psalm 8:6) — the Father distinguished from the Formed Son who bears the
-- name; no co-equal-persons grammar, no modalist collapse.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   greeting / blessed with all spiritual blessings
--           Tanakh: none warranted (the chosen-people weight lands at v.4)
--           Extras: none warranted   NT: none warranted (carried in prose)
--   v.4-6,11,14 chosen before the foundation / predestinated unto adoption / the inheritance
--           Tanakh: Deuteronomy 7:6-8 (chosen to be a special people), Deuteronomy 32:9 (the LORD''S
--                   portion is his people; Jacob is the lot of his inheritance)
--           Extras: none warranted   NT: Romans 8:15 (the Spirit of adoption) [carried in seal thread]
--   v.9-10  the mystery of his will: gather together in one all things in Messiah
--           Tanakh: Ezekiel 37:16-22 (the two sticks made one nation, one king), Hosea 1:10-11 (the
--                   sons of the living Elohim, Judah and Israel gathered, one head)
--           Extras: none warranted   NT: Colossians 1:20 (to reconcile all things unto himself)
--   v.13-14 sealed with that holy Spirit of promise, the earnest of our inheritance
--           Tanakh: Ezekiel 36:27 (I will put my spirit within you)
--           Extras: none warranted   NT: Romans 8:15-16 (the Spirit of adoption beareth witness)
--   v.17-18 the spirit of wisdom and revelation / the eyes of your understanding enlightened
--           Tanakh: none warranted (the explicit parallel is the wisdom-library witness)
--           Extras: Wisdom of Solomon 7:7 (the spirit of wisdom came to me), 9:17 (send thy Holy
--                   Spirit from above)   NT: none warranted
--   v.19-23 raised and set at his right hand / all things under his feet / head over all
--           Tanakh: Psalm 110:1 (Sit thou at my right hand), Psalm 8:6 (thou hast put all things
--                   under his feet)
--           Extras: none warranted   NT: 1 Corinthians 15:27 (he hath put all things under his feet)
--
-- THREADS (slug -> target libraries):
--   7400 ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7   (Tanakh)
--   7403 ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37          (Tanakh + NT)
--   7406 ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36 (Tanakh + NT)
--   7409 ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7    (Extras)
--   7412 ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110            (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s230_ep01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7
  ('canon', 'ephesians', 1, 4, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). The choosing Paul writes of is no new act: at Sinai Yahuah (LORD) *chose* his people *to be a special people unto himself.* So Paul: *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love* (Ephesians 1:4). The *holy people* of Deuteronomy and the *holy and without blame* of Ephesians are one calling — the set-apart seed chosen from of old, now gathered in Messiah (Christ), not a people swapped for another.'),
  ('canon', 'ephesians', 1, 4, 'canon', 'deuteronomy', 7, 7, 'free', E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). The election rests on his love and good pleasure, not on the worth of the chosen — *not... because ye were more in number.* Paul says the same of the assembly: chosen *before the foundation of the world* (Ephesians 1:4), *according to the good pleasure of his will* (Ephesians 1:5). The pattern of grace is unchanged — Yahuah (LORD) sets his love on a people for his own name''s sake, then and now.'),
  ('canon', 'ephesians', 1, 5, 'canon', 'deuteronomy', 32, 9, 'free', E'*For the LORD’S portion is his people; Jacob is the lot of his inheritance.* (Deuteronomy 32:9). In the song of Moses Yashar''el (Israel) is named Yahuah (LORD)''s own *portion,* Jacob *the lot of his inheritance.* Paul takes up that very language of sonship and inheritance: *Having predestinated us unto the adoption of children by Yahusha HaMashiach (Jesus Christ) to himself* (Ephesians 1:5), and *In whom also we have obtained an inheritance* (Ephesians 1:11). The adopted children and the obtained inheritance are the people who were always his lot; the seed of Jacob, gathered and grafted, remain the portion of Yahuah (LORD).'),
  ('canon', 'ephesians', 1, 11, 'canon', 'deuteronomy', 32, 9, 'free', E'*For the LORD’S portion is his people; Jacob is the lot of his inheritance.* (Deuteronomy 32:9). Moses sang that the people are Yahuah (LORD)''s *portion* and Jacob *the lot of his inheritance.* Paul declares *In whom also we have obtained an inheritance, being predestinated according to the purpose of him who worketh all things after the counsel of his own will* (Ephesians 1:11). The inheritance is two-sided in one covenant: the people are his inheritance, and they obtain an inheritance in him — the gathered seed brought into the portion that was Jacob''s from of old.'),
  -- thread: ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37
  ('canon', 'ephesians', 1, 10, 'canon', 'ezekiel', 37, 17, 'free', E'*And join them one to another into one stick; and they shall become one in thine hand.* (Ezekiel 37:17). Yahuah (LORD) bade Ezekiel join the two sticks — Yahudah (Judah) and Joseph/Ephraim — *into one stick.* This is the very mystery Paul unveils: *That in the dispensation of the fulness of times he might gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth* (Ephesians 1:10). The gathering-into-one of Ephesians is the joining-into-one of Ezekiel — the two houses made one in the hand of Yahuah (LORD), now consummated in Messiah (Christ).'),
  ('canon', 'ephesians', 1, 10, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). The promise is one nation under one king — *no more two nations.* Paul names the same end: *that... he might gather together in one all things in Messiah (Christ)* (Ephesians 1:10). The *gather together in one* is the making of the divided houses into *one nation... one king* — Messiah (Christ) the one head over the regathered people, the two kingdoms divided no more.'),
  ('canon', 'ephesians', 1, 10, 'canon', 'hosea', 1, 11, 'free', E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel.* (Hosea 1:11). Hosea foretells Judah and Israel *gathered together* under *one head.* Paul proclaims it accomplished: *he might gather together in one all things in Messiah (Christ)* (Ephesians 1:10). The *gathered together* of Hosea is the *gather together in one* of Ephesians, and the *one head* is Messiah (Christ), who is *the head over all things to the church* (Ephesians 1:22) — the day of Jezreel come.'),
  ('canon', 'ephesians', 1, 10, 'canon', 'colossians', 1, 20, 'free', E'*And, having made peace through the blood of his cross, by him to reconcile all things unto himself; by him, I say, whether they be things in earth, or things in heaven.* (Colossians 1:20). The twin letter says the same: *to reconcile all things unto himself... whether they be things in earth, or things in heaven.* Paul to the Ephesians: *gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth* (Ephesians 1:10). The gathering-into-one and the reconciling-of-all-things are one work of the one Messiah (Christ) — peace made through his blood, the sundered brought home.'),
  -- thread: ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36
  ('canon', 'ephesians', 1, 13, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The promised Spirit is the Spirit *put within* to *cause you to walk in my statutes.* Paul says it is given and sealed: *after that ye believed, ye were sealed with that holy Spirit of promise* (Ephesians 1:13). It is *that holy Spirit of promise* — the promise of Ezekiel — and its working is not the abolishing of the Instruction but the writing of it within, that the gathered may walk in his statutes and keep his judgments.'),
  ('canon', 'ephesians', 1, 14, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The Spirit put within is the down-payment of all the covenant promised. Paul calls it so: the holy Spirit *Which is the earnest of our inheritance until the redemption of the purchased possession* (Ephesians 1:14). The indwelling Spirit of Ezekiel 36 is the *earnest* — the first instalment of the inheritance, the pledge that the One who began the regathering will finish it unto the redemption of his purchased people.'),
  ('canon', 'ephesians', 1, 13, 'canon', 'romans', 8, 15, 'free', E'*For ye have not received the spirit of bondage again to fear; but ye have received the Spirit of adoption, whereby we cry, Abba, Father.* (Romans 8:15). The same Spirit that seals is the *Spirit of adoption.* Paul to the Ephesians joins the sealing to the adoption and inheritance: *ye were sealed with that holy Spirit of promise* (Ephesians 1:13), the earnest of the inheritance of those *predestinated... unto the adoption of children* (Ephesians 1:5). The Spirit that cries *Abba, Father* is the seal upon the sons brought home — the witness that the gathered are indeed the children of Elohim (God).'),
  -- thread: ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7
  ('canon', 'ephesians', 1, 17, 'apocrypha', 'the-wisdom-of-solomon', 7, 7, 'extras', E'*Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me.* (Wisdom of Solomon 7:7). The wisdom-library witnesses that the *spirit of wisdom* is asked of Yahuah (God) and given. Paul prays the same gift for the assembly: *That the Elohim (God) of our Lord Yahusha HaMashiach (Lord Jesus Christ), the Father of glory, may give unto you the spirit of wisdom and revelation in the knowledge of him* (Ephesians 1:17). The *spirit of wisdom* Solomon prayed for is the *spirit of wisdom and revelation* Paul prays be given — wisdom not gathered by the flesh but sent down from the Father of glory.'),
  ('canon', 'ephesians', 1, 18, 'apocrypha', 'the-wisdom-of-solomon', 9, 17, 'extras', E'*And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom of Solomon 9:17). None can know the counsel of Yahuah (God) *except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above.* So the eyes of understanding are opened only from above: Paul prays *The eyes of your understanding being enlightened; that ye may know what is the hope of his calling* (Ephesians 1:18). The enlightening of the eyes is the sending of the Spirit and the giving of wisdom from above — the same descent of revelation the wisdom-library confessed, that the gathered may know the hope of his calling.'),
  -- thread: ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110
  ('canon', 'ephesians', 1, 20, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). David heard Yahuah (LORD) say to his Lord, *Sit thou at my right hand.* Paul declares it done in the raising of Messiah (Christ): *when he raised him from the dead, and set him at his own right hand in the heavenly places* (Ephesians 1:20). The right-hand seat of the psalm is the Formed Son''s seat — the Father (the One) exalting the Son he raised; and the enemies made a footstool are the *all things* put *under his feet* (Ephesians 1:22).'),
  ('canon', 'ephesians', 1, 22, 'canon', 'psalms', 8, 6, 'free', E'*Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* (Psalm 8:6). The psalm of the son of Adam crowned with glory says *thou hast put all things under his feet.* Paul applies it to the risen Messiah (Christ): *And hath put all things under his feet, and gave him to be the head over all things to the church* (Ephesians 1:22). The dominion granted to man in Psalm 8 is fulfilled in the One who is *far above all principality, and power, and might, and dominion* (Ephesians 1:21) — all things under the feet of the Formed Son, head over all to his gathered body.'),
  ('canon', 'ephesians', 1, 22, 'canon', '1-corinthians', 15, 27, 'free', E'*For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him.* (1 Corinthians 15:27). Paul elsewhere quotes the same psalm and guards the Christology: *all things are put under him,* yet *he is excepted, which did put all things under him* — the Father is not subjected. So in Ephesians: the Father *raised him from the dead, and set him at his own right hand* and *hath put all things under his feet* (Ephesians 1:20,22). The One who puts all under the Son''s feet is the Father, the One; the Son under whose feet all is put is the Formed — distinguished, not collapsed, not co-equal-persons but the Father exalting the Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7',
       E'Chosen in him before the foundation of the world (Deuteronomy 7, 32)',
       E'Paul opens the letter at the eternal counsel: *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love: Having predestinated us unto the adoption of children by Yahusha HaMashiach (Jesus Christ) to himself, according to the good pleasure of his will* (Ephesians 1:4-5). This choosing is no new act and no new people. At Sinai Yahuah (LORD) had already said, *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6) — and the ground of it was his love, not their worth: *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7). The *holy people* chosen *according to the good pleasure of his will* are one calling across the covenant. And the inheritance language is Moses'' own: *For the LORD’S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). Paul says of the assembly *In whom also we have obtained an inheritance, being predestinated according to the purpose of him who worketh all things after the counsel of his own will* (Ephesians 1:11). The people who were always his portion are the adopted children who obtain an inheritance in him — the seed of Jacob gathered and grafted, not a people swapped for another. The choosing before the foundation is the unfolding of the same love Yahuah (LORD) set on his special people of old.',
       sv.verse_id, ev.verse_id, 'free', 7400
  FROM _s230_ep01_lookup sv, _s230_ep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37',
       E'The mystery of his will: to gather together in one all things in Messiah (Ezekiel 37, Hosea 1)',
       E'The heart of the chapter is the unveiled mystery: *Having made known unto us the mystery of his will, according to his good pleasure which he hath purposed in himself: That in the dispensation of the fulness of times he might gather together in one all things in Messiah (Christ), both which are in heaven, and which are on earth; even in him* (Ephesians 1:9-10). The *gather together in one* is the prophets'' regathering of the divided house. Yahuah (LORD) bade Ezekiel take two sticks — Yahudah (Judah) and Joseph/Ephraim — and *join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17), with the promise *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Hosea spoke the same: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The two houses *gathered together* under *one head* and *one king* — this is what Paul says is now being *gathered together in one all things in Messiah (Christ),* who is *the head over all things to the church* (Ephesians 1:22). The twin letter names the same work: *having made peace through the blood of his cross, by him to reconcile all things unto himself... whether they be things in earth, or things in heaven* (Colossians 1:20). The mystery is not a new institution replacing Israel but the re-gathering of the one people — Judah and scattered Israel, with the nations grafted in — made one in the hand of Yahuah (LORD), one nation under the one Messiah (Christ).',
       sv.verse_id, ev.verse_id, 'free', 7403
  FROM _s230_ep01_lookup sv, _s230_ep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36',
       E'Sealed with that holy Spirit of promise, the earnest of our inheritance (Ezekiel 36)',
       E'*In whom ye also trusted, after that ye heard the word of truth, the gospel of your salvation: in whom also after that ye believed, ye were sealed with that holy Spirit of promise, Which is the earnest of our inheritance until the redemption of the purchased possession, unto the praise of his glory* (Ephesians 1:13-14). Mark the words *that holy Spirit of promise* — the Spirit was promised, and the promise is Ezekiel''s: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit is *put within,* and its working is not the abolishing of the Instruction but the writing of it on the heart, that the gathered may walk in his statutes and keep his judgments. This indwelling Spirit is the *earnest* — the down-payment, the first instalment of the whole inheritance, the pledge that the One who began the regathering will finish it *until the redemption of the purchased possession.* And it is the Spirit of sonship: *ye have received the Spirit of adoption, whereby we cry, Abba, Father* (Romans 8:15). The seal of the Spirit is laid upon the very ones *predestinated... unto the adoption of children* (Ephesians 1:5) — the Spirit put within of Ezekiel 36, sealing the children brought home, the earnest of all that Yahuah (LORD) has promised his gathered people.',
       sv.verse_id, ev.verse_id, 'free', 7406
  FROM _s230_ep01_lookup sv, _s230_ep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7',
       E'The spirit of wisdom and revelation, the eyes of understanding enlightened (Wisdom of Solomon 7, 9)',
       E'Paul prays for the assembly a gift that comes only from above: *That the Elohim (God) of our Lord Yahusha HaMashiach (Lord Jesus Christ), the Father of glory, may give unto you the spirit of wisdom and revelation in the knowledge of him: The eyes of your understanding being enlightened; that ye may know what is the hope of his calling, and what the riches of the glory of his inheritance in the saints* (Ephesians 1:17-18). The wisdom-library had confessed this same descent of wisdom from the Father of glory. Solomon prayed and received: *Wherefore I prayed, and understanding was given me: I called upon Yahuah (God), and the spirit of wisdom came to me* (Wisdom of Solomon 7:7) — the *spirit of wisdom* asked of Yahuah (God) and given, not gathered by the flesh. And he confessed that none can know the counsel of Yahuah (God) apart from this sending: *And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom of Solomon 9:17). The enlightening of the eyes of understanding is exactly that — the giving of wisdom and the sending of the Spirit from above, that the gathered may know the hope of his calling and the riches of his inheritance. What Solomon prayed for, Paul prays the Father of glory would give to the whole assembly.',
       sv.verse_id, ev.verse_id, 'extras', 7409
  FROM _s230_ep01_lookup sv, _s230_ep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110',
       E'Raised and set at his right hand, all things under his feet (Psalm 110, Psalm 8)',
       E'Paul shows *the exceeding greatness of his power... Which he wrought in Messiah (Christ), when he raised him from the dead, and set him at his own right hand in the heavenly places, Far above all principality, and power, and might, and dominion... And hath put all things under his feet, and gave him to be the head over all things to the church* (Ephesians 1:19-22). Two psalms are gathered into this exaltation. The right-hand seat is David''s oracle: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1) — the Father (the One) speaking to the Lord, the Formed Son, seating him at his right hand. And the all-things-under-his-feet is the psalm of dominion: *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalm 8:6). Paul elsewhere quotes that same psalm and guards the Christology with care: *For he hath put all things under his feet. But when he saith all things are put under him, it is manifest that he is excepted, which did put all things under him* (1 Corinthians 15:27). The One who raises the Son, seats him at the right hand, and puts all things under his feet is the Father; the Son raised, seated, and exalted is the Formed — distinguished from the Father, not collapsed into him and not a second co-equal person, but the Son whom the Father exalted far above every name, head over all things to his gathered body.',
       sv.verse_id, ev.verse_id, 'free', 7412
  FROM _s230_ep01_lookup sv, _s230_ep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* the Sinai choosing; *he hath chosen us in him before the foundation of the world* (Ephesians 1:4).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — *Yahuah (LORD) did not set his love upon you... because ye were more in number* election grounded in his love, not their worth; chosen *according to the good pleasure of his will* (Ephesians 1:4-5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:9 — *the LORD’S portion is his people; Jacob is the lot of his inheritance* the people as his inheritance; *predestinated us unto the adoption of children* (Ephesians 1:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:9 — *Jacob is the lot of his inheritance* the obtained inheritance is the portion that was Jacob''s; *In whom also we have obtained an inheritance* (Ephesians 1:11).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-chosen-in-him-before-the-foundation-the-lot-of-his-inheritance-deuteronomy-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:17 — *join them one to another into one stick; and they shall become one in thine hand* the two sticks made one; *gather together in one all things in Messiah (Christ)* (Ephesians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:22 — *one nation... and one king shall be king to them all... no more two nations* the divided houses made one; the regathering Paul names *gather together in one* (Ephesians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 1:11 — *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* the two houses under one head; Messiah (Christ) *the head over all things* (Ephesians 1:10,22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 1:20 — *by him to reconcile all things unto himself... whether they be things in earth, or things in heaven* the twin letter''s same work; *all things in Messiah (Christ), both which are in heaven, and which are on earth* (Ephesians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-mystery-to-gather-together-in-one-all-things-in-messiah-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the promised indwelling Spirit; *ye were sealed with that holy Spirit of promise* (Ephesians 1:13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — *I will put my spirit within you* the Spirit put within is the down-payment; the Spirit *Which is the earnest of our inheritance* (Ephesians 1:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:15 — *ye have received the Spirit of adoption, whereby we cry, Abba, Father* the sealing Spirit is the Spirit of sonship; the seal on those *predestinated... unto the adoption of children* (Ephesians 1:5,13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-sealed-with-the-holy-spirit-of-promise-the-earnest-of-the-inheritance-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:7 — *I called upon Yahuah (God), and the spirit of wisdom came to me* wisdom asked and given from above; *may give unto you the spirit of wisdom and revelation* (Ephesians 1:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 9:17 — *except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above* the counsel known only by the Spirit sent down; *the eyes of your understanding being enlightened* (Ephesians 1:18).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-the-spirit-of-wisdom-and-revelation-the-eyes-enlightened-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* the Father seating the Formed Son; *raised him from the dead, and set him at his own right hand* (Ephesians 1:20).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 8:6 — *thou hast put all things under his feet* the dominion of the son of Adam; *hath put all things under his feet, and gave him to be the head over all things* (Ephesians 1:22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:27 — *he hath put all things under his feet... he is excepted, which did put all things under him* the Father not subjected; the Formed Son under whose feet all is put (Ephesians 1:22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep01_lookup sv, _s230_ep01_lookup tv
 WHERE t.slug='ephesians-1-raised-and-set-at-his-right-hand-all-things-under-his-feet-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
