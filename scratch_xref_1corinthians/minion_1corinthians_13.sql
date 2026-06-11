-- ----- fragment: minion_1corinthians_13.sql (S228 1 Corinthians 13) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 13 (13 verses) — THE MORE EXCELLENT WAY: love/charity.
-- Tag: co13 (temp view _s228_co13_lookup).
-- Sort band: floor 6900, step 3 (6900, 6903 used; under 6925).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul's hymn to charity (13:4-8,13) is not a Romantic sentiment set against the
-- commandments — it is the more excellent way that FULFILS the Torah. *Charity suffereth long, and
-- is kind... charity never faileth* (13:4-8) re-speaks the love-command Yahuah (LORD) gave at Sinai,
-- *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). Paul himself
-- elsewhere makes the equation flat: *he that loveth another hath fulfilled the law... love is the
-- fulfilling of the law* (Romans 13:8,10), and Yahusha (Jesus) hangs *all the law and the prophets*
-- on loving Elohim (God) and loving the neighbour (Matthew 22:37-40). Charity is the SHAPE the
-- keeping-of-the-commandments takes, NOT a replacement for them — love does no ill to his neighbour,
-- so it does what the commandments command. 13:12's *now we see through a glass, darkly; but then
-- face to face* re-speaks the contrast Yahuah (LORD) drew between Moses and the prophets: *With him
-- will I speak mouth to mouth, even apparently, and not in dark speeches* (Numbers 12:8) — the
-- dark-speech/dim-mirror now, the apparent/face-to-face seeing then.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   tongues/prophecy/knowledge/faith/almsgiving without charity profit nothing
--           Tanakh: none warranted (the gift-without-love point is carried into the charity thread)
--           Extras: none warranted (Sirach almsgiving is about giving, not love's primacy over it)
--           NT: none warranted (carried in the charity thread as the lead-in to 13:4-8)
--   v.4-8   charity suffereth long, is kind... charity never faileth  [WATCHPOINT CENTERPIECE]
--           Tanakh: Leviticus 19:18 (thou shalt love thy neighbour as thyself: I am Yahuah (LORD))
--           Extras: Ecclesiasticus/Sirach 40:17 (mercifulness endureth for ever — beside *charity
--                   never faileth*); Sirach 18:11 weighed, secondary, dropped (it is Yahuah's mercy,
--                   not the assembly's charity)
--           NT: Romans 13:8-10 (love is the fulfilling of the law), Matthew 22:37-40 (on these two
--                   commandments hang all the law and the prophets)
--   v.9-11  we know in part... when that which is perfect is come... I put away childish things
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (the partial-now/
--                   whole-then point is carried into the glass-darkly thread at v.12)
--   v.12    now we see through a glass, darkly; but then face to face
--           Tanakh: Numbers 12:8 (I will speak mouth to mouth, even apparently, and not in dark
--                   speeches; and the similitude of Yahuah (LORD) shall he behold)
--           Extras: none warranted   NT: none warranted
--   v.13    now abideth faith, hope, charity... but the greatest of these is charity
--           Tanakh: carried in the charity thread (Leviticus 19:18 — charity is the greatest because
--                   it is the fulfilling of the law)   Extras: none warranted   NT: carried in the
--                   charity thread (Romans 13:10, Matthew 22:40)
--
-- THREADS (slug -> target libraries):
--   6900 1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19   (Tanakh + Extras + NT)  [WATCHPOINT CENTERPIECE]
--   6903 1-corinthians-13-now-we-see-through-a-glass-darkly-numbers-12        (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19  [WATCHPOINT CENTERPIECE]
  ('canon', '1-corinthians', 13, 4, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The charity Paul exalts is the love-command Yahuah (LORD) gave at Sinai. *Charity suffereth long, and is kind; charity envieth not... is not easily provoked, thinketh no evil* (1 Corinthians 13:4-5) is that command unfolded: to love the neighbour as oneself is to bear no grudge, to take no vengeance, to think no evil. Paul is not setting a new affection against the Torah; he is describing what *thou shalt love thy neighbour as thyself* looks like when it is lived. The signature *I am Yahuah (LORD)* seals it — the love-command is the LORD''s own word, and charity is the keeping of it.'),
  ('canon', '1-corinthians', 13, 8, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *Charity never faileth: but whether there be prophecies, they shall fail; whether there be tongues, they shall cease; whether there be knowledge, it shall vanish away* (1 Corinthians 13:8). The gifts are for the age of partial seeing; the love-command outlasts them, because it is the LORD''s abiding word, not a passing endowment. The neighbour-love sealed with *I am Yahuah (LORD)* does not vanish away when prophecy and tongues cease — it is the everlasting shape of the redeemed life, which is why it is the greatest of the three that abide.'),
  ('canon', '1-corinthians', 13, 13, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). *And now abideth faith, hope, charity, these three; but the greatest of these is charity* (1 Corinthians 13:13). Charity is the greatest because it is the fulfilling of the law — the love-command Yahuah (LORD) spoke at Sinai, sealed with his own name. Faith and hope reach toward what is not yet seen; charity does now what the commandments command, loving the neighbour as oneself. The crown of the three is the keeping of the LORD''s word.'),
  ('canon', '1-corinthians', 13, 4, 'canon', 'romans', 13, 8, 'free', E'*Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.* (Romans 13:8). Paul makes the equation flat in his letter to Rome: to love is to fulfil the law. So when he writes *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up* (1 Corinthians 13:4), he is not describing a sentiment that floats free of the commandments — he is describing the law fulfilled. The longsuffering, kind, unenvious love of this hymn is the very debt Romans says we owe and pay by loving one another.'),
  ('canon', '1-corinthians', 13, 5, 'canon', 'romans', 13, 9, 'free', E'*For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself.* (Romans 13:9). Paul gathers the commandments of the second table into the love-command, and the charity hymn does the same in narrative form: love *Doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil; Rejoiceth not in iniquity, but rejoiceth in the truth* (1 Corinthians 13:5-6). Love that seeks not her own does not steal or covet; love that thinks no evil does not kill or bear false witness — the charity Paul praises is the commandments *briefly comprehended* and lived.'),
  ('canon', '1-corinthians', 13, 8, 'canon', 'romans', 13, 10, 'free', E'*Love worketh no ill to his neighbour: therefore love is the fulfilling of the law.* (Romans 13:10). Here is the thesis stated plain: *love is the fulfilling of the law.* So *Charity never faileth* (1 Corinthians 13:8) because the law it fulfils never fails — love does no ill to his neighbour, which is exactly what every commandment toward the neighbour requires. Charity is not the abolition of the Torah but its consummation; it is the more excellent way precisely because it does what the law commands.'),
  ('canon', '1-corinthians', 13, 13, 'canon', 'matthew', 22, 40, 'free', E'*On these two commandments hang all the law and the prophets.* (Matthew 22:40). Yahusha (Jesus) hangs *all the law and the prophets* on two commandments — to love Yahuah Elohayka (the Lord thy God) and to love the neighbour as oneself. So Paul can call charity the greatest of the three that abide: *the greatest of these is charity* (1 Corinthians 13:13). The whole law and the prophets hang on the love Yahusha (Jesus) named; the charity Paul exalts is that love, which is why nothing — not faith, not hope, not any gift — surpasses it.'),
  ('canon', '1-corinthians', 13, 4, 'canon', 'matthew', 22, 39, 'free', E'*And the second is like unto it, Thou shalt love thy neighbour as thyself.* (Matthew 22:39). Yahusha (Jesus) names the neighbour-love of Leviticus the second great commandment. The charity of Paul''s hymn — *suffereth long... is kind... envieth not* (1 Corinthians 13:4) — is that very commandment in motion. To love the neighbour as oneself is to be longsuffering and kind toward him, to envy him nothing; the hymn unfolds the commandment Yahusha (Jesus) set beside the love of Elohim (God) as the second on which all the law hangs.'),
  ('canon', '1-corinthians', 13, 8, 'apocrypha', 'ecclesiasticus', 40, 17, 'extras', E'*Bountifulness is as a most fruitful garden, and mercifulness endureth for ever.* (Ecclesiasticus 40:17). The Hebrew library already knew that mercy outlasts all else: *mercifulness endureth for ever.* Paul says the same of charity — *Charity never faileth* (1 Corinthians 13:8), while prophecies fail, tongues cease, and knowledge vanishes away. The merciful love that endures for ever in the wisdom of the fathers is the charity that never fails in Paul''s hymn; the gifts pass, but the love that does the law abides.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- second thread's cross_references
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-13-now-we-see-through-a-glass-darkly-numbers-12
  ('canon', '1-corinthians', 13, 12, 'canon', 'numbers', 12, 8, 'free', E'*With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold: wherefore then were ye not afraid to speak against my servant Moses?* (Numbers 12:8). Yahuah (LORD) drew the very contrast Paul draws. To the prophets he spoke in vision and dream; with Moses he spoke *mouth to mouth, even apparently, and not in dark speeches,* and Moses beheld the LORD''s similitude. Paul sets the present age on the dark-speech side and the age to come on the apparent side: *For now we see through a glass, darkly; but then face to face: now I know in part; but then shall I know even as also I am known* (1 Corinthians 13:12). The dim mirror and the dark speeches are now; the mouth-to-mouth, face-to-face beholding of the LORD is then.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19',
       E'Charity is the fulfilling of the law (Leviticus 19, Romans 13, Matthew 22)',
       E'Paul''s hymn to charity is no sentiment set against the commandments — it is the more excellent way that *fulfils* the Torah. *Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up, Doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil; Rejoiceth not in iniquity, but rejoiceth in the truth* (1 Corinthians 13:4-6), and *Charity never faileth* (1 Corinthians 13:8). This is the love-command Yahuah (LORD) gave at Sinai unfolded: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To bear no grudge, to take no vengeance, to think no evil — this is *thou shalt love thy neighbour as thyself* lived, and the signature *I am Yahuah (LORD)* seals it as the LORD''s own abiding word. Paul himself states the equation flat in his letter to Rome: *he that loveth another hath fulfilled the law* (Romans 13:8); the commandments of the second table — *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal... Thou shalt not covet* — are *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9); and *Love worketh no ill to his neighbour: therefore love is the fulfilling of the law* (Romans 13:10). Love that seeks not her own does not steal or covet; love that thinks no evil does not kill or bear false witness — charity is the commandments done, not the commandments discarded. Yahusha (Jesus) sealed the same truth: *Thou shalt love thy neighbour as thyself... On these two commandments hang all the law and the prophets* (Matthew 22:39-40). And the Hebrew library knew the love that endures: *mercifulness endureth for ever* (Ecclesiasticus 40:17), even as *Charity never faileth* while prophecy and tongues and knowledge pass away. So when Paul crowns the three — *And now abideth faith, hope, charity, these three; but the greatest of these is charity* (1 Corinthians 13:13) — charity is the greatest because it is the fulfilling of the law: faith and hope reach toward what is not yet seen, but charity does now what every commandment toward the neighbour requires. The more excellent way is the keeping of the LORD''s word.',
       sv.verse_id, ev.verse_id, 'extras', 6900
  FROM _s228_co13_lookup sv, _s228_co13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-13-now-we-see-through-a-glass-darkly-numbers-12',
       E'Now we see through a glass, darkly; but then face to face (Numbers 12)',
       E'*For now we see through a glass, darkly; but then face to face: now I know in part; but then shall I know even as also I am known* (1 Corinthians 13:12). Paul sets the present age of partial knowing — *we know in part, and we prophesy in part* (1 Corinthians 13:9) — against the age to come, when *that which is perfect is come* and the partial is done away. The contrast is the LORD''s own. When Miriam and Aaron presumed against Moses, Yahuah (LORD) drew the line between the prophets and his servant: to the prophets he made himself known in vision and dream, but *With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold* (Numbers 12:8). The *dark speeches* and the dim mirror are the present-age seeing; the *mouth to mouth, even apparently,* beholding of the LORD''s similitude is the *face to face* of the age to come. What Moses was granted as the singular servant — to behold the similitude of Yahuah (LORD) plainly — Paul holds out as the hope of all the gathered when knowledge in part gives way to knowing even as we are known.',
       sv.verse_id, ev.verse_id, 'free', 6903
  FROM _s228_co13_lookup sv, _s228_co13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=13 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the love-command Yahuah (LORD) sealed at Sinai; charity *suffereth long, and is kind... thinketh no evil* is that command lived (1 Corinthians 13:4-5).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the LORD''s abiding word outlasts the gifts; *Charity never faileth* while prophecies fail and tongues cease (1 Corinthians 13:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* charity is *the greatest of these* because it is the fulfilling of the law, the LORD''s own command (1 Corinthians 13:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 13:8 — *he that loveth another hath fulfilled the law* the equation stated flat; the longsuffering, kind, unenvious charity of *suffereth long, and is kind; charity envieth not* is the law fulfilled (1 Corinthians 13:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 13:9 — the commandments *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself*; love that *seeketh not her own... thinketh no evil* does not steal, covet, kill, or bear false witness (1 Corinthians 13:5-6).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 13:10 — *love is the fulfilling of the law* the thesis plain; *Charity never faileth* because the law it fulfils never fails — love does no ill to his neighbour (1 Corinthians 13:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 22:39 — *the second is like unto it, Thou shalt love thy neighbour as thyself* the neighbour-love Yahusha (Jesus) named; charity *suffereth long... is kind... envieth not* is that commandment in motion (1 Corinthians 13:4).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Matthew 22:40 — *On these two commandments hang all the law and the prophets* Yahusha (Jesus) hanging the whole Torah on love; charity is *the greatest of these* because it is that love (1 Corinthians 13:13).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Ecclesiasticus 40:17 — *mercifulness endureth for ever* the merciful love the fathers knew outlasts all else; *Charity never faileth* while prophecy, tongues, and knowledge pass away (1 Corinthians 13:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-is-the-fulfilling-of-the-law-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=40 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-13-now-we-see-through-a-glass-darkly-numbers-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:8 — *With him will I speak mouth to mouth, even apparently, and not in dark speeches; and the similitude of Yahuah (LORD) shall he behold* the LORD''s own contrast of dark speech and plain seeing; *now... through a glass, darkly; but then face to face* (1 Corinthians 13:12).'
  FROM cross_reference_threads t, cross_references x, _s228_co13_lookup sv, _s228_co13_lookup tv
 WHERE t.slug='1-corinthians-13-now-we-see-through-a-glass-darkly-numbers-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
