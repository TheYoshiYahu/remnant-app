-- ----- fragment: minion_1john_04.sql (S242 1 John 4) -----
-- =====================================================================
-- S242 minion — 1 JOHN 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 4 (21 verses) — try the spirits / Elohim is love / the Father sent the Son.
-- Tag: j242c4 (temp view _s242_j242c4_lookup).
-- Sort band: floor 10090, step 3 (10090, 10093, 10096, 10099, 10102 used; under 10120).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 John = the test-of-knowing-Him letter; the test is keeping His commandments).
-- Chapter 4 sets the test of the spirits and the test of love side by side. The discerning of spirits
-- is the Torah's own test of the prophet (Deuteronomy 13 / 18; Isaiah 8:20 *to the law and to the
-- testimony*) — the spirit that confesses Yahusha (Jesus) come in the flesh stands the test; the spirit
-- of antichrist fails it. And love itself is *of Elohim (God)* — the Torah's *thou shalt love thy
-- neighbour as thyself* (Leviticus 19:18) and *thou shalt love Yahuah Elohayka with all thine heart*
-- (Deuteronomy 6:5). Christology held at the Father-is-the-source key: *Elohim (God) sent his only
-- begotten Son into the world* (4:9), *the Father sent the Son to be the Saviour of the world* (4:14) —
-- the Father is the sender and the source, the Son the one sent and begotten; no co-equal-persons
-- grammar, no modalist collapse. And the order of love is fixed: *We love him, because he first loved
-- us* (4:19) — Yahuah's covenant love precedes ours, *because Yahuah (LORD) loved you* (Deuteronomy 7:8).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   try the spirits / the spirit that confesseth not Yahusha come in flesh is antichrist
--           Tanakh: Deuteronomy 13:1-5 (try the prophet/dreamer), Deuteronomy 18:20-22 (the prophet
--                   who presumes), Isaiah 8:20 (to the law and to the testimony)
--           Extras: none warranted   NT: none warranted (the Torah test is the root)
--   v.7-8,11-12 beloved let us love one another, for love is of Elohim; Elohim is love
--           Tanakh: Leviticus 19:18 (love thy neighbour as thyself), Deuteronomy 6:5 (love Yahuah with
--                   all thine heart)
--           Extras: Sirach 2:15-16 (they that love him will keep his ways / be filled with the law)
--           NT: none warranted (carried in prose)
--   v.9-10,14 Elohim sent his only begotten Son / the Father sent the Son to be the Saviour
--           Tanakh: Isaiah 43:11 (beside me there is no saviour), Psalm 2:7 (Thou art my Son; this day
--                   have I begotten thee)
--           Extras: none warranted   NT: none warranted (the Father-the-sender Christology in prose)
--   v.19    we love him, because he first loved us
--           Tanakh: Deuteronomy 7:7-8 (because Yahuah loved you), Jeremiah 31:3 (I have loved thee
--                   with an everlasting love)
--           Extras: none warranted   NT: none warranted
--   v.20-21 if a man say I love Elohim and hateth his brother he is a liar; this commandment
--           Tanakh: Leviticus 19:17-18 (thou shalt not hate thy brother... love thy neighbour)
--           Extras: none warranted   NT: none warranted (the commandment is the Torah's)
--
-- THREADS (slug -> target libraries):
--   10090 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8   (Tanakh)
--   10093 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6  (Tanakh + Extras)
--   10096 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2  (Tanakh)
--   10099 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31  (Tanakh)
--   10102 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s242_j242c4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8
  ('canon', '1-john', 4, 1, 'canon', 'deuteronomy', 13, 3, 'free', E'*Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul.* (Deuteronomy 13:3). The Torah is the original test of the spirits: even a prophet who gives a sign that comes to pass is to be tried, and not hearkened to if he turns the heart after other gods. John gives the same charge — *believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world* (1 John 4:1). The measuring-line of discernment is not the wonder but fidelity to Yahuah (LORD); the apostle hands the assemblies the prophet-test Moses gave Yashar''el (Israel).'),
  ('canon', '1-john', 4, 1, 'canon', 'deuteronomy', 13, 5, 'free', E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt, and redeemed you out of the house of bondage, to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in. So shalt thou put the evil away from the midst of thee.* (Deuteronomy 13:5). The false prophet is judged because he seeks *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in.* John''s *many false prophets are gone out into the world* (1 John 4:1) are the same breed under apostolic ink: the spirit that draws away from the way Yahuah (LORD) commanded is the spirit to be refused, tried by the Torah and found wanting.'),
  ('canon', '1-john', 4, 3, 'canon', 'deuteronomy', 18, 20, 'free', E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die.* (Deuteronomy 18:20). The Torah names the presumptuous prophet who speaks what Yahuah (LORD) has not commanded. The spirit of antichrist is that voice grown to its fulness — *every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist* (1 John 4:3). The Torah''s test of the presuming prophet is the seed of John''s test of the lying spirit: what it confesses, and whether it speaks according to Yahuah (LORD)''s own word, exposes it.'),
  ('canon', '1-john', 4, 3, 'canon', 'deuteronomy', 18, 22, 'free', E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). Moses gives a plain test for the spirit behind the prophet, and a plain comfort — *thou shalt not be afraid of him.* John gives the assemblies the same confidence over against the spirit of antichrist: *ye are of Elohim (God), little children, and have overcome them: because greater is he that is in you, than he that is in the world* (1 John 4:4). The Torah''s rule that the failing word unmasks the false prophet stands behind the apostle''s assurance that the tried-and-overcome spirit need not be feared.'),
  ('canon', '1-john', 4, 6, 'canon', 'isaiah', 8, 20, 'free', E'*To the law and to the testimony: if they speak not according to this word, it is because there is no light in them.* (Isaiah 8:20). Isaiah sets the standard of all discernment: every voice is brought *to the law and to the testimony,* and the voice that does not speak according to that word has no light. This is John''s very rule — *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6): the spirit of truth speaks according to the word, and the spirit of error does not. The apostle''s spirit-of-truth versus spirit-of-error is Isaiah''s law-and-testimony test carried into the assemblies.'),
  -- thread: 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6
  ('canon', '1-john', 4, 7, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The command John calls the whole assembly back to — *Beloved, let us love one another: for love is of Elohim (God)* (1 John 4:7) — is the old commandment of the Torah, *thou shalt love thy neighbour as thyself.* Love is *of Elohim (God)* because Yahuah (LORD) spoke it from of old and sealed it with his own name; the apostle does not invent a new sentiment but presses the very statute Moses delivered, the love that is the keeping of the commandment.'),
  ('canon', '1-john', 4, 8, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The Shema commands the love of Yahuah (LORD) with the whole heart — and John makes that love the very proof of knowing Him: *He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:8). The one who does not love does not know the Elohim (God) whose own first commandment is love; the love John names is not a feeling severed from the Torah but the heart-love of Deuteronomy 6, the love that is owed first to Yahuah (LORD) and then to the brother made in His likeness.'),
  ('canon', '1-john', 4, 12, 'canon', 'deuteronomy', 6, 5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The invisible Elohim (God) is known and indwelt through love: *No man hath seen Elohim (God) at any time. If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12). The whole-hearted love commanded in the Shema is the very love by which Yahuah (LORD) is said to dwell in His people; the love-command of Deuteronomy 6 is not abolished but brought to its perfecting in the assembly that loves one another.'),
  ('canon', '1-john', 4, 7, 'apocrypha', 'ecclesiasticus', 2, 16, 'extras', E'*They that fear Yahuah (God) will seek that which is well, pleasing to him; and they that love him shall be filled with the law.* (Sirach 2:16). The Hebrew library binds the love of Yahuah (God) to the law as tightly as John binds love to the knowing of Elohim (God): *every one that loveth is born of Elohim (God), and knoweth Elohim (God)* (1 John 4:7). They that love Him *shall be filled with the law* — love and Torah are one motion, not two. The apostle''s *love is of Elohim (God)* re-speaks the wisdom of the fathers: the one who loves is the one filled with the law, born of and knowing the Elohim (God) who is love.'),
  -- thread: 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2
  ('canon', '1-john', 4, 14, 'canon', 'isaiah', 43, 11, 'free', E'*I, even I, am Yahuah (LORD); and beside me there is no saviour.* (Isaiah 43:11). Yahuah (LORD) declares Himself the only Saviour — and John testifies *that the Father sent the Son to be the Saviour of the world* (1 John 4:14). There is no rival deliverer: the salvation of the world is the Father''s own salvation, accomplished through the Son He sent. Keep the order the verse keeps — the Father is the source and the sender, the Son the One sent forth to be the Saviour; the saving that belongs to Yahuah (LORD) alone is wrought by the begotten One the Father commissioned, not by a second who saves apart from Him.'),
  ('canon', '1-john', 4, 9, 'canon', 'isaiah', 43, 11, 'free', E'*I, even I, am Yahuah (LORD); and beside me there is no saviour.* (Isaiah 43:11). *In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9). The Elohim (God) who alone is Saviour manifests His love by sending — the sending is the Father''s act, the life is given *through him,* the Son. Beside Yahuah (LORD) there is no saviour; therefore the only-begotten sent into the world saves not as a rival but as the One through whom the one Elohim (God) gives life.'),
  ('canon', '1-john', 4, 9, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The decree of the Father names the Son begotten: *Thou art my Son; this day have I begotten thee.* John speaks of the same begotten One — *Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9). The begetting is the Father''s declaring, the sending is the Father''s act; the Son is the begotten and the sent, not a co-equal who begets Himself. The Psalm''s Father-and-Son decree is the very Christology the apostle carries: the Father the source, the only-begotten the One He sent.'),
  -- thread: 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31
  ('canon', '1-john', 4, 19, 'canon', 'deuteronomy', 7, 8, 'free', E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8). The redemption from Egypt rested on nothing in Yashar''el (Israel) but on Yahuah (LORD)''s prior love — *because Yahuah (LORD) loved you.* John fixes the same order for the assembly: *We love him, because he first loved us* (1 John 4:19). The love that saves is not earned by the loved but poured out first by the One who loves; the apostle''s *he first loved us* re-speaks the Torah''s reason for the exodus — Yahuah (LORD)''s love precedes and creates the love of His people.'),
  ('canon', '1-john', 4, 19, 'canon', 'deuteronomy', 7, 7, 'free', E'*Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people:* (Deuteronomy 7:7). Yahuah (LORD) loved and chose Yashar''el (Israel) for no merit of theirs — not for number, not for greatness, but of His own free love. *We love him, because he first loved us* (1 John 4:19): our love is wholly answer, never cause. The Torah''s reason — Yahuah (LORD) set His love freely, before and without any worthiness in the loved — is the ground of the apostle''s order, His love first and ours only because of His.'),
  ('canon', '1-john', 4, 19, 'canon', 'jeremiah', 31, 3, 'free', E'*Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee.* (Jeremiah 31:3). Yahuah (LORD)''s love is the *everlasting love* that draws — He loves first, and the drawing follows. John says no more and no less: *We love him, because he first loved us* (1 John 4:19). The lovingkindness that drew Yashar''el (Israel) is the first-loving the apostle names; our love is the response to a love that reached for us *of old,* an everlasting love that went before.'),
  -- thread: 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19
  ('canon', '1-john', 4, 20, 'canon', 'leviticus', 19, 17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* (Leviticus 19:17). The Torah forbids the hatred of the brother *in thine heart.* John makes that command the very test of the love of Elohim (God): *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* (1 John 4:20). The hatred Leviticus forbids exposes the lie; the claim to love the unseen Elohim (God) is broken by the hatred of the seen brother, for the love of Elohim (God) and the love of the brother are one Torah.'),
  ('canon', '1-john', 4, 21, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). John names the commandment outright: *And this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21). It is no new commandment but the old one Yahuah (LORD) sealed with His name — *thou shalt love thy neighbour as thyself.* The love of Elohim (God) and the love of the brother are bound in a single statute of the Torah; the apostle quotes the Levitical command as the commandment the assembly *have... from him.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8',
       E'Try the spirits whether they are of Elohim (Deuteronomy 13, 18; Isaiah 8:20)',
       E'John opens the chapter with a charge of discernment: *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world* (1 John 4:1). This is not a new apostolic invention but the Torah''s own test of the prophet handed to the assemblies. Moses commanded that even a prophet or dreamer who gives a sign that comes to pass be tried and refused if he turns the heart away: *Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul* (Deuteronomy 13:3), for he has spoken *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in* (Deuteronomy 13:5). And Moses gave the test of the presuming prophet and the comfort with it: *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20), and *when a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass... thou shalt not be afraid of him* (Deuteronomy 18:22). So John, naming the chief mark — *every spirit that confesseth not that Yahusha HaMashiach (Jesus Christ) is come in the flesh is not of Elohim (God): and this is that spirit of antichrist* (1 John 4:3) — gives the same fearless assurance: *ye are of Elohim (God), little children, and have overcome them* (1 John 4:4). The standard of all such trying is Isaiah''s: *To the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:20). The apostle''s own conclusion is that very rule — *Hereby know we the spirit of truth, and the spirit of error* (1 John 4:6): the spirit of truth speaks according to the word, and the spirit of error does not. The discerning of spirits is the law-and-testimony test carried into the assemblies; the spirit is tried by what it confesses and whether it speaks according to Yahuah (LORD)''s own word.',
       sv.verse_id, ev.verse_id, 'free', 10090
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6',
       E'Beloved, let us love one another, for love is of Elohim (Leviticus 19:18, Deuteronomy 6:5)',
       E'*Beloved, let us love one another: for love is of Elohim (God); and every one that loveth is born of Elohim (God), and knoweth Elohim (God). He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:7-8). The love John presses is not a vague sentiment but the old commandment of the Torah. *Love is of Elohim (God)* because Yahuah (LORD) spoke it from of old and sealed it with His own name: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). And it reaches up before it reaches across — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5), the Shema''s first command, the whole-hearted love of Yahuah (LORD) that John makes the very proof of knowing Him: *He that loveth not knoweth not Elohim (God).* The invisible Elohim (God) is known and indwelt through this love — *No man hath seen Elohim (God) at any time. If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12) — the whole-hearted love of the Shema brought to its perfecting in the assembly. The Hebrew library bound love and Torah in one motion: *they that love him shall be filled with the law* (Sirach 2:16). So the apostle does not abolish the love-command but presses it: to love is to keep the statute Moses delivered, to be born of and to know the Elohim (God) who is love.',
       sv.verse_id, ev.verse_id, 'extras', 10093
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2',
       E'The Father sent the Son to be the Saviour of the world (Isaiah 43:11, Psalm 2:7)',
       E'John testifies to the heart of the gospel with the order of Father and Son kept exact: *In this was manifested the love of Elohim (God) toward us, because that Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9), and *we have seen and do testify that the Father sent the Son to be the Saviour of the world* (1 John 4:14). The sending is the Father''s act; the Son is the One sent. And the salvation belongs to Yahuah (LORD) alone — *I, even I, am Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11). There is no rival deliverer: the saving of the world is the Father''s own salvation, accomplished through the only-begotten He sent, the life given *through him.* The begetting too is the Father''s declaring — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The Son is the begotten and the sent, not a co-equal who begets or saves Himself. Keep the order the apostle keeps: the Father is the source and the sender, the Son the One He commissioned and sent forth to be the Saviour; *that we might live through him* — the life of the one Elohim (God) given through the begotten One.',
       sv.verse_id, ev.verse_id, 'free', 10096
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31',
       E'We love him, because he first loved us (Deuteronomy 7:7-8, Jeremiah 31:3)',
       E'*We love him, because he first loved us* (1 John 4:19). The apostle fixes the order of all covenant love: Yahuah (LORD) loves first, and our love is wholly answer, never cause. This is the Torah''s own reason for the exodus. Yahuah (LORD) loved and chose Yashar''el (Israel) for no merit of theirs — *Yahuah (LORD) did not set his love upon you, nor choose you, because ye were more in number than any people; for ye were the fewest of all people* (Deuteronomy 7:7) — *but because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8). The redemption rested on nothing in Yashar''el (Israel) but on Yahuah (LORD)''s prior, free love. And that love is everlasting and drawing: *Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). The lovingkindness that drew Yashar''el (Israel) of old is the first-loving John names; our love for Him is the response to a love that reached for us before we reached for Him. *He first loved us* re-speaks the Torah and the prophets: His love precedes and creates the love of His people.',
       sv.verse_id, ev.verse_id, 'free', 10099
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19',
       E'If a man say, I love Elohim, and hateth his brother, he is a liar (Leviticus 19:17-18)',
       E'John closes the chapter by welding the love of Elohim (God) to the love of the brother, and naming the breach a lie: *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* (1 John 4:20). The hatred he forbids is the very hatred the Torah forbids: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). And the commandment he names is the Levitical command outright: *And this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21) — no new commandment but the old one Yahuah (LORD) sealed with His name, *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The love of Elohim (God) and the love of the brother are bound in a single statute of the Torah; the claim to love the unseen Elohim (God) is exposed as a lie by the hatred of the seen brother, for they are one law. The apostle quotes the Torah as the commandment the assembly *have... from him.*',
       sv.verse_id, ev.verse_id, 'free', 10102
  FROM _s242_j242c4_lookup sv, _s242_j242c4_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:3 — *Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah... with all your heart* the Torah''s test of the prophet/dreamer; *try the spirits whether they are of Elohim (God)* (1 John 4:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:5 — the false prophet seeks *to thrust thee out of the way which Yahuah Elohayka (the LORD thy God) commanded thee to walk in*; the same breed are John''s *many false prophets... gone out into the world* (1 John 4:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:20 — *the prophet, which shall presume to speak a word in my name, which I have not commanded... shall die* the seed of John''s test; the spirit that confesseth not is *that spirit of antichrist* (1 John 4:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 18:22 — *if the thing follow not, nor come to pass... thou shalt not be afraid of him* the failing word unmasks the false prophet; behind John''s *ye... have overcome them... greater is he that is in you* (1 John 4:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 8:20 — *To the law and to the testimony: if they speak not according to this word... there is no light in them* the standard of all discernment; John''s *spirit of truth, and the spirit of error* (1 John 4:6).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-try-the-spirits-whether-they-are-of-elohim-deuteronomy-13-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the old commandment sealed with His name; *let us love one another: for love is of Elohim (God)* (1 John 4:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* the Shema''s first command, made the proof of knowing Him; *He that loveth not knoweth not Elohim (God); for Elohim (God) is love* (1 John 4:8).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 6:5 — the whole-hearted love of the Shema brought to its perfecting; *If we love one another, Elohim (God) dwelleth in us, and his love is perfected in us* (1 John 4:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 2:16 — *they that love him shall be filled with the law* the Hebrew library binds love and Torah in one motion; *every one that loveth is born of Elohim (God), and knoweth Elohim (God)* (1 John 4:7).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-beloved-let-us-love-one-another-for-love-is-of-elohim-leviticus-19-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:11 — *I, even I, am Yahuah (LORD); and beside me there is no saviour* the salvation belongs to Yahuah (LORD) alone; *the Father sent the Son to be the Saviour of the world* (1 John 4:14), the Father the sender.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:11 — beside Yahuah (LORD) there is no saviour, so the only-begotten saves not as a rival; *Elohim (God) sent his only begotten Son into the world, that we might live through him* (1 John 4:9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* the begetting is the Father''s declaring; *Elohim (God) sent his only begotten Son into the world* (1 John 4:9), the Father the source.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-the-father-sent-the-son-to-be-the-saviour-of-the-world-isaiah-43-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:8 — *because Yahuah (LORD) loved you... hath Yahuah (LORD) brought you out with a mighty hand* the exodus rested on His prior love; *We love him, because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:7 — Yahuah (LORD) loved and chose for no merit, *for ye were the fewest of all people*; our love is wholly answer, *because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:3 — *I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* the love that draws went before; *We love him, because he first loved us* (1 John 4:19).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-we-love-him-because-he-first-loved-us-deuteronomy-7-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart* the very hatred that exposes the lie; *If a man say, I love Elohim (God), and hateth his brother, he is a liar* (1 John 4:20).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the old commandment named outright; *this commandment have we from him, That he who loveth Elohim (God) love his brother also* (1 John 4:21).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c4_lookup sv, _s242_j242c4_lookup tv
 WHERE t.slug='1-john-4-if-a-man-say-i-love-elohim-and-hateth-his-brother-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
