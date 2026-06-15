-- ----- fragment: minion_1john_05.sql (S242 1 John 5) -----
-- =====================================================================
-- S242 minion — 1 JOHN 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 JOHN 5 (21 verses) — the closing chapter: love IS keeping His commandments,
--   the victory of faith, the threefold witness, the Son who is life, the assurance of eternal life.
-- Tag: j242c5 (temp view _s242_j242c5_lookup).
-- Sort band: floor 10120, step 3 (10120, 10123, 10126, 10129, 10132, 10135 used; under 10150).
-- Source is ALWAYS the canon 1 John verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (1 John = the test-of-knowing-Him letter; the test is KEEPING HIS COMMANDMENTS;
-- the Torah is the very measuring-line of fellowship, not abolished). Chapter 5 welds love and
-- obedience: *this is the love of Elohim, that we keep his commandments: and his commandments are
-- not grievous* (5:2-3) — John's *not grievous* is Moses' own *it is not too hard for thee... the
-- word is very nigh unto thee* (Deuteronomy 30). The Father is the source and sender; the Son is
-- the one *manifested*, *sent*, in whom is the life the Father gave (5:11). No co-equal-persons
-- grammar, no modalist collapse.
-- ⚠ 5:7-8 (the "Johannine Comma"): the canon pull DOES carry the heaven-witness clause; per the
-- brief I quote ONLY what dump_canon returns and do NOT add any trinitarian gloss in my prose. The
-- witness thread is built on the Torah's own two-or-three-witnesses law (Deuteronomy 19:15) — the
-- framework reading: the record stands established by witnesses, the witness of Elohim concerning
-- His Son. The Comma text is quoted verbatim where it falls, with no interpretive expansion.
--
-- 1 John 5 coverage:
--   v.1   Tanakh: none warranted (born-of-Elohim by believing)  Extras: none warranted  NT: John 1:12-13 (power to become sons of Elohim, believe on his name)
--   v.2-3 Tanakh: Deuteronomy 30:11-14 (commandment not hidden/not far off, the word very nigh), Deuteronomy 10:12-13, Joshua 22:5  Extras: Sirach (Ecclesiasticus) 2:15-16 (they that love him will keep his ways)  NT: John 14:15 (if ye love me, keep my commandments)   [LOAD-BEARING]
--   v.4   Tanakh: Psalm 44:5-7 (through thee will we push down our enemies)  Extras: none warranted  NT: none warranted
--   v.5   Tanakh: none warranted  Extras: none warranted  NT: (folded into v.4 victory thread)
--   v.6-9 Tanakh: Deuteronomy 19:15 (two or three witnesses establish the matter)  Extras: none warranted  NT: none warranted   [⚠ Comma caution]
--   v.10  (folded into witness thread)
--   v.11-12 Tanakh: Deuteronomy 30:15,19-20 (life and death set before thee... he is thy life)  Extras: none warranted  NT: none warranted
--   v.13  Tanakh: Daniel 12:2 (many that sleep shall awake, some to everlasting life)  Extras: none warranted  NT: none warranted
--   v.14-21 Tanakh: none warranted (assurance/prayer/keep from idols)  Extras: none warranted  NT: none warranted
--
-- THREADS (6):
--   1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30  [LOAD-BEARING; Deut 30/10, Joshua 22, John 14, Sirach 2 — extras tier]
--   1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1  [John 1 — free]
--   1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44  [Psalm 44 — free]
--   1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19  [Deut 19 — free; ⚠ Comma quoted verbatim]
--   1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30  [Deut 30 — free]
--   1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12  [Daniel 12 — free]
-- =====================================================================

CREATE TEMP VIEW _s242_j242c5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30  [LOAD-BEARING]
  ('canon', '1-john', 5, 3, 'canon', 'deuteronomy', 30, 11, 'free', E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off.* (Deuteronomy 30:11). When John says *his commandments are not grievous* (1 John 5:3), he speaks Moses'' own verdict on the Torah: the commandment *is not hidden from thee, neither is it far off.* The apostle does not abolish the commandments nor call them a burden too heavy — he names them, as Moses did, as the very thing a man can keep, because Yahuah (LORD) never gave a law beyond the reach of those who love Him.'),
  ('canon', '1-john', 5, 3, 'canon', 'deuteronomy', 30, 14, 'free', E'*But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14). The commandment is *very nigh unto thee... that thou mayest do it* — this is exactly why *his commandments are not grievous* (1 John 5:3). The Torah is not in heaven nor beyond the sea but in the mouth and the heart of the one who loves Yahuah (LORD); John''s *not grievous* is Moses'' *thou mayest do it.*'),
  ('canon', '1-john', 5, 2, 'canon', 'deuteronomy', 10, 12, 'free', E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul,* (Deuteronomy 10:12). Moses welds loving Yahuah (LORD) to walking in His ways and keeping His commandments (v.13). John welds the same two: *when we love Elohim (God), and keep his commandments* (1 John 5:2) — love and obedience are one act, as the Torah always taught.'),
  ('canon', '1-john', 5, 3, 'canon', 'joshua', 22, 5, 'free', E'*But take diligent heed to do the commandment and the law, which Moses the servant of Yahuah (LORD) charged you, to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him, and to serve him with all your heart and with all your soul.* (Joshua 22:5). Joshua binds *to love Yahuah* to *keep his commandments* in one breath — the very fusion John makes: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). To love Him and to keep His commandments are not two things but one, from Moses to Joshua to the apostle.'),
  ('canon', '1-john', 5, 3, 'canon', 'john', 14, 15, 'free', E'*If ye love me, keep my commandments.* (John 14:15). Yahusha (Jesus) said love is proven in keeping His commandments; John writes the same: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). The Gospel twin and the epistle speak one word — love is not a feeling severed from obedience but is itself the keeping of the commandments.'),
  ('canon', '1-john', 5, 3, 'apocrypha', 'ecclesiasticus', 2, 15, 'extras', E'*They that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways.* (Sirach 2:15). The Hebrew library said it plainly: *they that love him will keep his ways* — and the next verse, *they that love him shall be filled with the law* (Sirach 2:16). This is John''s very welding of love and obedience: *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3). To love Yahuah (LORD) is to keep His ways and be filled with His law; the apostle stands in the same stream as the wisdom of the fathers.'),
  -- thread: 1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1
  ('canon', '1-john', 5, 1, 'canon', 'john', 1, 12, 'free', E'*But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name:* (John 1:12). The Gospel said those who *believe on his name* are given *power to become the sons of Elohim (God),* born *of Elohim (God)* (John 1:13). John''s epistle opens the chapter with the same word: *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God)* (1 John 5:1). Believing that Yahusha (Jesus) is the Messiah is the new birth the Gospel promised; the Father begets, and the believer is born of Him.'),
  -- thread: 1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44
  ('canon', '1-john', 5, 4, 'canon', 'psalms', 44, 5, 'free', E'*Through thee will we push down our enemies: through thy name will we tread them under that rise up against us.* (Psalm 44:5). The psalmist confesses the victory is not in his own arm but in Yahuah (LORD): *I will not trust in my bow, neither shall my sword save me* (Psalm 44:6). John names the same overcoming: *this is the victory that overcometh the world, even our faith* (1 John 5:4). The conquest is by trust in Him, not by the sword of the flesh — the faith of the one *born of Elohim (God)* overcomes the world as the psalmist''s faith pushed down the enemy through the Name.'),
  ('canon', '1-john', 5, 4, 'canon', 'psalms', 44, 7, 'free', E'*But thou hast saved us from our enemies, and hast put them to shame that hated us.* (Psalm 44:7). It is Yahuah (LORD) who *saved us from our enemies* — the victory belongs to Him and is received by faith. So John: *whatsoever is born of Elohim (God) overcometh the world: and this is the victory that overcometh the world, even our faith* (1 John 5:4). The one born of Elohim (God) overcomes not by his own strength but by the faith that lays hold of the One who saves; the psalm and the epistle confess one Deliverer.'),
  -- thread: 1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19  [⚠ Comma quoted verbatim]
  ('canon', '1-john', 5, 9, 'canon', 'deuteronomy', 19, 15, 'free', E'*One witness shall not rise up against a man for any iniquity, or for any sin, in any sin that he sinneth: at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established.* (Deuteronomy 19:15). The Torah''s law of witnesses requires *two... or... three witnesses* before *the matter shall be established.* John''s testimony is built on that very law: *there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one* (1 John 5:8), so that *the witness of Elohim (God) is greater* (1 John 5:9). The threefold witness meets the Torah''s requirement; the record concerning the Son stands established at the mouth of the witnesses Elohim (God) Himself appointed.'),
  -- thread: 1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30
  ('canon', '1-john', 5, 12, 'canon', 'deuteronomy', 30, 15, 'free', E'*See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15). Moses set before Yashar''el (Israel) *life and good, and death and evil* — a stark either/or. John sets the same before his hearers: *He that hath the Son hath life; and he that hath not the Son of Elohim (God) hath not life* (1 John 5:12). Life or death, with no third way; the choice Moses laid before the people is the choice the apostle lays before every soul, now centered in the Son in whom the Father gave the life.'),
  ('canon', '1-john', 5, 12, 'canon', 'deuteronomy', 30, 19, 'free', E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). *I have set before you life and death... therefore choose life* — and John says where that life is found: *He that hath the Son hath life* (1 John 5:12). To choose life is to have the Son; the Torah''s summons to choose life is answered in the One the Father gave, *and this life is in his Son* (1 John 5:11).'),
  ('canon', '1-john', 5, 11, 'canon', 'deuteronomy', 30, 20, 'free', E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* (Deuteronomy 30:20). Moses says of Yahuah (LORD), *he is thy life, and the length of thy days* — life is found in cleaving to Him. John says the same of the gift the Father gave in the Son: *Elohim (God) hath given to us eternal life, and this life is in his Son* (1 John 5:11). The life that is Yahuah (LORD) Himself in the Torah is the eternal life now given in His Son; the Father remains the source from whom the life flows.'),
  -- thread: 1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12
  ('canon', '1-john', 5, 13, 'canon', 'daniel', 12, 2, 'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel was given the promise of *everlasting life* for those that sleep in the dust who shall awake. John writes so the scattered elect may have the assurance of that very life now: *These things have I written unto you that believe on the name of the Son of Elohim (God); that ye may know that ye have eternal life* (1 John 5:13). The everlasting life Daniel saw at the resurrection is the eternal life John says we may KNOW we have, by believing on the name of the Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s242_j242c5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s242_j242c5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30',
       E'This is the love of Elohim, that we keep his commandments: and they are not grievous (Deuteronomy 30, 10)',
       E'John welds love and obedience into one act and leaves no daylight between them: *By this we know that we love the children of Elohim (God), when we love Elohim (God), and keep his commandments. For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:2-3). The love of Elohim (God) IS the keeping of His commandments — not a sentiment that floats free of obedience, but the very doing of the Torah. And the closing clause, *his commandments are not grievous,* is Moses'' own verdict on that Torah: *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11); *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14). John''s *not grievous* is Moses'' *it is not too hard for thee* — the commandment was never a burden beyond reach, but the near word a man who loves Yahuah (LORD) can keep. The Torah itself had already bound loving Him to keeping Him: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him* (Deuteronomy 10:12), and Joshua charged the same — *to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him* (Joshua 22:5). Yahusha (Jesus) spoke the identical word in the Gospel: *If ye love me, keep my commandments* (John 14:15). And the wisdom of the fathers had said it too: *they that love him will keep his ways* (Sirach 2:15), *they that love him shall be filled with the law* (Sirach 2:16). From the Torah through the prophets and the wisdom-books to the apostle, the testimony is one and unbroken — love is not severed from obedience; to love Elohim (God) is to keep His commandments, and His commandments are not grievous.',
       sv.verse_id, ev.verse_id, 'extras', 10120
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1',
       E'Whosoever believeth that Yahusha is the Messiah is born of Elohim (John 1)',
       E'The chapter opens with the new birth and its single mark: *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God): and every one that loveth him that begat loveth him also that is begotten of him* (1 John 5:1). This is the Gospel''s own promise come round again: *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* (John 1:12), born *not of blood, nor of the will of the flesh, nor of the will of man, but of Elohim (God)* (John 1:13). To believe that Yahusha (Jesus) is the Messiah is to be born of the Father — the Father begets, the believer is born of Him, and the one who loves the Father who begat loves also the Son begotten. The Father remains the source of the begetting; the Son is the One believed on, and the new birth is the Father''s own work in the one who receives Him.',
       sv.verse_id, ev.verse_id, 'free', 10123
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44',
       E'This is the victory that overcometh the world, even our faith (Psalm 44)',
       E'*For whatsoever is born of Elohim (God) overcometh the world: and this is the victory that overcometh the world, even our faith. Who is he that overcometh the world, but he that believeth that Yahusha (Jesus) is the Son of Elohim (God)?* (1 John 5:4-5). The overcoming is by faith, not by the strength of the flesh — and that is the very confession of the psalmist of the sons of Korah: *Through thee will we push down our enemies: through thy name will we tread them under that rise up against us. For I will not trust in my bow, neither shall my sword save me* (Psalm 44:5-6). The victory is in Yahuah (LORD) and through His Name, received by trust: *thou hast saved us from our enemies, and hast put them to shame that hated us* (Psalm 44:7). What the psalmist confessed of the battles of old, John confesses of the world itself — the one born of Elohim (God) overcomes not by his own arm but by the faith that lays hold of the Deliverer. The bow and the sword save no one; the faith that trusts the Son is the victory.',
       sv.verse_id, ev.verse_id, 'free', 10126
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19',
       E'The record established at the mouth of the witnesses of Elohim concerning his Son (Deuteronomy 19)',
       E'John grounds the assurance of the Son in the Torah''s own law of evidence. The Spirit, the water, and the blood bear their record: *And it is the Spirit that beareth witness, because the Spirit is truth* (1 John 5:6); *And there are three that bear witness in earth, the Spirit, and the water, and the blood: and these three agree in one* (1 John 5:8). A matter is not established on one voice alone but on the agreement of witnesses — the Torah''s requirement: *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* (Deuteronomy 19:15). The threefold earthly witness meets that very standard, so that the record stands sure, and *the witness of Elohim (God) is greater: for this is the witness of Elohim (God) which he hath testified of his Son. He that believeth on the Son of Elohim (God) hath the witness in himself* (1 John 5:9-10). The point is the establishing of the record concerning the Son by the witnesses Elohim (God) Himself appointed — the same Torah-law of two-or-three witnesses by which every matter in Yashar''el (Israel) was settled now settles the testimony of the Father about His Son.',
       sv.verse_id, ev.verse_id, 'free', 10129
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30',
       E'He that hath the Son hath life: I have set before thee life and death (Deuteronomy 30)',
       E'*And this is the record, that Elohim (God) hath given to us eternal life, and this life is in his Son. He that hath the Son hath life; and he that hath not the Son of Elohim (God) hath not life* (1 John 5:11-12). It is a stark either/or, with no third way — and it is the very choice Moses set before Yashar''el (Israel): *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15); *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). To choose life, Moses said, is to cleave to Yahuah (LORD): *for he is thy life, and the length of thy days* (Deuteronomy 30:20). John says that life is now given in the Son — *Elohim (God) hath given to us eternal life, and this life is in his Son.* The life that is Yahuah (LORD) Himself in the Torah is the eternal life the Father has given in the One He sent; to have the Son is to have the life, and the Father remains the source from whom the gift flows. The Torah''s summons — *choose life* — is answered in the Son in whom the Father set the life.',
       sv.verse_id, ev.verse_id, 'free', 10132
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12',
       E'That ye may know that ye have eternal life (Daniel 12)',
       E'John names the purpose of his whole letter: *These things have I written unto you that believe on the name of the Son of Elohim (God); that ye may know that ye have eternal life, and that ye may believe on the name of the Son of Elohim (God)* (1 John 5:13). The eternal life he says we may KNOW we have is the very life Daniel was shown at the end of the days: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). Daniel saw the everlasting life of the resurrection from afar; John says the scattered elect who believe on the name of the Son may have its assurance now — not a hope deferred to the dust alone, but a present knowing. The everlasting life of Daniel''s awakening and the eternal life John''s readers may know are one and the same gift, given in the Son and held by faith.',
       sv.verse_id, ev.verse_id, 'free', 10135
  FROM _s242_j242c5_lookup sv, _s242_j242c5_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-john' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:11 — *this commandment... it is not hidden from thee, neither is it far off* the Torah within reach; John''s *his commandments are not grievous* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:14 — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* Moses'' *thou mayest do it* is John''s *not grievous* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:12 — *to fear Yahuah... to love him* bound to keeping His commandments (v.13); John''s *love Elohim (God), and keep his commandments* (1 John 5:2).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 22:5 — *to love Yahuah... and to keep his commandments, and to cleave unto him* love and obedience welded in one charge; John''s *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 14:15 — *If ye love me, keep my commandments* the Gospel twin; John''s *this is the love of Elohim (God), that we keep his commandments* (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 2:15 — *they that love him will keep his ways* and *shall be filled with the law* (Sirach 2:16); the wisdom of the fathers welds love and obedience as John does (1 John 5:3).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-love-of-elohim-that-we-keep-his-commandments-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:12 — *as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* the new birth promised; *Whosoever believeth that Yahusha (Jesus) is the Messiah (Christ) is born of Elohim (God)* (1 John 5:1).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-whosoever-believeth-that-yahusha-is-the-messiah-is-born-of-elohim-john-1'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:5 — *through thy name will we tread them under... I will not trust in my bow* victory by trust not the sword; John''s *this is the victory that overcometh the world, even our faith* (1 John 5:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 44:7 — *thou hast saved us from our enemies* the victory belongs to Yahuah (LORD) and is received by faith; *whatsoever is born of Elohim (God) overcometh the world... even our faith* (1 John 5:4).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-this-is-the-victory-that-overcometh-the-world-even-our-faith-psalm-44'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 19:15 — *at the mouth of two witnesses, or at the mouth of three witnesses, shall the matter be established* the Torah''s law of evidence; the threefold record so that the witness of Elohim (God) concerning His Son stands established (1 John 5:8-9).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-the-record-of-the-witness-of-elohim-of-his-son-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *I have set before thee this day life and good, and death and evil* the stark either/or; John''s *He that hath the Son hath life... hath not the Son... hath not life* (1 John 5:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I have set before you life and death... therefore choose life* to choose life is to have the Son; *He that hath the Son hath life* (1 John 5:12).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* the life that is Yahuah (LORD) Himself; *this life is in his Son* (1 John 5:11), the Father the source.'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-he-that-hath-the-son-hath-life-deuteronomy-30'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake, some to everlasting life* the resurrection life Daniel saw; John writes *that ye may know that ye have eternal life* (1 John 5:13).'
  FROM cross_reference_threads t, cross_references x, _s242_j242c5_lookup sv, _s242_j242c5_lookup tv
 WHERE t.slug='1-john-5-that-ye-may-know-that-ye-have-eternal-life-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-john' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
