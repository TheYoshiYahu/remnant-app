-- ----- fragment: minion_1corinthians_14.sql (S228 1 Corinthians 14) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 14 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 14 (40 verses) — prophecy and tongues / the order of the assembly.
-- Tag: co14 (temp view _s228_co14_lookup).
-- Sort band: floor 6925, step 3 (6925, 6928 used; under 6950).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul orders the assembly of the called-out ones at Corinth — and his authority for
-- that order is THE LAW. Twice in this chapter he reaches for Torah to settle how the gathered seed
-- shall conduct itself: once to read the gift of tongues as the prophesied *sign* to an unhearing
-- people (*In the law it is written... With men of other tongues and other lips will I speak unto
-- this people; and yet for all that will they not hear me, saith Yahuah (Lord)* 14:21, citing Isaiah
-- 28:11-12 — and note that Paul calls Isaiah *the law,* Torah as the living, undivided authority of
-- the whole Tanakh, not abrogated), and once to ground the order of men and women in the assembly
-- (*as also saith the law* 14:34, reaching back to the creation order and the woman's word *Unto the
-- woman he said... he shall rule over thee* of Genesis 3:16, with the man formed first and the woman
-- taken from the man, Genesis 2:7,18,21-23, and the Torah order of a woman's word under her husband,
-- Numbers 30). The chapter's controlling sentence is covenantal order: *Elohim (God) is not the
-- author of confusion, but of peace, as in all churches of the saints* (14:33), *Let all things be
-- done decently and in order* (14:40). The long pastoral middle (the practical regulation of tongues
-- and prophecy, the edifying of the assembly, the two-or-three rule) carries no load-bearing Tanakh
-- citation and is recorded *none warranted* — quote-quality over quantity. NT-Lord rule: where Paul
-- quotes the YHWH text of Isaiah the pull renders *Yahuah (Lord)* (14:21), and his own apostolic word
-- is *the commandments of Yahuah (Lord)* (14:37) — preserved exactly as the pull gives.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-20  prophecy edifies more than tongues; the unfruitful understanding; be men in understanding
--           Tanakh: none warranted (pastoral regulation; the load-bearing citation is at v.21)
--           Extras: none warranted (Sirach on the tongue verbally near but not Paul's sign-argument)
--           NT: none warranted
--   v.21    in the law it is written, with men of other tongues... they will not hear, saith Yahuah
--           Tanakh: Isaiah 28:11-12 (with stammering lips and another tongue will he speak to this
--                   people... yet they would not hear) — the actual cited verse, Paul calls it the law
--           Extras: none warranted   NT: none warranted
--   v.22-32 tongues a sign to unbelievers; prophecy convicts; the two-or-three order; the spirits
--           of the prophets subject to the prophets
--           Tanakh: none warranted (carried into the order thread at v.33 in prose)
--           Extras: none warranted   NT: none warranted
--   v.33    Elohim is not the author of confusion, but of peace, as in all churches of the saints
--           Tanakh: carried in the order/the-law thread (Genesis creation order)
--           Extras: none warranted   NT: none warranted
--   v.34-35 let your women keep silence... they are commanded to be under obedience, as saith the law
--           Tanakh: Genesis 3:16 (he shall rule over thee), Genesis 2:7,18,21-23 (man formed first,
--                   woman taken from man), Numbers 30:13 (the husband may establish or make void)
--           Extras: none warranted   NT: none warranted
--   v.36-40 the commandments of Yahuah; let all things be done decently and in order
--           Tanakh: carried in the order thread (Genesis order; the law as Paul's authority)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6925 1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28   (Tanakh)  [WATCHPOINT]
--   6928 1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28  [WATCHPOINT]
  ('canon', '1-corinthians', 14, 21, 'canon', 'isaiah', 28, 11, 'free', E'*For with stammering lips and another tongue will he speak to this people.* (Isaiah 28:11). This is the verse Paul cites when he writes, *In the law it is written, With men of other tongues and other lips will I speak unto this people; and yet for all that will they not hear me, saith Yahuah (Lord)* (1 Corinthians 14:21). Mark the framing: Paul calls Isaiah *the law* — Torah is the whole living authority of the Tanakh, not a fenced-off five books, and not abrogated. The *another tongue* of Isaiah was the foreign speech of the Assyrian, a judgment-sign upon a people who *would not hear*; Paul reads the gift of tongues the same way — *tongues are for a sign, not to them that believe, but to them that believe not* (1 Corinthians 14:22). The sign of strange speech remains what it was in the law: a witness against the unhearing.'),
  ('canon', '1-corinthians', 14, 21, 'canon', 'isaiah', 28, 12, 'free', E'*To whom he said, This is the rest wherewith ye may cause the weary to rest; and this is the refreshing: yet they would not hear.* (Isaiah 28:12). The close of the citation carries its weight: Yahuah (Lord) offered *rest* and *refreshing,* *yet they would not hear* — and so he turns to *stammering lips and another tongue.* Paul ends his quotation on that very note, *and yet for all that will they not hear me, saith Yahuah (Lord)* (1 Corinthians 14:21). The tongue is a sign precisely because the people will not hear the plain word; the gift, when it edifies no one in the assembly, replays the judgment of Isaiah, which is why Paul presses *rather that ye may prophesy* (1 Corinthians 14:1) — that the weary may be given rest in words they can hear.'),
  -- thread: 1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30
  ('canon', '1-corinthians', 14, 34, 'canon', 'genesis', 3, 16, 'free', E'*Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* (Genesis 3:16). When Paul writes *let your women keep silence in the churches... but they are commanded to be under obedience, as also saith the law* (1 Corinthians 14:34), this is the word of the law he reaches for: the order spoken to the woman in the garden, *he shall rule over thee.* Paul does not invent a new rule for the assembly; he grounds the order of the gathered in the Torah, the same law that is his authority through the whole chapter. The assembly of the called-out ones keeps the order Elohim (God) himself set.'),
  ('canon', '1-corinthians', 14, 34, 'canon', 'genesis', 2, 7, 'free', E'*And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). Paul''s appeal *as also saith the law* (1 Corinthians 14:34) rests on the creation order: the man was *formed... of the dust of the ground* first, and only afterward the woman taken from him. The order of the assembly mirrors the order of the making — not a later imposition but the shape of things from the beginning, the law Paul honors as the living authority for how the gathered seed conducts itself.'),
  ('canon', '1-corinthians', 14, 34, 'canon', 'genesis', 2, 18, 'free', E'*And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). The woman is given as *an help meet for him* — the creation order Paul invokes when he says the women in the assembly *are commanded to be under obedience, as also saith the law* (1 Corinthians 14:34). The help-meet is no lesser creature but is set in an ordered relation; the order of the gathered assembly answers to this order of the garden, which is the law Paul stands upon.'),
  ('canon', '1-corinthians', 14, 34, 'canon', 'genesis', 2, 22, 'free', E'*And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* (Genesis 2:22). The woman *taken from man* and *brought... unto the man* is the creation order the law records and Paul invokes — *as also saith the law* (1 Corinthians 14:34). Paul reasons the order of the assembly from the order of the making: the gathered keep in their gathering the order Elohim (God) set when he made the man and the woman, the Torah-shape of things honored, not overturned.'),
  ('canon', '1-corinthians', 14, 34, 'canon', 'numbers', 30, 13, 'free', E'*Every vow, and every binding oath to afflict the soul, her husband may establish it, or her husband may make it void.* (Numbers 30:13). The law sets the woman''s word under her husband''s confirming: *her husband may establish it, or her husband may make it void.* It is this Torah order Paul invokes for the assembly — *they are commanded to be under obedience, as also saith the law... let them ask their husbands at home* (1 Corinthians 14:34-35). The household order of Numbers, the husband over the wife''s binding word, is the very *law* Paul names; the order of the assembly extends the order the law already keeps in the house.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28',
       E'Tongues are for a sign, and Paul calls Isaiah the law (Isaiah 28)',
       E'In the heart of his charge to *covet to prophesy, and forbid not to speak with tongues* (1 Corinthians 14:39), Paul reaches for Scripture to read the gift of tongues rightly: *In the law it is written, With men of other tongues and other lips will I speak unto this people; and yet for all that will they not hear me, saith Yahuah (Lord)* (1 Corinthians 14:21). Two things are load-bearing here. First, Paul calls Isaiah *the law* — Torah is the whole living authority of the Tanakh, the undivided word of Yahuah (Lord), not a fenced-off five books and not a thing abrogated; the prophet''s word is *the law* because it is the binding instruction of the same covenant Elohim (God). Second, he reads the gift through the prophet''s own meaning. Isaiah said, *For with stammering lips and another tongue will he speak to this people* (Isaiah 28:11) — the foreign speech of the Assyrian invader, a judgment-sign sent upon a people who had refused the plain word; for Yahuah (Lord) had offered them *the rest wherewith ye may cause the weary to rest... yet they would not hear* (Isaiah 28:12). Strange speech came as a witness against the unhearing. So Paul draws the lesson: *tongues are for a sign, not to them that believe, but to them that believe not* (1 Corinthians 14:22). A tongue that no one in the assembly understands does not edify; it replays the judgment of Isaiah''s day, *ye shall speak into the air* (1 Corinthians 14:9). This is why he presses prophecy over tongues — *rather that ye may prophesy* (1 Corinthians 14:1) — that the weary be given the rest of a word they can hear, that *all may learn, and all may be comforted* (1 Corinthians 14:31). The law, which Paul honors as his living authority, teaches him how to weigh the gift.',
       sv.verse_id, ev.verse_id, 'free', 6925
  FROM _s228_co14_lookup sv, _s228_co14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=14 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30',
       E'The order of the assembly: as also saith the law (Genesis 2-3, Numbers 30)',
       E'*Elohim (God) is not the author of confusion, but of peace, as in all churches of the saints* (1 Corinthians 14:33), and *Let all things be done decently and in order* (1 Corinthians 14:40). The order of the gathered assembly is covenantal, and Paul''s authority for it is THE LAW. When he writes *Let your women keep silence in the churches... but they are commanded to be under obedience, as also saith the law* (1 Corinthians 14:34), he is not inventing a rule but appealing to the Torah he has leaned on all through the letter. The word of the law he reaches for is the order spoken in the garden: *Unto the woman he said... thy desire shall be to thy husband, and he shall rule over thee* (Genesis 3:16). Behind it stands the order of the making itself — the man *formed... of the dust of the ground* first (Genesis 2:7), the woman given as *an help meet for him* (Genesis 2:18), *the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man* (Genesis 2:22): the order of the assembly mirrors the order of creation, the shape of things from the beginning. And the law keeps that same order in the household, where the woman''s binding word stands under her husband''s confirming — *her husband may establish it, or her husband may make it void* (Numbers 30:13) — which is why Paul adds *let them ask their husbands at home* (1 Corinthians 14:35). None of this is abrogation; it is Torah honored as the living authority for how the called-out ones conduct themselves. So Paul can say of his own ordering word, *the things that I write unto you are the commandments of Yahuah (Lord)* (1 Corinthians 14:37): the apostle''s order and the law''s order are one, that all things be done decently and in order in the peace of the Elohim (God) of the saints.',
       sv.verse_id, ev.verse_id, 'free', 6928
  FROM _s228_co14_lookup sv, _s228_co14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=14 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:11 — *with stammering lips and another tongue will he speak to this people* the actual verse Paul cites as *the law*; the foreign tongue a judgment-sign, read into *tongues are for a sign... to them that believe not* (1 Corinthians 14:21-22).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:12 — *this is the refreshing: yet they would not hear* the rest offered and refused; Paul ends his citation on it, *and yet for all that will they not hear me, saith Yahuah (Lord)* (1 Corinthians 14:21).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-tongues-a-sign-and-paul-calls-isaiah-the-law-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *thy desire shall be to thy husband, and he shall rule over thee* the word of the law Paul reaches for: *under obedience, as also saith the law* (1 Corinthians 14:34).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *Yahuah Elohim (the LORD God) formed man of the dust of the ground* the man formed first, the creation order Paul invokes *as also saith the law* (1 Corinthians 14:34).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:18 — *I will make him an help meet for him* the woman given in ordered relation; the creation order behind *under obedience, as also saith the law* (1 Corinthians 14:34).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:22 — *the rib... made he a woman, and brought her unto the man* the woman taken from the man; the making-order the law records and Paul invokes (1 Corinthians 14:34).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Numbers 30:13 — *her husband may establish it, or her husband may make it void* the Torah order of the woman''s word under the husband; *let them ask their husbands at home* (1 Corinthians 14:35).'
  FROM cross_reference_threads t, cross_references x, _s228_co14_lookup sv, _s228_co14_lookup tv
 WHERE t.slug='1-corinthians-14-the-order-of-the-assembly-as-also-saith-the-law-genesis-2-3-numbers-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
