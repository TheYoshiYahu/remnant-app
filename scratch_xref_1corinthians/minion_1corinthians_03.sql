-- ----- fragment: minion_1corinthians_03.sql (S228 1 Corinthians 3) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 3 (23 verses) — Elohim's husbandry, Elohim's building, Elohim's temple.
-- Tag: co03 (temp view _s228_co03_lookup).
-- Sort band: floor 6650, step 3 (6650, 6653, 6656, 6659 used; under 6675).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul keeps reasoning with the fleshly, divided assembly at Corinth — called-out
-- Israel and the grafted-in seed gathered home. The party-loyalty boast (*I am of Paul... of
-- Apollos,* 3:4) is flesh-credential carnality, not Torah-keeping; planter and waterer are nothing,
-- *Elohim (God) gave the increase* (3:6). The chapter's spine is the building-and-temple figure: the
-- assembly is *Elohim''s (God''s) building* (3:9), and *the foundation... is Yahusha HaMashiach (Jesus
-- Christ)* (3:11) — the tried corner stone Yahuah (LORD) laid in Zion (Isaiah 28:16). They are *the
-- temple of Elohim (God)* in whom *the Spirit of Elohim (God) dwelleth* (3:16) — the tabernacle/temple
-- promise of Sinai kept, *I will set my tabernacle among you... I will walk among you* (Leviticus
-- 26:11-12, Exodus 25:8, 29:45): the same indwelling Yahuah (LORD), the same gathered people, not a
-- church that replaced Yashar''el (Israel). Then the two explicit Tanakh citations close the
-- world-wisdom: *He taketh the wise in their own craftiness* (3:19, citing Job 5:13) and *Yahuah
-- (LORD) knoweth the thoughts of the wise, that they are vain* (3:20, citing Psalm 94:11). The
-- NT-Lord rule: 3:5 (*even as Yahuah (Lord) gave to every man*) and 3:20 (*Yahuah (Lord) knoweth*)
-- are rendered exactly as the pull returns them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   milk not meat, ye are yet carnal, I am of Paul / of Apollos
--           Tanakh: none warranted (the divisions are flesh-credential carnality; no load-bearing root)
--           Extras: none warranted
--           NT: Hebrews 5:12-14 (need of milk, and not of strong meat; babes vs full age)
--   v.5-9   I planted, Apollos watered, Elohim gave the increase; ye are Elohim's husbandry/building
--           Tanakh: none warranted (the planting figure is illustrative; the load-bearing Tanakh root
--                   is the building/temple, carried at v.9 into the temple thread)
--           Extras: none warranted   NT: none warranted (continues into the building/temple weave)
--   v.10-11 I have laid the foundation; other foundation can no man lay than Yahusha HaMashiach
--           Tanakh: Isaiah 28:16 (Behold, I lay in Zion for a foundation a stone, a tried stone)
--           Extras: none warranted
--           NT: 1 Peter 2:6 (I lay in Sion a chief corner stone, elect, precious), Ephesians 2:20
--               (built upon the foundation... Yahusha HaMashiach the chief corner stone)
--   v.12-15 gold, silver, wood, hay, stubble; the day shall declare it, revealed by fire; saved by fire
--           Tanakh: none warranted (the fire-tested-work figure has no single load-bearing root)
--           Extras: none warranted   NT: none warranted
--   v.16-17 ye are the temple of Elohim, and the Spirit of Elohim dwelleth in you; the temple is holy
--           Tanakh: Leviticus 26:11-12 (I will set my tabernacle among you... and I will walk among
--                   you), Exodus 25:8 (let them make me a sanctuary; that I may dwell among them),
--                   Exodus 29:45 (I will dwell among the children of Yashar'el)
--           Extras: none warranted
--           NT: 1 Peter 2:5 (built up a spiritual house, an holy priesthood), Ephesians 2:21-22
--               (groweth unto an holy temple... an habitation of Elohim through the Spirit)
--   v.18-20 if any man seem wise, let him become a fool; the wisdom of this world is foolishness
--           Tanakh: Job 5:13 (He taketh the wise in their own craftiness — explicit citation),
--                   Psalm 94:11 (Yahuah knoweth the thoughts of man, that they are vanity — explicit)
--           Extras: none warranted (the Wisdom-of-Solomon world-wisdom weight sits in ch1-2)
--           NT: none warranted
--   v.21-23 let no man glory in men; all things are yours; ye are Messiah's; Messiah is Elohim's
--           Tanakh: none warranted   Extras: none warranted
--           NT: none warranted (the glory-not-in-men close is the carnal-divisions thread's resolution)
--
-- THREADS (slug -> target libraries):
--   6650 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5   (NT)
--   6653 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28   (Tanakh + NT)
--   6656 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26  (Tanakh + NT)
--   6659 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s228_co03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5
  ('canon', '1-corinthians', 3, 2, 'canon', 'hebrews', 5, 12, 'free', E'*For when for the time ye ought to be teachers, ye have need that one teach you again which be the first principles of the oracles of Elohim (God); and are become such as have need of milk, and not of strong meat.* (Hebrews 5:12). The same rebuke Paul gives the Corinthians: *I have fed you with milk, and not with meat: for hitherto ye were not able to bear it* (1 Corinthians 3:2). Both letters measure a people by what they can take in — the carnal stay at the milk of *babes in Messiah (Christ)* (1 Corinthians 3:1), unready for the strong meat. The fault is not in the meat but in the fleshliness that cannot yet bear it.'),
  ('canon', '1-corinthians', 3, 2, 'canon', 'hebrews', 5, 14, 'free', E'*But strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil.* (Hebrews 5:14). The strong meat is for *them that are of full age* — and Paul tells the Corinthians they are not yet there: *ye were not able to bear it, neither yet now are ye able. For ye are yet carnal* (1 Corinthians 3:2-3). The proof of their childishness is the envying and strife and the party-cries *I am of Paul; and another, I am of Apollos* (1 Corinthians 3:4): a full-grown discernment would not split the one body into factions.'),
  -- thread: 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28
  ('canon', '1-corinthians', 3, 11, 'canon', 'isaiah', 28, 16, 'free', E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste.* (Isaiah 28:16). Yahuah (LORD) himself laid the one foundation in Zion — *a tried stone, a precious corner stone, a sure foundation.* Paul builds on no other: *other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11). The masterbuilder only sets what Yahuah (LORD) already laid; the tried stone of Isaiah is the Messiah, and every wise builder lays his work upon that and no rival.'),
  ('canon', '1-corinthians', 3, 11, 'canon', '1-peter', 2, 6, 'free', E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded.* (1 Peter 2:6). Peter reads the same Isaiah-28 stone as the Messiah, the *chief corner stone, elect, precious,* laid in Zion by Elohim (God). It is the very foundation Paul will lay and no other: *other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11). The two apostles confess one corner stone — the tried stone of Isaiah, the Messiah on whom the whole building rests.'),
  ('canon', '1-corinthians', 3, 10, 'canon', 'ephesians', 2, 20, 'free', E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* (Ephesians 2:20). The household of Elohim (God) is *built upon the foundation... Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone.* Paul tells the Corinthians the same: *as a wise masterbuilder, I have laid the foundation, and another buildeth thereon. But let every man take heed how he buildeth thereupon* (1 Corinthians 3:10). The corner stone is the Messiah; the apostolic laying only sets that foundation, and every man''s building must answer to it.'),
  -- thread: 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26
  ('canon', '1-corinthians', 3, 16, 'canon', 'leviticus', 26, 11, 'free', E'*And I will set my tabernacle among you: and my soul shall not abhor you.* (Leviticus 26:11). The covenant promise of Sinai is the dwelling of Yahuah (LORD) in the midst of his people: *I will set my tabernacle among you.* Paul tells the assembly the promise is kept in them: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16). The tabernacle set among Yashar''el (Israel) and the Spirit dwelling in the gathered seed are one indwelling — the same Elohim (God) who would not abhor his people, making his house among them.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'leviticus', 26, 12, 'free', E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people.* (Leviticus 26:12). Yahuah (LORD) promised to *walk among you, and will be your Elohim (God), and ye shall be my people* — the heart of the covenant. That walking-among is now the Spirit''s indwelling: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). To be his temple is to be the people in whose midst he walks; the assembly is not a new house but the covenant dwelling brought to the gathered seed.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'exodus', 25, 8, 'free', E'*And let them make me a sanctuary; that I may dwell among them.* (Exodus 25:8). The whole purpose of the tabernacle Yahuah (LORD) named at the mount: *let them make me a sanctuary; that I may dwell among them.* That dwelling is fulfilled not in cut stone but in the people themselves — *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The sanctuary built so that Yahuah (LORD) might dwell among Yashar''el (Israel) becomes the assembly indwelt by his Spirit; the indwelling is the same, the house is now living.'),
  ('canon', '1-corinthians', 3, 17, 'canon', 'exodus', 29, 45, 'free', E'*And I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God).* (Exodus 29:45). When the tabernacle and altar were hallowed, Yahuah (LORD) declared *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* — and the house was sanctified by his glory, holy because he dwelt there. So Paul: *if any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17). The dwelling makes the house holy; to defile the indwelt assembly is to profane the sanctuary Yahuah (LORD) sanctified by his presence.'),
  ('canon', '1-corinthians', 3, 16, 'canon', '1-peter', 2, 5, 'free', E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* (1 Peter 2:5). Peter sees the gathered as *a spiritual house, an holy priesthood* built of living stones — the same temple Paul names: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The figure is one: the assembly is the dwelling of Elohim (God), built on the corner stone, indwelt by his Spirit, offering up what is acceptable to him.'),
  ('canon', '1-corinthians', 3, 16, 'canon', 'ephesians', 2, 21, 'free', E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* (Ephesians 2:21). The building *fitly framed together groweth unto an holy temple in Yahuah (Lord)* — and in the next breath, *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). It is the very thing Paul tells the Corinthians: *ye are the temple of Elohim (God), and... the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16). The holy temple is the gathered people, the habitation of Elohim (God) through the Spirit — Israel and the grafted-in framed together into one indwelt house.'),
  -- thread: 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5
  ('canon', '1-corinthians', 3, 19, 'canon', 'job', 5, 13, 'free', E'*He taketh the wise in their own craftiness: and the counsel of the froward is carried headlong.* (Job 5:13). Paul cites this verse outright: *the wisdom of this world is foolishness with Elohim (God). For it is written, He taketh the wise in their own craftiness* (1 Corinthians 3:19). The world''s clever counsel becomes the very snare that traps the clever; Elohim (God) overturns the wisdom that exalts itself. The Corinthians who *seemeth to be wise in this world* are warned to *become a fool, that he may be wise* (1 Corinthians 3:18) — for the craftiness men trust is what Yahuah (LORD) uses to take them.'),
  ('canon', '1-corinthians', 3, 20, 'canon', 'psalms', 94, 11, 'free', E'*Yahuah (LORD) knoweth the thoughts of man, that they are vanity.* (Psalm 94:11). Paul cites this Psalm directly: *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20). The Psalm rebukes the brutish and the foolish who say *Yahuah (LORD) shall not see* (Psalm 94:7-8); Paul turns it on those who prize the wisdom of this world. The thoughts the wise are proud of are vanity before the One who searches them — *let no man glory in men* (1 Corinthians 3:21), for the cleverness men boast in is emptiness with Elohim (God).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5',
       E'Milk, not meat: the carnal divisions of those yet babes in Messiah (Hebrews 5)',
       E'Paul cannot speak to the Corinthians as spiritual but *as unto carnal, even as unto babes in Messiah (Christ)* (1 Corinthians 3:1): *I have fed you with milk, and not with meat: for hitherto ye were not able to bear it, neither yet now are ye able* (1 Corinthians 3:2). The same measure stands in Hebrews — a people who *ought to be teachers* but *are become such as have need of milk, and not of strong meat* (Hebrews 5:12), for *strong meat belongeth to them that are of full age, even those who by reason of use have their senses exercised to discern both good and evil* (Hebrews 5:14). The fault is not in the meat but in the fleshliness that cannot yet take it in. And the proof of their childishness is plain: *whereas there is among you envying, and strife, and divisions, are ye not carnal, and walk as men? For while one saith, I am of Paul; and another, I am of Apollos; are ye not carnal?* (1 Corinthians 3:3-4). The party-cry is a flesh-credential boast — loyalty to a man as a badge of status — and Paul dissolves it: *Who then is Paul, and who is Apollos, but ministers by whom ye believed... I have planted, Apollos watered; but Elohim (God) gave the increase* (1 Corinthians 3:5-6). A full-grown discernment glories in no man, for the increase is the Elohim (God) who gives it, and *all things are yours... and ye are Messiah''s (Christ''s); and Messiah (Christ) is Elohim''s (God''s)* (1 Corinthians 3:21-23).',
       sv.verse_id, ev.verse_id, 'free', 6650
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28',
       E'Other foundation can no man lay: Yahusha HaMashiach the tried corner stone (Isaiah 28)',
       E'Paul builds as *a wise masterbuilder,* but he lays nothing of his own: *I have laid the foundation, and another buildeth thereon. But let every man take heed how he buildeth thereupon. For other foundation can no man lay than that is laid, which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:10-11). The one foundation was laid by Yahuah (LORD) himself, long before any apostle: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The masterbuilder only sets what Yahuah (LORD) already laid in Zion — the tried stone, which is the Messiah. The other apostles confess the same one stone: Peter reads Isaiah''s word as the Messiah, *Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6); and the household of Elohim (God) is *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20). There is one corner stone for the whole building; every man''s work is laid upon that and tested by it, and *the fire shall try every man''s work of what sort it is* (1 Corinthians 3:13).',
       sv.verse_id, ev.verse_id, 'free', 6653
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26',
       E'Ye are the temple of Elohim (God), and his Spirit dwelleth in you (Leviticus 26, Exodus 25 & 29)',
       E'*Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you? If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:16-17). The assembly is *Elohim''s (God''s) building* (1 Corinthians 3:9), and the indwelling Paul names is the very covenant promise of Sinai. Yahuah (LORD) gave the tabernacle for one purpose: *let them make me a sanctuary; that I may dwell among them* (Exodus 25:8); and when it was hallowed he declared *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* (Exodus 29:45). The heart of the covenant was his dwelling in the midst: *I will set my tabernacle among you: and my soul shall not abhor you. And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:11-12). That walking-among is now the Spirit''s indwelling of the gathered seed — not a church that replaced Yashar''el (Israel), but the same indwelling Yahuah (LORD), the same covenant presence, brought into the living house of Israel and the grafted-in. And as the sanctuary was sanctified by his glory, so the indwelt assembly is holy: *the temple of Elohim (God) is holy, which temple ye are.* Peter sees the same — *ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5) — and the building in Ephesians *groweth unto an holy temple in Yahuah (Lord)... an habitation of Elohim (God) through the Spirit* (Ephesians 2:21-22). To defile the temple is to profane the dwelling Yahuah (LORD) hallowed by his own presence.',
       sv.verse_id, ev.verse_id, 'free', 6656
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5',
       E'The wisdom of this world is foolishness: He taketh the wise in their craftiness (Job 5, Psalm 94)',
       E'Paul closes the building-chapter by turning on the very wisdom the Corinthians prized in their factions: *Let no man deceive himself. If any man among you seemeth to be wise in this world, let him become a fool, that he may be wise. For the wisdom of this world is foolishness with Elohim (God)* (1 Corinthians 3:18-19). He proves it from two Tanakh texts he quotes outright. The first is Job: *For it is written, He taketh the wise in their own craftiness* (1 Corinthians 3:19), the words of Job 5:13 — *He taketh the wise in their own craftiness: and the counsel of the froward is carried headlong.* The world''s clever counsel becomes the snare that traps the clever; Elohim (God) overturns the wisdom that exalts itself. The second is the Psalm: *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20), citing *Yahuah (LORD) knoweth the thoughts of man, that they are vanity* (Psalm 94:11) — the Psalm that rebukes the brutish who say *Yahuah (LORD) shall not see.* The thoughts the wise boast in are emptiness before the One who searches them. So the chapter''s charge follows: *Therefore let no man glory in men. For all things are yours* (1 Corinthians 3:21) — the party-loyalty boast is excluded not because wisdom is despised but because the only true wisdom is to belong wholly to the Messiah, *and ye are Messiah''s (Christ''s); and Messiah (Christ) is Elohim''s (God''s)* (1 Corinthians 3:23).',
       sv.verse_id, ev.verse_id, 'free', 6659
  FROM _s228_co03_lookup sv, _s228_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 5:12 — *are become such as have need of milk, and not of strong meat* the same milk-fed childishness; Paul''s *I have fed you with milk, and not with meat* (1 Corinthians 3:2).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 5:14 — *strong meat belongeth to them that are of full age... to discern both good and evil* what the carnal cannot yet bear; *neither yet now are ye able. For ye are yet carnal* (1 Corinthians 3:2-3).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-milk-not-meat-and-the-carnal-divisions-i-am-of-paul-hebrews-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* the one foundation Yahuah (LORD) laid; *other foundation can no man lay... which is Yahusha HaMashiach (Jesus Christ)* (1 Corinthians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 2:6 — *I lay in Sion a chief corner stone, elect, precious* Peter reads the same Isaiah-28 stone as the Messiah; the one laid foundation of 1 Corinthians 3:11.'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:20 — *built upon the foundation... Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* the same corner stone the masterbuilder lays; *take heed how he buildeth thereupon* (1 Corinthians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-foundation-is-yahusha-hamashiach-the-tried-stone-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *I will set my tabernacle among you: and my soul shall not abhor you* the covenant dwelling promise; *the Spirit of Elohim (God) dwelleth in you* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *I will walk among you, and will be your Elohim (God), and ye shall be my people* the covenant''s heart; the walking-among now the Spirit''s indwelling (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 25:8 — *let them make me a sanctuary; that I may dwell among them* the tabernacle''s whole purpose, fulfilled in the living house; *ye are the temple of Elohim (God)* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 29:45 — *I will dwell among the children of Yashar''el (Israel), and will be their Elohim (God)* the dwelling that makes the house holy; *the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 2:5 — *built up a spiritual house, an holy priesthood* the same temple-figure for the gathered; *ye are the temple of Elohim (God)* (1 Corinthians 3:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ephesians 2:21 — *groweth unto an holy temple in Yahuah (Lord)... an habitation of Elohim (God) through the Spirit* the gathered framed into one indwelt house; *the temple of Elohim (God)... which temple ye are* (1 Corinthians 3:16-17).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 5:13 — *He taketh the wise in their own craftiness* the verse Paul cites outright; *the wisdom of this world is foolishness with Elohim (God). For it is written...* (1 Corinthians 3:19).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 94:11 — *Yahuah (LORD) knoweth the thoughts of man, that they are vanity* the verse Paul cites; *And again, Yahuah (Lord) knoweth the thoughts of the wise, that they are vain* (1 Corinthians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s228_co03_lookup sv, _s228_co03_lookup tv
 WHERE t.slug='1-corinthians-3-the-wisdom-of-this-world-is-foolishness-he-taketh-the-wise-job-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
