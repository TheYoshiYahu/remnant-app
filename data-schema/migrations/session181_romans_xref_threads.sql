-- =====================================================================
-- Session 181 migration — romans-anchored cross-reference threads
-- =====================================================================
-- 16 threads with 157 member rows
-- Anchor: Romans book — companion to any pre-existing
-- romans-anchored threads from S74 / S110+. All threads at tier='free'.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session181_romans_xref_threads.sql
-- =====================================================================

\echo 'Session 181 romans migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction.
CREATE TEMP VIEW _s181_romans_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: gospel-promised-afore
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'gospel-promised-afore',
    E'The gospel of Yahusha was promised afore by his prophets',
    E'Paul opens the letter by naming what the gospel he preaches is *not*. It is not a new revelation handed down outside the scriptures. It is not a Greek innovation grafted onto a Hebrew root. It is the same good news Yahuah (the LORD) spoke through his prophets and wrote into the holy scriptures long before Yahusha (Jesus) walked Galilee.\n\n*Paul, a servant of Yahusha HaMashiach (Jesus Christ), called to be an apostle, separated unto the gospel of Elohim (God), which he had promised afore by his prophets in the holy scriptures, concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh.* (Romans 1:1-3)\n\nThe gospel is *promised afore.* The scriptures that promised it are the Hebrew scriptures — Moses, the prophets, the Psalms. The Messiah the gospel is concerning is *of the seed of David according to the flesh* — the paternal blood-line carrying the patriarchal promises forward from Avraham (Abraham) through Yitschaq (Isaac) and Ya''aqov (Jacob) and into the tribe of Yahudah (Judah). Paul is not announcing a religion. He is announcing the arrival of what the prophets said was coming.\n\n*Behold, the days come, saith Yahuah (the LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth. In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely.* (Jeremiah 23:5-6)\n\nThis thread surfaces the Tanakh verses Paul is drawing on at the letter''s opening so that the inherited reading — *Paul preached a new gospel that replaced the old one* — cannot stand. The gospel was *promised afore.* Paul read the same scriptures we read. He preached the substance those scriptures had already named.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1001
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 1 AND ev.verse_number = 4
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 1, 2, 'isaiah', 52, 7, 1, E'*Promised afore by his prophets* = *how beautiful upon the mountains are the feet of him that bringeth good tidings* — the prophetic good news of the kingdom.'),
  ('romans', 1, 2, 'jeremiah', 23, 5, 2, E'*Promised afore* = the righteous Branch raised unto David, foretold in the prophets.'),
  ('romans', 1, 3, '2-samuel', 7, 12, 3, E'*Made of the seed of David according to the flesh* = the Davidic covenant promise of the seed who shall build the house.'),
  ('romans', 1, 3, 'psalms', 132, 11, 4, E'*Of the seed of David* = *of the fruit of thy body will I set upon thy throne* — the oath Yahuah (the LORD) sware unto David.'),
  ('romans', 1, 3, 'isaiah', 11, 1, 5, E'*Seed of David* = *a rod out of the stem of Yishai (Jesse), and a Branch shall grow out of his roots* — the same paternal-seed lineage.'),
  ('romans', 1, 4, 'psalms', 2, 7, 6, E'*Declared to be the Son of Elohim (God) with power* = *thou art my Son; this day have I begotten thee* — the enthronement Psalm Paul will cite again at Acts 13:33.'),
  ('romans', 1, 4, 'daniel', 7, 13, 7, E'*Declared to be the Son of Elohim (God)* by the resurrection = the everlasting dominion given to the one *like the Son of Adam* who comes with the clouds of heaven.'),
  ('romans', 1, 5, 'isaiah', 49, 6, 8, E'*For obedience to the faith among all nations* = *I will also give thee for a light to the Goyim (Gentiles), that thou mayest be my salvation unto the end of the earth* — the same prophetic mission Paul names at Acts 13:47. Paul''s mission is to the *uncircumcision,* the scattered seed of Yashar''el (Israel) living as Gentiles among the nations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:gospel-promised-afore | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for gospel-promised-afore.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'gospel-promised-afore'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:gospel-promised-afore | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: just-shall-live-by-his-faithfulness
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'just-shall-live-by-his-faithfulness',
    E'The just shall live by his faithfulness — emunah as covenant walking',
    E'Paul''s thesis verse for the letter quotes Habakkuk. The inherited reading hears *the just shall live by faith* as Reformation grammar — mental assent to a proposition about the cross, the moment a sinner is declared righteous, the basis for assurance against the operation of the commandments. The Tanakh source forbids that reading. The Hebrew word Habakkuk used is *emunah* — faithfulness, covenant fidelity, the steady walk of trust that keeps the appointed way through the trouble. The just one *lives* — present tense, continuous, life-long — by his faithful walking.\n\n*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4)\n\nHabakkuk was speaking to the covenant community on the eve of the Babylonian judgment. The proud and unfaithful would fall. The just — those who held to Yahuah (the LORD)''s ways through the long trouble — would live. *Emunah* there is not the moment of mental assent that flips a soul from condemned to acquitted. *Emunah* is the steady covenant fidelity that holds through exile, through trouble, through the day-of-Ya''aqov''s-trouble that is still operative now.\n\n*And he believed in Yahuah (the LORD); and he counted it to him for righteousness.* (Genesis 15:6)\n\nAvraham (Abraham)''s *belief* in Genesis 15:6 is the same substance — a faithful covenant-relationship that proved itself in walking, not a one-time mental transaction. The book of James will read Genesis 15:6 forward into Genesis 22 and name Avraham (Abraham) justified by works *when he had offered Yitschaq (Isaac) his son upon the altar* (James 2:21) — because the faithful walking is what *emunah* is. Paul cites Habakkuk and Genesis 15:6 to ground the gospel in the prophetic substance Habakkuk named; he does not cite them to retire the covenant fidelity those verses describe.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1002
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 1 AND sv.verse_number = 16
   AND ev.book_slug = 'romans' AND ev.chapter_number = 1 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 1, 17, 'habakkuk', 2, 4, 1, E'*The just shall live by his faith* = Habakkuk''s *emunah* — covenant faithfulness through the trouble, not mental assent in a moment.'),
  ('romans', 1, 17, 'genesis', 15, 6, 2, E'*The righteousness of Elohim (God) revealed from faith to faith* = Avraham (Abraham) believed Yahuah (the LORD), and it was counted to him for righteousness — the same emunah-substance.'),
  ('romans', 1, 17, 'psalms', 37, 39, 3, E'*The just shall live* = *the salvation of the righteous is of Yahuah (the LORD): he is their strength in the time of trouble* — the just live through the trouble by Yahuah''s strength.'),
  ('romans', 1, 17, 'proverbs', 28, 18, 4, E'*Live by his faith* = *whoso walketh uprightly shall be saved* — the walking is the substance of the faith.'),
  ('romans', 1, 16, 'isaiah', 49, 6, 5, E'*To the Yahudi (Jew) first, and also to the Greek* = the *light to the Goyim (Gentiles)* of Isaiah 49:6 — the mission to the scattered seed living among the nations. Paul''s *Greek* is not Athens — it is the scattered seed living as Gentiles among the Greek-speaking nations of the Pauline mission, the same Category-2 substance Isaiah 49:6 grounds.'),
  ('romans', 1, 17, 'hebrews', 10, 38, 6, E'*The just shall live by faith* = the writer of Hebrews quoting the same Habakkuk 2:4 and warning that *if any draw back, my soul shall have no pleasure in him* — the faith that lives is the faith that does not draw back.'),
  ('romans', 1, 17, 'james', 2, 21, 7, E'*From faith to faith* = Avraham (Abraham) justified by works when he offered Yitschaq (Isaac) upon the altar — Genesis 15:6 read forward into Genesis 22 as one substance.'),
  ('romans', 1, 17, 'galatians', 3, 11, 8, E'*The just shall live by his faith* = Paul citing Habakkuk again to ground the gospel in the prophetic substance — the same *emunah* in both letters.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:just-shall-live-by-his-faithfulness | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for just-shall-live-by-his-faithfulness.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'just-shall-live-by-his-faithfulness'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:just-shall-live-by-his-faithfulness | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: doers-of-the-law-circumcision-of-the-heart
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'doers-of-the-law-circumcision-of-the-heart',
    E'Doers of the law shall be justified — the heart-circumcision the Torah named',
    E'Romans 2 is the passage the antinomian reading cannot survive. Paul writes plainly: *not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* (Romans 2:13). The inherited grammar reads Paul as the apostle of grace-against-doing; the chapter itself names doing the Torah as the substance of being justified. The doctrine that Paul retired the Torah cannot stand on the page Paul wrote.\n\n*For when the Goyim (Gentiles), which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves: which shew the work of the law written in their hearts, their conscience also bearing witness, and their thoughts the mean while accusing or else excusing one another.* (Romans 2:14-15)\n\nThe *Goyim (Gentiles)* who do by nature the things contained in the law have the *work of the law written in their hearts.* This is not a description of pagans being acquitted apart from Torah. This is the scattered seed of Yashar''el (Israel) living as Gentiles among the nations — the Lo-Ammi house — in whom Torah is being written on the heart per the new covenant promise. Paul will cite that promise explicitly when he names *circumcision is that of the heart, in the Ruach (Spirit), and not in the letter* (Romans 2:29) — quoting the language of Moses and the prophets directly.\n\n*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16)\n\n*And Yahuah (the LORD) thy Elohim (God) will circumcise thine heart, and the heart of thy seed, to love Yahuah (the LORD) thy Elohim (God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6)\n\n*Circumcise yourselves to Yahuah (the LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Yerushalayim (Jerusalem), lest my fury come forth like fire.* (Jeremiah 4:4)\n\nThe heart-circumcision is not a Pauline innovation. It is the Torah''s own demand and the prophets'' own promise. The point of Romans 2 is not that the Torah is now off; the point is that outward conformity without the inward submission was always the failure mode the Torah itself named, and that the Spirit-written Torah on the heart of the scattered seed is what the new covenant produces. Paul is reading Moses and Jeremiah forward into his moment. The chapter is the most anti-antinomian sentence in the New Testament.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1003
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.book_slug = 'romans' AND ev.chapter_number = 2 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 2, 13, 'deuteronomy', 6, 25, 1, E'*The doers of the law shall be justified* = *it shall be our righteousness, if we observe to do all these commandments* — Moses naming the same substance.'),
  ('romans', 2, 13, 'james', 1, 22, 2, E'*Doers of the law shall be justified* = *be ye doers of the word, and not hearers only* — James and Paul reading the same Tanakh substance.'),
  ('romans', 2, 14, 'jeremiah', 31, 33, 3, E'*The Goyim (Gentiles)... do by nature the things contained in the law* = *I will put my law in their inward parts, and write it in their hearts* — the new covenant Torah-internalized promise. The *Goyim* here are the scattered seed of Yashar''el (Israel) in the Lo-Ammi condition, in whom the new covenant Torah-internalization is taking place.'),
  ('romans', 2, 15, 'ezekiel', 36, 26, 4, E'*The work of the law written in their hearts* = *a new heart also will I give you... I will put my Ruach (Spirit) within you, and cause you to walk in my statutes.*'),
  ('romans', 2, 25, 'genesis', 17, 10, 5, E'*Circumcision verily profiteth, if thou keep the law* = the covenant of circumcision Yahuah (the LORD) gave to Avraham (Abraham) — the sign of the covenant kept.'),
  ('romans', 2, 28, '1-samuel', 16, 7, 6, E'*He is not a Yahudi (Jew) which is one outwardly* = *Yahuah (the LORD) looketh on the heart* — the inward substance the Tanakh always named.'),
  ('romans', 2, 29, 'deuteronomy', 10, 16, 7, E'*Circumcision is that of the heart* = *circumcise therefore the foreskin of your heart, and be no more stiffnecked* — Moses naming the heart-circumcision in Torah itself.'),
  ('romans', 2, 29, 'deuteronomy', 30, 6, 8, E'*Circumcision of the heart* = *Yahuah (the LORD) thy Elohim (God) will circumcise thine heart... to love Yahuah (the LORD) thy Elohim (God) with all thine heart* — the covenant promise restoring the substance.'),
  ('romans', 2, 29, 'jeremiah', 4, 4, 9, E'*Circumcision of the heart* = *circumcise yourselves to Yahuah (the LORD), and take away the foreskins of your heart* — the prophet pleading the same substance to Yahudah (Judah).'),
  ('romans', 2, 29, 'jeremiah', 9, 25, 10, E'*Circumcision of the heart* = the prophetic indictment that the circumcised-in-flesh and the uncircumcised will both be visited, *for all the house of Yashar''el (Israel) are uncircumcised in the heart.*'),
  ('romans', 2, 13, 'matthew', 7, 21, 11, E'*Doers of the law shall be justified* = *not every one that saith unto me, Lord, Lord... but he that doeth the will of my Father which is in heaven.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:doers-of-the-law-circumcision-of-the-heart | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for doers-of-the-law-circumcision-of-the-heart.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'doers-of-the-law-circumcision-of-the-heart'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:doers-of-the-law-circumcision-of-the-heart | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: none-righteous-tanakh-catena
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'none-righteous-tanakh-catena',
    E'None righteous, no not one — Paul reading the Tanakh, not retiring it',
    E'Romans 3:9-20 is the long Tanakh catena where Paul demonstrates that *all have sinned* — and he demonstrates it by stitching together verses from Psalms and Isaiah, one after another. The chapter that the inherited reading cites as *the gospel goes beyond the Tanakh* is in fact Paul demonstrating the gospel *from* the Tanakh. Every clause in the indictment is a Hebrew scripture; the indictment is the prophets'' indictment, not Paul''s invention.\n\n*As it is written, There is none righteous, no, not one: there is none that understandeth, there is none that seeketh after Elohim (God). They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one.* (Romans 3:10-12)\n\nPaul is reading Psalm 14:1-3 and Psalm 53:1-3 verbatim. *Their throat is an open sepulchre* is Psalm 5:9. *The poison of asps is under their lips* is Psalm 140:3. *Whose mouth is full of cursing and bitterness* is Psalm 10:7. *Their feet are swift to shed blood; destruction and misery are in their ways* is Isaiah 59:7-8. *There is no fear of Elohim (God) before their eyes* is Psalm 36:1. Seven Tanakh quotations stacked one after another to make a single point: *we have before proved both Yahudim (Jews) and Goyim (Gentiles), that they are all under sin* (Romans 3:9).\n\nThe verse the inherited reading lifts as the Pauline thesis — *by the deeds of the law there shall no flesh be justified in his sight* (Romans 3:20) — does not retire the Torah. It names the function the Torah''s own indictment has always performed: *by the law is the knowledge of sin.* The Torah names sin as sin. It convicts. It cannot make the convicted righteous on its own — that was never its job; that was the promise the prophets named and the work of the Messiah. The catena establishes that Paul is reading the Tanakh forward into his moment, not writing a new chapter against it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1004
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 3 AND sv.verse_number = 9
   AND ev.book_slug = 'romans' AND ev.chapter_number = 3 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 3, 10, 'psalms', 14, 1, 1, E'*There is none righteous, no, not one* = Psalm 14:1''s *there is none that doeth good* — the catena''s first stitch.'),
  ('romans', 3, 11, 'psalms', 14, 2, 2, E'*There is none that understandeth, there is none that seeketh after Elohim (God)* = Psalm 14:2 verbatim.'),
  ('romans', 3, 12, 'psalms', 14, 3, 3, E'*They are all gone out of the way... none that doeth good, no, not one* = Psalm 14:3 verbatim.'),
  ('romans', 3, 12, 'psalms', 53, 3, 4, E'*They are all gone out of the way* = Psalm 53:3 — the parallel Psalm Paul is also drawing from.'),
  ('romans', 3, 13, 'psalms', 5, 9, 5, E'*Their throat is an open sepulchre; with their tongues they have used deceit* = Psalm 5:9 verbatim.'),
  ('romans', 3, 13, 'psalms', 140, 3, 6, E'*The poison of asps is under their lips* = Psalm 140:3 verbatim.'),
  ('romans', 3, 14, 'psalms', 10, 7, 7, E'*Whose mouth is full of cursing and bitterness* = Psalm 10:7 verbatim.'),
  ('romans', 3, 15, 'isaiah', 59, 7, 8, E'*Their feet are swift to shed blood; destruction and misery are in their ways; the way of peace have they not known* = Isaiah 59:7-8 verbatim.'),
  ('romans', 3, 18, 'psalms', 36, 1, 9, E'*There is no fear of Elohim (God) before their eyes* = Psalm 36:1 verbatim.'),
  ('romans', 3, 19, 'psalms', 63, 11, 10, E'*Every mouth may be stopped* = *the mouth of them that speak lies shall be stopped* — the Tanakh substance of the silencing.'),
  ('romans', 3, 20, 'psalms', 143, 2, 11, E'*By the deeds of the law there shall no flesh be justified in his sight* = *in thy sight shall no man living be justified* — David''s psalm of repentance Paul is echoing word for word.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:none-righteous-tanakh-catena | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for none-righteous-tanakh-catena.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'none-righteous-tanakh-catena'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:none-righteous-tanakh-catena | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: works-of-the-law-flesh-credential
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'works-of-the-law-flesh-credential',
    E'Works of the law — the flesh-credential system, not Torah observance',
    E'Paul''s phrase *erga nomou* — translated *works of the law* — is the most weaponized phrase in the New Testament. The inherited reading hears it as a synonym for Torah observance and concludes that Torah-keeping cannot justify and is therefore set aside. The phrase does not mean that. *Erga nomou* in Paul''s vocabulary is a technical term for the circumcision party''s flesh-credential system — the doctrine that performing the ritual marks (circumcision, ceremonial separation, Pharisaic boundary-keeping) confers covenant standing independent of the Messiah and independent of the heart.\n\n*Where is boasting then? It is excluded. By what law? of works? Nay: but by the law of faith. Therefore we conclude that a man is justified by faith without the deeds of the law.* (Romans 3:27-28)\n\nThe *deeds of the law* Paul names here are *erga nomou* — the circumcision-party''s flesh-credential ritual system, not the Torah-substance Paul will himself name *established* by faith two verses later. The boasting that is excluded is the boasting of the circumcision-party''s flesh-credential — the same boasting Paul names in Galatians 6:13 (*neither they themselves who are circumcised keep the law; but desire to have you circumcised, that they may glory in your flesh*). The system Paul is dismantling is the lie that ritual performance confers standing. The Torah itself is not the system being dismantled; the Torah is what the circumcision party was voiding by their flesh-credentialism. Paul ends the paragraph with the move the inherited reading never quotes: *do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31).\n\n*And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised.* (Romans 4:11)\n\nRomans 4 is the structural proof. Avraham (Abraham) was reckoned righteous in Genesis 15:6 — *before* he was circumcised in Genesis 17, fourteen-plus years later. The covenant order itself rules out the flesh-credential gospel. The promise came first; the sign of circumcision came after; the sign was the seal of the righteousness Avraham (Abraham) already had by faithful covenant-relationship. The Judaizer-system inverted the order and made circumcision the door. Paul restores the order Genesis set.\n\nThe contemporary parallel is the antichrist substitution running in every age — the Pharisees compounded Torah with traditions that voided it (Mark 7:13); the Galatian agitators inverted the Genesis 15:6 / Genesis 17 sequence and made circumcision the door; institutional Christianity declares the Torah abolished and installs water-baptism-plus-creed-confession as the new flesh-credential. Same architecture. Different costume. *Erga nomou* names the flesh-credential system in each costume; it does not name Torah obedience under the new heart.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1005
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 3 AND sv.verse_number = 27
   AND ev.book_slug = 'romans' AND ev.chapter_number = 3 AND ev.verse_number = 31
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 3, 27, 'galatians', 6, 13, 1, E'*Boasting is excluded* = *that they may glory in your flesh... Elohim (God) forbid that I should glory, save in the cross of our Lord Yahusha HaMashiach (Jesus Christ)* — same boasting-of-the-flesh Paul names.'),
  ('romans', 3, 28, 'galatians', 2, 16, 2, E'*Justified by faith without the deeds of the law* = *not justified by the works of the law, but by the faith of Yahusha HaMashiach (Jesus Christ)* — same *erga nomou* technical term.'),
  ('romans', 3, 29, 'isaiah', 45, 22, 3, E'*Is he the Elohim (God) of the Yahudim (Jews) only? is he not also of the Goyim (Gentiles)?* = *Look unto me, and be ye saved, all the ends of the earth: for I am El (God), and there is none else* — the scattered-seed gathering across the nations the prophet named. (The *Goyim* of Paul''s mission are the scattered seed of Yashar''el (Israel) among the nations, per Acts 13:47 and Isaiah 49:6 — not Category-3 nations grafted in by faith-confession.)'),
  ('romans', 3, 31, 'matthew', 5, 17, 4, E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* = *think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* — Paul and Yahusha (Jesus) saying the same thing in different words.'),
  ('romans', 3, 31, 'deuteronomy', 27, 26, 5, E'*We establish the law* = the standing curse on *every one that confirmeth not all the words of this law to do them* — the covenant standard remains in force.'),
  ('romans', 4, 11, 'genesis', 17, 11, 6, E'*The sign of circumcision, a seal of the righteousness of the faith* = the covenant sign Yahuah (the LORD) gave Avraham (Abraham) after Genesis 15:6 — the seal, not the doorway.'),
  ('romans', 9, 32, 'isaiah', 8, 14, 7, E'*They stumbled at that stumblingstone* = *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — the flesh-credential system stumbling on the cornerstone of faithful covenant-walking.'),
  ('romans', 3, 28, 'james', 2, 24, 8, E'*Justified by faith without the deeds of the law* (erga nomou) read together with *a man is justified by works, and not by faith only* (erga in James) — the two erga are different vocabularies for different things; the contradiction the inherited reading manufactures dissolves when the technical terms are kept distinct.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:works-of-the-law-flesh-credential | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for works-of-the-law-flesh-credential.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'works-of-the-law-flesh-credential'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:works-of-the-law-flesh-credential | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 6: avraham-reckoned-before-circumcision
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'avraham-reckoned-before-circumcision',
    E'Avraham reckoned righteous before circumcision — the covenant timing-architecture',
    E'Romans 4 is the chapter where Paul proves the gospel he is preaching from the order of the Genesis text itself. The order matters. Avraham (Abraham) believed Yahuah (the LORD) at Genesis 15:6 and it was reckoned to him for righteousness *fourteen-plus years before* he received the covenant of circumcision at Genesis 17. The promise preceded the sign. The faithful relationship preceded the ritual mark. The covenant standing preceded the flesh-credential. Genesis itself rules out the doctrine that the ritual confers the standing.\n\n*And he believed in Yahuah (the LORD); and he counted it to him for righteousness.* (Genesis 15:6)\n\n*And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also.* (Romans 4:11)\n\nAvraham''s (Abraham''s) fatherhood of *all them that believe* is the cause-and-effect-reversal substance — those who believe are revealed as seed-of-promise by their hearing, not made seed by their confessing. The marriage-covenant absorption (Rachab into Salmon, Ruth into Boaz) remains the only mechanism by which foreign-origin individuals enter the seed-line; the seed-substance is paternal in every generation.\n\nThe Judaizer error inverts this order. The Pharisaical proselyte system, the Galatian agitators, modern institutional Christianity''s water-baptism-confers-standing, modern Hebrew Roots'' false inclusion gospel — all of them install the ritual at the head of the sequence and make it the doorway. Paul restores the Genesis order and reads it forward. Faithful covenant-relationship first; the sign of the covenant after; the sign as the seal of what was already true, not the mechanism by which it became true.\n\nThis is also the order the framework''s *cause-and-effect reversal* names. The Father''s election precedes the hearing; the hearing reveals what was always true. Avraham (Abraham) believed Yahuah (the LORD) because the Father had already drawn him out of Ur; the belief was the revealing, the circumcision was the sealing. The order is consistent through the whole covenant. Paul is not preaching a new gospel against the Torah. Paul is reading the Torah''s own sequence and refusing to let the circumcision party invert it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1006
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 4 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 4 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 4, 3, 'genesis', 15, 6, 1, E'*Avraham (Abraham) believed Elohim (God), and it was counted unto him for righteousness* = Genesis 15:6 verbatim, the verse Paul is anchoring the chapter on.'),
  ('romans', 4, 7, 'psalms', 32, 1, 2, E'*Blessed are they whose iniquities are forgiven... blessed is the man to whom Yahuah (the LORD) will not impute sin* = Psalm 32:1-2 verbatim — David naming the same substance.'),
  ('romans', 4, 9, 'genesis', 17, 24, 3, E'*Avraham (Abraham) was an hundred years old, when he was circumcised* — the timing-architecture: Genesis 15:6 came at chapter 15; circumcision came at chapter 17. The order is the proof.'),
  ('romans', 4, 11, 'genesis', 17, 10, 4, E'*He received the sign of circumcision, a seal of the righteousness of the faith* = the covenant sign given as the seal, not as the doorway.'),
  ('romans', 4, 13, 'genesis', 22, 18, 5, E'*The promise, that he should be the heir of the world* = *in thy seed shall all the nations of the earth be blessed* — the patriarchal promise carried through the paternal seed-line.'),
  ('romans', 4, 16, 'genesis', 17, 5, 6, E'*That the promise might be sure to all the seed* = *a father of many nations have I made thee* — the prophetic father of the seed-of-promise gathered through all twelve tribes.'),
  ('romans', 4, 17, 'genesis', 15, 5, 7, E'*I have made thee a father of many nations* = *look now toward heaven, and tell the stars, if thou be able to number them... so shall thy seed be* — the seed-promise spoken before Genesis 15:6''s reckoning.'),
  ('romans', 4, 18, 'genesis', 15, 5, 8, E'*So shall thy seed be* = the same star-promise repeated, the substance Avraham (Abraham) believed.'),
  ('romans', 4, 22, 'genesis', 15, 6, 9, E'*Therefore it was imputed to him for righteousness* = the closing return to the Genesis 15:6 verse.'),
  ('romans', 4, 25, 'isaiah', 53, 5, 10, E'*Delivered for our offences, and was raised again for our justification* = *he was wounded for our transgressions, he was bruised for our iniquities* — the Tanakh source for the substance of the deliverance.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:avraham-reckoned-before-circumcision | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for avraham-reckoned-before-circumcision.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'avraham-reckoned-before-circumcision'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:avraham-reckoned-before-circumcision | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: sin-reigned-grace-reigns
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'sin-reigned-grace-reigns',
    E'Sin reigned unto death — grace reigns through righteousness unto life',
    E'Romans 5:12-21 is the Adamic-seed architecture of the whole covenant story. By one man sin entered the world, and death by sin; the seed of Adam walked into the curse-system and the curse-system held. The Father''s response was not to retire the standard — that would be the indifference that costumes itself as love. The Father''s response was to send the Formed one in flesh, *the second Adam,* who walked the seed-of-promise''s road faithfully and opened the door home through the very curse he bore.\n\n*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* (Romans 5:12)\n\n*For if through the offence of one many be dead, much more the grace of Elohim (God), and the gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many.* (Romans 5:15)\n\n*That as sin hath reigned unto death, even so might grace reign through righteousness unto eternal life by Yahusha HaMashiach (Jesus Christ) our Lord.* (Romans 5:21)\n\nThe closing clause is the architecture: *grace reigns through righteousness.* Grace is not the alternative to righteousness; grace is the means by which the gathered are returned to the Way and live in righteousness through the Ruach (Spirit). The inherited reading hears *grace reigns* and stops there, picturing a permanent reign of acquittal that suspends the consequence-system. Paul does not stop there. Paul writes *grace reigns through righteousness unto eternal life* — the destination is the righteous life the Father always called his people to, walked now in covenant fidelity by the new heart he gives.\n\nThe Adam-and-the-second-Adam structure also names the seed-of-promise architecture the whole framework rests on. The first Adam walked the seed of promise into the curse; the second Adam — the Formed one in flesh — walked the seed of promise out of the curse and opened the road home. The seed-line is paternal; the second Adam stands in the lineage as the kinsman-redeemer the prophets named; the gathering of the scattered home runs through him. *He shall save his people from their sins* (Matthew 1:21) — his people, the seed of promise, gathered home through the door he opened.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1007
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 5 AND sv.verse_number = 12
   AND ev.book_slug = 'romans' AND ev.chapter_number = 5 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 5, 12, 'genesis', 2, 17, 1, E'*Death passed upon all men* = *in the day that thou eatest thereof thou shalt surely die* — the curse-system Adam walked into.'),
  ('romans', 5, 12, 'genesis', 3, 17, 2, E'*Sin entered the world, and death by sin* = the curse on the ground, the toil, the return to dust — the operative consequence-system.'),
  ('romans', 5, 14, 'genesis', 5, 5, 3, E'*Death reigned from Adam to Moses* = *and all the days that Adam lived were nine hundred and thirty years: and he died* — the death-reign across the generations.'),
  ('romans', 5, 15, 'isaiah', 53, 11, 4, E'*The gift by grace, which is by one man, Yahusha HaMashiach (Jesus Christ), hath abounded unto many* = *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* — the Tanakh''s suffering-servant substance.'),
  ('romans', 5, 17, 'genesis', 3, 15, 5, E'*They which receive abundance of grace... shall reign in life by one* = the seed-of-the-woman bruising the serpent''s head, the original gospel-promise in the garden.'),
  ('romans', 5, 18, 'isaiah', 53, 5, 6, E'*By the righteousness of one the free gift came upon all men unto justification of life* = *with his stripes we are healed... Yahuah (the LORD) hath laid on him the iniquity of us all.*'),
  ('romans', 5, 19, 'isaiah', 53, 11, 7, E'*By the obedience of one shall many be made righteous* = *my righteous servant... shall bear their iniquities* — the obedient suffering servant.'),
  ('romans', 5, 20, 'deuteronomy', 28, 15, 8, E'*The law entered, that the offence might abound* = the Deuteronomy 28 curses for covenant-breaking. The Torah enters and the Deuteronomy 28 covenant-breaking consequences operate against those who walk contrary; the *abounding of offence* is the curse-system of exile, not the Torah-substance being named as offence. The Torah surfaces sin as sin — it names what is, and the consequences hold against the offender; the Torah itself is not the curse.'),
  ('romans', 5, 21, 'ezekiel', 36, 27, 9, E'*Grace reign through righteousness unto eternal life* = *I will put my Ruach (Spirit) within you, and cause you to walk in my statutes* — the grace-reigns-through-righteousness substance is the new-heart promise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:sin-reigned-grace-reigns | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for sin-reigned-grace-reigns.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'sin-reigned-grace-reigns'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:sin-reigned-grace-reigns | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: baptized-into-his-death-walk-newness
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'baptized-into-his-death-walk-newness',
    E'Baptized into his death — walking in newness of life',
    E'Romans 6 is the chapter the antinomian reading cannot survive without the immediate corrective verse being cut out. Paul says *we are not under the law, but under grace* in Romans 6:14, and the inherited reading lifts that half-verse as a permanent release from the consequence-system. The very next verse refuses the lift: *what then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). The two verses were written as one breath. Verse 14 is the door home; verse 15 is the refusal to read verse 14 as a release from the standard.\n\n*Know ye not, that so many of us as were baptized into Yahusha HaMashiach (Jesus Christ) were baptized into his death? Therefore we are buried with him by baptism into death: that like as HaMashiach (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* (Romans 6:3-4)\n\nThe *newness of life* is not the absence of the Way. The newness is the new heart walking in the Father''s statutes by the Ruach (Spirit). *Sin shall not have dominion over you: for ye are not under the law, but under grace* (Romans 6:14) names the deliverance from sin''s dominion — not the deliverance from the Torah''s standard. The deliverance is from the curse-system that the old life walked into; the destination is the Spirit-empowered Torah-walking that the new heart performs. The depart-as-mercy and the new-heart-as-return are one motion of one love.\n\n*The wages of sin is death; but the gift of Elohim (God) is eternal life through Yahusha HaMashiach (Jesus Christ) our Lord.* (Romans 6:23)\n\nThe chapter ends with the consequence-system still operative. Sin still pays its wages. The gift is given freely; the gift carries the homecoming; the homecoming carries the walk. Paul does not retire the consequence-system. He names the door through it and calls the gathered to walk through the door into the Way. The fruit of the Spirit-walking is the substance the post-harvest sifting tests; the gift is given freely, the walking is the response of the new heart, and the fruit is what the sifting separates from chaff at the threshing floor.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1008
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 6 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 6 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 6, 4, 'ezekiel', 36, 26, 1, E'*Walk in newness of life* = *a new heart also will I give you... I will put my Ruach (Spirit) within you, and cause you to walk in my statutes.*'),
  ('romans', 6, 6, 'galatians', 5, 24, 2, E'*Our old man is crucified with him* = *they that are HaMashiach''s (Christ''s) have crucified the flesh with the affections and lusts* — the same departing-from-the-flesh motion.'),
  ('romans', 6, 11, 'deuteronomy', 30, 19, 3, E'*Reckon ye also yourselves to be dead indeed unto sin, but alive unto Elohim (God)* = *I have set before you life and death... therefore choose life* — the same life-or-death reckoning the Torah laid before Yashar''el (Israel).'),
  ('romans', 6, 13, 'joshua', 24, 15, 4, E'*Yield yourselves unto Elohim (God), as those that are alive from the dead* = *choose you this day whom ye will serve... as for me and my house, we will serve Yahuah (the LORD)* — the same covenant-yielding the Torah called for.'),
  ('romans', 6, 14, 'romans', 6, 15, 5, E'*Ye are not under the law, but under grace* read together with *shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* — Paul''s own immediate corrective to the half-verse the Reformation lifts.'),
  ('romans', 6, 16, 'joshua', 24, 15, 6, E'*Ye are that one''s servants to whom ye obey* = the same Joshua-substance of choosing whom you serve.'),
  ('romans', 6, 19, 'leviticus', 19, 2, 7, E'*Yield your members servants to righteousness unto holiness* = *ye shall be holy: for I Yahuah (the LORD) your Elohim (God) am holy* — the standing call to set-apartness the Torah grounds.'),
  ('romans', 6, 22, 'jeremiah', 31, 33, 8, E'*Ye have your fruit unto holiness, and the end everlasting life* = *I will put my law in their inward parts, and write it in their hearts* — the new covenant fruit.'),
  ('romans', 6, 23, 'ezekiel', 18, 4, 9, E'*The wages of sin is death* = *the soul that sinneth, it shall die* — the consequence-system is the Tanakh''s own naming, still operative in this age.'),
  ('romans', 6, 23, 'deuteronomy', 30, 19, 10, E'*The gift of Elohim (God) is eternal life* = *I have set before you life and death, blessing and cursing: therefore choose life* — the same life-offer the Torah extends.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:baptized-into-his-death-walk-newness | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for baptized-into-his-death-walk-newness.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'baptized-into-his-death-walk-newness'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:baptized-into-his-death-walk-newness | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 9: the-law-is-holy-just-good
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-law-is-holy-just-good',
    E'The law is holy — the absolute anti-antinomian declaration',
    E'Romans 7 has Paul wrestling with the divided self under the dispensation of the flesh — *the good that I would I do not: but the evil which I would not, that I do* (Romans 7:19). The inherited reading lifts the *I* of the divided self as the believer''s permanent condition and lifts *we are delivered from the law* (Romans 7:6) as the believer''s permanent acquittal from the Torah''s standard. The chapter itself forbids both lifts. Paul writes, in the middle of the very passage that names the wrestle, the most anti-antinomian sentence in the New Testament.\n\n*Wherefore the law is holy, and the commandment holy, and just, and good.* (Romans 7:12)\n\nThe Torah is holy. The commandment is holy and just and good. The deliverance the chapter names is deliverance from sin''s reign over the flesh — *who shall deliver me from the body of this death? I thank Elohim (God) through Yahusha HaMashiach (Jesus Christ) our Lord* (Romans 7:24-25) — not deliverance from the standard the Torah names. The standard is the Father''s instruction. The deliverance is from the inability of the flesh-only-self to walk it. The next chapter will name the resolution: *the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Ruach (Spirit)* (Romans 8:4).\n\n*For I delight in the law of Elohim (God) after the inward man.* (Romans 7:22)\n\nPaul''s *inward man delights in the Torah.* The David of Psalm 1 and Psalm 119 lives inside Paul''s wrestle. *O how love I thy law! it is my meditation all the day* (Psalm 119:97). The Pharisaical reading that voided Torah by addition and the institutional-Christian reading that voided Torah by subtraction are both refused by Paul''s own *I delight in the law.* The inward man of the new-heart-bearer loves what Yahuah (the LORD) loves; what Yahuah (the LORD) loves is his Torah; therefore the new-heart-bearer loves the Torah. There is no antinomian gospel in Romans 7. There is only the wrestle of the seed-of-promise walking out of the dispensation of the flesh into the dispensation of the Ruach (Spirit) that Romans 8 will name.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1009
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 7 AND sv.verse_number = 7
   AND ev.book_slug = 'romans' AND ev.chapter_number = 7 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 7, 7, 'exodus', 20, 17, 1, E'*I had not known lust, except the law had said, Thou shalt not covet* = the tenth commandment exactly. The Torah names sin as sin; Paul cites it as still authoritative.'),
  ('romans', 7, 12, 'psalms', 19, 7, 2, E'*The law is holy, and the commandment holy, and just, and good* = *the law of Yahuah (the LORD) is perfect, converting the soul... the statutes of Yahuah (the LORD) are right, rejoicing the heart.*'),
  ('romans', 7, 12, 'psalms', 119, 172, 3, E'*The commandment holy, and just, and good* = *all thy commandments are righteousness.*'),
  ('romans', 7, 14, 'psalms', 1, 2, 4, E'*The law is spiritual* = *his delight is in the law of Yahuah (the LORD); and in his law doth he meditate day and night* — the Torah as the spiritual food of the righteous.'),
  ('romans', 7, 16, 'nehemiah', 9, 13, 5, E'*I consent unto the law that it is good* = *thou camest down also upon mount Sinai... and gavest them right judgments, and true laws, good statutes and commandments.*'),
  ('romans', 7, 22, 'psalms', 40, 8, 6, E'*I delight in the law of Elohim (God) after the inward man* = *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* — the Messianic Psalm naming the inward delight.'),
  ('romans', 7, 22, 'psalms', 119, 97, 7, E'*I delight in the law of Elohim (God)* = *O how love I thy law! it is my meditation all the day.*'),
  ('romans', 7, 24, 'psalms', 51, 10, 8, E'*Who shall deliver me from the body of this death?* = *create in me a clean heart, O Elohim (God); and renew a right spirit within me* — David''s same deliverance-plea.'),
  ('romans', 7, 25, 'ezekiel', 36, 27, 9, E'*With the mind I myself serve the law of Elohim (God)* = the new-heart promise that *causes you to walk in my statutes* — the wrestle''s resolution.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-law-is-holy-just-good | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-law-is-holy-just-good.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-law-is-holy-just-good'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-law-is-holy-just-good | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: righteousness-of-torah-fulfilled-in-spirit-walkers
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'righteousness-of-torah-fulfilled-in-spirit-walkers',
    E'The righteousness of the Torah fulfilled in those who walk after the Ruach',
    E'Romans 8 is the chapter where Paul names the resolution of Romans 7''s wrestle. The Spirit who lives in the believer is the Spirit who spoke at Sinai. He does not lead in two directions. He does not deliver from the wrestle by retiring the Torah; he delivers from the wrestle by writing the Torah on the heart and empowering the walk. The verse that lifts the architecture in a single breath is Romans 8:4 — and the inherited reading has spent centuries flinching from it.\n\n*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Ruach (Spirit).* (Romans 8:4)\n\nThe *righteousness of the law* is the substance the Torah names — *whatsoever Yahuah (the LORD) hath spoken we will do* (Exodus 19:8), *the righteousness of these commandments* (Deuteronomy 6:25). That righteousness is *fulfilled in us* — present-tense, ongoing, in the gathered who walk after the Ruach (Spirit). The Torah is not the thing being escaped. The Torah''s righteous substance is the thing being walked, by the Spirit, in the lives of the gathered.\n\n*And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)\n\nPaul is reading Ezekiel forward. The Spirit who is now within the gathered is the Spirit Ezekiel promised would cause them to walk in the Father''s statutes. The connection is exact. Romans 8:1 — *there is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus)* — names the deliverance from the curse-system''s condemnation that the door home opens; Romans 8:4 names the Way the gathered now walk because the Spirit has been put within them. The two verses are one motion. The inherited reading lifts 8:1 and skips 8:4. The chapter holds both.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1010
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 8 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 8 AND ev.verse_number = 4
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 8, 2, 'jeremiah', 31, 33, 1, E'*The law of the Ruach (Spirit) of life in HaMashiach Yahusha (Christ Jesus)* = *I will put my law in their inward parts, and write it in their hearts* — the new covenant Torah-internalized.'),
  ('romans', 8, 3, 'isaiah', 53, 10, 2, E'*Elohim (God) sending his own Son in the likeness of sinful flesh... condemned sin in the flesh* = *it pleased Yahuah (the LORD) to bruise him... when thou shalt make his soul an offering for sin.*'),
  ('romans', 8, 4, 'ezekiel', 36, 27, 3, E'*The righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Ruach (Spirit)* = *I will put my Ruach (Spirit) within you, and cause you to walk in my statutes* — the new-heart promise word-for-word substance.'),
  ('romans', 8, 4, 'deuteronomy', 6, 25, 4, E'*The righteousness of the law* = *it shall be our righteousness, if we observe to do all these commandments* — Moses naming the righteousness Paul says is fulfilled in the Spirit-walkers.'),
  ('romans', 8, 7, 'psalms', 119, 165, 5, E'*The carnal mind is enmity against Elohim (God): for it is not subject to the law* = *great peace have they which love thy law: and nothing shall offend them* — the inverse: the heart that loves the Torah is at peace with Elohim (God).'),
  ('romans', 8, 14, 'ezekiel', 36, 27, 6, E'*As many as are led by the Ruach (Spirit) of Elohim (God), they are the sons of Elohim (God)* = the same Ruach-leading that *causes you to walk in my statutes.*'),
  ('romans', 8, 15, 'hosea', 1, 10, 7, E'*The Spirit of adoption, whereby we cry, Abba, Father* = *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* — the Lo-Ammi-reversal language Paul will quote three chapters later.'),
  ('romans', 8, 29, 'isaiah', 53, 10, 8, E'*Predestinate to be conformed to the image of his Son... the firstborn among many brethren* = *he shall see his seed... by his knowledge shall my righteous servant justify many* — the firstborn among the brethren of the suffering-servant substance.'),
  ('romans', 8, 33, 'isaiah', 50, 8, 9, E'*Who shall lay any thing to the charge of Elohim (God)''s elect? It is Elohim (God) that justifieth* = *he is near that justifieth me; who will contend with me?* — the suffering-servant Tanakh substance of the vindication.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:righteousness-of-torah-fulfilled-in-spirit-walkers | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for righteousness-of-torah-fulfilled-in-spirit-walkers.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'righteousness-of-torah-fulfilled-in-spirit-walkers'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:righteousness-of-torah-fulfilled-in-spirit-walkers | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: sovereign-election-and-the-remnant-of-yashar-el
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'sovereign-election-and-the-remnant-of-yashar-el',
    E'Sovereign election and the remnant of Yashar''el — Paul reading Isaiah forward',
    E'Romans 9 is the chapter the inherited reading repurposes into a doctrine of individual eternal-destiny double-predestination divorced from the covenant story. The chapter does not carry that reading. The chapter carries Paul''s grief over the unbelief of his kinsmen — the body of Yahudah (Judah) most visibly at his moment, but the scattered northern tribes equally — at the Messiah''s first coming, and his careful tracing — through verse after verse of Genesis, Exodus, Isaiah, Hosea — of the prophetic substance of the gathering of the seed-of-promise remnant out of the larger covenant body.\n\n*For they are not all Yashar''el (Israel), which are of Yashar''el (Israel): neither, because they are the seed of Avraham (Abraham), are they all children: but, In Yitschaq (Isaac) shall thy seed be called.* (Romans 9:6-7)\n\nThe seed-of-promise runs through the patriarchal line as the Torah named it — through Yitschaq (Isaac) and not Yishma''el (Ishmael), through Ya''aqov (Jacob) and not Esav (Esau). The sovereign election is the election of the seed-line; the line itself is the substance the prophets named. Paul is not introducing a new doctrine of individual decretal salvation; Paul is reading the Torah''s own naming of the seed-line forward and grieving that the body of Yahudah (Judah) at the Messiah''s coming has not yet recognized the Messiah their own scriptures named.\n\n*Esaias also crieth concerning Yashar''el (Israel), Though the number of the children of Yashar''el (Israel) be as the sand of the sea, a remnant shall be saved.* (Romans 9:27)\n\nPaul lifts Isaiah 10:22 to ground the remnant-substance in the Tanakh. *A remnant shall return* is the prophetic name (Isaiah 7:3''s Shear-jashub) — the remnant of the seed-of-promise who walk the covenant faithfully when the body does not. The doctrine of the elect-remnant is not the doctrine of arbitrary acquittal of individuals divorced from the seed-line. The remnant is the seed-of-promise sifted through the long covenant story — first the harvest separating wheat from tares (the tares bound and burned because they were never wheat), then the post-harvest sifting in the wilderness of the people separating fruitful from unfruitful, names blotted out of those who professed but did not walk.\n\nThe closing of the chapter names the stone of stumbling. *They stumbled at that stumblingstone* (Romans 9:32) — citing Isaiah 8:14. The Tanakh source is the prophet''s own naming of *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel).* Both houses. The cornerstone of faithful covenant-walking trips the flesh-credential system in every age, in every house. Paul is reading the prophets, naming the stumble the prophets foretold, and grieving the unbelief of his own kinsmen even as he labors to bring the scattered seed home.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1011
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 9 AND sv.verse_number = 6
   AND ev.book_slug = 'romans' AND ev.chapter_number = 9 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 9, 7, 'genesis', 21, 12, 1, E'*In Yitschaq (Isaac) shall thy seed be called* = Genesis 21:12 verbatim — the seed-line through Yitschaq (Isaac), not Yishma''el (Ishmael).'),
  ('romans', 9, 9, 'genesis', 18, 10, 2, E'*At this time will I come, and Sarah shall have a son* = the promised-seed visitation at the oaks of Mamre.'),
  ('romans', 9, 12, 'genesis', 25, 23, 3, E'*The elder shall serve the younger* = the seed-of-promise running through Ya''aqov (Jacob), not Esav (Esau).'),
  ('romans', 9, 13, 'malachi', 1, 2, 4, E'*Ya''aqov (Jacob) have I loved, but Esav (Esau) have I hated* = Malachi 1:2-3 verbatim — the prophet''s own naming of the seed-line distinction.'),
  ('romans', 9, 15, 'exodus', 33, 19, 5, E'*I will have mercy on whom I will have mercy* = Exodus 33:19 verbatim — Yahuah''s (the LORD''s) self-disclosure to Mosheh (Moses).'),
  ('romans', 9, 17, 'exodus', 9, 16, 6, E'*For this same purpose have I raised thee up* = Exodus 9:16 verbatim — the Pharaoh confrontation.'),
  ('romans', 9, 20, 'isaiah', 29, 16, 7, E'*Shall the thing formed say to him that formed it, Why hast thou made me thus?* = *shall the work say of him that made it, He made me not?* — the potter-clay substance.'),
  ('romans', 9, 21, 'jeremiah', 18, 6, 8, E'*Hath not the potter power over the clay* = *cannot I do with you as this potter? saith Yahuah (the LORD).*'),
  ('romans', 9, 25, 'hosea', 2, 23, 9, E'*I will call them my people, which were not my people* = Hosea 2:23 — the Lo-Ammi reversal Paul is citing; the same scattered-seed-gathering substance Hoshea (Hosea) 1 names.'),
  ('romans', 9, 26, 'hosea', 1, 10, 10, E'*Ye are the sons of the living Elohim (God)* = Hosea 1:10 verbatim — the scattered-seed gathering.'),
  ('romans', 9, 27, 'isaiah', 10, 22, 11, E'*A remnant shall be saved* = *a remnant of them shall return* — Isaiah''s prophetic naming of the remnant.'),
  ('romans', 9, 29, 'isaiah', 1, 9, 12, E'*Except Yahuah (the LORD) of Sabaoth had left us a seed* = *except Yahuah Tseva''ot (the LORD of hosts) had left unto us a very small remnant* — Isaiah 1:9 verbatim.'),
  ('romans', 9, 32, 'isaiah', 8, 14, 13, E'*They stumbled at that stumblingstone* = *a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — the cornerstone tripping the flesh-credential system in both houses.'),
  ('romans', 9, 33, 'isaiah', 28, 16, 14, E'*Behold, I lay in Tsion (Zion) a stumblingstone... whosoever believeth on him shall not be ashamed* = *I lay in Tsion (Zion) for a foundation a stone, a tried stone, a precious corner stone* — the foundation-stone the prophet named.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:sovereign-election-and-the-remnant-of-yashar-el | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for sovereign-election-and-the-remnant-of-yashar-el.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'sovereign-election-and-the-remnant-of-yashar-el'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:sovereign-election-and-the-remnant-of-yashar-el | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: whosoever-calls-on-yahuah-shall-be-saved
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'whosoever-calls-on-yahuah-shall-be-saved',
    E'Whosoever calls on the name of Yahuah — the gathering call to the scattered',
    E'Romans 10 carries the proclamation-to-the-scattered mechanism. The good news goes out broadly because we do not know the citizens of the kingdom by sight. The scattered seed lives among the nations; the Father''s sheep hear the Shepherd''s voice; the proclamation surfaces them. Paul cites Joel and Isaiah to ground the substance in the prophets — the gathering call was always the prophets'' substance, never a Pauline novelty.\n\n*For whosoever shall call upon the name of Yahuah (the LORD) shall be saved.* (Romans 10:13)\n\n*And it shall come to pass, that whosoever shall call on the name of Yahuah (the LORD) shall be delivered: for in mount Tsion (Zion) and in Yerushalayim (Jerusalem) shall be deliverance, as Yahuah (the LORD) hath said, and in the remnant whom Yahuah (the LORD) shall call.* (Joel 2:32)\n\nPaul is quoting Joel verbatim. The whole prophetic context of Joel 2:32 is the day-of-Yahuah (the LORD) — the gathering of the remnant out of the trouble. The *whosoever* of Paul''s citation is not the *anyone-without-distinction* of the inclusion gospel. The *whosoever* is the prophetic substance of the gathering Joel named: the remnant whom Yahuah (the LORD) shall call. The call surfaces the sheep; the calling-on-the-name is the response of the sheep who hear.\n\n*How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15)\n\nThe Tanakh source is Isaiah 52:7 — *how beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Tsion (Zion), Thy Elohim (God) reigneth!* The good tidings are the kingdom-gospel. The publishing-of-peace is the proclamation that the King has come and is gathering his people. The feet that carry the proclamation are the feet of the messengers Yahuah (the LORD) sends out to the scattered. *How shall they hear without a preacher?* (Romans 10:14) names the proclamation-to-the-scattered mechanism the framework holds: we proclaim broadly because we do not know the citizens by sight; the sheep hear; the hearing is the revealing. Those who reject, we shake the dust off our feet and we do not cast our pearls before swine. The mechanism is not universal-inclusion; the mechanism is the gathering call that surfaces the citizens.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1012
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 10 AND sv.verse_number = 11
   AND ev.book_slug = 'romans' AND ev.chapter_number = 10 AND ev.verse_number = 15
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 10, 5, 'leviticus', 18, 5, 1, E'*The man which doeth those things shall live by them* = Leviticus 18:5 verbatim — the Torah''s own naming of the life-in-the-Way substance.'),
  ('romans', 10, 6, 'deuteronomy', 30, 11, 2, E'*Say not in thine heart, Who shall ascend into heaven?... The word is nigh thee, even in thy mouth, and in thy heart* = Deuteronomy 30:11-14 word-for-word — Mosheh (Moses) naming the nearness of the commandment the gathered now walk.'),
  ('romans', 10, 11, 'isaiah', 28, 16, 3, E'*Whosoever believeth on him shall not be ashamed* = *he that believeth shall not make haste* — the foundation-stone substance Paul cited at the end of Romans 9.'),
  ('romans', 10, 13, 'joel', 2, 32, 4, E'*Whosoever shall call upon the name of Yahuah (the LORD) shall be saved* = Joel 2:32 verbatim — the prophetic gathering of the remnant in the day-of-Yahuah (the LORD).'),
  ('romans', 10, 15, 'isaiah', 52, 7, 5, E'*How beautiful are the feet of them that preach the gospel of peace* = *how beautiful upon the mountains are the feet of him that bringeth good tidings... that saith unto Tsion (Zion), Thy Elohim (God) reigneth.*'),
  ('romans', 10, 16, 'isaiah', 53, 1, 6, E'*Yahuah (the LORD), who hath believed our report?* = Isaiah 53:1 verbatim — the prophet''s own grief over the unreceived report of the suffering servant.'),
  ('romans', 10, 18, 'psalms', 19, 4, 7, E'*Their sound went into all the earth, and their words unto the ends of the world* = *their line is gone out through all the earth, and their words to the end of the world* — the broad publishing the proclamation mechanism rests on.'),
  ('romans', 10, 19, 'deuteronomy', 32, 21, 8, E'*I will provoke you to jealousy by them that are no people* = Deuteronomy 32:21 verbatim — the Song of Mosheh (Moses) foretelling the provocation by the scattered-seed-among-the-nations.'),
  ('romans', 10, 20, 'isaiah', 65, 1, 9, E'*I was found of them that sought me not; I was made manifest unto them that asked not after me* = Isaiah 65:1 verbatim — the prophetic revealing-to-the-scattered.'),
  ('romans', 10, 21, 'isaiah', 65, 2, 10, E'*All day long I have stretched forth my hands unto a disobedient and gainsaying people* = Isaiah 65:2 verbatim — the continuing grief over the unbelief of the body.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:whosoever-calls-on-yahuah-shall-be-saved | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for whosoever-calls-on-yahuah-shall-be-saved.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'whosoever-calls-on-yahuah-shall-be-saved'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:whosoever-calls-on-yahuah-shall-be-saved | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 13: natural-branches-asleep-grafted-again
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'natural-branches-asleep-grafted-again',
    E'The natural branches are asleep — grafted in again at the resurrection',
    E'The companion thread to S74''s `false-inclusion-rebuttal` — same chapter, different cut. Where the existing thread anchors the wild-olive substance of Romans 11:17-24, this thread surfaces the natural-branches substance: the covenant lineage of Yashar''el (Israel) carried through the patriarchs, broken off when both houses fell into unbelief and were scattered, and the forefathers who walked the covenant faithfully in their lifetimes who are now asleep, awaiting the first resurrection at which Yahuah (the LORD) is able to graft them in again.\n\n*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am a Yashar''eli (Israelite), of the seed of Avraham (Abraham), of the tribe of Benyamin (Benjamin)... Elohim (God) hath not cast away his people which he foreknew.* (Romans 11:1-2)\n\nPaul names himself a Yashar''eli (Israelite) of the seed of Avraham (Abraham), of the tribe of Benyamin (Benjamin) — paternal-blood lineage stated three ways in one sentence. The covenant people are not cast away. The seed-of-promise lineage has not been retired. The body of Yahudah (Judah) at Paul''s moment may not yet have recognized the Messiah their own scriptures named, but the elect-remnant of the seed-of-promise continues to walk the covenant Way through every generation.\n\nThe wild olive branches are us — the living descendants of the broken-off, both modern Yahudah (Judah) and the scattered seed of Yashar''el (Israel) growing wild among the nations. The wild olive does not partake of the root by mere faith-confession in this age; the wild olive comes home through the journey the prophets named — gathered out of the nations, brought under the rod, brought into the bond of the new covenant, and grafted into the natural root of the fathers at the resurrection. The grafting is the destination, not the doorway. The cause-and-effect runs the framework''s way, not the inclusion-gospel''s: those who hear the Shepherd''s voice are revealed as sheep, because they were sheep before the foundation of the world (Revelation 13:8; 17:8). Election precedes hearing; lineage precedes response. Names can only be blotted out (Exodus 32:33), not added — the harvest separates the wheat from the tares, and the post-harvest sifting tests the fruit of those gathered.\n\n*And they also, if they abide not still in unbelief, shall be grafted in: for Elohim (God) is able to graff them in again. For if thou wert cut out of the olive tree which is wild by nature, and wert graffed contrary to nature into a good olive tree: how much more shall these, which be the natural branches, be graffed into their own olive tree?* (Romans 11:23-24)\n\nThe natural branches'' grafting-in-again is not a faith-confession in the present age; it is the first resurrection of those who walked the covenant faithfully in their lifetimes. *Yahuah (the LORD) is able to graff them in again* — the able-to is the language of the resurrection-power of the Father, the same power Yahusha (Jesus) named when he said *all that are in the graves shall hear his voice* (John 5:28-29). Even Paul did not presume on attaining the first resurrection (Philippians 3:11) — the first resurrection is conditional on faithfulness, not automatic on lineage. The natural-branches that are grafted in again are the worthy of the seed.\n\nThe chapter ends with the destination the whole framework moves toward: *and so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Tsion (Zion) the Deliverer, and shall turn away ungodliness from Ya''aqov (Jacob)* (Romans 11:26). The closing scripture is Paul''s quotation of Isaiah 59:20. The Deliverer is the second-Adam Messiah; the *all Yashar''el (Israel)* is the gathered remnant of the seed-of-promise, both houses restored through the long journey the prophets named.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1013
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 11 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 11 AND ev.verse_number = 5
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 11, 1, 'psalms', 94, 14, 1, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* = *Yahuah (the LORD) will not cast off his people, neither will he forsake his inheritance.*'),
  ('romans', 11, 1, '1-samuel', 12, 22, 2, E'*Elohim (God) hath not cast away his people* = *Yahuah (the LORD) will not forsake his people for his great name''s sake* — the same grace-from-name''s-sake substance the prophets ground.'),
  ('romans', 11, 2, 'jeremiah', 31, 37, 3, E'*Elohim (God) hath not cast away his people which he foreknew* = the covenant promise that the seed-of-Yashar''el (Israel) shall not cease from being a nation.'),
  ('romans', 11, 4, '1-kings', 19, 18, 4, E'*I have reserved to myself seven thousand men, who have not bowed the knee* = 1 Kings 19:18 verbatim — the Elijah-remnant substance.'),
  ('romans', 11, 5, 'isaiah', 10, 22, 5, E'*Even so then at this present time also there is a remnant according to the election of grace* = *a remnant of them shall return* — the prophetic remnant Paul has been tracing since Romans 9:27.'),
  ('romans', 11, 8, 'isaiah', 29, 10, 6, E'*Elohim (God) hath given them the spirit of slumber* = *Yahuah (the LORD) hath poured out upon you the spirit of deep sleep* — the prophetic slumber on the body that does not see the Messiah.'),
  ('romans', 11, 8, 'deuteronomy', 29, 4, 7, E'*Eyes that they should not see, and ears that they should not hear* = *Yahuah (the LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear* — Mosheh (Moses) naming the same condition before the Babylonian and Assyrian exiles.'),
  ('romans', 11, 9, 'psalms', 69, 22, 8, E'*Let their table be made a snare... let their eyes be darkened* = Psalm 69:22-23 verbatim — the Davidic-Messianic Psalm Paul cites.'),
  ('romans', 11, 23, 'john', 5, 28, 9, E'*Elohim (God) is able to graff them in again* = *all that are in the graves shall hear his voice... they that have done good, unto the resurrection of life* — the resurrection-power of the Father.'),
  ('romans', 11, 24, 'hebrews', 11, 39, 10, E'*How much more shall these, which be the natural branches, be graffed into their own olive tree* = *these all... received not the promise: Elohim (God) having provided some better thing for us, that they without us should not be made perfect* — the fathers awaiting the resurrection together with the gathered.'),
  ('romans', 11, 26, 'isaiah', 59, 20, 11, E'*There shall come out of Tsion (Zion) the Deliverer, and shall turn away ungodliness from Ya''aqov (Jacob)* = Isaiah 59:20-21 verbatim — the closing scripture for any Romans 11 treatment in the framework.'),
  ('romans', 11, 27, 'jeremiah', 31, 33, 12, E'*This is my covenant unto them, when I shall take away their sins* = the new covenant promise of Jeremiah 31:33-34 — Torah-internalized on the heart, sins forgiven, the gathered walking the statutes by the Ruach (Spirit).'),
  ('romans', 11, 29, 'psalms', 105, 8, 13, E'*The gifts and calling of Elohim (God) are without repentance* = *he hath remembered his covenant for ever, the word which he commanded to a thousand generations.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:natural-branches-asleep-grafted-again | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for natural-branches-asleep-grafted-again.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'natural-branches-asleep-grafted-again'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:natural-branches-asleep-grafted-again | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 14: living-sacrifice-renewal-of-the-mind
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'living-sacrifice-renewal-of-the-mind',
    E'Present your bodies a living sacrifice — be ye transformed by the renewing',
    E'Romans 12 opens with the practical consequence of the whole architecture Paul has been building. The living sacrifice is the daily walk; the renewal of the mind is the new-heart promise operative in the gathered; the *good, and acceptable, and perfect, will of Elohim (God)* is the Torah-substance the new heart now loves and walks. The chapter is not a turn from theology to practice as the inherited reading frames it. The chapter is the natural outworking of the new-heart promise the previous chapters have grounded in the prophets.\n\n*I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service. And be not conformed to this world: but be ye transformed by the renewing of your mind, that ye may prove what is that good, and acceptable, and perfect, will of Elohim (God).* (Romans 12:1-2)\n\nThe *living sacrifice* takes the language of the Torah''s sacrificial substance — *holy, acceptable* — and locates it in the body of the gathered. The Torah''s altar substance is internalized into the walking life of the seed-of-promise. The same prophetic move Ezekiel and Jeremiah named — *the law put into the inward parts, the heart of flesh, the Ruach (Spirit) within causing the walking in the statutes* — is what Paul''s *renewing of the mind* names. The mind that has been renewed loves what Yahuah (the LORD) loves; what Yahuah (the LORD) loves is his commandments; therefore the renewed mind walks the commandments not as wage-performance but as the natural expression of the new heart.\n\n*And what doth Yahuah (the LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8)\n\nThe *reasonable service* is the substance Micah named. The depart-as-mercy and the new-heart-as-return are both at work in the renewing — the unwilling are released from a kingdom they would have hated; the willing are equipped with the heart that loves the Way they are now walking. The *good and acceptable and perfect will of Elohim (God)* is the Torah-substance the Father always called his people to. The chapter is the antinomian reading''s refutation in two sentences.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1014
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 12 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 12 AND ev.verse_number = 2
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 12, 1, 'leviticus', 1, 3, 1, E'*Present your bodies a living sacrifice, holy, acceptable* = *of his own voluntary will at the door of the tabernacle... that he may be accepted* — the Torah''s altar substance internalized into the walking life.'),
  ('romans', 12, 1, 'psalms', 50, 14, 2, E'*Living sacrifice... reasonable service* = *offer unto Elohim (God) thanksgiving... and call upon me in the day of trouble* — the substance of acceptable worship the Psalmist names.'),
  ('romans', 12, 2, 'ezekiel', 36, 26, 3, E'*Be ye transformed by the renewing of your mind* = *a new heart also will I give you, and a new spirit will I put within you* — the renewal Ezekiel named.'),
  ('romans', 12, 2, 'jeremiah', 31, 33, 4, E'*That ye may prove what is that good, and acceptable, and perfect, will of Elohim (God)* = *I will put my law in their inward parts, and write it in their hearts* — the will of Elohim (God) internalized as the Torah on the heart.'),
  ('romans', 12, 2, 'deuteronomy', 6, 5, 5, E'*The good, and acceptable, and perfect, will of Elohim (God)* = *thou shalt love Yahuah (the LORD) thy Elohim (God) with all thine heart* — the central commandment of the renewed mind.'),
  ('romans', 12, 2, 'micah', 6, 8, 6, E'*Prove what is that good, and acceptable, and perfect, will of Elohim (God)* = *what doth Yahuah (the LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God).*'),
  ('romans', 12, 9, 'psalms', 97, 10, 7, E'*Abhor that which is evil; cleave to that which is good* = *ye that love Yahuah (the LORD), hate evil* — the Psalmist''s same substance.'),
  ('romans', 12, 19, 'deuteronomy', 32, 35, 8, E'*Vengeance is mine; I will repay, saith Yahuah (the LORD)* = Deuteronomy 32:35 verbatim — the Song of Mosheh (Moses).'),
  ('romans', 12, 20, 'proverbs', 25, 21, 9, E'*If thine enemy hunger, feed him; if he thirst, give him drink* = Proverbs 25:21-22 verbatim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:living-sacrifice-renewal-of-the-mind | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for living-sacrifice-renewal-of-the-mind.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'living-sacrifice-renewal-of-the-mind'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:living-sacrifice-renewal-of-the-mind | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 15: love-brings-torah-to-pass
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'love-brings-torah-to-pass',
    E'Love is the fulfilling of the law — bringing Torah to pass, not retiring it',
    E'Romans 13:8-10 is the verse the antinomian reading lifts as *Torah is now reduced to love, and the commandments are absorbed into a single principle that retires the rest.* The verse does not carry that reading. Paul cites four of the Ten Commandments by name and adds *and if there be any other commandment* — explicitly preserving the rest of the Torah. The *fulfilling* is the bringing-to-pass, the walking-it-out, the making-it-real in the life of the gathered. *Fulfill* in scripture is never *retire.* The same word that names the love-fulfilling-the-Torah substance is the word Yahusha (Jesus) uses at Matthew 5:17 when he says *I am not come to destroy, but to fulfil.*\n\n*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law. For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself. Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:8-10)\n\nThe four commandments Paul cites by name are the second-table commandments toward the neighbor. *Thou shalt love thy neighbour as thyself* is Leviticus 19:18 — the Torah''s own naming of the substance the rest of the second-table commandments express. Paul is not retiring those commandments; he is naming the substance they all express, and saying that the gathered who love the neighbor bring those commandments to pass in their walking. *Love worketh no ill to his neighbour* is the test the Torah set: do you steal from your neighbor? do you kill him? do you bear false witness against him? do you covet his wife? if you love him, you do none of these — the commandments are walked. *Therefore love is the fulfilling of the law.*\n\n*Thou shalt love thy neighbour as thyself: I am Yahuah (the LORD).* (Leviticus 19:18)\n\n*Hear, O Yashar''el (Israel): Yahuah (the LORD) our Elohim (God) is one Yahuah (the LORD): And thou shalt love Yahuah (the LORD) thy Elohim (God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:4-5)\n\nThe Shema and Leviticus 19:18 are the two great commandments Yahusha (Jesus) names at Matthew 22:37-40 — *on these two commandments hang all the law and the prophets.* The *hanging* is the same substance as Paul''s *briefly comprehended* — the rest of the Torah hangs on these two as the body hangs on the spine, both still in force, both walked in the gathered life. The verse does not flatten the Torah into one principle that retires the rest. The verse names the substance the rest expresses and calls the gathered to walk it.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1015
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 13 AND sv.verse_number = 8
   AND ev.book_slug = 'romans' AND ev.chapter_number = 13 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 13, 8, 'leviticus', 19, 18, 1, E'*He that loveth another hath fulfilled the law* = *thou shalt love thy neighbour as thyself* — the Torah''s own substance.'),
  ('romans', 13, 9, 'exodus', 20, 13, 2, E'*Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet* = the Ten Commandments cited by name, four of them, with *and if there be any other commandment* explicitly preserving the rest.'),
  ('romans', 13, 9, 'deuteronomy', 5, 17, 3, E'The same commandments restated by Mosheh (Moses) in the second giving of the Torah at Moav (Moab).'),
  ('romans', 13, 9, 'leviticus', 19, 18, 4, E'*Thou shalt love thy neighbour as thyself* = Leviticus 19:18 verbatim — the Torah''s own naming of the substance.'),
  ('romans', 13, 10, 'matthew', 22, 37, 5, E'*Love is the fulfilling of the law* = *on these two commandments hang all the law and the prophets* — Paul and Yahusha (Jesus) naming the same substance.'),
  ('romans', 13, 10, 'matthew', 5, 17, 6, E'*Love is the fulfilling of the law* = *I am not come to destroy the law, or the prophets... but to fulfil* — the same fulfill-as-bring-to-pass substance.'),
  ('romans', 13, 10, 'james', 2, 8, 7, E'*Love is the fulfilling of the law* = *if ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* — James and Paul reading Leviticus 19:18 the same way.'),
  ('romans', 13, 10, '1-john', 5, 3, 8, E'*Love is the fulfilling of the law* = *this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.*'),
  ('romans', 13, 14, 'galatians', 5, 24, 9, E'*Make not provision for the flesh, to fulfil the lusts thereof* = *they that are HaMashiach''s (Christ''s) have crucified the flesh with the affections and lusts* — the same depart-from-the-flesh motion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:love-brings-torah-to-pass | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for love-brings-torah-to-pass.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'love-brings-torah-to-pass'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:love-brings-torah-to-pass | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 16: weak-and-strong-not-license-to-eat-unclean
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'weak-and-strong-not-license-to-eat-unclean',
    E'The weak and the strong — Torah-applicability in the scattered-seed community',
    E'Romans 14 is the chapter the inherited reading cites as Paul retiring the dietary commandments — *I know, and am persuaded by the Lord Yahusha (Jesus), that there is nothing unclean of itself* (Romans 14:14). The chapter does not carry that reading. The dispute in the Roman assembly is not whether the Torah''s dietary instructions are still binding (that question is settled by Daniel''s faithfulness in Babylon, by Yahusha''s (Jesus''s) own keeping of Torah, and by Acts 10 where Peter says *I have never eaten any thing that is common or unclean* years after Pentecost). The dispute is over food whose source is uncertain — meat from the marketplace that may have been offered to idols, food that may not have been tithed, food whose preparation cannot be verified. The weak abstain from all meat to avoid the uncertainty; the strong eat what is clean by Torah without anxiety over the unverifiable.\n\n*One man esteemeth one day above another: another esteemeth every day alike. Let every man be fully persuaded in his own mind.* (Romans 14:5)\n\nThe day-dispute is the same substance — Torah''s appointed days are not the question (those are settled), but the additional fast-days and assembly-days the scattered-seed-among-the-nations communities had been observing under different inherited customs. The whole chapter is Paul adjudicating *adiaphora* — matters where the Torah does not legislate one way or the other for the scattered-seed community''s varied conditions — and pleading with the gathered not to despise one another over them. The chapter is not the Torah-retirement charter the inherited reading needs it to be.\n\nThe Acts 15 council is the structural parallel. The council did not retire the Torah for the scattered-seed-coming-home; the council named the four-fold Noahide entry-point that the scattered would observe immediately as they entered the synagogues of the Way — *that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood... for Mosheh (Moses) of old time hath in every city them that preach him, being read in the synagogues every sabbath day* (Acts 15:20-21). The four-fold rule was the entry-point; the synagogue Sabbath reading was the schoolroom; the Torah continued to teach as it had always taught. The same architecture holds in Romans 14: the weak and the strong are both within the Torah''s standing; the dispute is over what falls under it, not whether it stands.\n\n*Whatsoever is sold in the shambles, that eat, asking no question for conscience sake.* (1 Corinthians 10:25)\n\nPaul''s own counsel at Corinth confirms the substance: the meat-from-the-marketplace question is the question Romans 14 addresses, not the unclean-meat question. The Torah''s clean-and-unclean distinction continues to stand; the dispute over what falls within or outside the clean is what Paul is adjudicating, with the rule *let every man be fully persuaded in his own mind* and *destroy not him with thy meat, for whom HaMashiach (Christ) died* (Romans 14:15).',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1016
  FROM _s181_romans_lookup sv, _s181_romans_lookup ev
 WHERE sv.book_slug = 'romans' AND sv.chapter_number = 14 AND sv.verse_number = 1
   AND ev.book_slug = 'romans' AND ev.chapter_number = 14 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('romans', 14, 1, 'acts', 15, 19, 1, E'*Him that is weak in the faith receive ye* = the four-fold Noahide entry-point of Acts 15 — the scattered-seed-coming-home community has entry-conditions, not Torah-retirement.'),
  ('romans', 14, 3, 'daniel', 1, 8, 2, E'*Let not him that eateth despise him that eateth not* = *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat* — the Tanakh substance of the faithful abstention from the unverifiable.'),
  ('romans', 14, 5, 'leviticus', 23, 1, 3, E'*One man esteemeth one day above another* — the Torah''s appointed feast-days are settled; the dispute is over additional inherited days, not over the Sabbath or the festivals Yahuah (the LORD) named.'),
  ('romans', 14, 6, '1-timothy', 4, 4, 4, E'*He that eateth, eateth to Yahuah (the LORD), for he giveth Elohim (God) thanks* = *every creature of Elohim (God) is good, and nothing to be refused, if it be received with thanksgiving: for it is sanctified by the word of Elohim (God) and prayer* — the word-of-Elohim (God) is the Torah, which defines what is *good* (clean) and what is to be refused (unclean).'),
  ('romans', 14, 14, '1-corinthians', 10, 25, 5, E'*There is nothing unclean of itself* = *whatsoever is sold in the shambles, that eat, asking no question for conscience sake* — the marketplace-meat substance Paul is addressing in both letters.'),
  ('romans', 14, 14, 'acts', 10, 28, 6, E'*To him that esteemeth any thing to be unclean, to him it is unclean* = *Elohim (God) hath shewed me that I should not call any man common or unclean* — the Peter-vision was about people not food, and Peter himself names the substance.'),
  ('romans', 14, 15, 'leviticus', 19, 18, 7, E'*Destroy not him with thy meat, for whom HaMashiach (Christ) died* = *thou shalt love thy neighbour as thyself* — the Torah substance Romans 13 just established governing the meat-question here.'),
  ('romans', 14, 17, 'isaiah', 55, 1, 8, E'*The kingdom of Elohim (God) is not meat and drink; but righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* = *wherefore do ye spend money for that which is not bread? and your labour for that which satisfieth not?* — the kingdom-substance the prophet named.'),
  ('romans', 14, 23, 'habakkuk', 2, 4, 9, E'*Whatsoever is not of faith is sin* = *the just shall live by his faith* — the emunah-substance from Romans 1:17 returning at the chapter''s close.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:weak-and-strong-not-license-to-eat-unclean | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_romans_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_romans_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for weak-and-strong-not-license-to-eat-unclean.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'weak-and-strong-not-license-to-eat-unclean'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:weak-and-strong-not-license-to-eat-unclean | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 181 romans migration complete.'