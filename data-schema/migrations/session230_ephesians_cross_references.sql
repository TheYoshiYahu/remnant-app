-- =====================================================================
-- Session 230 — Ephesians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session230_ephesians_cross_references.sql
-- =====================================================================

\echo 'session230 — Ephesians cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_ephesians_03.sql (S230 Ephesians 3) -----
-- =====================================================================
-- S230 minion — EPHESIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 3 (21 verses) — the mystery made known / the Gentiles
--   fellowheirs and of the same body / the manifold wisdom of Elohim / rooted
--   and grounded in love.
-- Tag: ep03 (temp view _s230_ep03_lookup).
-- Sort band: floor 7450, step 3 (7450, 7453, 7456 used; under 7475).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-
--   canonical + NT, woven. Tiers per-row: canon target (Tanakh + NT) = 'free';
--   extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: this chapter is allusive and pastoral. The load-bearing
--   line is 3:6 — *That the Gentiles should be fellowheirs, and of the same
--   body, and partakers of his promise in Messiah (Christ) by the gospel* — the
--   nations brought INTO the one body, the commonwealth of Yashar'el (Israel),
--   the olive tree of Romans 11, NOT a new people replacing Israel. The
--   "mystery hid from ages now revealed" (3:3-9) is the regathering made known,
--   the same promise to Abraham (Genesis 12:3, 22:18 — in thy seed shall all
--   nations be blessed) opened to the grafted-in seed. "None warranted" is
--   recorded honestly for the pastoral blocks with no genuine root.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--   v.1-9   the mystery made known: Gentiles fellowheirs of the same body
--           Tanakh: Genesis 12:3 (in thee shall all families of the earth be
--                   blessed), Genesis 22:18 (in thy seed shall all the nations
--                   of the earth be blessed) — the seed-promise the mystery
--                   opens to the nations
--           Extras: none warranted (the mystery-of-wisdom extras weight carried
--                   at v.10 / Wisdom 7)
--           NT: Romans 11:17,25 (the wild olive graffed in; the fulness of the
--               Gentiles, the mystery), Colossians 1:26-27 (the mystery hid
--               from ages, made known among the Gentiles, Messiah in you)
--   v.10-11 the manifold wisdom of Elohim made known by the church
--           Tanakh: none warranted (the depth-of-wisdom doxology root is NT,
--                   Romans 11:33)
--           Extras: Wisdom of Solomon 7:22 (in her is an understanding spirit
--                   holy, one only, manifold) — the manifold wisdom re-spoken
--           NT: Romans 11:33 (O the depth of the riches both of the wisdom and
--               knowledge of Elohim), Colossians 2:2-3 (the mystery of Elohim,
--               in whom are hid all the treasures of wisdom and knowledge)
--   v.12-13 boldness and access with confidence; faint not at my tribulations
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (pastoral; access-by-faith carried in prose, not a load-bearing thread)
--   v.14-15 the Father of whom the whole family in heaven and earth is named
--           Tanakh: none warranted (allusive; the one-Father weight belongs to
--                   ch4's Shema thread, not forced here)
--           Extras: none warranted   NT: none warranted
--   v.16-19 strengthened in the inner man; Messiah dwell in your hearts; rooted
--           and grounded in love; the breadth, length, depth, height
--           Tanakh: Jeremiah 17:7-8 (blessed is the man that trusteth in Yahuah
--                   ... as a tree planted by the waters, and that spreadeth out
--                   her roots by the river)
--           Extras: none warranted
--           NT: Colossians 2:6-7 (rooted and built up in him, and stablished
--               in the faith)
--   v.20-21 the doxology: glory in the church throughout all ages
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (doxology; folded into the rooted-and-grounded thread's close in prose)
--
-- THREADS (slug -> target libraries):
--   7450 ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12  (Tanakh + NT)
--   7453 ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7    (Tanakh-none + Extras + NT)
--   7456 ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17          (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s230_ep03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12
  ('canon', 'ephesians', 3, 6, 'canon', 'genesis', 12, 3, 'free', E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* (Genesis 12:3). The mystery Paul unveils is no new thing but the promise sworn to Abram: *in thee shall all families of the earth be blessed.* When he writes *That the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ) by the gospel* (Ephesians 3:6), the nations are not made a separate people but brought INTO the families blessed in Abraham — *partakers of his promise,* heirs of the covenant already given. The blessing of all families is the gathering of the nations into the one commonwealth, the promise opened, not annulled.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'genesis', 22, 18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice.* (Genesis 22:18). On Moriah Yahuah (LORD) swore the promise through the seed: *in thy seed shall all the nations of the earth be blessed.* Paul names this the mystery now made known — *the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ)* (Ephesians 3:6). The seed in whom all nations are blessed is Messiah (Christ); the nations made *fellowheirs* are the families gathered into Abraham''s blessing through him, INTO the body, not in place of it.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'romans', 11, 17, 'free', E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree;* (Romans 11:17). Paul''s own figure for what he calls the mystery: the nations are *a wild olive tree* graffed *in among* the natural branches, made to *partake of the root and fatness of the olive tree.* This is exactly what *fellowheirs, and of the same body, and partakers of his promise* (Ephesians 3:6) means — the Gentiles grafted INTO the one tree, sharing the one root, never a second tree planted beside it. The mystery is the regathering of the olive tree, not its replacement.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'romans', 11, 25, 'free', E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in.* (Romans 11:25). Paul names the very same secret a *mystery* in both letters: here, *the fulness of the Gentiles* coming in while a partial blindness rests on Yashar''el (Israel) until *all Yashar''el (Israel) shall be saved.* In Ephesians it is *the mystery... That the Gentiles should be fellowheirs, and of the same body* (Ephesians 3:6). One mystery, one in-gathering: the nations brought in, and Yashar''el (Israel) not cast away but received — the two made one people in the one body.'),
  ('canon', 'ephesians', 3, 5, 'canon', 'colossians', 1, 26, 'free', E'*Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints:* (Colossians 1:26). The twin letter speaks Ephesians'' word almost verbatim: the mystery *hid from ages and from generations, but now is made manifest.* Paul writes that it *in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit* (Ephesians 3:5). The same hidden-then-revealed secret stands behind both — the long-kept counsel of Elohim (God) now unveiled to his gathered people.'),
  ('canon', 'ephesians', 3, 6, 'canon', 'colossians', 1, 27, 'free', E'*To whom Elohim (God) would make known what is the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory:* (Colossians 1:27). Colossians spells out the content of the mystery: *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you.* Ephesians names the same — *the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ)* (Ephesians 3:6). The nations are not given a lesser portion but Messiah (Christ) himself dwelling among them, the whole hope of glory, as members of the one body.'),
  -- thread: ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7
  ('canon', 'ephesians', 3, 10, 'apocrypha', 'the-wisdom-of-solomon', 7, 22, 'extras', E'*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good,* (Wisdom of Solomon 7:22). The restored library already named the wisdom of Yahuah (God) *manifold* — *in her is an understanding spirit holy, one only, manifold.* Paul says it is *to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10). The one wisdom that is the worker of all things, of many facets, is now displayed through the gathered assembly before the powers of the heavenlies — the same manifold wisdom, unveiled in the regathering.'),
  ('canon', 'ephesians', 3, 10, 'canon', 'romans', 11, 33, 'free', E'*O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). Paul closes the olive-tree mystery with this very cry: *the depth of the riches both of the wisdom and knowledge of Elohim (God).* It is the wisdom Ephesians says is now *known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10). The unsearchable wisdom that ordered the in-gathering of the nations and the receiving of Yashar''el (Israel) is the manifold wisdom the assembly now puts on display — one wisdom, depth past finding out, made known through the gathered people.'),
  ('canon', 'ephesians', 3, 9, 'canon', 'colossians', 2, 2, 'free', E'*That their hearts might be comforted, being knit together in love, and unto all riches of the full assurance of understanding, to the acknowledgement of the mystery of Elohim (God), and of the Father, and of Messiah (Christ);* (Colossians 2:2). The twin letter joins the same words Ephesians joins — *the mystery of Elohim (God),* hearts *knit together in love* (the rooted-and-grounded love of the next thread). Paul''s charge *to make all men see what is the fellowship of the mystery, which from the beginning of the world hath been hid in Elohim (God)* (Ephesians 3:9) is the same unveiling: the hidden counsel of Elohim (God), now acknowledged by the gathered.'),
  ('canon', 'ephesians', 3, 10, 'canon', 'colossians', 2, 3, 'free', E'*In whom are hid all the treasures of wisdom and knowledge.* (Colossians 2:3). In Messiah (Christ), says the twin letter, *are hid all the treasures of wisdom and knowledge* — and Ephesians says that *manifold wisdom of Elohim (God)* (Ephesians 3:10) is now *known by the church.* The treasures hidden in Messiah (Christ) are the treasures the assembly displays before the principalities and powers; the wisdom kept secret from ages is the wisdom now made known through the gathered body.'),
  -- thread: ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17
  ('canon', 'ephesians', 3, 17, 'canon', 'jeremiah', 17, 7, 'free', E'*Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is.* (Jeremiah 17:7). Jeremiah''s blessing falls on the one whose trust and hope are fixed in Yahuah (LORD) — the very posture Paul prays for: *That Messiah (Christ) may dwell in your hearts by faith; that ye, being rooted and grounded in love* (Ephesians 3:17). The man who trusts in Yahuah (LORD) is the man rooted in him; the faith by which Messiah (Christ) dwells in the heart is the trust on which Jeremiah pronounces the blessing.'),
  ('canon', 'ephesians', 3, 17, 'canon', 'jeremiah', 17, 8, 'free', E'*For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river, and shall not see when heat cometh, but her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit.* (Jeremiah 17:8). The one who trusts in Yahuah (LORD) is *as a tree planted by the waters, and that spreadeth out her roots by the river* — the very image Paul reaches for: *being rooted and grounded in love* (Ephesians 3:17). The roots driven down to the river that never fails in drought are the roots driven down into the love of Messiah (Christ), which passeth knowledge; the rooted tree bears its leaf green and its fruit unceasing because it draws from the living water.'),
  ('canon', 'ephesians', 3, 17, 'canon', 'colossians', 2, 7, 'free', E'*Rooted and built up in him, and stablished in the faith, as ye have been taught, abounding therein with thanksgiving.* (Colossians 2:7). The twin letter prays the same prayer in the same words: the saints *rooted and built up in him, and stablished in the faith.* Ephesians has *rooted and grounded in love* (Ephesians 3:17). The root and the foundation are one figure in both — the believer planted and built upon Messiah (Christ), grounded in love, that the whole household may stand and grow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12',
       E'The mystery made known: the Gentiles fellowheirs of the same body (Genesis 12, 22; Romans 11)',
       E'Paul calls it the mystery — *How that by revelation he made known unto me the mystery* (Ephesians 3:3), the thing *which in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit* (Ephesians 3:5). But its content is no new institution. It is this: *That the Gentiles should be fellowheirs, and of the same body, and partakers of his promise in Messiah (Christ) by the gospel* (Ephesians 3:6) — the nations brought INTO the one body and the one promise, not made a people apart. And the promise they are made partakers of is the oldest in the covenant story: Yahuah (LORD) swore to Abram, *in thee shall all families of the earth be blessed* (Genesis 12:3), and on Moriah, *in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The seed in whom all nations are blessed is Messiah (Christ); the *fellowheirs* are the families gathered into Abraham''s blessing through him. Paul''s own figure for this is the olive tree: the nations are *a wild olive tree* graffed *in among* the natural branches, made *with them* to partake *of the root and fatness of the olive tree* (Romans 11:17) — grafted IN, sharing the one root, never a second tree planted beside it. He names the very same secret a mystery there too: *that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25), after which *all Yashar''el (Israel) shall be saved.* One mystery, one in-gathering — the nations brought in, and Yashar''el (Israel) not cast away but received. The twin letter says it almost verbatim: the mystery *hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26), *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory* (Colossians 1:27). The nations are given no lesser portion — Messiah (Christ) himself dwells among them, members of the one body. The mystery is the regathering of the one olive tree, the commonwealth of Yashar''el (Israel) opened, NOT the Church replacing Israel.',
       sv.verse_id, ev.verse_id, 'free', 7450
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7',
       E'The manifold wisdom of Elohim made known by the church (Wisdom of Solomon 7; Romans 11)',
       E'Paul lifts the eye from the assembly to the heavenlies: the mystery is unveiled *to the intent that now unto the principalities and powers in heavenly places might be known by the church the manifold wisdom of Elohim (God)* (Ephesians 3:10), *according to the eternal purpose which he purposed in HaMashiach Yahusha (Christ Jesus) our Lord* (Ephesians 3:11). The gathered people are the theatre in which the wisdom of Elohim (God) is displayed before the powers. And that wisdom is called *manifold* — of many facets, one and yet entering every age — exactly as the restored library named it: *in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled* (Wisdom of Solomon 7:22), *the worker of all things.* The one wisdom of many facets is now put on show through the assembly. Paul closes the olive-tree mystery with the same wonder: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33) — the unsearchable wisdom that ordered the in-gathering of the nations and the receiving of Yashar''el (Israel). The twin letter joins the same threads: the *mystery of Elohim (God),* in Messiah (Christ) *are hid all the treasures of wisdom and knowledge* (Colossians 2:2-3). The wisdom kept secret from ages, hidden in Messiah (Christ), is the manifold wisdom the gathered body now makes known — to men, and before the principalities and powers of the heavenlies.',
       sv.verse_id, ev.verse_id, 'extras', 7453
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17',
       E'Rooted and grounded in love: a tree planted by the waters (Jeremiah 17; Colossians 2)',
       E'Paul bows his knees and prays that the saints would *be strengthened with might by his Spirit in the inner man; That Messiah (Christ) may dwell in your hearts by faith; that ye, being rooted and grounded in love* (Ephesians 3:16-17), *may be able to comprehend with all saints what is the breadth, and length, and depth, and height; And to know the love of Messiah (Christ), which passeth knowledge* (Ephesians 3:18-19). The figure is the tree driven down to the living water. Jeremiah pronounced the blessing on the one whose trust is in Yahuah (LORD): *Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is. For he shall be as a tree planted by the waters, and that spreadeth out her roots by the river, and shall not see when heat cometh, but her leaf shall be green; and shall not be careful in the year of drought, neither shall cease from yielding fruit* (Jeremiah 17:7-8). The roots spread out to the river that never fails are the roots driven down into the love of Messiah (Christ) which passeth knowledge; the faith by which Messiah (Christ) dwells in the heart is the trust on which Jeremiah''s blessing rests. The twin letter prays the same prayer in the same words: *Rooted and built up in him, and stablished in the faith* (Colossians 2:7) — root and foundation are one figure, the believer planted and built upon Messiah (Christ). So Paul ends in doxology: *Now unto him that is able to do exceeding abundantly above all that we ask or think... Unto him be glory in the church by HaMashiach Yahusha (Christ Jesus) throughout all ages, world without end. Amen* (Ephesians 3:20-21) — the rooted tree bearing its fruit unceasing, the gathered people green in the year of drought because they draw from the love that passeth knowledge.',
       sv.verse_id, ev.verse_id, 'free', 7456
  FROM _s230_ep03_lookup sv, _s230_ep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:3 — *in thee shall all families of the earth be blessed* the Abrahamic promise the mystery opens; the Gentiles made *fellowheirs* brought INTO the families blessed in Abraham (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed* the Moriah oath; the seed is Messiah (Christ), the nations made *partakers of his promise* (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:17 — *a wild olive tree, wert graffed in among them... partakest of the root and fatness of the olive tree* Paul''s own figure; the Gentiles *of the same body* grafted INTO the one tree, not beside it (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:25 — *this mystery... until the fulness of the Gentiles be come in* the same secret named a mystery; the nations brought in and Yashar''el (Israel) received, the two made one (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:26 — *the mystery which hath been hid from ages and from generations, but now is made manifest* the twin letter''s near-verbatim word; *in other ages was not made known... now is revealed* (Ephesians 3:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Colossians 1:27 — *the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory* the content of the mystery; the nations given Messiah (Christ) himself, members of the one body (Ephesians 3:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-mystery-made-known-the-gentiles-fellowheirs-of-the-same-body-genesis-12'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:22 — *in her is an understanding spirit holy, one only, manifold* the restored library''s own word *manifold* for the wisdom of Yahuah (God); the *manifold wisdom of Elohim (God)* now known by the church (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)!* the wonder closing the olive-tree mystery; the unsearchable wisdom the assembly now displays (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 2:2 — *the mystery of Elohim (God), and of the Father, and of Messiah (Christ)* hearts *knit together in love*; the same unveiling Paul charges *to make all men see* (Ephesians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge* the treasures hidden in Messiah (Christ); the *manifold wisdom of Elohim (God)* the assembly displays before the powers (Ephesians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-the-manifold-wisdom-of-elohim-made-known-by-the-church-wisdom-of-solomon-7'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 17:7 — *Blessed is the man that trusteth in Yahuah (LORD), and whose hope Yahuah (LORD) is* the trust that roots the soul; the faith by which Messiah (Christ) dwells in the heart (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 17:8 — *as a tree planted by the waters, and that spreadeth out her roots by the river* the very image; *rooted and grounded in love,* drawing from the love that passeth knowledge (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 2:7 — *Rooted and built up in him, and stablished in the faith* the twin letter''s same root-and-foundation prayer; *rooted and grounded in love* (Ephesians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep03_lookup sv, _s230_ep03_lookup tv
 WHERE t.slug='ephesians-3-rooted-and-grounded-in-love-a-tree-planted-by-the-waters-jeremiah-17'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ephesians_04.sql (S230 Ephesians 4) -----
-- =====================================================================
-- S230 minion — EPHESIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 4 (32 verses) — the one body / one Spirit / one Yahuah / one faith / one
--   baptism / One Elohim and Father of all (the Shema); he ascended up on high, led captivity
--   captive, gave gifts unto men (Psalm 68:18); put off the old man, put on the new man created
--   in righteousness; be ye angry and sin not; grieve not the holy Spirit.
-- Tag: ep04 (temp view _s230_ep04_lookup).
-- Sort band: floor 7475, step 3 (7475, 7478, 7481, 7484 used; under 7500).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, Israel + the grafted-in seed
-- of the nations into ONE covenant people; same Yahuah, same Torah, same Yashar'el restored). Chapter
-- 4 is the unity charge built on the Shema: *One Elohim (God) and Father of all* (4:6) — the Father is
-- the One; Yahusha (Jesus) is the Formed Son who *ascended up far above all heavens* (4:10), bearing
-- the Psalm-68 ascent of Yahuah himself. No co-equal-persons grammar, no modalist collapse. The new
-- man *which after Elohim (God) is created in righteousness and true holiness* (4:24) is the renewed
-- obedience of the gathered, the image-of-Elohim restored — NOT a Torah abolished. The walk of unity
-- (lowliness, longsuffering, truth in love, putting away wrath, forgiving one another) is the
-- covenant ethic of the called-out ones, not a new morality replacing the old.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   walk worthy / keep the unity of the Spirit in the bond of peace
--           Tanakh: none warranted (the unity is carried by the Shema thread at v.4-6)
--           Extras: none warranted   NT: none warranted (Col 3:12-14 the same ethic, carried in prose)
--   v.4-6   one body, one Spirit, One Yahuah, one faith, one baptism, One Elohim and Father of all
--           Tanakh: Deuteronomy 6:4 (the Shema, Yahuah our Elohim is one Yahuah), Zechariah 14:9
--                   (one Yahuah, and his name one), Malachi 2:10 (have we not all one father?)
--           Extras: none warranted   NT: Mark 12:29 (the first commandment is the Shema)
--   v.7-10  he ascended up on high, led captivity captive, gave gifts unto men [EXPLICIT CITATION]
--           Tanakh: Psalm 68:18 (thou hast ascended on high, thou hast led captivity captive, thou
--                   hast received gifts for men)
--           Extras: none warranted   NT: none warranted (the citation is the Tanakh root)
--   v.11-16 he gave apostles, prophets... the body fitly joined, growing up into the head
--           Tanakh: none warranted (the body-as-one is carried by the Shema/one-body thread)
--           Extras: none warranted   NT: none warranted (1 Cor 12 the body already cross-linked
--                   from that book to Ephesians 4; not re-built here)
--   v.17-19 walk not as other Gentiles, the understanding darkened, alienated from the life of Elohim
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.20-24 put off the old man... put on the new man, created in righteousness and true holiness
--           Tanakh: Genesis 1:27 (Elohim created man in his own image)
--           Extras: none warranted   NT: Colossians 3:9-10 (put off the old man... put on the new
--                   man, renewed after the image of him that created him)
--   v.25-32 putting away lying / be ye angry and sin not / grieve not the Spirit / forgiving one another
--           Tanakh: Psalm 4:4 (Stand in awe, and sin not), Isaiah 63:10 (they vexed his holy Spirit)
--           Extras: Sirach (Ecclesiasticus) 28:2,6-7 (forgive your neighbour... abide in the
--                   commandments) and 28:8-12 (a furious man kindles strife; the spark of the mouth)
--           NT: none warranted (Col 3:8,13 the same put-away-wrath / forgive, carried in prose)
--
-- THREADS (slug -> target libraries):
--   7475 ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6   (Tanakh + NT)
--   7478 ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68  (Tanakh)
--   7481 ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1 (Tanakh + NT)
--   7484 ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4   (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6
  ('canon', 'ephesians', 4, 6, 'canon', 'deuteronomy', 6, 4, 'free', E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4). This is the Shema, the bedrock confession of Yashar''el (Israel) — Yahuah is one. Paul builds the unity of the gathered upon it: *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). The oneness of the body, the Spirit, the faith, and the baptism (Ephesians 4:4-5) flows from the oneness of the One — *One Yahuah (Lord)... One Elohim (God) and Father of all.* The Father is the One of the Shema; the Formed Son who *ascended up far above all heavens* (Ephesians 4:10) bears his name, not a second God beside him.'),
  ('canon', 'ephesians', 4, 5, 'canon', 'zechariah', 14, 9, 'free', E'*And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one.* (Zechariah 14:9). The prophet looks to the day when *there shall be one Yahuah (LORD), and his name one* — the whole earth gathered to the worship of the One. Paul declares that day''s confession already binding upon the called-out: *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5). The *one Yahuah (Lord)* of the assembly is the *one Yahuah (LORD)* whose name shall be one over all the earth; the unity of the gathered is the firstfruits of the kingdom Zechariah saw.'),
  ('canon', 'ephesians', 4, 6, 'canon', 'malachi', 2, 10, 'free', E'*Have we not all one father? hath not one Elohim (God) created us? why do we deal treacherously every man against his brother, by profaning the covenant of our fathers?* (Malachi 2:10). Malachi grounds the duty of brotherhood in the oneness of the Maker: *one father... one Elohim (God) created us.* Paul makes the same move toward unity: *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). Because there is *one father,* the brethren must not deal treacherously but *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3); the one Father is the ground of the one body.'),
  ('canon', 'ephesians', 4, 5, 'canon', 'mark', 12, 29, 'free', E'*And Yahusha (Jesus) answered him, The first of all the commandments is, Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord):* (Mark 12:29). When asked the first commandment, Yahusha (Jesus) named the Shema: *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord).* Paul speaks from the same first commandment when he sets *One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all* (Ephesians 4:5-6) as the ground of the body''s unity. The Master''s first word and the apostle''s charge are one confession — the oneness of Yahuah, the foundation of the one people.'),
  -- thread: ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68
  ('canon', 'ephesians', 4, 8, 'canon', 'psalms', 68, 18, 'free', E'*Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men; yea, for the rebellious also, that Yahuah Elohim (the LORD God) might dwell among them.* (Psalm 68:18). This is the very verse Paul cites: *Wherefore he saith, When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8). The Psalm sings the triumphal ascent of Yahuah (LORD) up the holy hill, leading captivity captive and receiving gifts — *that Yahuah Elohim (the LORD God) might dwell among them.* Paul reads the ascent as the Formed Son''s: *He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:10). The One who ascends in the Psalm to dwell among his people is the One who ascends in Ephesians to *fill all things,* and the gifts received are now given — *he gave some, apostles; and some, prophets* (Ephesians 4:11) — for the building of the one body.'),
  -- thread: ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1
  ('canon', 'ephesians', 4, 24, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). At the beginning *Elohim (God) created man in his own image.* The new man Paul calls the gathered to put on is that image restored: *that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The *new man* is no novelty but the original — man as Elohim (God) first made him, the image renewed in *righteousness and true holiness.* This is the renewed obedience of the covenant people, the creation-image brought back, not a law abolished.'),
  ('canon', 'ephesians', 4, 22, 'canon', 'colossians', 3, 9, 'free', E'*Lie not one to another, seeing that ye have put off the old man with his deeds;* (Colossians 3:9). The twin letter speaks the same charge: *put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). Paul tells the Ephesians the same — *put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22) and *put on the new man* (Ephesians 4:24). Both letters root the new man in *the image of him that created him* — the Genesis image restored; the old man put off, the renewed obedience put on.'),
  ('canon', 'ephesians', 4, 24, 'canon', 'colossians', 3, 10, 'free', E'*And have put on the new man, which is renewed in knowledge after the image of him that created him:* (Colossians 3:10). Colossians names the new man *renewed... after the image of him that created him* — pointing straight back to the creation image of Genesis. Ephesians says the same: *the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The two letters are one teaching: the new man is the created image of Elohim (God) renewed in the called-out ones, the righteousness and holiness for which man was first made.'),
  -- thread: ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4
  ('canon', 'ephesians', 4, 26, 'canon', 'psalms', 4, 4, 'free', E'*Stand in awe, and sin not: commune with your own heart upon your bed, and be still. Selah.* (Psalm 4:4). Paul takes up the Psalm''s very words: *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26). The Psalmist''s charge — *stand in awe, and sin not... commune with your own heart upon your bed, and be still* — is the discipline of anger that does not pass into sin, the heart quieted before the day is done. The apostle binds it to the unity of the body: wrath unchecked *give[s] place to the devil* (Ephesians 4:27); the Psalm''s stillness is the covenant ethic of the gathered.'),
  ('canon', 'ephesians', 4, 30, 'canon', 'isaiah', 63, 10, 'free', E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them.* (Isaiah 63:10). Isaiah remembers how Yashar''el (Israel) *rebelled, and vexed his holy Spirit.* Paul warns the gathered not to do the same: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30). The Spirit that was *put... within* the people of old (Isaiah 63:11) is the same Spirit of the sealing; to grieve him is to repeat the rebellion of the wilderness. The bitterness, wrath, and evil speaking of Ephesians 4:31 are the very grieving Isaiah names.'),
  ('canon', 'ephesians', 4, 32, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Ecclesiasticus 28:2). The Hebrew library teaches the forgiveness Paul commands: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven.* Ephesians says the same — *be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32). The forgiven forgive; the measure of mercy received is the measure shown to the neighbour, as Sirach (Ecclesiasticus) had long taught the gathered.'),
  ('canon', 'ephesians', 4, 31, 'apocrypha', 'ecclesiasticus', 28, 8, 'extras', E'*Abstain from strife, and you shall diminish your sins: for a furious man will kindle strife,* (Ecclesiasticus 28:8). Sirach (Ecclesiasticus) warns against the furious man who *will kindle strife,* and against the tongue: *If you blow the spark, it shall burn: if you spit upon it, it shall be quenched: and both these come out of your mouth* (Ecclesiasticus 28:12). Paul gathers the same wrath and the same mouth into his charge: *Let all bitterness, and wrath, and anger, and clamour, and evil speaking, be put away from you, with all malice* (Ephesians 4:31), and *Let no corrupt communication proceed out of your mouth* (Ephesians 4:29). The kindled strife and the burning spark of the tongue are what the new man puts away.'),
  ('canon', 'ephesians', 4, 26, 'apocrypha', 'ecclesiasticus', 28, 6, 'extras', E'*Remember your end, and let enmity cease; remember corruption and death, and abide in the commandments.* (Ecclesiasticus 28:6). The library counsels: *let enmity cease... and abide in the commandments,* and *Remember the commandments, and bear no malice to your neighbour* (Ecclesiasticus 28:7). Paul''s *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26) is the same wisdom — let the enmity cease before the day ends, abiding in the commandments. The covenant ethic of the gathered is no innovation; it is the Instruction the Hebrew library had long pressed upon the heart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6',
       E'One body, one Spirit, One Yahuah, One Elohim and Father of all — the Shema (Deuteronomy 6, Zechariah 14, Malachi 2)',
       E'Paul grounds the unity of the gathered in the oneness of the One: *There is one body, and one Spirit, even as ye are called in one hope of your calling; One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:4-6). This is the Shema, the bedrock confession of Yashar''el (Israel): *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). The prophet sang of the day it would fill the earth: *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — and the unity of the called-out is the firstfruits of that kingdom. Malachi draws the duty of brotherhood from the same root: *Have we not all one father? hath not one Elohim (God) created us? why do we deal treacherously every man against his brother, by profaning the covenant of our fathers?* (Malachi 2:10) — because there is one Father, the brethren must *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3). Yahusha (Jesus) himself named the Shema the first of all the commandments: *Hear, O Yashar''el (Israel); Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* (Mark 12:29). The Master''s first word and the apostle''s charge are one confession. Mark the Christology: the Father is the One — *One Elohim (God) and Father of all* — and the Formed Son who *ascended up far above all heavens, that he might fill all things* (Ephesians 4:10) bears his name and his work; not a second God beside him, not a co-equal-persons grammar, but the Formed drawn from the Formless. The oneness of Yahuah is the ground of the one body; the gathered are one because their Elohim (God) is one.',
       sv.verse_id, ev.verse_id, 'free', 7475
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68',
       E'When he ascended up on high, he led captivity captive, and gave gifts unto men (Psalm 68)',
       E'Paul cites a Psalm by name to declare the ascent of the Formed Son: *Wherefore he saith, When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8). The verse is Psalm 68: *Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men; yea, for the rebellious also, that Yahuah Elohim (the LORD God) might dwell among them* (Psalm 68:18). The Psalm sings the triumphal ascent of Yahuah (LORD) up the holy hill — leading captivity captive, receiving gifts, *that Yahuah Elohim (the LORD God) might dwell among them.* Paul reads that ascent as the Son''s own, framed by descent and ascent: *Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:9-10). The One who ascends in the Psalm to dwell among his people is the One who ascends in Ephesians to fill all things; and the gifts received above are now poured out below — *And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers; For the perfecting of the saints... for the edifying of the body of Messiah (Christ)* (Ephesians 4:11-12). The ascended Formed Son, bearing the very ascent Psalm 68 sang of Yahuah, gives the gifts that build the one body.',
       sv.verse_id, ev.verse_id, 'free', 7478
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1',
       E'Put off the old man, put on the new man created in righteousness — the image restored (Genesis 1, Colossians 3)',
       E'Paul calls the gathered to a change of nature: *That ye put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts; And be renewed in the spirit of your mind; And that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:22-24). The new man is no novelty — it is the original image restored. At the beginning *Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27); the new man *after Elohim (God) is created in righteousness and true holiness* is that creation-image renewed. The twin letter says the same in the same words, and names the source plainly: *Lie not one to another, seeing that ye have put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). Both letters root the new man in *the image of him that created him* — the Genesis image. This is the renewed obedience of the covenant people, the righteousness and holiness for which man was first made, brought back in the called-out ones — not a law abolished, but the image of Elohim (God) restored.',
       sv.verse_id, ev.verse_id, 'free', 7481
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4',
       E'Be ye angry, and sin not; grieve not the holy Spirit; forgive one another (Psalm 4, Isaiah 63, Sirach 28)',
       E'The walk of the new man is the covenant ethic of the gathered, drawn straight from the Hebrew library. Paul charges, *Be ye angry, and sin not: let not the sun go down upon your wrath: Neither give place to the devil* (Ephesians 4:26-27) — the very words of the Psalm: *Stand in awe, and sin not: commune with your own heart upon your bed, and be still. Selah* (Psalm 4:4), the anger that does not pass into sin, the heart quieted before the day is done. He warns, *grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30), echoing Isaiah''s memory of the wilderness rebellion: *But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy* (Isaiah 63:10) — the Spirit *put... within* the people then is the Spirit of the sealing now. And the put-away of *all bitterness, and wrath, and anger, and clamour, and evil speaking* (Ephesians 4:31) and the *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32) are the wisdom Sirach (Ecclesiasticus) had long pressed: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Ecclesiasticus 28:2); *Remember your end, and let enmity cease... and abide in the commandments* (Ecclesiasticus 28:6); and of the kindled strife and the burning tongue, *for a furious man will kindle strife* (Ecclesiasticus 28:8), *If you blow the spark, it shall burn... and both these come out of your mouth* (Ecclesiasticus 28:12). The forgiven forgive; the enmity ceases before the sun goes down; the new man abides in the commandments. None of this is innovation — it is the Instruction the whole library had long written upon the heart.',
       sv.verse_id, ev.verse_id, 'extras', 7484
  FROM _s230_ep04_lookup sv, _s230_ep04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* the Shema, ground of the body''s unity; *One Elohim (God) and Father of all* (Ephesians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 14:9 — *one Yahuah (LORD), and his name one* the day the One fills the earth; *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:10 — *Have we not all one father? hath not one Elohim (God) created us?* the one Father the ground of brotherhood; *keep the unity of the Spirit in the bond of peace* (Ephesians 4:3,6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Mark 12:29 — *Yahuah Eloheinu (The Lord our God) is one Yahuah (Lord)* Yahusha (Jesus) naming the Shema the first commandment; the same confession behind *One Yahuah (Lord)... One Elohim (God)* (Ephesians 4:5-6).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-one-body-one-spirit-one-lord-one-elohim-the-shema-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 68:18 — *Thou hast ascended on high, thou hast led captivity captive: thou hast received gifts for men* the verse Paul cites; *When he ascended up on high, he led captivity captive, and gave gifts unto men* (Ephesians 4:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-he-ascended-up-on-high-led-captivity-captive-gave-gifts-psalm-68'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *Elohim (God) created man in his own image* the original the new man restores; *the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 3:9 — *put off the old man with his deeds* the twin letter''s same charge; *put off... the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 3:10 — *the new man, which is renewed in knowledge after the image of him that created him* the Genesis image named; *created in righteousness and true holiness* (Ephesians 4:24).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-put-off-the-old-man-put-on-the-new-man-created-in-righteousness-genesis-1'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 4:4 — *Stand in awe, and sin not: commune with your own heart upon your bed, and be still* the anger that does not pass into sin; *Be ye angry, and sin not: let not the sun go down upon your wrath* (Ephesians 4:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 63:10 — *they rebelled, and vexed his holy Spirit* the wilderness rebellion; *grieve not the holy Spirit of Elohim (God), whereby ye are sealed* (Ephesians 4:30).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven* the forgiven forgive; *forgiving one another, even as Elohim (God)... hath forgiven you* (Ephesians 4:32).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 28:8 — *for a furious man will kindle strife* and *both these come out of your mouth* (28:12); *Let all bitterness, and wrath... and evil speaking, be put away* (Ephesians 4:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 28:6 — *let enmity cease... and abide in the commandments* and *bear no malice to your neighbour* (28:7); *let not the sun go down upon your wrath* (Ephesians 4:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep04_lookup sv, _s230_ep04_lookup tv
 WHERE t.slug='ephesians-4-be-ye-angry-and-sin-not-grieve-not-the-spirit-psalm-4'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ephesians_05.sql (S230 Ephesians 5) -----
-- =====================================================================
-- S230 minion — EPHESIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 5 (33 verses) — walk in love a sweetsmelling savour /
--          children of light / ★ THE BRIDEGROOM AND THE BRIDE.
-- Tag: ep05 (temp view _s230_ep05_lookup).
-- Sort band: floor 7500, step 3 (7500, 7503, 7506 used; under 7525).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, the two houses made one,
-- grace unto the ordained works, the Torah affirmed not abolished, the Formed Son). Chapter 5 walks
-- the gathered called-out ones in love (an offering of a sweet savour, Leviticus 1-3), as children
-- of light (Isaiah 60), and unveils the great mystery: the marriage of Messiah (Christ) and the
-- assembly. ★ The bride is NOT a new bride replacing Yashar'el (Israel); she is the betrothed
-- covenant people RESTORED — the wife Yahuah married, divorced for her whoredoms, washed and
-- re-betrothed (Hosea 2:19-20, Ezekiel 16:8-14, Isaiah 54:5, Isaiah 62:5). 5:31-32 cites Genesis
-- 2:24 (*they two shall be one flesh*) and reads it of Messiah and the church; 5:26 (*the washing
-- of water by the word*) echoes Ezekiel 16:9 (*then washed I thee with water*). The marriage figure
-- is the covenant restored, not abrogated. No replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   walk in love, an offering and a sacrifice for a sweetsmelling savour
--           Tanakh: Leviticus 1:9, Leviticus 3:5 (a sweet savour unto Yahuah), Exodus 29:18,
--                   Genesis 8:21 (Yahuah smelled a sweet savour)
--           Extras: none warranted   NT: none warranted (Messiah''s self-offering carried in prose)
--   v.3-7   fornication / no inheritance / wrath on the children of disobedience
--           Tanakh: none warranted (vice-list, no single load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.8-14  ye were darkness, now light in Yahuah; walk as children of light; awake from the dead
--           Tanakh: Isaiah 60:1 (Arise, shine; for thy light is come), Isaiah 26:19 (Awake and
--                   sing, ye that dwell in dust... the earth shall cast out the dead)
--           Extras: Wisdom of Solomon 5:6 (the light of righteousness has not shined to us),
--                   Wisdom of Solomon 18:1,4 (your saints had a very great light; the uncorrupt
--                   light of the law to be given to the world)
--           NT: none warranted (the light-of-life root is the Tanakh witness)
--   v.15-21 walk circumspectly / be filled with the Spirit / psalms and hymns / submitting
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (ethical, allusive)
--   v.22-33 ★ the marriage: husband head of the wife as Messiah head of the church; sanctify and
--           cleanse with the washing of water by the word; two shall be one flesh; a great mystery
--           Tanakh: Genesis 2:24 (they shall be one flesh), Ezekiel 16:8-9 (I sware unto thee, and
--                   entered into a covenant with thee... then washed I thee with water), Hosea
--                   2:19-20 (I will betroth thee unto me for ever), Isaiah 54:5 (thy Maker is thine
--                   husband), Isaiah 62:5 (as the bridegroom rejoiceth over the bride)
--           Extras: Tobit 8:6 (You madest Adam, and gavest him Eve his wife... It is not good that
--                   man should be alone) — the Genesis-2 marriage re-spoken in a wedding prayer
--           NT: Matthew 19:5 (For this cause shall a man leave father and mother... they twain
--                   shall be one flesh) — Yahusha (Jesus) citing the same Genesis 2:24
--
-- THREADS (slug -> target libraries):
--   7500 ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2  (Tanakh + Extras + NT)  ★ BLESSING
--   7503 ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3        (Tanakh)
--   7506 ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26              (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2  ★ BLESSING
  ('canon', 'ephesians', 5, 31, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). This is the word Paul quotes and then unveils: *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh. This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:31-32). The first marriage in the garden, the man and the woman made one flesh, was always a figure of the deeper union — Messiah (Christ) and the gathered covenant people joined into one body. The two becoming one is the great mystery: not two peoples merged, but the betrothed restored to her Maker.'),
  ('canon', 'ephesians', 5, 32, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Paul names the Genesis-2 word *a great mystery,* and reads it *concerning Messiah (Christ) and the church* (Ephesians 5:32). The one-flesh union spoken over Adam and the woman is the pattern of the covenant: the assembly is *members of his body, of his flesh, and of his bones* (Ephesians 5:30), bone of his bone as the woman was taken from the man. The mystery hidden in the garden is opened here — the bridegroom and the bride made one.'),
  ('canon', 'ephesians', 5, 25, 'canon', 'hosea', 2, 19, 'free', E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies.* (Hosea 2:19). Yahuah (LORD) speaks to the wife who played the harlot and was put away, and yet vows to take her back: *I will betroth thee unto me for ever.* This is the love Paul holds up to husbands: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The bride of the church is the re-betrothed bride of Hosea — the same covenant wife, divorced for her whoredoms and wooed back in lovingkindness, not a new bride replacing Yashar''el (Israel).'),
  ('canon', 'ephesians', 5, 26, 'canon', 'ezekiel', 16, 9, 'free', E'*Then washed I thee with water; yea, I throughly washed away thy blood from thee, and I anointed thee with oil.* (Ezekiel 16:9). When Yahuah (LORD) took Jerusalem as his bride, he washed her: *I sware unto thee, and entered into a covenant with thee... and thou becamest mine. Then washed I thee with water* (Ezekiel 16:8-9). Paul re-speaks that washing of the bride: Messiah (Christ) gave himself for the church *That he might sanctify and cleanse it with the washing of water by the word* (Ephesians 5:26). The bridal washing of Ezekiel is the cleansing of the assembly; the bride is the covenant people whom Yahuah (LORD) washed, betrothed, and now sanctifies — the same bride, restored.'),
  ('canon', 'ephesians', 5, 25, 'canon', 'isaiah', 54, 5, 'free', E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called.* (Isaiah 54:5). Isaiah names the marriage outright: *thy Maker is thine husband.* The forsaken wife, grieved in spirit, is called back with everlasting kindness (Isaiah 54:6-8). Paul stands in that same marriage when he says Messiah (Christ) *loved the church, and gave himself for it* (Ephesians 5:25). The husband who is the Maker and Redeemer of Yashar''el (Israel) is the bridegroom of the church; the bride is the wife of his covenant, gathered again.'),
  ('canon', 'ephesians', 5, 27, 'canon', 'isaiah', 62, 5, 'free', E'*For as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). The forsaken and desolate land is renamed *Hephzi-bah* and *Beulah* — married — and Yahuah (LORD) rejoices over her *as the bridegroom rejoiceth over the bride* (Isaiah 62:4-5). Paul sets this bridegroom''s joy before us: Messiah (Christ) sanctifies the church *That he might present it to himself a glorious church, not having spot, or wrinkle... but that it should be holy and without blemish* (Ephesians 5:27). The glorious bride presented to Messiah (Christ) is the once-forsaken, now-married people over whom her Elohim (God) rejoices.'),
  ('canon', 'ephesians', 5, 31, 'apocrypha', 'tobit', 8, 6, 'extras', E'*You madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: you have said, It is not good that man should be alone; let us make to him an aid like to himself.* (Tobit 8:6). On his wedding night Tobias rises to pray, and grounds his marriage in the garden: Yahuah (God) made Adam and gave him Eve, *for it is not good that man should be alone.* The restored library re-speaks the very Genesis-2 word Paul quotes — *For this cause shall a man leave his father and mother... and they two shall be one flesh* (Ephesians 5:31). The marriage that began in Eden is the figure honoured in the wedding prayer and unveiled by Paul as the mystery of Messiah (Christ) and the church.'),
  ('canon', 'ephesians', 5, 31, 'canon', 'matthew', 19, 5, 'free', E'*And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Yahusha (Jesus) himself cites Genesis 2:24, and adds, *Wherefore they are no more twain, but one flesh. What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:6). Paul speaks the same word over the marriage of Messiah (Christ) and the church: *they two shall be one flesh. This is a great mystery* (Ephesians 5:31-32). The one-flesh joining the Master declares from creation is the joining Paul reads of the bridegroom and his bride — what Elohim (God) has joined, made one and not to be put asunder.'),
  -- thread: ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3
  ('canon', 'ephesians', 5, 2, 'canon', 'leviticus', 1, 9, 'free', E'*But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 1:9). The burnt offering rises from the altar *a sweet savour unto Yahuah (LORD).* Paul names Messiah (Christ) by that very offering: *walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The whole burnt offering of Leviticus, given up entirely to Elohim (God), is fulfilled in the self-giving of Messiah (Christ); and the walk of love into which we are called is the same sweet savour ascending to the Father.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'leviticus', 3, 5, 'free', E'*And Aaron''s sons shall burn it on the altar upon the burnt sacrifice, which is upon the wood that is on the fire: it is an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 3:5). The peace offering too ascends *a sweet savour unto Yahuah (LORD)* — the offering that makes peace between Elohim (God) and his people. Paul reads Messiah''s sacrifice as exactly this: *an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). He who *is our peace* (Ephesians 2:14) is himself the peace offering, the sweet savour by which the gathered are reconciled and brought near.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). At the consecration of the priests the ram is wholly burned, *a sweet savour... an offering made by fire unto Yahuah (LORD).* Paul casts the love-walk and the self-offering of Messiah (Christ) in the same priestly terms: *given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The offering that consecrated Aaron and his sons is taken up in the one offering that sanctifies the whole assembly of the called-out.'),
  ('canon', 'ephesians', 5, 2, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake...* (Genesis 8:21). The first sweet savour in scripture rises from Noah''s altar after the flood, and Yahuah (LORD) answers it with covenant mercy. Paul names Messiah''s self-giving by that ancient fragrance: *an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). The savour that turned away the curse is fulfilled in the offering of Messiah (Christ), whose sacrifice secures the covenant and into whose love-walk the gathered are called.'),
  -- thread: ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26
  ('canon', 'ephesians', 5, 8, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Isaiah calls the people out of darkness into the risen light of Yahuah (LORD): *the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee* (Isaiah 60:2). Paul speaks the same passage from death to light: *For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The light come upon Zion is the light now risen on the gathered; to walk as children of light is to live in the glory of Yahuah (LORD) arisen upon his people.'),
  ('canon', 'ephesians', 5, 14, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). The summons *Arise, shine* is the very word Paul gathers up in the hymn he quotes: *Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14). Isaiah''s *thy light is come* becomes *Messiah (Christ) shall give thee light* — the rising of the glory of Yahuah (LORD) upon Zion fulfilled in the One who is the light, raising the sleeping and the dead to walk in his day.'),
  ('canon', 'ephesians', 5, 14, 'canon', 'isaiah', 26, 19, 'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). Isaiah calls the dead to wake and rise: *Awake and sing, ye that dwell in dust... the earth shall cast out the dead.* Paul quotes a hymn in the same key: *Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14). The resurrection-call of Isaiah is the call to the children of light — to awake from the sleep of the works of darkness and rise in the light Messiah (Christ) gives.'),
  ('canon', 'ephesians', 5, 13, 'apocrypha', 'the-wisdom-of-solomon', 5, 6, 'extras', E'*Therefore have we erred from the way of truth, and the light of righteousness has not shined to us, and the sun of righteousness rose not upon us.* (Wisdom of Solomon 5:6). The ungodly confess too late that *the light of righteousness has not shined to us* — they walked the unfruitful works of darkness and never came to the light. Paul sets the children of light against exactly this: *all things that are reproved are made manifest by the light: for whatsoever doth make manifest is light* (Ephesians 5:13), having no fellowship with *the unfruitful works of darkness* (Ephesians 5:11). The restored library names the doom of those over whom the sun of righteousness never rose; the gathered are summoned out of that darkness into the light.'),
  ('canon', 'ephesians', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 18, 1, 'extras', E'*Nevertheless your saints had a very great light, whose voice they hearing, and not seeing their shape, because they also had not suffered the same things, they counted them happy.* (Wisdom of Solomon 18:1). When darkness fell on Egypt, *your saints had a very great light* — the covenant people set apart in light while the enemies were *imprisoned in darkness, who had kept your sons shut up, by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4). Paul writes the same divide into the assembly: *ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The saints'' great light, bound to the uncorrupt light of the law, is the children-of-light walk — the gathered shining where the world lies in darkness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2',
       E'The bridegroom and the bride: they two shall be one flesh (Genesis 2, Hosea 2, Ezekiel 16)',
       E'Paul lifts the marriage of husband and wife into its greatest meaning: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it; That he might sanctify and cleanse it with the washing of water by the word, That he might present it to himself a glorious church, not having spot, or wrinkle... but that it should be holy and without blemish* (Ephesians 5:25-27). Then he quotes the first marriage in the garden — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31, citing *they shall be one flesh,* Genesis 2:24) — and names it outright: *This is a great mystery: but I speak concerning Messiah (Christ) and the church* (Ephesians 5:32). The one-flesh union of Adam and the woman was always the figure of this deeper union; and the gathered are *members of his body, of his flesh, and of his bones* (Ephesians 5:30), taken from his side as the woman was taken from the man. Mark well who this bride is. She is not a new bride brought in to replace Yashar''el (Israel); she is the covenant wife restored. Yahuah (LORD) took Jerusalem as his bride and washed her — *I sware unto thee, and entered into a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine. Then washed I thee with water* (Ezekiel 16:8-9) — and that bridal washing is the cleansing Paul names, *the washing of water by the word* (Ephesians 5:26). She played the harlot and was put away, and yet her husband vowed to take her back: *I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). For *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the forsaken wife called back with everlasting kindness; and *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5), the desolate land renamed Married. The restored library held the same garden-marriage in its wedding prayer: *You madest Adam, and gavest him Eve his wife for an helper and stay... It is not good that man should be alone* (Tobit 8:6). And Yahusha (Jesus) himself spoke the Genesis word over marriage — *they twain shall be one flesh... What therefore Elohim (God) hath joined together, let not man put asunder* (Matthew 19:5-6). So the great mystery is the covenant restored: the once-forsaken, washed, re-betrothed wife presented at last a glorious bride, the two made one, what Elohim (God) has joined never to be put asunder.',
       sv.verse_id, ev.verse_id, 'extras', 7500
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3',
       E'Walk in love, an offering of a sweetsmelling savour (Leviticus 1-3)',
       E'*And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). Paul reads Messiah''s self-giving in the language of the altar. The burnt offering, wholly given up to Elohim (God), ascends *a sweet savour unto Yahuah (LORD)* (Leviticus 1:9); so does the peace offering that makes peace between Elohim (God) and his people — *an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 3:5); and the consecration ram of the priests, *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). The fragrance reaches back to the first altar after the flood, when *Yahuah (LORD) smelled a sweet savour* and answered with covenant mercy (Genesis 8:21). All of it is gathered up in the one offering of Messiah (Christ), who *is our peace* (Ephesians 2:14) and gave himself a sweetsmelling savour to the Father. And the figure is not left at the altar: the walk of love into which the gathered are called is itself that ascending savour — to love as Messiah (Christ) loved, to give as he gave, is to live the offering whose smoke rises pleasing to Elohim (God).',
       sv.verse_id, ev.verse_id, 'free', 7503
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26',
       E'Walk as children of light: awake thou that sleepest, and arise from the dead (Isaiah 60, 26)',
       E'*For ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8). The passage from darkness to light is Isaiah''s great summons to Zion: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee. For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee* (Isaiah 60:1-2). The light come upon the city is the light now risen on the gathered. So when Paul quotes the hymn — *Wherefore he saith, Awake thou that sleepest, and arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14) — Isaiah''s *thy light is come* becomes *Messiah (Christ) shall give thee light,* and his *Arise, shine* joins the resurrection-call: *Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19). To walk as children of light is to wake from the sleep of *the unfruitful works of darkness* (Ephesians 5:11), for *all things that are reproved are made manifest by the light* (Ephesians 5:13). The restored library marks both sides of this divide. The ungodly confess too late, *the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* (Wisdom of Solomon 5:6); but the covenant people, even in the night of judgment that fell on their oppressors, were kept in light — *your saints had a very great light* (Wisdom of Solomon 18:1), the people *by whom the uncorrupt light of the law was to be given to the world* (Wisdom of Solomon 18:4). The children of light are that set-apart people, risen from the dead, shining where the world lies in darkness.',
       sv.verse_id, ev.verse_id, 'extras', 7506
  FROM _s230_ep05_lookup sv, _s230_ep05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *they shall be one flesh* the first marriage in the garden, quoted by Paul and read *concerning Messiah (Christ) and the church* (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *they shall be one flesh* the same word named *a great mystery* and applied to *Messiah (Christ) and the church* (Ephesians 5:32).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 16:9 — *Then washed I thee with water* the bridal washing of the covenant wife; *the washing of water by the word* by which Messiah (Christ) cleanses the church (Ephesians 5:26).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 2:19 — *I will betroth thee unto me for ever* the put-away wife wooed back; the love Messiah (Christ) shows the church, *gave himself for it* (Ephesians 5:25). The bride is Yashar''el (Israel) re-betrothed, not replaced.'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 54:5 — *thy Maker is thine husband* the forsaken wife called back with everlasting kindness; the bridegroom who *loved the church, and gave himself for it* (Ephesians 5:25).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* the desolate land renamed Married; the glorious bride Messiah (Christ) presents to himself (Ephesians 5:27).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Tobit 8:6 — *You madest Adam, and gavest him Eve his wife... It is not good that man should be alone* the garden-marriage re-spoken in a wedding prayer; the Genesis-2 word Paul quotes (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 19:5 — *they twain shall be one flesh* Yahusha (Jesus) citing Genesis 2:24, *what Elohim (God) hath joined... let not man put asunder*; the one-flesh joining Paul reads of the bridegroom and bride (Ephesians 5:31).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-the-bridegroom-and-the-bride-two-shall-be-one-flesh-genesis-2-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 1:9 — *a sweet savour unto Yahuah (LORD)* the whole burnt offering; Messiah (Christ) *gave himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 3:5 — *of a sweet savour unto Yahuah (LORD)* the peace offering that makes peace; he who *is our peace* (Ephesians 2:14) the sweetsmelling savour (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 29:18 — *a sweet savour, an offering made by fire unto Yahuah (LORD)* the consecration ram of the priests; the offering that sanctifies the assembly (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the first altar after the flood answered with covenant mercy; the offering of Messiah (Christ) a sweetsmelling savour (Ephesians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-in-love-an-offering-of-a-sweetsmelling-savour-leviticus-1-3'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* the light risen on Zion; *ye were sometimes darkness, but now are ye light in Yahuah (Lord): walk as children of light* (Ephesians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:1 — *Arise, shine; for thy light is come* the summons fulfilled in the hymn Paul quotes: *arise from the dead, and Messiah (Christ) shall give thee light* (Ephesians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:19 — *Awake and sing, ye that dwell in dust... the earth shall cast out the dead* the resurrection-call behind *Awake thou that sleepest, and arise from the dead* (Ephesians 5:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:6 — *the light of righteousness has not shined to us, and the sun of righteousness rose not upon us* the ungodly''s too-late confession; against the children of light who reprove *the unfruitful works of darkness* (Ephesians 5:11,13).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 18:1 — *your saints had a very great light* the covenant people kept in light in the night of judgment, *by whom the uncorrupt light of the law was to be given to the world* (18:4); the children-of-light walk (Ephesians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s230_ep05_lookup sv, _s230_ep05_lookup tv
 WHERE t.slug='ephesians-5-walk-as-children-of-light-awake-from-the-dead-isaiah-60-26'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ephesians_06.sql (S230 Ephesians 6) -----
-- =====================================================================
-- S230 minion — EPHESIANS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: EPHESIANS 6 (24 verses) — the household code grounded IN the Ten (children honour
--   father and mother, the Torah AFFIRMED), and ★ THE WHOLE ARMOUR OF ELOHIM (the Isaiah catena).
-- Tag: ep06 (temp view _s230_ep06_lookup).
-- Sort band: floor 7525, step 3 (7525, 7528, 7531 used; under 7550).
-- Source is ALWAYS the canon Ephesians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Ephesians = the re-gathering of the one olive tree, the two houses made one new
-- man; same Yahuah, same Torah, same betrothed Yashar'el restored; NOT replacement, NOT law-vs-grace).
-- Chapter 6 closes the letter on the practical walk and the warfare. Paul grounds household obedience
-- IN the fifth word of the Ten: *Honour thy father and mother; (which is the first commandment with
-- promise;)* (6:2-3) quotes Exodus 20:12 / Deuteronomy 5:16 as STANDING LAW with its promise intact —
-- the Torah affirmed, not abolished; the household code does not float free of the commandment, it
-- rests on it. Then *the whole armour of Elohim (God)* (6:11-17) is an Isaiah catena: the loins girt
-- with truth (Isaiah 11:5), the breastplate of righteousness + helmet of salvation (Isaiah 59:17),
-- the feet shod with the gospel of peace (Isaiah 52:7), the sword = the word (Isaiah 49:2 / 11:4).
-- The armour the believer puts on is the armour Yahuah (LORD) HIMSELF puts on in Isaiah 59 — the
-- saint is clothed in the armour of his Elohim (God), not a private kit. The restored library
-- re-speaks the SAME Isaiah-59 armour: Wisdom of Solomon 5:17-20 (*put on righteousness as a
-- breastplate, and true judgment instead of an helmet... a sword*). And the war is not against flesh
-- and blood but against the spirit-powers (6:12) — 1 Enoch 15:8-10 names that very war: the evil
-- spirits whose dwelling is the earth, who rise up against the children of men. No Trinitarian
-- co-equal grammar arises here; the Father is *Elohim (God) the Father* and the Son *the Lord Yahusha
-- HaMashiach* (6:23). The pull's name-renderings (including the ethical *Yahuah (Lord)* at 6:1,4,7,8,
-- 10) are preserved exactly as dump_canon returns them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     children, obey your parents in Yahuah (Lord)
--           Tanakh: carried in the honour-thy-parents thread (Exodus 20:12 / Deuteronomy 5:16)
--           Extras: Sirach 3:1-7 (children, hear your father; he that fears Yahuah will honour his
--                   father) — carried in the honour thread   NT: none warranted
--   v.2-3   honour thy father and mother; (the first commandment with promise) [EXPLICIT CITATION]
--           Tanakh: Exodus 20:12 (honour thy father and thy mother: that thy days may be long),
--                   Deuteronomy 5:16 (honour thy father and thy mother... that it may go well with thee)
--           Extras: Sirach 3:6 (he that honoureth his father shall have a long life), Sirach 3:8
--                   (honour your father and mother... that a blessing may come upon you)
--           NT: none warranted (the citation IS the Tanakh root; gospel honour-parents at Matthew
--               15:4 is itself a re-quote of the same commandment — carried in the prose)
--   v.4     fathers, provoke not your children to wrath; nurture and admonition of Yahuah (Lord)
--           Tanakh: none warranted (the load-bearing weight is the commandment at v.2-3)
--           Extras: none warranted (Sirach honour-block is child-to-parent)   NT: none warranted
--   v.5-9   servants/masters; doing the will of Elohim from the heart; no respect of persons
--           Tanakh: none warranted (respect-of-persons root carried in prose; not a curated thread)
--           Extras: none warranted   NT: none warranted (Colossians 3:22-4:1 is the twin household
--                   code — noted in prose, not a separate Tanakh thread)
--   v.10-11 be strong in Yahuah; put on the whole armour of Elohim
--           Tanakh: carried in the armour thread (the armour is Yahuah's own, Isaiah 59:17)
--           Extras: carried in the armour thread (Wisdom 5:17)   NT: none warranted
--   v.12    we wrestle not against flesh and blood, but against principalities... powers... rulers
--           of the darkness... spiritual wickedness in high places
--           Tanakh: none warranted (no clean Tanakh witness names this spirit-war directly)
--           Extras: 1 Enoch 15:8-10 (the spirits of heaven; these spirits shall rise up against the
--                   children of men) — the war with the spirit-powers
--           NT: none warranted (carried by the extras witness)
--   v.13-17 the whole armour: loins girt with truth, breastplate of righteousness, feet shod with the
--           gospel of peace, shield of faith, helmet of salvation, the sword of the Spirit (the word)
--           [the Isaiah catena]
--           Tanakh: Isaiah 59:17 (righteousness as a breastplate, helmet of salvation), Isaiah 11:5
--                   (righteousness the girdle of his loins, faithfulness the girdle of his reins),
--                   Isaiah 52:7 (the feet of him that bringeth good tidings, that publisheth peace),
--                   Isaiah 49:2 (made my mouth like a sharp sword), Isaiah 11:4 (he shall smite the
--                   earth with the rod of his mouth)
--           Extras: Wisdom of Solomon 5:17-20 (he shall put on righteousness as a breastplate, and
--                   true judgment instead of an helmet... a sword) — the SAME Isaiah-59 armour
--           NT: none warranted (the catena IS the Tanakh root)
--   v.18-20 praying always in the Spirit; the mystery of the gospel; ambassador in bonds
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.21-24 Tychicus; peace and grace to the brethren (epistolary close)
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7525 ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20  (Tanakh + Extras)
--   7528 ephesians-6-the-whole-armour-of-elohim-isaiah-59                                        (Tanakh + Extras)  [★ BLESSING]
--   7531 ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s230_ep06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20
  ('canon', 'ephesians', 6, 2, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). When Paul writes *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2), he is quoting the fifth word of the Ten spoken at Sinai, with its promise still attached. He calls it *the first commandment with promise* — not an abolished ordinance but standing law he grounds household obedience IN. The Torah is not set aside in the household code; it is the foundation of it.'),
  ('canon', 'ephesians', 6, 3, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). Paul carries the very promise of the commandment forward: *That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The promise of long days that Yahuah (LORD) bound to honouring father and mother at Sinai is the promise Paul holds out still — the commandment intact, promise and all.'),
  ('canon', 'ephesians', 6, 3, 'canon', 'deuteronomy', 5, 16, 'free', E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Deuteronomy 5:16). Moses'' second giving of the Ten carries the doubled promise Paul echoes word for word: *that it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The *that it may go well with thee* of Deuteronomy is the *that it may be well with thee* of Ephesians — Paul is not improvising a maxim; he is reciting the commandment as Moses gave it, the Torah affirmed.'),
  ('canon', 'ephesians', 6, 2, 'apocrypha', 'ecclesiasticus', 3, 6, 'extras', E'*He that honoureth his father shall have a long life; and he that is obedient to Yahuah (God) shall be a comfort to his mother.* (Sirach 3:6). The Hebrew library already read the fifth commandment as Paul reads it — a commandment WITH PROMISE: *he that honoureth his father shall have a long life.* This is the very logic of *the first commandment with promise* (Ephesians 6:2); the long life promised at Sinai for honouring father and mother is the long life the wisdom of the fathers held out, the standing word Paul affirms.'),
  ('canon', 'ephesians', 6, 1, 'apocrypha', 'ecclesiasticus', 3, 7, 'extras', E'*He that fears Yahuah (God) will honour his father, and will do service to his parents, as to his masters.* (Sirach 3:7). The fear of Yahuah (God) shows itself in honouring father and mother — and Paul writes *Children, obey your parents in Yahuah (Lord): for this is right* (Ephesians 6:1). To obey one''s parents *in Yahuah (Lord)* is exactly the service to parents that flows from the fear of Yahuah (God); the household obedience Paul commands is the obedience the restored library taught, rooted in the commandment.'),
  ('canon', 'ephesians', 6, 3, 'apocrypha', 'ecclesiasticus', 3, 8, 'extras', E'*Honour your father and mother both in word and deed, that a blessing may come upon you from them.* (Sirach 3:8). The wisdom of the fathers joins the honour to the blessing it brings — *that a blessing may come upon you.* So Paul joins the commandment to its promise: *That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:3). The blessing that follows honouring father and mother is no New-Covenant novelty; it is the promise carried in the commandment from the first, affirmed and not annulled.'),
  -- thread: ephesians-6-the-whole-armour-of-elohim-isaiah-59  [★ BLESSING]
  ('canon', 'ephesians', 6, 14, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). This is Yahuah (LORD) himself, arming to bring salvation when there was no man and no intercessor. The armour Paul tells the saints to put on is HIS armour: *having on the breastplate of righteousness* (Ephesians 6:14) and *the helmet of salvation* (Ephesians 6:17). The believer is not issued a private kit; he is clothed in the very righteousness-breastplate and salvation-helmet of his Elohim (God), standing in the strength of the One who armed himself to save.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). Yahuah (LORD) puts *an helmet of salvation upon his head,* and Paul bids the saint *take the helmet of salvation* (Ephesians 6:17). The salvation that is Yahuah''s (LORD) own headpiece becomes the believer''s; what the Redeemer wore to come to Zion is what guards the head of those who stand in him.'),
  ('canon', 'ephesians', 6, 14, 'canon', 'isaiah', 11, 5, 'free', E'*And righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins.* (Isaiah 11:5). The Branch out of the stem of Jesse wears righteousness and faithfulness girded about his loins; Paul tells the saint to stand *having your loins girt about with truth* (Ephesians 6:14). The girdle of truth and righteousness that belts the Messiah-King of Isaiah 11 is the girdle the believer puts on — the loins of the soldier of Elohim (God) belted with the same faithfulness that belts the Branch.'),
  ('canon', 'ephesians', 6, 15, 'canon', 'isaiah', 52, 7, 'free', E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). The feet that carry the good news of peace to Zion are the feet Paul shods the saint with: *your feet shod with the preparation of the gospel of peace* (Ephesians 6:15). The gospel of peace is no new errand; it is the good tidings Isaiah''s herald already ran to publish — *Thy Elohim (God) reigneth* — now the footing on which the saint stands and goes.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 49, 2, 'free', E'*And he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft; in his quiver hath he hid me;* (Isaiah 49:2). The Servant''s weapon is his word: Yahuah (LORD) *hath made my mouth like a sharp sword.* Paul names the soldier''s one offensive weapon the same way: *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The sword of the believer is not steel but the word — the very sword that is the mouth of the Servant whom Yahuah (LORD) hid in his quiver and now sends forth.'),
  ('canon', 'ephesians', 6, 17, 'canon', 'isaiah', 11, 4, 'free', E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). The Branch *shall smite the earth with the rod of his mouth* — the word itself is the weapon that judges and slays the wicked. So Paul arms the saint with *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The word that is the Messiah''s rod of judgment is the word the believer wields against the wiles of the devil.'),
  ('canon', 'ephesians', 6, 14, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). The restored library re-speaks the very armour of Isaiah 59: Yahuah (God) arming to repay his enemies *shall put on righteousness as a breastplate.* It is the same breastplate Paul gives the saint — *having on the breastplate of righteousness* (Ephesians 6:14). The Hebrew library, the prophet, and the apostle agree: the breastplate is righteousness, and it is first the LORD''s own armour before it is the believer''s.'),
  ('canon', 'ephesians', 6, 17, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). Where Isaiah 59:17 sets *an helmet of salvation* upon the LORD''s head, the wisdom of the fathers sets *true judgment instead of an helmet* — the same head-piece of the armed Elohim (God). Paul bids the saint *take the helmet of salvation* (Ephesians 6:17): the helmet of the One who arms himself to judge and save is the helmet handed to those who stand in him.'),
  ('canon', 'ephesians', 6, 17, 'apocrypha', 'the-wisdom-of-solomon', 5, 20, 'extras', E'*His severe wrath shall he sharpen for a sword, and the world shall fight with him against the unwise.* (Wisdom of Solomon 5:20). The armed Elohim (God) of the restored library sharpens a sword for the day of recompence — the same figure as the Servant whose *mouth* Yahuah (LORD) made *like a sharp sword* (Isaiah 49:2). Paul names the saint''s sword *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17): the sword in the believer''s hand is the LORD''s own sword, the word that fights for him against the unwise.'),
  ('canon', 'ephesians', 6, 11, 'apocrypha', 'the-wisdom-of-solomon', 5, 17, 'extras', E'*He shall take to him his jealousy for complete armour, and make the creature his weapon for the revenge of his enemies.* (Wisdom of Solomon 5:17). The phrase *complete armour* — the whole panoply of the armed Elohim (God) — is the very figure Paul opens with: *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11). The complete armour the LORD takes to himself in the day of vengeance is the whole armour the saint is told to put on; one and the same panoply, the LORD''s, now the believer''s defence.'),
  -- thread: ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15
  ('canon', 'ephesians', 6, 12, 'enoch', '1-enoch', 15, 8, 'extras', E'*And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* (1 Enoch 15:8). Paul says the conflict is not what it seems: *we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12). The restored library tells where these spirit-foes came from and where they dwell — evil spirits whose dwelling is the earth, born of the rebellion of the Watchers; the war is against these, not against mortal men.'),
  ('canon', 'ephesians', 6, 12, 'enoch', '1-enoch', 15, 10, 'extras', E'*And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* (1 Enoch 15:10). The library names the very warfare Paul names: spirits that *rise up against the children of men.* This is why *we wrestle not against flesh and blood, but against principalities, against powers* (Ephesians 6:12) — the true adversary is the spirit-power, the unseen wickedness in high places, and the children of men stand against it not in the flesh but in the whole armour of Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s230_ep06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s230_ep06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20',
       E'Honour thy father and mother, the first commandment with promise (Exodus 20, Deuteronomy 5)',
       E'Paul grounds the whole household code in the Ten. *Children, obey your parents in Yahuah (Lord): for this is right. Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:1-3). He is not coining a maxim — he is quoting the fifth word spoken at Sinai, and he quotes it as STANDING LAW, *the first commandment with promise,* its promise still attached. The commandment is Exodus 20:12: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* And Moses'' second giving carries the doubled promise Paul echoes word for word: *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee* (Deuteronomy 5:16) — the *that it may go well with thee* that becomes Paul''s *that it may be well with thee.* This is the Torah affirmed, not abolished: Paul does not say the commandment is past; he says it is *first... with promise* and reaches for its very promise of long days. The wisdom of the fathers had read it the same way: *he that honoureth his father shall have a long life* (Sirach 3:6); *he that fears Yahuah (God) will honour his father, and will do service to his parents* (Sirach 3:7); *Honour your father and mother both in word and deed, that a blessing may come upon you from them* (Sirach 3:8). Commandment, promise, and blessing stand together — the same word from Sinai to the sages to the apostle, the Instruction kept whole.',
       sv.verse_id, ev.verse_id, 'extras', 7525
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-the-whole-armour-of-elohim-isaiah-59',
       E'The whole armour of Elohim (God): the armour Yahuah (LORD) himself put on (Isaiah 59, 11, 52, 49)',
       E'*Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11). Mark whose armour it is: not a private kit issued to the soldier, but the armour of Elohim (God) — the very armour Yahuah (LORD) HIMSELF put on. When there was no man and no intercessor, *he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17). Paul takes that armour off the LORD and puts it on the saint piece by piece. *Having on the breastplate of righteousness* (Ephesians 6:14) is the LORD''s righteousness-breastplate of Isaiah 59:17; *the helmet of salvation* (Ephesians 6:17) is the salvation-helmet upon his head. *Having your loins girt about with truth* (Ephesians 6:14) is the Branch of Jesse whose belt is faithfulness: *righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins* (Isaiah 11:5). *Your feet shod with the preparation of the gospel of peace* (Ephesians 6:15) is the herald of Zion: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace... that saith unto Zion, Thy Elohim (God) reigneth* (Isaiah 52:7). And *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17) is the Servant''s mouth — *he hath made my mouth like a sharp sword* (Isaiah 49:2) — and the Branch''s rod: *he shall smite the earth with the rod of his mouth* (Isaiah 11:4). The one offensive weapon is the word, the same word that is the Messiah''s rod of judgment. The restored library re-speaks this exact armour of the LORD: the armed Elohim (God) who *shall take to him his jealousy for complete armour* (Wisdom of Solomon 5:17), who *shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18), whose *severe wrath shall he sharpen for a sword* (Wisdom of Solomon 5:20). The *complete armour* of Wisdom is the *whole armour of Elohim (God)* of Paul; the breastplate, the helmet, the sword are first the LORD''s own panoply before they are ever the believer''s. To stand against the wiles of the devil is to stand clothed in the armour of Yahuah (LORD) — his righteousness, his salvation, his truth, his gospel of peace, his word — for the battle is his, and the saint fights in his strength and in his armour, not his own.',
       sv.verse_id, ev.verse_id, 'extras', 7528
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15',
       E'We wrestle not against flesh and blood: the war with the spirit-powers (1 Enoch 15)',
       E'*For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12). Paul names the true adversary: not mortal men but unseen spirit-powers. The restored library tells where these spirit-foes came from and where they dwell. From the rebellion of the Watchers came a brood whose offspring became evil spirits: *the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:8). And their war is exactly the war Paul names: *these spirits shall rise up against the children of men and against the women, because they have proceeded from them* (1 Enoch 15:10). This is why the saint puts on the whole armour of Elohim (God): the fight is not flesh against flesh but the children of men against the spirit-powers that rise up against them. The wrestling is real and the enemy is real, but he is *not flesh and blood* — and so the weapons are not flesh and blood either, but the truth, the righteousness, the salvation, and the word of the armed Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 7531
  FROM _s230_ep06_lookup sv, _s230_ep06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ephesians' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land* the fifth word of the Ten, the commandment Paul quotes as *the first commandment with promise* (Ephesians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:12 — *that thy days may be long upon the land* the promise of the commandment, carried forward in *that... thou mayest live long on the earth* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 5:16 — *that it may go well with thee, in the land* Moses'' second giving of the Ten, echoed word for word in *that it may be well with thee* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 3:6 — *he that honoureth his father shall have a long life* the wisdom of the fathers reading the fifth word as a commandment with promise, the very logic of *the first commandment with promise* (Ephesians 6:2).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 3:7 — *He that fears Yahuah (God) will honour his father, and will do service to his parents* the fear of Yahuah (God) shown in honouring parents; Paul''s *obey your parents in Yahuah (Lord): for this is right* (Ephesians 6:1).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 3:8 — *Honour your father and mother both in word and deed, that a blessing may come upon you* the honour joined to its blessing, as Paul joins the commandment to *that it may be well with thee* (Ephesians 6:3).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-honour-thy-father-and-mother-the-first-commandment-with-promise-exodus-20'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-6-the-whole-armour-of-elohim-isaiah-59
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 5:17 — *He shall take to him his jealousy for complete armour* the *complete armour* of the armed Elohim (God) re-spoken; Paul''s *Put on the whole armour of Elohim (God)* (Ephesians 6:11).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:5 — *righteousness shall be the girdle of his loins, and faithfulness the girdle of his reins* the Branch''s belt; *your loins girt about with truth* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 59:17 — *he put on righteousness as a breastplate, and an helmet of salvation upon his head* the armour Yahuah (LORD) himself put on; *the breastplate of righteousness* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the same Isaiah-59 armour of the LORD re-spoken; *the breastplate of righteousness* (Ephesians 6:14).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 52:7 — *the feet of him that bringeth good tidings, that publisheth peace* the herald of Zion; *your feet shod with the preparation of the gospel of peace* (Ephesians 6:15).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 59:17 — *an helmet of salvation upon his head* the salvation-helmet of the armed LORD; *take the helmet of salvation* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Isaiah 49:2 — *he hath made my mouth like a sharp sword* the Servant''s word the weapon; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Isaiah 11:4 — *he shall smite the earth with the rod of his mouth* the word as the Messiah''s rod of judgment; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Wisdom of Solomon 5:20 — *His severe wrath shall he sharpen for a sword* the sword of the armed Elohim (God) re-spoken; *the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the helmet of the armed Elohim (God) re-spoken; *take the helmet of salvation* (Ephesians 6:17).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-the-whole-armour-of-elohim-isaiah-59'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *the giants... shall be called evil spirits upon the earth, and on the earth shall be their dwelling* the origin of the spirit-foes; *we wrestle not against flesh and blood, but against principalities, against powers* (Ephesians 6:12).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *these spirits shall rise up against the children of men* the very spirit-war Paul names; *against the rulers of the darkness of this world, against spiritual wickedness in high places* (Ephesians 6:12).'
  FROM cross_reference_threads t, cross_references x, _s230_ep06_lookup sv, _s230_ep06_lookup tv
 WHERE t.slug='ephesians-6-we-wrestle-not-against-flesh-and-blood-the-war-with-the-spirit-powers-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='ephesians' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session230 — Ephesians cross-references complete.'
