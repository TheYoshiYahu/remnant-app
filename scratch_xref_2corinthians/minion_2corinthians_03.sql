-- ----- fragment: minion_2corinthians_03.sql (S229 2 Corinthians 3) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 3 (18 verses) — THE HIGH-WATCHPOINT CHAPTER of the book.
--   The new-covenant ministry: letter vs spirit, the SAME Torah written on the heart, the veil on Moses.
-- Tag: 2c03 (temp view _s229_2c03_lookup).
-- Sort band: floor 7050, step 3 (7050, 7053, 7056 used; under 7075).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME / WATCHPOINT (the most important guard in the whole book): this chapter is NOT
-- "the Torah is abolished" and NOT "law vs grace." *The letter killeth, but the spirit giveth life*
-- (3:6) means the externally-graven code WITHOUT the new heart — the old administration of Deuteronomy
-- 27-28 that brings the curse on a people who have the commandment graven on stone but a heart of stone
-- (Ezekiel 36:26). The *spirit that gives life* writes the SAME Torah on the heart: Jeremiah 31:33
-- *I will put my law in their inward parts, and write it in their hearts*; Ezekiel 36:26-27 *a new
-- heart... and cause you to walk in my statutes.* The glory of Moses' face (Exodus 34:29-35) was real
-- and from Yahuah; *that which is done away* (3:11) is the fading-glory ministration of condemnation
-- under the old administration, not the commandment of Yahuah; the veil is *upon their heart* in the
-- reading (3:15), not a defect in the Torah. Build the centerpiece thread on Jeremiah 31:33 + Ezekiel
-- 36:26 (+ Exodus 31:18, Proverbs 7:3, Ezekiel 11:19). NEVER render Torah-against-Spirit or
-- letter-against-grace.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   ye are the epistle of Messiah, written not in tables of stone but in fleshy tables of the heart
--           Tanakh: Exodus 31:18 (two tables of stone, written with the finger of Elohim), Jeremiah
--                   31:33 (write it in their hearts), Ezekiel 36:26 (heart of flesh), Ezekiel 11:19
--                   (the stony heart taken away), Proverbs 7:3 (write them upon the table of thine heart)
--           Extras: none warranted (the new-covenant root is wholly canon)   NT: none warranted
--   v.4-6   able ministers of the new testament; the letter killeth, but the spirit giveth life
--           Tanakh: Jeremiah 31:33 (the new covenant, the law written within), Ezekiel 36:27
--                   (the new spirit, caused to walk in the statutes)
--           Extras: none warranted   NT: none warranted (the new-covenant root is the Tanakh promise)
--   v.7-11  the ministration of death written and engraven in stones, the glory done away
--           Tanakh: Exodus 34:29 / 34:30 (the skin of Moses' face shone; they were afraid)
--           Extras: none warranted   NT: none warranted
--   v.12-15 Moses put a vail over his face; the vail is upon their heart in the reading
--           Tanakh: Exodus 34:33 / 34:35 (he put a vail on his face; removed only before Yahuah)
--           Extras: none warranted   NT: none warranted
--   v.16-18 when it shall turn to the Lord the vail is taken away; where the Spirit is, there is liberty;
--           changed from glory to glory
--           Tanakh: Ezekiel 36:27 (cause you to walk in my statutes — the Spirit that gives the liberty),
--                   Jeremiah 31:34 (they shall all know me — the unveiled knowledge), Ezekiel 36:26
--                   (the new heart that transforms from glory to glory)
--           Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7050 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31  (Tanakh)  [CENTERPIECE / BLESSING]
--   7053 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34          (Tanakh)
--   7056 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s229_2c03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31  [CENTERPIECE]
  ('canon', '2-corinthians', 3, 3, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). This is the new covenant Paul ministers. When he says the assembly is *the epistle of Messiah (Christ)... written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3), he is naming exactly Jeremiah''s promise: the SAME law, no longer only graven on stone but now *put in their inward parts* and *written in their hearts.* The new place of the writing is the heart, and the One who writes is the Spirit of the living Elohim (God).'),
  ('canon', '2-corinthians', 3, 6, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). Paul is *made... able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life* (2 Corinthians 3:6). The *spirit that giveth life* is the very thing Jeremiah promised — the law *written in their hearts.* The *letter that killeth* is that same law graven only on stone, an external code without the inward writing — it condemns a people whose heart is unchanged; the law put *in their inward parts* gives life. The Torah is not the death; the death is the commandment on stone without the heart of flesh.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). Paul''s *fleshy tables of the heart* (2 Corinthians 3:3) are Ezekiel''s *heart of flesh.* The old administration wrote the commandment on *tables of stone* and met a *stony heart*; the new covenant takes away the stony heart and gives *an heart of flesh* on which the Spirit writes. The *living Elohim (God)* who writes the epistle of Messiah on the heart (3:3) is the One who said *I will take away the stony heart out of your flesh.*'),
  ('canon', '2-corinthians', 3, 6, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). Here is the *spirit* that *giveth life* (2 Corinthians 3:6): Yahuah (LORD) puts his Spirit within his people and *cause[s] you to walk in my statutes.* The Spirit does not abolish the statutes — it writes them on the heart and makes the people keep them and do them. The new covenant Paul ministers is the covenant in which *my spirit* and *my statutes* are joined: the law obeyed from the inside, the letter become life.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'exodus', 31, 18, 'free', E'*And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God).* (Exodus 31:18). At Sinai the covenant was *written with the finger of Elohim (God)* on *tables of stone.* Paul sets the new covenant against this very picture: *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). The same finger of Elohim (God), the same law — but the writing-surface is changed from stone to the living heart. The glory at Sinai was real; the promise is that the writing moves inward.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'proverbs', 7, 3, 'free', E'*Bind them upon thy fingers, write them upon the table of thine heart.* (Proverbs 7:3). The wisdom-call already knew the goal: the commandments are to be *written upon the table of thine heart.* This is what the Spirit accomplishes in the new covenant — Paul''s *fleshy tables of the heart* (2 Corinthians 3:3) are the very *table of thine heart* on which Proverbs bids the law be written. The same commandments (*keep my commandments, and live; and my law as the apple of thine eye,* Proverbs 7:2) are not erased but inscribed where they were always meant to live.'),
  ('canon', '2-corinthians', 3, 3, 'canon', 'ezekiel', 11, 19, 'free', E'*And I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh:* (Ezekiel 11:19). Ezekiel''s earlier promise joins the same gift to the same purpose: *That they may walk in my statutes, and keep mine ordinances, and do them: and they shall be my people, and I will be their Elohim (God)* (Ezekiel 11:20). The *heart of flesh* that replaces *the stony heart* is Paul''s *fleshy tables of the heart* (2 Corinthians 3:3); and its end is not lawlessness but to *walk in my statutes, and keep mine ordinances, and do them.* The new heart is given so the Torah may finally be kept.'),
  -- thread: 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34
  ('canon', '2-corinthians', 3, 7, 'canon', 'exodus', 34, 29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* (Exodus 34:29). The glory on Moses'' face was real and from Yahuah (LORD): *the skin of his face shone* because he had spoken with Yahuah (LORD). Paul grants it fully — *the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The point is not that the Sinai glory was false but that it was a fading glory; the glory of the ministration of the spirit *exceed[s] in glory* (3:9).'),
  ('canon', '2-corinthians', 3, 7, 'canon', 'exodus', 34, 30, 'free', E'*And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him.* (Exodus 34:30). The children of Yashar''el (Israel) *were afraid to come nigh* because of the shining of Moses'' face — they *could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The glory was so weighty they could not look on it. Paul names this to set the contrast: under the new covenant *we all, with open face beholding... the glory of Yahuah (Lord), are changed into the same image from glory to glory* (3:18) — no longer afraid, no longer veiled, but transformed by the glory they now behold.'),
  ('canon', '2-corinthians', 3, 13, 'canon', 'exodus', 34, 33, 'free', E'*And till Moses had done speaking with them, he put a vail on his face.* (Exodus 34:33). Moses *put a vail on his face* after speaking the words of Yahuah (LORD) to the people. Paul reads the vail: *And not as Moses, which put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13). The vail belongs to the fading-glory ministration — what is *abolished* is that fading administration of condemnation, not the commandment of Yahuah (LORD); and the vail now lies *upon their heart* (3:15) in the reading, until it is turned to the Lord.'),
  ('canon', '2-corinthians', 3, 13, 'canon', 'exodus', 34, 35, 'free', E'*And the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone: and Moses put the vail upon his face again, until he went in to speak with him.* (Exodus 34:35). Moses unveiled his face *when [he] went in before Yahuah (LORD) to speak with him* (Exodus 34:34) and veiled it again before the people. Paul makes this the figure of the whole reading: the vail remains *in the reading of the old testament; which vail is done away in Messiah (Christ)* (2 Corinthians 3:14), and *when Moses is read, the vail is upon their heart* (3:15) — but *when it shall turn to Yahuah (Lord), the vail shall be taken away* (3:16), as Moses'' own vail came off when he turned in to Yahuah (LORD).'),
  -- thread: 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36
  ('canon', '2-corinthians', 3, 17, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). *Now Yahuah (Lord) is that Spirit: and where the Spirit of Yahuah (Lord) is, there is liberty* (2 Corinthians 3:17). The liberty is not freedom from the statutes but the Spirit-given freedom to walk in them — exactly Ezekiel''s gift, *my spirit within you,* which *cause[s] you to walk in my statutes.* The Spirit that liberates is the Spirit that writes the law on the heart and makes the people keep the judgments and do them; liberty and obedience are one gift.'),
  ('canon', '2-corinthians', 3, 16, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). The new covenant promised an unveiled knowing — *they shall all know me, from the least of them unto the greatest.* This is what happens when the vail is removed: *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16), and the heart sees what was hidden in the reading. The forgiven, Spirit-taught people of Jeremiah''s covenant are the ones who behold *with open face* the glory of Yahuah (Lord) (3:18).'),
  ('canon', '2-corinthians', 3, 18, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). *But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:18). The transformation *from glory to glory* is the new heart at work: the *new spirit* Yahuah (LORD) puts within remakes the beholder into the image he beholds. The same Spirit that gives *an heart of flesh* changes the unveiled face into the image of the glory of Yahuah (Lord).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31',
       E'The new covenant written on the heart, not in tables of stone (Jeremiah 31, Ezekiel 36)',
       E'This is the heart of the chapter, and it must not be misread. Paul tells the assembly they are *the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3), and that he and his fellows are *made... able ministers of the new testament; not of the letter, but of the spirit: for the letter killeth, but the spirit giveth life* (2 Corinthians 3:6). This is NOT "the Torah is abolished" and NOT "law against grace." It is precisely the new covenant Yahuah (LORD) promised through Jeremiah: *But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The same law — now written in a new place. The *letter that killeth* is that same law graven only on *tables of stone, written with the finger of Elohim (God)* (Exodus 31:18) and met by a *stony heart* — an external code without the inward writing, which can only condemn a people whose heart is unchanged. The *spirit that giveth life* writes that same Torah on the heart: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26), *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The new heart is given so the statutes may finally be kept — Ezekiel had said it before: *I will take the stony heart out of their flesh, and will give them an heart of flesh: That they may walk in my statutes, and keep mine ordinances, and do them* (Ezekiel 11:19-20). And the wisdom-call had named the goal long before: *write them upon the table of thine heart* (Proverbs 7:3). Paul''s *fleshy tables of the heart* are Ezekiel''s *heart of flesh* and Proverbs'' *table of thine heart* — the very surface on which the new covenant inscribes the law. The death is never the commandment of Yahuah (LORD); the death is the commandment on stone without the heart of flesh. The Spirit gives life by writing the SAME Torah within.',
       sv.verse_id, ev.verse_id, 'free', 7050
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34',
       E'The vail on the face of Moses and the glory that fades (Exodus 34)',
       E'Paul reads the story of Moses'' shining face with care, and he grants the Sinai glory its full weight. When Moses came down from the mount, *the skin of his face shone while he talked with him* (Exodus 34:29) — a real glory, given by Yahuah (LORD) — so that *Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30). Paul says exactly this: *the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The Sinai glory was not false — it was a fading glory, *which glory was to be done away.* So *if the ministration of condemnation be glory, much more doth the ministration of righteousness exceed in glory* (3:9). Then the vail: *And till Moses had done speaking with them, he put a vail on his face* (Exodus 34:33), and *the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone: and Moses put the vail upon his face again, until he went in to speak with him* (Exodus 34:35) — taking it off only when he *went in before Yahuah (LORD) to speak with him* (Exodus 34:34). Paul makes the vail the figure of the reading: Moses *put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13). What is *abolished* is the fading-glory ministration of condemnation, not the commandment of Yahuah (LORD); and the vail now lies *upon their heart* (3:15) — until, like Moses turning in to Yahuah (LORD), the heart turns to the Lord and the vail is taken away (3:16).',
       sv.verse_id, ev.verse_id, 'free', 7053
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36',
       E'When it shall turn to the Lord the vail is taken away, and the Spirit of liberty (Ezekiel 36, Jeremiah 31)',
       E'The chapter ends in glory: *Nevertheless when it shall turn to Yahuah (Lord), the vail shall be taken away. Now Yahuah (Lord) is that Spirit: and where the Spirit of Yahuah (Lord) is, there is liberty. But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:16-18). The liberty here is not freedom FROM the statutes; it is the Spirit-given freedom to walk in them — exactly Ezekiel''s promise: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit that liberates is the Spirit that writes the law on the heart; liberty and obedience are one gift. And the unveiled beholding is the new covenant''s promised knowing: *they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34) — when the vail is taken away, the heart at last sees what was hidden in the reading. Finally, the transformation *from glory to glory* is the new heart at work: *A new heart also will I give you, and a new spirit will I put within you... and I will give you an heart of flesh* (Ezekiel 36:26). The same Spirit that gives the heart of flesh changes the unveiled face into the image of the glory of Yahuah (Lord). This is the new-covenant ministry in its fullness — the SAME Torah, written within, beheld with open face, working its own glory into the beholder.',
       sv.verse_id, ev.verse_id, 'free', 7056
  FROM _s229_2c03_lookup sv, _s229_2c03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant Paul ministers; the assembly *written... in fleshy tables of the heart* (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the *spirit that giveth life*; the *letter killeth, but the spirit giveth life* (2 Corinthians 3:6) — the SAME law written within, not abolished.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *I will take away the stony heart out of your flesh, and I will give you an heart of flesh* Paul''s *fleshy tables of the heart* (2 Corinthians 3:3); the stony heart replaced by flesh.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the *spirit that giveth life* (2 Corinthians 3:6); the Spirit writes the statutes on the heart, not abolishes them.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 31:18 — *two tables of testimony, tables of stone, written with the finger of Elohim (God)* the Sinai writing; the new covenant *not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 7:3 — *write them upon the table of thine heart* the goal named long before; Paul''s *fleshy tables of the heart* (2 Corinthians 3:3), the law inscribed where it was meant to live.'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ezekiel 11:19 — *I will take the stony heart out of their flesh, and will give them an heart of flesh* given *that they may walk in my statutes* (Ezekiel 11:20); the *fleshy tables of the heart* so the Torah may be kept (2 Corinthians 3:3).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-new-covenant-written-on-the-heart-not-in-tables-of-stone-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *the skin of his face shone while he talked with him* the real Sinai glory; *the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *the skin of his face shone; and they were afraid to come nigh him* the glory too weighty to look on; they *could not stedfastly behold the face of Moses* (2 Corinthians 3:7).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:33 — *Moses... put a vail on his face* the vail Paul reads; Moses *put a vail over his face, that the children of Yashar''el (Israel) could not stedfastly look to the end of that which is abolished* (2 Corinthians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:35 — *Moses put the vail upon his face again, until he went in to speak with him* the vail removed only when he turned in to Yahuah (LORD); *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-the-vail-on-the-face-of-moses-and-the-glory-that-fades-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the liberty is freedom to walk in the statutes; *where the Spirit of Yahuah (Lord) is, there is liberty* (2 Corinthians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:34 — *they shall all know me, from the least of them unto the greatest* the unveiled knowing; *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *a new heart... and I will give you an heart of flesh* the new heart that transforms; *changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c03_lookup sv, _s229_2c03_lookup tv
 WHERE t.slug='2-corinthians-3-when-it-shall-turn-to-the-lord-the-vail-taken-away-and-the-spirit-of-liberty-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
