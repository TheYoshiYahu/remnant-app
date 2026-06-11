-- ----- fragment: minion_1corinthians_12.sql (S228 1 Corinthians 12) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 12 (31 verses) — the spiritual gifts and the one body.
-- Tag: co12 (temp view _s228_co12_lookup).
-- Sort band: floor 6875, step 3 (6875, 6878, 6881 used; under 6900).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul writes to the divided assembly at Corinth — Yahudim (Jews) and the grafted-in
-- nations gathered as one. Chapter 12 is the one-body chapter, and the watchpoint is plain: *by one
-- Spirit are we all baptized into one body... whether we be Yahudim (Jews) or Gentiles* (12:13). The
-- one body is NOT a replacement people; it is Yashar'el (Israel)-and-the-grafted made ONE, the
-- scattered seed gathered home — the very thing Yahuah (LORD) promised Ezekiel when he joined the two
-- sticks into *one nation... no more two* (Ezekiel 37:22). The gifts are *the same Spirit,* *the same
-- Lord,* *the same Elohim* (12:4-6) — and the confession of the body rests on a Spirit-given word: *no
-- man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (12:3),
-- the same word Yahusha (Jesus) named when *flesh and blood hath not revealed it unto thee, but my
-- Father which is in heaven* (Matthew 16:17). The body-and-members figure is the SAME figure as Romans
-- 12:4-5 and Ephesians 4 — one mind holds them together. This chapter is heavily NT-resonant; Tanakh
-- and extras are weighed honestly and "none warranted" recorded generously where there is no
-- load-bearing root (no forced verbal coincidences).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   spiritual gifts; ye were Gentiles carried away unto dumb idols
--           Tanakh: none warranted (the dumb-idols phrase carries no load-bearing thread of its own
--                   here; the deliverance-from-idols weight belongs to ch10/ch8, not ch12)
--           Extras: none warranted   NT: none warranted (carried in prose at v.13)
--   v.3     no man can say Yahusha is Yahuah but by the Ruach HaKodesh
--           Tanakh: none warranted (the confession is a NT/Spirit matter; no verbatim OT root)
--           Extras: none warranted
--           NT: Matthew 16:16-17 (flesh and blood hath not revealed it... but my Father), Romans 10:9
--               (confess with thy mouth the Lord Yahusha)
--   v.4-11  diversities of gifts, the same Spirit / same Lord / same Elohim; the manifestation given
--           Tanakh: none warranted (the same-Spirit triad is NT-internal; no load-bearing OT verse —
--                   do not force the Shema here, the chapter is not making a one-Elohim argument)
--           Extras: none warranted
--           NT: Romans 12:6 (gifts differing according to the grace given), Ephesians 4:7-11 (he gave
--               gifts unto men; some apostles, some prophets) — carried in the body thread
--   v.12-13 the body is one and hath many members; by one Spirit baptized into one body, Jews or
--           Gentiles, the gathered seed made ONE
--           Tanakh: Ezekiel 37:22 (I will make them one nation... no more two), Ezekiel 37:19 (make
--                   them one stick... one in mine hand)
--           Extras: none warranted (the one-congregation weight is best carried by Ezekiel's two
--                   sticks; the extras add no cleaner witness here)
--           NT: Romans 12:4-5 (many members... one body in Messiah), Ephesians 4:4-6 (one body, one
--               Spirit... one Yahuah... one Elohim)
--   v.14-27 the body and its many members; no schism; ye are the body of Messiah, members in particular
--           Tanakh: none warranted (the figure has no single OT verse-root; the congregation-as-one
--                   weight is carried at v.13 by Ezekiel 37)
--           Extras: none warranted
--           NT: Romans 12:4-5 (the same one-body figure), Ephesians 4:16 (the whole body fitly joined
--               together... maketh increase of the body)
--   v.28-31 Elohim set some in the assembly: apostles, prophets, teachers; covet the best gifts; a
--           more excellent way
--           Tanakh: none warranted
--           Extras: none warranted
--           NT: Ephesians 4:11 (he gave some apostles... some prophets) — carried in the body thread
--
-- THREADS (slug -> target libraries):
--   6875 1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16  (NT)
--   6878 1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37  (Tanakh + NT)
--   6881 1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4  (NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16
  ('canon', '1-corinthians', 12, 3, 'canon', 'matthew', 16, 16, 'free', E'*And Simon Peter answered and said, Thou art the Messiah (Christ), the Son of the living Elohim (God).* (Matthew 16:16). Peter''s confession is the very thing Paul says cannot be spoken from the flesh: *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3). The true naming of who Yahusha (Jesus) is — Messiah, the Son of the living Elohim (God), Yahuah (Lord) — is not a conclusion the natural man reaches but a word given by the Spirit, the same Spirit who divides the gifts to the one body.'),
  ('canon', '1-corinthians', 12, 3, 'canon', 'matthew', 16, 17, 'free', E'*And Yahusha (Jesus) answered and said unto him, Blessed art thou, Simon Bar-jona: for flesh and blood hath not revealed it unto thee, but my Father which is in heaven.* (Matthew 16:17). Yahusha (Jesus) names the source of the true confession: *flesh and blood hath not revealed it unto thee, but my Father.* This is exactly Paul''s point — *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3). The confession of the body is a revealed word, given from above by the Father through the Spirit, never a flesh-credential the natural man supplies.'),
  ('canon', '1-corinthians', 12, 3, 'canon', 'romans', 10, 9, 'free', E'*That if thou shalt confess with thy mouth the Lord Yahusha (Lord Jesus), and shalt believe in thine heart that Elohim (God) hath raised him from the dead, thou shalt be saved.* (Romans 10:9). The confession unto salvation is *the Lord Yahusha (Lord Jesus)* — and Paul has already told the same assemblies that this very saying is Spirit-wrought: *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3). The word in the mouth and the faith in the heart are one Spirit''s gift; to name Yahusha (Jesus) as Yahuah (Lord) is itself the Spirit''s seal upon the gathered.'),
  -- thread: 1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37
  ('canon', '1-corinthians', 12, 13, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* (Ezekiel 37:22). Yahuah (LORD) promised to make the scattered house *one nation... no more two.* That is the very thing Paul declares accomplished: *by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles* (1 Corinthians 12:13). The one body is not a new people displacing Yashar''el (Israel) but the two-into-one Yahuah (LORD) swore to gather — the divided seed made one under one King, knit by one Spirit into one body.'),
  ('canon', '1-corinthians', 12, 13, 'canon', 'ezekiel', 37, 19, 'free', E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand.* (Ezekiel 37:19). The two sticks — Joseph and Yahudah (Judah) — Yahuah (LORD) joins to *make them one stick... one in mine hand.* Paul speaks the same gathering when he says *by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles* (1 Corinthians 12:13). The one body is the two sticks made one in his hand, the scattered seed of the whole house drawn back together — Israel and the grafted-in as one, not a replacement.'),
  ('canon', '1-corinthians', 12, 13, 'canon', 'romans', 12, 5, 'free', E'*So we, being many, are one body in Messiah (Christ), and every one members one of another.* (Romans 12:5). To the assembly at Rome Paul speaks the same one-body word he speaks at Corinth: *being many, are one body in Messiah (Christ).* It answers *by one Spirit are we all baptized into one body* (1 Corinthians 12:13) and *all the members of that one body, being many, are one body: so also is Messiah (Christ)* (1 Corinthians 12:12). One figure, one mind, two letters: the many made one in Messiah, members one of another.'),
  ('canon', '1-corinthians', 12, 13, 'canon', 'ephesians', 4, 4, 'free', E'*There is one body, and one Spirit, even as ye are called in one hope of your calling;* (Ephesians 4:4). The Ephesian word lays the same foundation as Corinth: *one body, and one Spirit.* It unfolds Paul''s declaration that *by one Spirit are we all baptized into one body* (1 Corinthians 12:13) — and the next breath is *One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all* (Ephesians 4:5-6), the very same-Spirit, same-Lord, same-Elohim triad that gives the gifts at Corinth (1 Corinthians 12:4-6). One Spirit binds the one body; the gathered are one because the One who calls them is one.'),
  -- thread: 1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4
  ('canon', '1-corinthians', 12, 12, 'canon', 'romans', 12, 4, 'free', E'*For as we have many members in one body, and all members have not the same office:* (Romans 12:4). Paul lays the body-figure twice in two letters with the same hand. At Rome: *many members in one body, and all members have not the same office.* At Corinth: *the body is one, and hath many members, and all the members of that one body, being many, are one body* (1 Corinthians 12:12). The diversity of the members serves the unity of the body — many offices, one body, no member dispensable.'),
  ('canon', '1-corinthians', 12, 27, 'canon', 'romans', 12, 5, 'free', E'*So we, being many, are one body in Messiah (Christ), and every one members one of another.* (Romans 12:5). The Roman word names what the Corinthian body is: *one body in Messiah (Christ), and every one members one of another.* Paul says it plainly to Corinth: *now ye are the body of Messiah (Christ), and members in particular* (1 Corinthians 12:27). The gathered are the body of Messiah, each a member set in his place — *being many, are one body in Messiah.*'),
  ('canon', '1-corinthians', 12, 25, 'canon', 'ephesians', 4, 16, 'free', E'*From whom the whole body fitly joined together and compacted by that which every joint supplieth, according to the effectual working in the measure of every part, maketh increase of the body unto the edifying of itself in love.* (Ephesians 4:16). The Ephesian word shows the body knit so *every joint supplieth* and *every part* works to the whole — the answer to Paul''s charge at Corinth: *that there should be no schism in the body; but that the members should have the same care one for another* (1 Corinthians 12:25). No member stands alone; the whole body, fitly joined, grows by the supply of each part, the same care one for another.'),
  ('canon', '1-corinthians', 12, 28, 'canon', 'ephesians', 4, 11, 'free', E'*And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers;* (Ephesians 4:11). The Ephesian list of the gifts of office matches the Corinthian: *Elohim (God) hath set some in the church, first apostles, secondarily prophets, thirdly teachers* (1 Corinthians 12:28). The risen Messiah gives the offices to the one body — apostles, prophets, teachers — *for the perfecting of the saints... for the edifying of the body of Messiah (Christ)* (Ephesians 4:12), the same body Paul orders at Corinth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16',
       E'No man can say that Yahusha (Jesus) is Yahuah (Lord) but by the Spirit (Matthew 16, Romans 10)',
       E'Before Paul orders the gifts he settles the ground of the confession: *no man speaking by the Spirit of Elohim (God) calleth Yahusha (Jesus) accursed: and that no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3). To name Yahusha (Jesus) as Yahuah (Lord) is not a flesh-credential the natural man supplies; it is a word given by the Spirit. Yahusha (Jesus) said the same when Peter confessed him: *Thou art the Messiah (Christ), the Son of the living Elohim (God)* (Matthew 16:16) — and the answer, *Blessed art thou, Simon Bar-jona: for flesh and blood hath not revealed it unto thee, but my Father which is in heaven* (Matthew 16:17). Flesh and blood does not reveal it; the Father reveals it from above, the Spirit speaks it within. So too the confession unto salvation: *if thou shalt confess with thy mouth the Lord Yahusha (Lord Jesus), and shalt believe in thine heart that Elohim (God) hath raised him from the dead, thou shalt be saved* (Romans 10:9). The word in the mouth and the faith in the heart are one Spirit''s gift. The whole apparatus of gifts that follows rests on this: the same Spirit who divides the gifts severally is the Spirit who first gives the body its confession, naming Yahusha (Jesus) as Yahuah (Lord).',
       sv.verse_id, ev.verse_id, 'free', 6875
  FROM _s228_co12_lookup sv, _s228_co12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37',
       E'By one Spirit baptized into one body, Jews and Gentiles made one — the gathered seed (Ezekiel 37)',
       E'Here is the heart of the chapter, and the watchpoint: *For by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles, whether we be bond or free; and have been all made to drink into one Spirit* (1 Corinthians 12:13). The one body is NOT a new people displacing Yashar''el (Israel). It is the two-into-one that Yahuah (LORD) swore through Ezekiel — the divided house gathered home and knit as one. Ezekiel took two sticks, Joseph and Yahudah (Judah), and Yahuah (LORD) said *I will take the stick of Joseph... and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); and *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The one body Paul names is the *one nation... no more two* — the scattered seed of the whole house, Yahudim (Jews) and the grafted-in nations, made one by one Spirit under one King. Paul speaks the same one-body word to Rome: *being many, are one body in Messiah (Christ), and every one members one of another* (Romans 12:5); and to Ephesus he lays the foundation — *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), unfolding into *One Yahuah (Lord), one faith, one baptism, One Elohim (God) and Father of all* (Ephesians 4:5-6), the very same-Spirit, same-Lord, same-Elohim triad that gives the gifts at Corinth (1 Corinthians 12:4-6). The gathered are one because the One who calls them is one; the body is Yashar''el (Israel)-and-the-grafted made ONE, the two sticks one in his hand.',
       sv.verse_id, ev.verse_id, 'free', 6878
  FROM _s228_co12_lookup sv, _s228_co12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4',
       E'The body is one and hath many members, members in particular (Romans 12, Ephesians 4)',
       E'Paul draws the body-figure with the same hand in three letters. At Corinth: *For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ)* (1 Corinthians 12:12), and *now ye are the body of Messiah (Christ), and members in particular* (1 Corinthians 12:27). At Rome the same: *For as we have many members in one body, and all members have not the same office: So we, being many, are one body in Messiah (Christ), and every one members one of another* (Romans 12:4-5). The diversity of the members serves the unity of the body — the foot, the hand, the eye, the ear each set by Elohim (God) *as it hath pleased him* (1 Corinthians 12:18), none dispensable, *that there should be no schism in the body; but that the members should have the same care one for another* (1 Corinthians 12:25). Ephesians shows the body so knit that *the whole body fitly joined together and compacted by that which every joint supplieth... maketh increase of the body unto the edifying of itself in love* (Ephesians 4:16) — no member standing alone, the whole growing by the supply of each part. And the offices are the gift of the risen Messiah to the one body: *Elohim (God) hath set some in the church, first apostles, secondarily prophets, thirdly teachers* (1 Corinthians 12:28), matching *he gave some, apostles; and some, prophets... and some, pastors and teachers* (Ephesians 4:11), all *for the edifying of the body of Messiah (Christ)* (Ephesians 4:12). One body, many members, one care — the gathered knit as the body of Messiah.',
       sv.verse_id, ev.verse_id, 'free', 6881
  FROM _s228_co12_lookup sv, _s228_co12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=12 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 16:16 — *Thou art the Messiah (Christ), the Son of the living Elohim (God)* Peter''s Spirit-given confession; *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* (1 Corinthians 12:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:17 — *flesh and blood hath not revealed it unto thee, but my Father which is in heaven* the source of the true confession; not the flesh but the Father by the Spirit (1 Corinthians 12:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 10:9 — *if thou shalt confess with thy mouth the Lord Yahusha (Lord Jesus)... thou shalt be saved* the confession unto salvation, itself the Spirit''s gift (1 Corinthians 12:3).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-no-man-can-say-yahusha-is-lord-but-by-the-spirit-matthew-16'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:22 — *I will make them one nation... they shall be no more two nations* the gathered house made one; *by one Spirit are we all baptized into one body, whether we be Yahudim (Jews) or Gentiles* (1 Corinthians 12:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:19 — *make them one stick, and they shall be one in mine hand* the two sticks of Joseph and Yahudah (Judah) joined; the one body is the two sticks made one (1 Corinthians 12:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:5 — *being many, are one body in Messiah (Christ), and every one members one of another* the same one-body word to Rome (1 Corinthians 12:12-13).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope* the same foundation, unfolding into one Lord, one faith, one Elohim (1 Corinthians 12:13, 4-6).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 12:4 — *many members in one body, and all members have not the same office* the same body-figure to Rome; *the body is one, and hath many members* (1 Corinthians 12:12).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 12:5 — *being many, are one body in Messiah (Christ), and every one members one of another* what the Corinthian body is; *ye are the body of Messiah (Christ), and members in particular* (1 Corinthians 12:27).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:16 — *the whole body fitly joined together... every joint supplieth... maketh increase of the body* no member alone; *no schism in the body... the same care one for another* (1 Corinthians 12:25).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:11 — *he gave some, apostles; and some, prophets... and some, pastors and teachers* the offices given to the one body; *Elohim (God) hath set some in the church, first apostles, secondarily prophets, thirdly teachers* (1 Corinthians 12:28).'
  FROM cross_reference_threads t, cross_references x, _s228_co12_lookup sv, _s228_co12_lookup tv
 WHERE t.slug='1-corinthians-12-the-body-is-one-and-hath-many-members-romans-12-ephesians-4'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=12 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
