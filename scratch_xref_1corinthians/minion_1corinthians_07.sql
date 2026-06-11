-- ----- fragment: minion_1corinthians_07.sql (S228 1 Corinthians 7) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 7 (40 verses) — the Torah-affirming watchpoint chapter.
-- Tag: co07 (temp view _s228_co07_lookup).
-- Sort band: floor 6750, step 3 (6750, 6753, 6756 used; under 6775).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME. Chapter 7 is long and largely pastoral counsel — much of it Paul's own judgment
-- ("none warranted" for most of the marriage casuistry). But it carries the load-bearing thesis of
-- the whole letter and the whole framework: *Circumcision is nothing, and uncircumcision is nothing,
-- but the keeping of the commandments of Elohim (God)* (7:19). The outward flesh-credential — the
-- mark in the flesh — counts for nothing; what counts is the keeping of the commandments. This is
-- NOT a law-vs-grace antithesis and NOT the abolition of Torah; it is the very opposite — the
-- commandments are named as the thing that matters when the flesh-boast is stripped away. Paul binds
-- it to *Let every man abide in the same calling wherein he was called* (7:20,24): the distinction of
-- Yashar'el (Israel) and the nations is not erased — *let him not become uncircumcised... let him not
-- be circumcised* (7:18) — each abides where he was called, with Elohim (God). Marriage is grounded
-- in the creation order and the one-flesh bond (Genesis 2:24, the wife of the covenant of Malachi 2).
-- Concentrate the threads on 7:19 (commandments), abide-in-calling, and marriage/one-flesh; record
-- "none warranted" for the verse-blocks that are pastoral counsel without a genuine library root.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-9   marriage as the remedy against fornication; render due benevolence; better to marry than burn
--           Tanakh: Genesis 2:24 (one flesh — carried in the marriage thread at v.2-4)
--           Extras: none warranted (pastoral counsel)   NT: none warranted
--   v.10-16 the married not to depart; the unbelieving spouse sanctified; called to peace
--           Tanakh: Malachi 2:14-16 (the wife of thy covenant, deal not treacherously — marriage thread)
--           Extras: none warranted   NT: none warranted (Yahusha's own divorce word is Paul's *not I,
--                   but Yahuah (Lord)* in v.10; left in prose, no separate gospel member forced)
--   v.17-24 abide in the calling; circumcised/uncircumcised stay as called; commandments are what counts
--           Tanakh: Deuteronomy 30:8 (do all his commandments — abide-in-calling), Deuteronomy 13:4
--                   (keep his commandments... cleave unto him), Deuteronomy 30:11-16 + 30:14 (the
--                   commandment near, do it — the 7:19 commandments thread), Ecclesiastes 12:13
--                   (fear Elohim and keep his commandments — the whole duty of man)
--           Extras: Ecclesiasticus (Sirach) 15:15 (if thou wilt, to keep the commandments)
--           NT: none warranted (the keeping-the-commandments weave is Tanakh + extras)
--   v.25-38 virgins, the present distress, the time is short, marrying doeth well
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (Paul's judgment)
--   v.39-40 the wife bound by the law while her husband liveth; happier if she abide
--           Tanakh: Genesis 2:24 (the one-flesh bond — marriage thread), Malachi 2:14 (carried)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   6750 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30  (Tanakh + Extras)  [BLESSING CENTERPIECE]
--   6753 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30     (Tanakh)
--   6756 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30  [BLESSING CENTERPIECE]
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 11, 'free', E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11). When Paul says *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19), he speaks of the very commandment Moses set before Yashar''el (Israel) — not a buried or impossible thing, *not hidden from thee, neither is it far off.* The outward mark in the flesh counts for nothing; the keeping of the commandment that is near is what counts. Paul does not abolish the commandment; he names it as the one thing that matters once the flesh-credential is stripped away.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). The commandment is *very nigh... in thy mouth, and in thy heart, that thou mayest do it* — given to be done, not admired. This is the keeping that Paul sets over against every flesh-mark: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The word near in the mouth and heart is the word to be kept; the doing of it, not the cutting of the flesh, is the measure of the called.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'deuteronomy', 30, 16, 'free', E'*In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* (Deuteronomy 30:16). The life set before Yashar''el (Israel) is to *keep his commandments and his statutes and his judgments, that thou mayest live.* Paul holds the same standard over the divided assembly: not the flesh-credential of circumcision or uncircumcision, but *the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). What was life in the land is the shape of the redeemed life now — the commandments kept, the flesh-mark set aside.'),
  ('canon', '1-corinthians', 7, 19, 'canon', 'ecclesiastes', 12, 13, 'free', E'*Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* (Ecclesiastes 12:13). The Preacher''s whole conclusion is Paul''s thesis: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* Against the boast of the flesh — circumcised or uncircumcised — Paul sets the same one thing: *the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The whole duty of man is not the mark in the flesh but the commandment kept; the outward sign is nothing, the keeping is everything.'),
  ('canon', '1-corinthians', 7, 19, 'apocrypha', 'ecclesiasticus', 15, 15, 'extras', E'*If you will, to keep the commandments, and to perform acceptable faithfulness.* (Ecclesiasticus 15:15). The Hebrew library names the same measure: man is left *in the hand of his counsel,* and the path set before him is *to keep the commandments, and to perform acceptable faithfulness.* This is exactly what Paul calls the one thing that counts: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). Not the flesh-credential but the kept commandment and the faithfulness performed — the wisdom-tradition and the apostle speak with one voice.'),
  -- thread: 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30
  ('canon', '1-corinthians', 7, 24, 'canon', 'deuteronomy', 30, 8, 'free', E'*And thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day.* (Deuteronomy 30:8). The calling Paul bids each man abide in is the calling to obey: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments.* So Paul says *Brethren, let every man, wherein he is called, therein abide with Elohim (God)* (1 Corinthians 7:24) — to abide in the calling is to abide with Elohim (God), doing his commandments where one stands, whether circumcised or uncircumcised, bond or free.'),
  ('canon', '1-corinthians', 7, 18, 'canon', 'deuteronomy', 13, 4, 'free', E'*Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him.* (Deuteronomy 13:4). The walk Moses commands is to *keep his commandments... and cleave unto him* — and Paul keeps the distinction of the called intact precisely so each may so walk: *Is any man called being circumcised? let him not become uncircumcised. Is any called in uncircumcision? let him not be circumcised* (1 Corinthians 7:18). The mark of Yashar''el (Israel) is not erased and the nations are not forced under it; each abides as called, all alike cleaving unto Yahuah (LORD) and keeping his commandments.'),
  -- thread: 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2
  ('canon', '1-corinthians', 7, 2, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). Paul grounds marriage where the Maker set it at creation: a man cleaves unto his wife and *they shall be one flesh.* So *let every man have his own wife, and let every woman have her own husband* (1 Corinthians 7:2), and *the wife hath not power of her own body, but the husband: and likewise also the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — the one-flesh bond of Eden, where the two are no longer two separate powers but one.'),
  ('canon', '1-corinthians', 7, 4, 'canon', 'genesis', 2, 24, 'free', E'*Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* (Genesis 2:24). The mutual claim Paul lays down — *the wife hath not power of her own body, but the husband... the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — is the one-flesh of the garden, where *they shall be one flesh.* Because the two are one body, neither owns the body alone; the creation order, not custom, is the root of the rendering of *due benevolence* each to the other.'),
  ('canon', '1-corinthians', 7, 10, 'canon', 'malachi', 2, 14, 'free', E'*Yet ye say, Wherefore? Because Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant.* (Malachi 2:14). Yahuah (LORD) is *witness between thee and the wife of thy youth,* who is *the wife of thy covenant* — and so Paul commands, *not I, but Yahuah (Lord), Let not the wife depart from her husband... and let not the husband put away his wife* (1 Corinthians 7:10-11). The marriage is a covenant Yahuah (LORD) witnesses; to depart or put away is to deal treacherously against the companion of the covenant.'),
  ('canon', '1-corinthians', 7, 39, 'canon', 'malachi', 2, 15, 'free', E'*And did not he make one? Yet had he the residue of the spirit. And wherefore one? That he might seek a godly seed. Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth.* (Malachi 2:15). The Maker *made one* and seeks *a godly seed,* binding the wife to her husband while he lives; so *the wife is bound by the law as long as her husband liveth; but if her husband be dead, she is at liberty to be married to whom she will; only in Yahuah (Lord)* (1 Corinthians 7:39). The bond is the covenant-bond Malachi guards, loosed only by death, and her liberty is *only in Yahuah (Lord)* — the godly seed and the witnessed covenant honored to the end.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30',
       E'Circumcision is nothing, but the keeping of the commandments of Elohim (Deuteronomy 30, Ecclesiastes 12)',
       E'Here Paul lays down the thesis of the whole letter and the whole framework in a single line: *Circumcision is nothing, and uncircumcision is nothing, but the keeping of the commandments of Elohim (God)* (1 Corinthians 7:19). The outward mark in the flesh — the great flesh-credential of the divided assembly — counts for nothing. What counts is the keeping of the commandments. This is no abolition of Torah and no law-against-grace antithesis; it is the very opposite. When every flesh-boast is stripped away, the one thing Paul names as mattering is the commandment kept. And the commandment he means is the commandment Moses set before Yashar''el (Israel): *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11) — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). It was never given to be admired from afar but to be done; the life set before the people is *to keep his commandments and his statutes and his judgments, that thou mayest live and multiply* (Deuteronomy 30:16). The Preacher reaches the same conclusion of the whole matter: *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13). The whole duty of man is not the sign in the flesh but the commandment kept. And the Hebrew wisdom-library names the same measure — man is left in the hand of his own counsel, and the path before him is *to keep the commandments, and to perform acceptable faithfulness* (Ecclesiasticus 15:15). Moses, the Preacher, the wisdom-tradition, and the apostle speak with one voice: the flesh-credential is nothing; the keeping of the commandments of Elohim (God) is everything.',
       sv.verse_id, ev.verse_id, 'extras', 6750
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30',
       E'Let every man abide in the calling wherein he was called (Deuteronomy 30, 13)',
       E'Around the thesis of 7:19 Paul wraps a counsel that guards the distinction of the called: *Is any man called being circumcised? let him not become uncircumcised. Is any called in uncircumcision? let him not be circumcised* (1 Corinthians 7:18); *Let every man abide in the same calling wherein he was called* (1 Corinthians 7:20); *Brethren, let every man, wherein he is called, therein abide with Elohim (God)* (1 Corinthians 7:24). The mark of Yashar''el (Israel) is not to be undone, and the nations are not to be driven under it — each abides where he was called, and the abiding is *with Elohim (God).* For the calling is a calling to obey: *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments which I command thee this day* (Deuteronomy 30:8); the walk is *to keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). To abide in the calling is to abide doing the commandments, cleaving unto Yahuah (LORD), whether circumcised or uncircumcised, bond or free. The distinction is preserved; the obedience is the same for all.',
       sv.verse_id, ev.verse_id, 'free', 6753
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2',
       E'They shall be one flesh — the wife of the covenant (Genesis 2, Malachi 2)',
       E'Paul''s counsel on marriage is not bare pragmatism; it rests on the creation order and the covenant the Maker witnesses. *Let every man have his own wife, and let every woman have her own husband* (1 Corinthians 7:2), and *the wife hath not power of her own body, but the husband: and likewise also the husband hath not power of his own body, but the wife* (1 Corinthians 7:4) — because at the beginning *a man... shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). The two are one body, and so neither holds the body alone. Upon that one-flesh bond Paul lays the command against departing: *not I, but Yahuah (Lord), Let not the wife depart from her husband... and let not the husband put away his wife* (1 Corinthians 7:10-11) — for Yahuah (LORD) *hath been witness between thee and the wife of thy youth... yet is she thy companion, and the wife of thy covenant* (Malachi 2:14). To depart is to deal treacherously against the wife of the covenant. And the bond holds while life lasts: *the wife is bound by the law as long as her husband liveth; but if her husband be dead, she is at liberty to be married to whom she will; only in Yahuah (Lord)* (1 Corinthians 7:39) — the Maker who *made one... that he might seek a godly seed* (Malachi 2:15) guards the marriage to the end, and her liberty, when it comes, is *only in Yahuah (Lord).*',
       sv.verse_id, ev.verse_id, 'free', 6756
  FROM _s228_co07_lookup sv, _s228_co07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=7 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *this commandment which I command thee this day, it is not hidden from thee, neither is it far off* the commandment Paul means by *the keeping of the commandments of Elohim (God),* near and given to be kept (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* the commandment given to be done; the keeping, not the flesh-mark, is the measure (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:16 — *to keep his commandments and his statutes and his judgments, that thou mayest live* the life set before Yashar''el (Israel); the same standard Paul sets over the assembly in place of the flesh-credential (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 12:13 — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* the Preacher''s conclusion is Paul''s thesis; not the flesh-mark but the kept commandment is the whole duty (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 15:15 — *If you will, to keep the commandments, and to perform acceptable faithfulness* the wisdom-library''s same measure; the kept commandment and faithfulness performed, not the flesh-credential (1 Corinthians 7:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:4 — *keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* the walk of the called; the distinction of circumcised/uncircumcised kept so each may so cleave (1 Corinthians 7:18).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:8 — *thou shalt return and obey the voice of Yahuah (LORD), and do all his commandments* the calling is a calling to obey; *abide with Elohim (God)* is to abide doing the commandments where one stands (1 Corinthians 7:24).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-let-every-man-abide-in-the-calling-wherein-he-was-called-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *shall cleave unto his wife: and they shall be one flesh* the creation-order ground for each having his own wife and husband (1 Corinthians 7:2).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *they shall be one flesh* the two are one body, so neither holds the body alone: *the wife hath not power of her own body, but the husband* (1 Corinthians 7:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:14 — *Yahuah (LORD) hath been witness between thee and the wife of thy youth... the wife of thy covenant* the witnessed covenant behind the command not to depart or put away (1 Corinthians 7:10-11).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 2:15 — *did not he make one?... That he might seek a godly seed* the Maker who guards the marriage; the wife *bound by the law as long as her husband liveth... only in Yahuah (Lord)* (1 Corinthians 7:39).'
  FROM cross_reference_threads t, cross_references x, _s228_co07_lookup sv, _s228_co07_lookup tv
 WHERE t.slug='1-corinthians-7-they-shall-be-one-flesh-the-wife-of-the-covenant-genesis-2-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=7 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
