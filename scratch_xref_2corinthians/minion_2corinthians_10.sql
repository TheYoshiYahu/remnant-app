-- ----- fragment: minion_2corinthians_10.sql (S229 2 Corinthians 10) -----
-- =====================================================================
-- S229 minion — 2 CORINTHIANS 10 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 CORINTHIANS 10 (18 verses) — warfare not carnal / he that glorieth, let him glory in the Lord.
-- Tag: 2c10 (temp view _s229_2c10_lookup).
-- Sort band: floor 7225, step 3 (7225, 7228 used; under 7250).
-- Source is ALWAYS the canon 2 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul defends his apostleship before the divided assembly, refusing the
-- flesh-credential. 10:3-5 — though they walk in the flesh they do not war after it: *the weapons of
-- our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds*
-- (10:4), *Casting down imaginations, and every high thing that exalteth itself against the knowledge
-- of Elohim (God), and bringing into captivity every thought to the obedience of Messiah (Christ)*
-- (10:5). The lofty thing brought low is the prophets' own picture — Yahuah (LORD) alone exalted, the
-- high towers and strong holds cast down (Isaiah 2), no wisdom nor counsel standing against Yahuah
-- (LORD) (Proverbs 21:30-31). Then the boast: *But he that glorieth, let him glory in Yahuah (Lord)*
-- (10:17) cites Jeremiah 9:23-24 — the SAME boast-only-in-Yahuah as 1 Corinthians 1:31 (*according as
-- it is written, He that glorieth, let him glory in Yahuah (Lord)*) and the 1 Corinthians 1:26-29
-- counsel *that no flesh should glory in his presence*. The flesh-credential is excluded — NOT
-- Torah-keeping; the boast is in knowing Yahuah (LORD), and *not he that commendeth himself is
-- approved, but whom Yahuah (Lord) commendeth* (10:18). No law-vs-grace antithesis; Messiah (Christ) is
-- the One whose obedience every thought is brought captive unto.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   Paul beseeches by the meekness and gentleness of Messiah; walked according to the flesh
--           Tanakh: none warranted (pastoral self-defense; no load-bearing root)
--           Extras: none warranted   NT: none warranted (carried in prose)
--   v.3-6   the weapons of our warfare not carnal, casting down every high thing, every thought captive
--           Tanakh: Isaiah 2:11,12,17 (the lofty looks humbled, the high towers and strong holds
--                   brought low, Yahuah alone exalted), Isaiah 2:3 (out of Zion the law, the knowledge
--                   of his ways), Isaiah 11:9 (the earth full of the knowledge of Yahuah), Proverbs
--                   21:30-31 (no wisdom against Yahuah; safety is of Yahuah, not the horse of battle)
--           Extras: none warranted   NT: none warranted (the Tanakh roots carry the weight)
--   v.7-16  the measure of the rule, boasting not beyond measure, the gospel preached to you
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (apostolic apologia)
--   v.17-18 he that glorieth, let him glory in Yahuah; whom Yahuah commendeth is approved
--           Tanakh: Jeremiah 9:23-24 (let not the wise/mighty/rich glory; let him glory in knowing me)
--           Extras: none warranted
--           NT: 1 Corinthians 1:31 (the same citation), 1 Corinthians 1:29 (no flesh shall glory),
--               1 Corinthians 1:26-28 (not many wise/mighty/noble; the chosen confound the wise)
--
-- THREADS (slug -> target libraries):
--   7225 2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2  (Tanakh)
--   7228 2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9                                (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s229_2c10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2
  ('canon', '2-corinthians', 10, 4, 'canon', 'proverbs', 21, 30, 'free', E'*There is no wisdom nor understanding nor counsel against Yahuah (LORD).* (Proverbs 21:30). Paul says *the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4) — and the proverb names why no fortress of the flesh can stand: there is no wisdom, no understanding, no counsel that can be set *against Yahuah (LORD).* The strong holds Paul pulls down are the proud reasonings that imagine they can stand over against the knowledge of Elohim (God); they cannot, for nothing prevails against Yahuah (LORD).'),
  ('canon', '2-corinthians', 10, 4, 'canon', 'proverbs', 21, 31, 'free', E'*The horse is prepared against the day of battle: but safety is of Yahuah (LORD).* (Proverbs 21:31). The proverb sets the carnal weapon against the true might exactly as Paul does: the war-horse is *prepared against the day of battle,* yet *safety is of Yahuah (LORD)* — not of the horse. So *the weapons of our warfare are not carnal, but mighty through Elohim (God)* (2 Corinthians 10:4); the power is not in the flesh''s armory but in Yahuah (LORD), through whom alone the strong holds come down.'),
  ('canon', '2-corinthians', 10, 5, 'canon', 'isaiah', 2, 11, 'free', E'*The lofty looks of man shall be humbled, and the haughtiness of men shall be bowed down, and Yahuah (LORD) alone shall be exalted in that day.* (Isaiah 2:11). Paul''s warfare is *Casting down imaginations, and every high thing that exalteth itself against the knowledge of Elohim (God)* (2 Corinthians 10:5) — the very work Isaiah saw: *the lofty looks of man shall be humbled... and Yahuah (LORD) alone shall be exalted.* Every high thing lifting itself up is brought low so that Yahuah (LORD) alone stands exalted; the casting-down of imaginations is the bowing-down of the haughtiness of men.'),
  ('canon', '2-corinthians', 10, 5, 'canon', 'isaiah', 2, 12, 'free', E'*For the day of Yahuah Tseva''ot (LORD of hosts) shall be upon every one that is proud and lofty, and upon every one that is lifted up; and he shall be brought low:* (Isaiah 2:12). Isaiah''s day of Yahuah (LORD) comes *upon every one that is proud and lofty, and upon every one that is lifted up* — to bring it low; and Paul wars *every high thing that exalteth itself against the knowledge of Elohim (God)* (2 Corinthians 10:5). The high towers and fenced walls and lofty cedars of Isaiah''s vision are the strong holds Paul pulls down: everything lifted up against the knowledge of Elohim (God) is brought low under the obedience of Messiah (Christ).'),
  ('canon', '2-corinthians', 10, 5, 'canon', 'isaiah', 2, 17, 'free', E'*And the loftiness of man shall be bowed down, and the haughtiness of men shall be made low: and Yahuah (LORD) alone shall be exalted in that day.* (Isaiah 2:17). Isaiah repeats the verdict: *the loftiness of man shall be bowed down... and Yahuah (LORD) alone shall be exalted.* This is the end of Paul''s warfare — *bringing into captivity every thought to the obedience of Messiah (Christ)* (2 Corinthians 10:5). The proud thought is not destroyed but brought captive and bowed, that the One who is exalted alone might be exalted in the heart; the loftiness made low becomes the thought obedient to Messiah (Christ).'),
  ('canon', '2-corinthians', 10, 5, 'canon', 'isaiah', 11, 9, 'free', E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* (Isaiah 11:9). The aim of Paul''s warfare is *the knowledge of Elohim (God)* against which no high thing may stand (2 Corinthians 10:5) — and Isaiah promises that *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea.* Every imagination cast down, every thought brought captive, makes room for that flood: the knowledge of Yahuah (LORD) filling the earth, before which the haughtiness of men is bowed.'),
  ('canon', '2-corinthians', 10, 5, 'canon', 'isaiah', 2, 3, 'free', E'*And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* (Isaiah 2:3). The same chapter that bows the lofty looks shows where the knowledge of Elohim (God) is found: the nations going up to be taught his ways, *for out of Zion shall go forth the law.* Paul brings *every thought to the obedience of Messiah (Christ)* (2 Corinthians 10:5) — not against the Torah but unto it, the imagination cast down and the heart taught to walk in the paths of Yahuah (LORD) that go forth from Zion.'),
  -- thread: 2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9
  ('canon', '2-corinthians', 10, 17, 'canon', 'jeremiah', 9, 23, 'free', E'*Thus saith Yahuah (LORD), Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches:* (Jeremiah 9:23). When Paul writes *But he that glorieth, let him glory in Yahuah (Lord)* (2 Corinthians 10:17), he is speaking the word Yahuah (LORD) gave Jeremiah: *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches.* Every flesh-credential — wisdom, might, riches — is shut out of the boast; Paul, refusing to commend himself by the flesh, turns the assembly to the only boast Yahuah (LORD) allows.'),
  ('canon', '2-corinthians', 10, 17, 'canon', 'jeremiah', 9, 24, 'free', E'*But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD).* (Jeremiah 9:24). This is the boast Paul commands: *he that glorieth, let him glory in Yahuah (Lord)* (2 Corinthians 10:17). Jeremiah names its substance — *that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness.* The glory is not in self but in knowing Yahuah (LORD); and the next word, *not he that commendeth himself is approved, but whom Yahuah (Lord) commendeth* (2 Corinthians 10:18), is the same — approval is from the One who is known, not from the boasting flesh.'),
  ('canon', '2-corinthians', 10, 17, 'canon', '1-corinthians', 1, 31, 'free', E'*That, according as it is written, He that glorieth, let him glory in Yahuah (Lord).* (1 Corinthians 1:31). Paul gave this same congregation the same word in his first letter — *according as it is written, He that glorieth, let him glory in Yahuah (Lord)* — citing Jeremiah 9:24; and he repeats it here: *he that glorieth, let him glory in Yahuah (Lord)* (2 Corinthians 10:17). Twice over, against the divisions and the boasting of the assembly at Corinth, Paul shuts up every glory into Yahuah (LORD) alone, the boast the prophet wrote down.'),
  ('canon', '2-corinthians', 10, 17, 'canon', '1-corinthians', 1, 29, 'free', E'*That no flesh should glory in his presence.* (1 Corinthians 1:29). The reason the boast is shut up in Yahuah (LORD) is named in the first letter: Elohim (God) chose the foolish and the weak and the base things *That no flesh should glory in his presence.* So when Paul says *he that glorieth, let him glory in Yahuah (Lord)* (2 Corinthians 10:17), and *not he that commendeth himself is approved, but whom Yahuah (Lord) commendeth* (2 Corinthians 10:18), it is the same exclusion of the flesh-credential — no flesh may glory before him, only the one who glories in Yahuah (LORD).'),
  ('canon', '2-corinthians', 10, 18, 'canon', '1-corinthians', 1, 26, 'free', E'*For ye see your calling, brethren, how that not many wise men after the flesh, not many mighty, not many noble, are called:* (1 Corinthians 1:26). The self-commendation Paul refuses — *not he that commendeth himself is approved, but whom Yahuah (Lord) commendeth* (2 Corinthians 10:18) — answers the calling he had already set before this assembly: *not many wise men after the flesh, not many mighty, not many noble, are called.* The wise, the mighty, the noble are the very flesh-credentials Jeremiah barred from the boast; approval comes not by measuring oneself against oneself but from the One who calls and commends.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s229_2c10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s229_2c10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2',
       E'The weapons of our warfare are not carnal, every high thing brought low (Isaiah 2, Proverbs 21)',
       E'Though Paul and his fellows *walk in the flesh,* they *do not war after the flesh: For the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds; Casting down imaginations, and every high thing that exalteth itself against the knowledge of Elohim (God), and bringing into captivity every thought to the obedience of Messiah (Christ)* (2 Corinthians 10:3-5). The might is not in the flesh''s armory, for the proverb is sure: *There is no wisdom nor understanding nor counsel against Yahuah (LORD)* (Proverbs 21:30), and though *The horse is prepared against the day of battle... safety is of Yahuah (LORD)* (Proverbs 21:31) — not of the horse. The strong holds Paul pulls down are the proud reasonings, and their casting-down is the very work Isaiah saw in the day of Yahuah (LORD): *The lofty looks of man shall be humbled, and the haughtiness of men shall be bowed down, and Yahuah (LORD) alone shall be exalted in that day* (Isaiah 2:11); the day of Yahuah Tseva''ot (LORD of hosts) comes *upon every one that is proud and lofty, and upon every one that is lifted up; and he shall be brought low* (Isaiah 2:12), so that *the loftiness of man shall be bowed down... and Yahuah (LORD) alone shall be exalted* (Isaiah 2:17). The high towers and fenced walls of that vision are the strong holds; every high thing lifted up against the knowledge of Elohim (God) is brought low. And the aim is the knowledge of Elohim (God) itself, which Isaiah promised would fill the world: *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). The thought is not destroyed but brought captive *to the obedience of Messiah (Christ)* — and that obedience is no war against the Torah but the way of it, for the same Isaiah-2 vision shows the nations going up to be taught, *for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). The imagination cast down, the heart is taught to walk in the paths of Yahuah (LORD) — every thought bowed and obedient, that Yahuah (LORD) alone might be exalted.',
       sv.verse_id, ev.verse_id, 'free', 7225
  FROM _s229_2c10_lookup sv, _s229_2c10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9',
       E'He that glorieth, let him glory in Yahuah (Jeremiah 9)',
       E'Paul ends the chapter by shutting up every boast into one: *But he that glorieth, let him glory in Yahuah (Lord). For not he that commendeth himself is approved, but whom Yahuah (Lord) commendeth* (2 Corinthians 10:17-18). The word is Jeremiah''s, given by Yahuah (LORD): *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches: But let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD) which exercise lovingkindness, judgment, and righteousness, in the earth: for in these things I delight, saith Yahuah (LORD)* (Jeremiah 9:23-24). Every flesh-credential — wisdom, might, riches — is barred from the boast; the only glory left is the knowing of Yahuah (LORD) himself. This is not Torah-keeping set aside but the flesh''s self-commendation set aside: the boast is in knowing the One who delights in lovingkindness, judgment, and righteousness. Paul gave this same congregation the same citation in his first letter — *according as it is written, He that glorieth, let him glory in Yahuah (Lord)* (1 Corinthians 1:31) — and there named the reason: Elohim (God) chose the foolish and weak and base things *That no flesh should glory in his presence* (1 Corinthians 1:29), for in their calling were *not many wise men after the flesh, not many mighty, not many noble* (1 Corinthians 1:26). So Paul, against an assembly measuring itself by itself and commending its own, refuses to commend himself by the flesh and turns to the one approval that stands: *whom Yahuah (Lord) commendeth.* The boast is in Yahuah (LORD); the approval is from Yahuah (LORD); the glory of the flesh is shut out altogether.',
       sv.verse_id, ev.verse_id, 'free', 7228
  FROM _s229_2c10_lookup sv, _s229_2c10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-corinthians' AND ev.chapter_number=10 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:30 — *There is no wisdom nor understanding nor counsel against Yahuah (LORD)* why no fortress of the flesh stands; *the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:31 — *The horse is prepared against the day of battle: but safety is of Yahuah (LORD)* the carnal weapon set against the true might; the warfare *mighty through Elohim (God)* not the flesh''s armory (2 Corinthians 10:4).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 2:11 — *The lofty looks of man shall be humbled... and Yahuah (LORD) alone shall be exalted in that day* the casting-down of imaginations; *every high thing that exalteth itself against the knowledge of Elohim (God)* brought low (2 Corinthians 10:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 2:12 — *the day of Yahuah Tseva''ot (LORD of hosts) shall be upon every one that is proud and lofty... and he shall be brought low* the high towers cast down; *every high thing that exalteth itself against the knowledge of Elohim (God)* (2 Corinthians 10:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 2:17 — *the loftiness of man shall be bowed down... and Yahuah (LORD) alone shall be exalted* the proud thought bowed, not destroyed; *bringing into captivity every thought to the obedience of Messiah (Christ)* (2 Corinthians 10:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 11:9 — *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* the aim of the warfare; *the knowledge of Elohim (God)* against which no high thing may stand (2 Corinthians 10:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Isaiah 2:3 — *out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* the thought brought captive not against the Torah but unto it; *every thought to the obedience of Messiah (Christ)* (2 Corinthians 10:5).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-the-weapons-of-our-warfare-are-not-carnal-every-high-thing-brought-low-isaiah-2'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 9:23 — *Let not the wise man glory in his wisdom, neither let the mighty man glory in his might, let not the rich man glory in his riches* the flesh-credential barred; *he that glorieth, let him glory in Yahuah (Lord)* (2 Corinthians 10:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 9:24 — *let him that glorieth glory in this, that he understandeth and knoweth me, that I am Yahuah (LORD)* the substance of the boast; *whom Yahuah (Lord) commendeth* is approved, not the self-commender (2 Corinthians 10:17-18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:31 — *according as it is written, He that glorieth, let him glory in Yahuah (Lord)* the same Jeremiah-9 citation Paul gave this congregation before; repeated here (2 Corinthians 10:17).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 1:29 — *That no flesh should glory in his presence* the reason the boast is shut into Yahuah (LORD); the flesh-credential excluded (2 Corinthians 10:17-18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 1:26 — *not many wise men after the flesh, not many mighty, not many noble, are called* the same flesh-credentials Jeremiah barred; *not he that commendeth himself is approved, but whom Yahuah (Lord) commendeth* (2 Corinthians 10:18).'
  FROM cross_reference_threads t, cross_references x, _s229_2c10_lookup sv, _s229_2c10_lookup tv
 WHERE t.slug='2-corinthians-10-he-that-glorieth-let-him-glory-in-yahuah-jeremiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='2-corinthians' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
