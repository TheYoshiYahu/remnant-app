-- =====================================================================
-- Session 74 migration — 2026-05-17
-- =====================================================================
-- Cross-reference threads 2 through 5 — the v1 framework-diagnostic
-- overlay for the chapter-end card. Session 73 landed the schema and
-- the first thread (post-harvest-sifting); this migration adds:
--
--   2. grace-from-name's-sake
--      Anchor: Ezekiel 36:22-23 + Deuteronomy 9:5-6
--      Re-anchors the Pauline grace passages to the Tanakh source the
--      Reformation grammar cut in half. Grace is "for his name's sake,"
--      "not for thy righteousness" — the same sentence Paul is writing
--      when he says "by grace are ye saved through faith." The thread
--      makes the Tanakh source visible at the chapter-end card so the
--      sola-fide truncation can't sit unchallenged.
--
--   3. new-heart
--      Anchor: Ezekiel 36:26-27 + Ezekiel 11:19 + Jeremiah 31:31-34
--      The new covenant promise is Torah internalized, not Torah
--      replaced. "I will put my Ruach (Spirit) within you, AND CAUSE
--      YOU TO WALK IN MY STATUTES." The thread surfaces the NT passages
--      (Hebrews 8, 2 Corinthians 3, Romans 2:29, Romans 7:6) as
--      restating the Tanakh promise, not announcing its abolition.
--
--   4. scattered-seed-gathering
--      Anchor: Hosea 1:9-10 + Jeremiah 31:10
--      The Lo-Ammi / sons-of-the-living-God arc. Paul quotes Hosea in
--      Romans 9 about the scattered house coming home — not about
--      pagans being added. The thread keeps the three categories
--      intact at the chapter-end card: the "Gentiles" of Paul's
--      letters are often Category 2, the scattered seed living as
--      Gentiles among the nations.
--
--   5. false-inclusion-rebuttal
--      Anchor: Romans 11:17-24 (olive tree)
--      Red Line #11 in full. Both branches on the olive tree are
--      Yashar'el (Israel). The wild olive descended from the broken-
--      off and grew wild among the nations; the grafting is the
--      destination of the journey (gathered from the nations -> rod
--      sifts -> bond of the new covenant -> grafted into the natural
--      root), not a faith-confession doorway. The thread surfaces
--      the cause-and-effect reversal (hearing reveals what was always
--      true) and the names-can-only-be-blotted-out reading.
--
-- Framework note: threads 2-5 finish the v1 set. Together with thread 1
-- (post-harvest-sifting) they cover the five framework-bearing readings
-- the chapter-end card needs to surface from the moment v1 ships:
-- the post-harvest sifting (#1), grace-as-return-not-cancellation (#2),
-- new heart as Torah internalized (#3), scattered seed coming home (#4),
-- and the inclusion-gospel rebuttal (#5). The Treasury of Scripture
-- Knowledge comprehensive baseline remains queued as v1.1.
--
-- Schema: no DDL changes required — Session 73 landed the
-- cross_reference_threads + cross_reference_thread_members tables and
-- flipped cross_references.tier_required default to 'free'. This
-- migration only seeds rows.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING. Re-running
-- produces zero side effects after the first apply.
--
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session74_cross_reference_threads_2_to_5.sql
-- =====================================================================

\echo 'Session 74 migration starting...'

BEGIN;

-- ---------------------------------------------------------------------
-- Verse-id lookup helper as a temporary view scoped to this txn.
-- Spans every book any of the four threads cite, in the canon edition.
-- ---------------------------------------------------------------------
CREATE TEMP VIEW _s74_verse_lookup AS
SELECT
    b.slug          AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id            AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books b    ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon'
   AND b.slug IN (
       -- Tanakh anchors / targets
       'deuteronomy','isaiah','jeremiah','ezekiel','hosea',
       -- NT sources
       'john','romans','2-corinthians','ephesians','2-timothy',
       'titus','hebrews','1-peter','revelation'
   );

-- =====================================================================
-- THREAD 2: grace-from-name's-sake
-- =====================================================================
-- Anchor: Ezekiel 36:22-23 (the wider passage runs through v32: "not
-- for your sakes do I this... but for mine holy name's sake"). The
-- thread's grace-as-return-not-cancellation frame holds together
-- across this passage and the Deuteronomy 9:5-6 parallel; for the
-- anchor field we use the Ezekiel range and surface the Deuteronomy
-- parallel inside the prose.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'grace-from-names-sake',
    'Grace from his name''s sake — the Tanakh source the Reformation cut in half',
    E'Ezekiel 36:22-32 and Deuteronomy 9:5-6 are the Tanakh source for every Pauline grace passage. The Reformation cut the sentence in half and read the first clause alone as the whole gospel; the Tanakh source restores the missing back half.\n\n*"I do not this for your sakes, O house of Yashar''el (Israel), but for mine holy name''s sake, which ye have profaned among the heathen, whither ye went. And I will sanctify my great name... and the heathen shall know that I am Yahuah (the LORD)... when I shall be sanctified in you before their eyes. For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land. Then will I sprinkle clean water upon you, and ye shall be clean... A new heart also will I give you, and a new spirit will I put within you... And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them."* (Ezekiel 36:22-27)\n\n*"Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land... understand therefore, that Yahuah (the LORD) thy Elohim (God) giveth thee not this good land to possess it for thy righteousness; for thou art a stiffnecked people."* (Deuteronomy 9:5-6)\n\nThis is the whole sentence Paul is writing when he says *by grace are ye saved through faith.* Yahuah (the LORD) acts FOR HIS NAME''S SAKE — not for the recipient''s worth, not for the recipient''s righteousness, not as reward for performance — and the action he takes is to gather the scattered house out of the nations, sprinkle them clean, give them a new heart, put his Ruach (Spirit) within them, and cause them to walk in his statutes. Grace is the means of return TO the Way. The cross is the door home, not the cancellation of the consequence-system. The free gift carries the homecoming; the homecoming carries the walk; the walk is the keeping of his judgments by Spirit-empowered obedience.\n\nThe sola-fide grammar reads Ephesians 2:8 as if the sentence ended there. The Tanakh source ends the sentence the way Ezekiel ends it: *I will cause you to walk in my statutes, and ye shall keep my judgments, and do them.* Same grace. Same name''s-sake. Same destination.',
    sv.verse_id,
    ev.verse_id,
    'free'::content_tier,
    200
  FROM _s74_verse_lookup sv, _s74_verse_lookup ev
 WHERE sv.book_slug = 'ezekiel' AND sv.chapter_number = 36 AND sv.verse_number = 22
   AND ev.book_slug = 'ezekiel' AND ev.chapter_number = 36 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

-- Cross-reference pairs for thread 2.
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        ('ephesians',   2,  8, 'ezekiel',     36, 22,  1, 'By grace are ye saved through faith = "not for your sakes... but for mine holy name''s sake"'),
        ('ephesians',   2,  9, 'deuteronomy',  9,  5,  2, 'Not of works, lest any man should boast = "not for thy righteousness"'),
        ('titus',       3,  5, 'deuteronomy',  9,  5,  3, 'Not by works of righteousness which we have done = "not for thy righteousness"'),
        ('romans',      9, 11, 'deuteronomy',  9,  5,  4, 'Election not of works but of him that calleth = "not for thy righteousness"'),
        ('2-timothy',   1,  9, 'ezekiel',     36, 22,  5, 'Not according to our works, but according to his own purpose and grace = "not for your sakes"'),
        ('romans',     11,  6, 'deuteronomy',  9,  5,  6, 'If by grace, then is it no more of works = the Tanakh''s "not for thy righteousness"'),
        ('ephesians',   2, 10, 'ezekiel',     36, 27,  7, 'Created in HaMashiach Yahusha unto good works = "cause you to walk in my statutes" — the back half of the sentence')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:grace-from-names-sake | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s74_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s74_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread 2 members.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'grace-from-names-sake'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:grace-from-names-sake | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- THREAD 3: new-heart
-- =====================================================================
-- Anchor: Ezekiel 36:26-27. The Jeremiah 31:31-34 parallel and the
-- Ezekiel 11:19 echo live in the prose; the anchor field uses the
-- 36:26-27 range because it's the verse pair Hebrews 8 and 2
-- Corinthians 3 are most directly grafted to.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'new-heart',
    'New heart, new spirit, same Torah — written inside instead of on stone',
    E'Ezekiel 36:26-27, Ezekiel 11:19, and Jeremiah 31:31-34 are the Tanakh source for the new covenant. The promise was never Torah replaced. The promise was Torah internalized.\n\n*"A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them."* (Ezekiel 36:26-27)\n\n*"Behold, the days come, saith Yahuah (the LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people."* (Jeremiah 31:31, 33)\n\nThe new covenant is the same Torah, on a different surface. Stone tablets out; fleshy tables of the heart in. External performance out; Spirit-empowered obedience in. The Torah is not abolished — it is moved from the outside to the inside, and the same Spirit who spoke at Sinai is the one who now writes it.\n\nThe Christian reading inverts this. It hears *new* and reads *replacement.* It hears *letter killeth, spirit giveth life* and reads *Torah killeth, freedom-from-Torah giveth life.* The Tanakh source forbids the inversion. The letter that kills is the externalized-only Torah without the Spirit — the Pharisaical performance that the new covenant promise was given precisely to heal. The Spirit who gives life IS the Spirit who spoke at Sinai, and what he does inside the heart is the same thing he commanded outside: *cause you to walk in my statutes, and ye shall keep my judgments, and do them.* Two heart-surfaces, one Torah, one Spirit.\n\nHebrews 8 quotes Jeremiah 31 verbatim because the author is showing that the new covenant is not a Christian innovation — it is the Tanakh promise breaking into time. The thread surfaces the source so the reader meets the new covenant as the fulfillment of Ezekiel and Jeremiah, not as a replacement of them.',
    sv.verse_id,
    ev.verse_id,
    'free'::content_tier,
    300
  FROM _s74_verse_lookup sv, _s74_verse_lookup ev
 WHERE sv.book_slug = 'ezekiel' AND sv.chapter_number = 36 AND sv.verse_number = 26
   AND ev.book_slug = 'ezekiel' AND ev.chapter_number = 36 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- Cross-reference pairs for thread 3.
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        ('hebrews',       8,  8, 'jeremiah', 31, 31,  1, 'Behold, the days come... I will make a new covenant = Jeremiah 31:31 verbatim'),
        ('hebrews',       8, 10, 'jeremiah', 31, 33,  2, 'I will put my laws into their mind, and write them in their hearts = Jeremiah 31:33 verbatim'),
        ('hebrews',       8, 12, 'jeremiah', 31, 34,  3, 'I will be merciful... and remember no more = Jeremiah 31:34 verbatim'),
        ('2-corinthians', 3,  3, 'jeremiah', 31, 33,  4, 'Written... in fleshy tables of the heart = the law written in their hearts'),
        ('2-corinthians', 3,  6, 'ezekiel',  36, 27,  5, 'Ministers of the spirit... the spirit giveth life = the Ruach that causes walking in his statutes'),
        ('romans',        2, 29, 'ezekiel',  36, 26,  6, 'Circumcision is that of the heart, in the spirit = the new heart, the heart of flesh'),
        ('romans',        7,  6, 'ezekiel',  36, 27,  7, 'Serve in newness of spirit = Spirit-empowered Torah, not Torah-abolished'),
        ('hebrews',       8,  9, 'jeremiah', 31, 32,  8, 'Not according to the covenant... which they brake = Jeremiah 31:32 verbatim'),
        ('2-corinthians', 3,  3, 'ezekiel',  11, 19,  9, 'Heart of flesh, not stone = Ezekiel 11:19 parallel')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:new-heart | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s74_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s74_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread 3 members.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'new-heart'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:new-heart | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- THREAD 4: scattered-seed-gathering
-- =====================================================================
-- Anchor: Hosea 1:9-10. The Jeremiah 31:10 echo (he that scattered
-- Yashar'el will gather him) and Ezekiel 37 live in the prose; Hosea
-- 1:9-10 is the verse pair Paul lifts in Romans 9:25-26.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'scattered-seed-gathering',
    'Lo-Ammi to sons-of-the-living-Elohim — the scattered house coming home',
    E'Hosea 1:9-10 names the divorce and names the restoration in two consecutive verses. *"Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God). Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)."*\n\nThe *not my people* of Hosea 1:9 is the divorced northern kingdom — the ten tribes scattered through the Assyrian captivity, dispersed among the nations until they became indistinguishable from the nations. The *ye are the sons of the living Elohim (God)* of Hosea 1:10 is the same people, restored. The two verses are one prophecy: Yahuah (the LORD) names the divorce and names the homecoming in the same breath.\n\nPaul quotes both verses in Romans 9:25-26. He is not announcing a new doctrine. He is reading Hosea. *"As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved. And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)."* The *Gentiles* of Romans 9:24 in Paul''s context are the scattered seed living as Gentiles among the nations — the Lo-Ammi house coming home. The binary Jew-and-Gentile reading collapses this. The Tanakh source insists on it: the gathering is the gathering of the seed Yahuah (the LORD) himself scattered, and the prophets named them specifically — Ephraim, Yosef, Yashar''el (Israel), the house of the north.\n\nJeremiah 31:10 says the same thing in different words: *"Hear the word of Yahuah (the LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock."* The scatterer is the gatherer. The same one who sent them out brings them home.\n\n1 Peter 2:9-10 carries the same arc: *"a chosen generation, a royal priesthood, an holy nation, a peculiar people... which in time past were not a people, but are now the people of Elohim (God)."* The Tanakh source for that whole sentence is Exodus 19:6 (*"unto me a kingdom of priests, and an holy nation"*) and Hosea 1:9-10 (*"not a people... the people of Elohim (God)"*). Peter is writing to the scattered seed coming home, not to a new spiritual category.',
    sv.verse_id,
    ev.verse_id,
    'free'::content_tier,
    400
  FROM _s74_verse_lookup sv, _s74_verse_lookup ev
 WHERE sv.book_slug = 'hosea' AND sv.chapter_number = 1 AND sv.verse_number = 9
   AND ev.book_slug = 'hosea' AND ev.chapter_number = 1 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

-- Cross-reference pairs for thread 4.
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        ('romans',    9, 25, 'hosea',    2, 23,  1, 'I will call them my people, which were not my people = Hosea 2:23'),
        ('romans',    9, 26, 'hosea',    1, 10,  2, 'In the place where it was said... ye are the sons of the living Elohim = Hosea 1:10 verbatim'),
        ('1-peter',   2, 10, 'hosea',    1,  9,  3, 'Which in time past were not a people = Lo-Ammi'),
        ('1-peter',   2, 10, 'hosea',    2, 23,  4, 'But are now the people of Elohim = the Lo-Ammi reversal'),
        ('ephesians', 2, 12, 'ezekiel', 37, 21,  5, 'Aliens from the commonwealth of Yashar''el = the scattered seed before the gathering'),
        ('ephesians', 2, 13, 'isaiah',  57, 19,  6, 'Ye who sometimes were far off are made nigh = peace to him that is far off, and to him that is near'),
        ('romans',   11, 25, 'isaiah',  59, 20,  7, 'There shall come out of Sion the Deliverer = Isaiah 59:20 (Paul''s quotation in Romans 11:26)'),
        ('romans',    9, 24, 'jeremiah', 31, 10,  8, 'Whom he hath called, not of the Jews only = the shepherd gathering the scattered flock')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:scattered-seed-gathering | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s74_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s74_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread 4 members.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'scattered-seed-gathering'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:scattered-seed-gathering | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- THREAD 5: false-inclusion-rebuttal
-- =====================================================================
-- Anchor: Romans 11:17-24. The Red-Line-#11 reading in full. The
-- thread reads Romans 11 against Jeremiah 11:16 (olive = Yashar'el),
-- Hosea 14:6 (restoration imagery), Ezekiel 37:21 (gathering),
-- Ezekiel 20:37-38 (the rod sifts), Isaiah 59:20 (the Deliverer
-- coming out of Sion), and John 10:26 (the cause-and-effect
-- reversal). The wild olive is the descendants of the broken-off
-- grown wild among the nations; the grafting is the destination of
-- the journey, not the doorway.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (
    slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order
)
SELECT
    'false-inclusion-rebuttal',
    'The olive tree is Yashar''el — both branches, all the way through',
    E'Romans 11:17-24 is the verse the inclusion gospel hangs on. The inherited reading hears *wild olive grafted in* and pictures non-Yashar''eli (non-Israelite) outsiders being added to the covenant tree by faith-confession. The Tanakh source forbids that reading. Both branches on the olive tree are Yashar''el (Israel).\n\n*"Yahuah (the LORD) called thy name, A green olive tree, fair, and of goodly fruit"* (Jeremiah 11:16). The olive IS Yashar''el (Israel). The tree is the covenant lineage planted in Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob), carried through the twelve tribes.\n\nThe natural branches are not a living group today. They are the covenant lineage of Yashar''el (Israel) — the line of Adam carried forward through the patriarchs into the twelve tribes — broken off when both houses fell into unbelief and were scattered. The forefathers who walked the covenant faithfully in their lifetimes (Avraham (Abraham), Yitschaq (Isaac), Ya''aqov (Jacob), Mosheh (Moses), David, the prophets, the faithful unnamed of every generation back) are asleep, awaiting the first resurrection. *"Yahuah (the LORD) is able to graft them in again"* (Romans 11:23) — into their own root, at the resurrection. Even Paul did not presume on attaining it.\n\nThe wild olive branches are us — the living descendants of the broken-off. Both modern Yahudah (Judah) and the modern scattered seed of Yashar''el (Israel) are children of the broken-off. The wild olive does not partake of the root by mere faith-confession in this age. The wild olive comes home through the journey the prophets named: *gathered out of the nations* (Ezekiel 37:21) -> *brought under the rod* (Ezekiel 20:37) where the rod sifts and *purges out the rebels* (Ezekiel 20:38) -> *brought into the bond of the new covenant* (Jeremiah 31:31) -> and then *grafted into the natural root of the fathers* (Romans 11:24). The grafting is the destination of the journey. Not the doorway.\n\nThe cause-and-effect reversal that distinguishes the truth from the inclusion gospel: *if you hear, you are sons of Avraham (Abraham). You are sons of Adam. You are the seed of promise. You are heirs of the covenant.* You did not choose to hear and *become* these things. You heard because you *are* these things. *"My sheep hear my voice... ye believe not, because ye are not of my sheep"* (John 10:27, 26). Hearing reveals what was always true. The church says *if you hear and confess, you become a child of Yahuah (the LORD).* Scripture says *if you are a child of Yahuah (the LORD), you will hear when he calls.*\n\nNo name is added after the foundation of the world. Names can only be blotted out, and the warning to be blotted out is given to the wheat, not to the tares. The harvest separates wheat from tares; the tares are bound and burned at the harvest because they were never wheat. The gathered wheat then passes through the post-harvest sifting in the wilderness of the peoples — the thread anchored at Ezekiel 20:33-44 — where the rod purges out the rebels from among the gathered.\n\n*"And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Ya''aqov (Jacob)."* (Romans 11:26)',
    sv.verse_id,
    ev.verse_id,
    'free'::content_tier,
    500
  FROM _s74_verse_lookup sv, _s74_verse_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 11 AND sv.verse_number = 17
   AND ev.book_slug = 'romans' AND ev.chapter_number = 11 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

-- Cross-reference pairs for thread 5.
WITH new_xrefs(source_book, source_chap, source_v, target_book, target_chap, target_v, sort_order, member_note) AS (
    VALUES
        ('romans',    11, 17, 'jeremiah', 11, 16,  1, 'Wild olive graffed in among them = the olive tree IS Yashar''el (Jer 11:16)'),
        ('romans',    11, 23, 'ezekiel',  37, 21,  2, 'Able to graff them in again = the gathering of the scattered out of the heathen'),
        ('romans',    11, 24, 'hosea',    14,  6,  3, 'Grafted into their own olive tree = restoration imagery, his beauty as the olive tree'),
        ('romans',    11, 25, 'ezekiel',  20, 37,  4, 'Until the fulness of the Gentiles be come in = the rod-sifting after the gathering'),
        ('romans',    11, 25, 'ezekiel',  20, 38,  5, 'Blindness in part = the rebels purged out at the wilderness sifting'),
        ('romans',    11, 26, 'isaiah',   59, 20,  6, 'There shall come out of Sion the Deliverer = Isaiah 59:20 (Paul''s Tanakh source)'),
        ('romans',    11, 27, 'jeremiah', 31, 31,  7, 'This is my covenant unto them = the new covenant of Jeremiah 31:31'),
        ('john',      10, 26, 'isaiah',    6,  9,  8, 'Ye believe not, because ye are not of my sheep = hearing without hearing'),
        ('john',      10, 27, 'hosea',     2, 23,  9, 'My sheep hear my voice = I will call them my people, which were not my people'),
        ('revelation', 13,  8, 'isaiah',    4,  3, 10, 'Names written in the book of life from the foundation of the world = the names written among the living'),
        ('romans',    11, 26, 'hosea',     1, 10, 11, 'And so all Yashar''el shall be saved = sons of the living Elohim (Hosea 1:10)')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
    sv.verse_id,
    tv.verse_id,
    'manual',
    'thread:false-inclusion-rebuttal | ' || nx.member_note,
    'free'::content_tier
  FROM new_xrefs nx
  JOIN _s74_verse_lookup sv
    ON sv.book_slug = nx.source_book
   AND sv.chapter_number = nx.source_chap
   AND sv.verse_number = nx.source_v
  JOIN _s74_verse_lookup tv
    ON tv.book_slug = nx.target_book
   AND tv.chapter_number = nx.target_chap
   AND tv.verse_number = nx.target_v
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread 5 members.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
    t.id,
    x.id,
    ROW_NUMBER() OVER (
        ORDER BY
            sb.canonical_order, sc.chapter_number, sv.verse_number,
            tb.canonical_order, tc.chapter_number, tv.verse_number
    ) AS sort_order,
    SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'false-inclusion-rebuttal'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:false-inclusion-rebuttal | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Clean up the lookup view and bump schema_version.
-- ---------------------------------------------------------------------
DROP VIEW _s74_verse_lookup;

UPDATE schema_version
   SET version   = '1.0.0-phase4-session74',
       landed_at = now(),
       notes     = 'Session 74 (2026-05-17) — cross-reference threads 2 through 5, the v1 framework-diagnostic overlay for the chapter-end card. Seeded: grace-from-names-sake (anchor Ezek 36:22-32, 7 pairs into Eph/Titus/Rom/2Tim — re-anchors Pauline grace to the name''s-sake / not-for-thy-righteousness Tanakh source the Reformation cut in half), new-heart (anchor Ezek 36:26-27, 9 pairs into Heb 8/2Cor 3/Rom 2/Rom 7 — the new covenant as Torah internalized, not Torah replaced), scattered-seed-gathering (anchor Hosea 1:9-10, 8 pairs into Rom 9/1Pet 2/Eph 2/Rom 11 — Lo-Ammi to sons-of-the-living-Elohim, the scattered house coming home), false-inclusion-rebuttal (anchor Rom 11:17-24, 11 pairs into Jer 11/Hos 14/Ezek 20/Ezek 37/Isa 59/Jer 31/Isa 6/Hos 2/Isa 4/Hos 1 — Red Line #11 in full: both branches are Yashar''el, wild olive descended from broken-off, grafting is destination of the gathering->rod->bond journey not the doorway, cause-and-effect reversal that hearing reveals what was always true, no name added after the foundation of the world). Together with thread 1 (post-harvest-sifting, S73) this completes the five-thread v1 overlay. TSK comprehensive baseline ingestion remains queued for v1.1.'
 WHERE id = 1;

COMMIT;

\echo 'Session 74 migration committed. Verifying...'

-- =====================================================================
-- Verification queries (read-only)
-- =====================================================================

\echo ''
\echo '--- Verify 1: five threads present with anchors ---'
SELECT t.sort_order, t.slug, t.title, t.tier_required,
       sb.slug || ' ' || sc.chapter_number || ':' || sv.verse_number AS anchor_start,
       eb.slug || ' ' || ec.chapter_number || ':' || ev.verse_number AS anchor_end
  FROM cross_reference_threads t
  LEFT JOIN verses sv ON sv.id = t.anchor_verse_id_start
  LEFT JOIN chapters sc ON sc.id = sv.chapter_id
  LEFT JOIN books sb ON sb.id = sc.book_id
  LEFT JOIN verses ev ON ev.id = t.anchor_verse_id_end
  LEFT JOIN chapters ec ON ec.id = ev.chapter_id
  LEFT JOIN books eb ON eb.id = ec.book_id
 ORDER BY t.sort_order;

\echo ''
\echo '--- Verify 2: member counts per thread (expect 12 / 7 / 9 / 8 / 11) ---'
SELECT t.slug, COUNT(*) AS member_count
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 GROUP BY t.slug
 ORDER BY t.slug;

\echo ''
\echo '--- Verify 3: any member rows where the source or target verse failed to resolve? ---'
SELECT t.slug, COUNT(*) AS bad_rows
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
  JOIN cross_references x ON x.id = m.cross_reference_id
 WHERE x.source_verse_id IS NULL OR x.target_verse_id IS NULL
 GROUP BY t.slug;

\echo ''
\echo '--- Verify 4: schema_version current ---'
SELECT * FROM schema_version;

\echo ''
\echo 'Session 74 migration complete.'
