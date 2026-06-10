-- ----- fragment: minion_hebrews_09.sql (S222 Hebrews 9) -----
-- =====================================================================
-- S222 minion — HEBREWS 9 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 9.  Tag: h09 (temp view _s222_h09_lookup).  Sort band: 7957, step 1 (<=7963).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row (tier_required): canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the WHOLE-book watchpoint, applied here): Hebrews 9 is the sanctuary chapter,
-- and the trained misreading is that the Torah's tabernacle and its blood-service were a discarded
-- error swept away by the cross. The text says the opposite. The first tabernacle and its
-- ordinances are *the patterns of things in the heavens* (9:23) — the God-given copy and shadow of
-- the heavenly reality, made *after the pattern shewed to thee in the mount* (Exodus 25:40). The
-- candlestick, the shewbread, the ark, the cherubims of glory, the mercy seat, the high priest
-- entering the holiest *once every year, not without blood* (9:7) for the errors of the people —
-- all of it is the Day of Atonement of Leviticus 16, the divinely-appointed shadow that pointed
-- forward. Messiah *by his own blood... entered in once into the holy place, having obtained
-- eternal redemption* (9:12): the once-for-all FULFILMENT of the very thing the earthly service
-- foreshadowed, not its abolition. *Almost all things are by the law purged with blood; and without
-- shedding of blood is no remission* (9:22) is the law's own principle — *it is the blood that
-- maketh an atonement for the soul* (Leviticus 17:11) — honoured, not annulled. The first
-- testament itself was dedicated with blood: *This is the blood of the testament which Elohim (God)
-- hath enjoined unto you* (9:20) is Moses at Sinai, *Behold the blood of the covenant* (Exodus
-- 24:8). And the once-offering to *bear the sins of many* (9:28) is the suffering servant who
-- *bare the sin of many* (Isaiah 53:12). The change is the once-for-all offering of the better
-- sacrifice, the heavenly things themselves purified — the shadow reaching its substance.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   the first tabernacle / candlestick, shewbread, censer, ark, cherubims, mercy seat
--           Tanakh: Exodus 25:30 (shewbread), 25:31 (candlestick), 25:21-22 (ark/mercy seat),
--                   25:18 (cherubims), 25:40 (the pattern)  Extras: none warranted (held for v.23-24)  NT: none warranted
--   v.7     the high priest alone once every year, not without blood
--           Tanakh: Leviticus 16:2, 16:14-15, 16:34 (Day of Atonement, blood within the vail, once a year)  Extras: none warranted  NT: none warranted
--   v.11-12 Messiah by his own blood entered once, eternal redemption
--           Tanakh: Leviticus 16:15 (the blood within the vail) — woven into the Atonement thread  Extras: none warranted  NT: none warranted
--   v.14    purge your conscience from dead works
--           Tanakh: none added (the once-for-all blood carried in the Atonement thread)  Extras: none warranted  NT: none warranted
--   v.18-20 the first testament dedicated with blood / the blood of the testament enjoined
--           Tanakh: Exodus 24:8 (Behold the blood of the covenant), 24:7 (the book read), 24:6 (blood sprinkled on the altar)  Extras: none warranted  NT: none warranted
--   v.22    without shedding of blood is no remission
--           Tanakh: Leviticus 17:11 (the blood maketh an atonement), 17:14 (the life is the blood)  Extras: none warranted  NT: none warranted
--   v.23-24 the patterns of things in the heavens purified / figures of the true
--           Tanakh: Exodus 25:40 (the pattern in the mount)  Extras: Wisdom of Solomon 9:8 (a resemblance of the holy tabernacle prepared from the beginning)  NT: Acts 7:44 (made according to the fashion he had seen)
--   v.27-28 once to die, the judgment / Messiah once offered to bear the sins of many
--           Tanakh: Isaiah 53:12 (he bare the sin of many, made intercession), 53:6 (Yahuah laid on him the iniquity of us all)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7957 hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount        (Tanakh)
--   7958 hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement       (Tanakh)
--   7959 hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24          (Tanakh)
--   7960 hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17                   (Tanakh)
--   7961 hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle  (Tanakh + Extras + NT)
--   7962 hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53                          (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount
  ('canon', 'hebrews', 9, 2, 'canon', 'exodus', 25, 31, 'free', E'*And thou shalt make a candlestick of pure gold: of beaten work shall the candlestick be made: his shaft, and his branches, his bowls, his knops, and his flowers, shall be of the same.* (Exodus 25:31). The writer names the furniture of *a tabernacle made; the first, wherein was the candlestick, and the table, and the shewbread; which is called the sanctuary* (Hebrews 9:2). The candlestick was not improvised; Yahuah (LORD) specified every branch and bowl of beaten gold. The first tabernacle was the divinely-ordered house, each vessel a figure given by the Most High himself.'),
  ('canon', 'hebrews', 9, 2, 'canon', 'exodus', 25, 30, 'free', E'*And thou shalt set upon the table shewbread before me alway.* (Exodus 25:30). Among the things *in the first tabernacle, accomplishing the service of Elohim (God)* was *the table, and the shewbread* (Hebrews 9:2, 9:6). The bread set *before me alway* was the standing witness of the covenant people before Yahuah (LORD) — part of the ordained service the writer recalls as the God-given shadow of the better things to come.'),
  ('canon', 'hebrews', 9, 4, 'canon', 'exodus', 25, 21, 'free', E'*And thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee.* (Exodus 25:21). The writer recalls *the ark of the covenant overlaid round about with gold... and the tables of the covenant* (Hebrews 9:4). The ark held the testimony, and the mercy seat was set above it — the very place the high priest would sprinkle the blood. The earthly pattern is exact because Yahuah (LORD) himself drew it.'),
  ('canon', 'hebrews', 9, 5, 'canon', 'exodus', 25, 18, 'free', E'*And thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat.* (Exodus 25:18). The writer names *the cherubims of glory shadowing the mercyseat* (Hebrews 9:5). The cherubims of beaten gold stretched their wings over the mercy seat — the throne where Yahuah (LORD) met his people, the focal point of the whole sanctuary the writer is unfolding as the copy of the heavenly.'),
  ('canon', 'hebrews', 9, 5, 'canon', 'exodus', 25, 22, 'free', E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony, of all things which I will give thee in commandment unto the children of Yashar''el (Israel).* (Exodus 25:22). *The cherubims of glory shadowing the mercyseat* (Hebrews 9:5) overshadowed the very place where Yahuah (LORD) promised to *meet with thee* and *commune with thee from above the mercy seat.* The mercy seat was not decoration but the meeting-place of Elohim (God) and his people — the earthly shadow of the throne the great high priest would enter for us.'),
  -- thread: hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement
  ('canon', 'hebrews', 9, 7, 'canon', 'leviticus', 16, 2, 'free', E'*And Yahuah (LORD) said unto Moses, Speak unto Aaron thy brother, that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat.* (Leviticus 16:2). *But into the second went the high priest alone once every year, not without blood* (Hebrews 9:7). The restriction the writer describes is the law itself: Aaron was forbidden to come *at all times* within the vail — only on the appointed day, lest he die. The closed way was the Ruach HaKodesh (Holy Spirit) *signifying, that the way into the holiest of all was not yet made manifest* (Hebrews 9:8).'),
  ('canon', 'hebrews', 9, 7, 'canon', 'leviticus', 16, 14, 'free', E'*And he shall take of the blood of the bullock, and sprinkle it with his finger upon the mercy seat eastward; and before the mercy seat shall he sprinkle of the blood with his finger seven times.* (Leviticus 16:14). The high priest went in *not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). The blood of the bullock was first for himself; the law required the priest to atone for his own sin before the people''s — the very reason a greater priest, *without spot* (Hebrews 9:14), was needed.'),
  ('canon', 'hebrews', 9, 12, 'canon', 'leviticus', 16, 15, 'free', E'*Then shall he kill the goat of the sin offering, that is for the people, and bring his blood within the vail, and do with that blood as he did with the blood of the bullock, and sprinkle it upon the mercy seat, and before the mercy seat:* (Leviticus 16:15). Where Aaron carried *the blood of goats and calves* within the vail, Messiah (Christ) entered *by his own blood... once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12). The Day of Atonement is fulfilled, not discarded: the one whom every year''s sprinkling foreshadowed brought his own blood into the true holy place and finished the work the shadow could only repeat.'),
  ('canon', 'hebrews', 9, 25, 'canon', 'leviticus', 16, 34, 'free', E'*And this shall be an everlasting statute unto you, to make an atonement for the children of Yashar''el (Israel) for all their sins once a year. And he did as Yahuah (LORD) commanded Moses.* (Leviticus 16:34). The high priest *entereth into the holy place every year with blood of others* (Hebrews 9:25). The atonement *once a year* was the appointed rhythm of the shadow — repeated because no single offering of beasts could finish it. Messiah needed not offer himself often; *once in the end of the world hath he appeared to put away sin by the sacrifice of himself* (Hebrews 9:26).'),
  -- thread: hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24
  ('canon', 'hebrews', 9, 20, 'canon', 'exodus', 24, 8, 'free', E'*And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* (Exodus 24:8). The writer quotes Moses at Sinai: *This is the blood of the testament which Elohim (God) hath enjoined unto you* (Hebrews 9:20). The first covenant was not dedicated by word alone but by blood sprinkled on the people — *Behold the blood of the covenant.* The new testament is sealed the same way, by better blood, the pattern honoured and brought to its fulfilment.'),
  ('canon', 'hebrews', 9, 19, 'canon', 'exodus', 24, 7, 'free', E'*And he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient.* (Exodus 24:7). The writer recalls how *when Moses had spoken every precept to all the people according to the law, he took the blood... and sprinkled both the book, and all the people* (Hebrews 9:19). The book of the covenant was read and the people pledged obedience before the blood was applied — the word and the blood together dedicated the covenant, as they do in the better testament.'),
  ('canon', 'hebrews', 9, 21, 'canon', 'exodus', 24, 6, 'free', E'*And Moses took half of the blood, and put it in basons; and half of the blood he sprinkled on the altar.* (Exodus 24:6). *Moreover he sprinkled with blood both the tabernacle, and all the vessels of the ministry* (Hebrews 9:21). The blood was divided — half on the altar, half on the people — sanctifying both the place of service and those who served. The dedication of the sanctuary by blood was the ordained beginning of the very ministry that pointed to the better sacrifice.'),
  -- thread: hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17
  ('canon', 'hebrews', 9, 22, 'canon', 'leviticus', 17, 11, 'free', E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* (Leviticus 17:11). *And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). The writer states the law''s own principle: Yahuah (LORD) gave the blood *upon the altar to make an atonement,* for *it is the blood that maketh an atonement for the soul.* The cross does not overturn this law; it fulfils it — the better blood doing finally what the blood of beasts pointed toward.'),
  ('canon', 'hebrews', 9, 22, 'canon', 'leviticus', 17, 14, 'free', E'*For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* (Leviticus 17:14). *Without shedding of blood is no remission* (Hebrews 9:22) rests on the truth Yahuah (LORD) spoke through Moses: *the blood of it is for the life thereof.* Because the life is in the blood, only the giving up of a life — blood poured out — can answer for sin. The whole sacrificial order, and the once-for-all offering it foreshadowed, stands on this single law of the life in the blood.'),
  -- thread: hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle
  ('canon', 'hebrews', 9, 23, 'canon', 'exodus', 25, 40, 'free', E'*And look that thou make them after their pattern, which was shewed thee in the mount.* (Exodus 25:40). The earthly sanctuary was *the patterns of things in the heavens* (Hebrews 9:23) precisely because Moses was commanded to build it *after their pattern, which was shewed thee in the mount.* The tabernacle copied a heavenly original — it was never a human invention or a mistaken first attempt, but the God-given shadow of *the heavenly things themselves* (Hebrews 9:23), purified by better sacrifices.'),
  ('canon', 'hebrews', 9, 24, 'apocrypha', 'the-wisdom-of-solomon', 9, 8, 'extras', E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning.* (Wisdom of Solomon 9:8). Messiah is *not entered into the holy places made with hands, which are the figures of the true; but into heaven itself* (Hebrews 9:24). Solomon prayed knowing his temple was only *a resemblance of the holy tabernacle, which you have prepared from the beginning* — the heavenly sanctuary existing before the earthly copy. The figures made with hands always pointed to the true tabernacle the great high priest has now entered.'),
  ('canon', 'hebrews', 9, 24, 'canon', 'acts', 7, 44, 'free', E'*Our fathers had the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen.* (Acts 7:44). The holy places are *the figures of the true* (Hebrews 9:24) because the tabernacle was made *according to the fashion that he had seen.* Stephen witnessed to the same truth before the council: the wilderness tabernacle was not man''s design but a copy of a shown fashion — the earthly figure of the heavenly *true* into which Messiah has entered for us.'),
  -- thread: hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53
  ('canon', 'hebrews', 9, 28, 'canon', 'isaiah', 53, 12, 'free', E'*Therefore will I divide him a portion with the great, and he shall divide the spoil with the strong; because he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* (Isaiah 53:12). *So Messiah (Christ) was once offered to bear the sins of many* (Hebrews 9:28). The writer speaks in the prophet''s own words: the servant who *bare the sin of many* and *poured out his soul unto death.* The once-for-all offering is the suffering servant Isaiah saw — the one who carried the sin of the many and now appears *the second time without sin unto salvation* (Hebrews 9:28).'),
  ('canon', 'hebrews', 9, 28, 'canon', 'isaiah', 53, 6, 'free', E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all.* (Isaiah 53:6). That Messiah was *once offered to bear the sins of many* (Hebrews 9:28) is the prophet''s vision: *Yahuah (LORD) hath laid on him the iniquity of us all.* The bearing of the sins of many is no new doctrine but the burden Isaiah foresaw laid on the servant — the straying sheep gathered to the one on whom their iniquity was laid.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount',
       E'The Tabernacle and the Mercy Seat — the Pattern Shewed in the Mount',
       E'The writer opens Hebrews 9 by walking through the furniture of the first tabernacle, and every piece he names is the law''s own ordained design. *For there was a tabernacle made; the first, wherein was the candlestick, and the table, and the shewbread; which is called the sanctuary* (Hebrews 9:2). The candlestick was no human flourish: *And thou shalt make a candlestick of pure gold: of beaten work shall the candlestick be made: his shaft, and his branches, his bowls, his knops, and his flowers, shall be of the same* (Exodus 25:31). The shewbread stood *before me alway* (Exodus 25:30). Beyond the second veil lay *the Holiest of all; Which had the golden censer, and the ark of the covenant overlaid round about with gold... and the tables of the covenant* (Hebrews 9:3-4), and *And thou shalt put the mercy seat above upon the ark; and in the ark thou shalt put the testimony that I shall give thee* (Exodus 25:21). Over it were *the cherubims of glory shadowing the mercyseat* (Hebrews 9:5) — *And thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat* (Exodus 25:18). The mercy seat was the meeting-place itself: *And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). This was no discarded error but the God-drawn copy of the heavenly throne — the sanctuary Yahuah (LORD) himself specified, vessel by vessel, as the shadow of the better things the great high priest would bring.',
       sv.verse_id, ev.verse_id, 'free', 7957
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement',
       E'The High Priest Once a Year, Not Without Blood — the Day of Atonement',
       E'*But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). This is the Day of Atonement of Leviticus 16, and the writer is reading the law faithfully. Aaron was barred from the holy place except on the appointed day: *that he come not at all times into the holy place within the vail before the mercy seat... that he die not* (Leviticus 16:2). He brought blood — first the bullock''s, *and sprinkle it with his finger upon the mercy seat eastward; and before the mercy seat shall he sprinkle of the blood with his finger seven times* (Leviticus 16:14), for himself before the people. Then the goat: *Then shall he kill the goat of the sin offering, that is for the people, and bring his blood within the vail... and sprinkle it upon the mercy seat* (Leviticus 16:15). It was *an everlasting statute... to make an atonement for the children of Yashar''el (Israel) for all their sins once a year* (Leviticus 16:34). The closed vail was the Ruach HaKodesh (Holy Spirit) *signifying, that the way into the holiest of all was not yet made manifest* (Hebrews 9:8). And the day arrived: Messiah, *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12). The yearly shadow is fulfilled in the one offering that does not repeat — the blood that can *purge your conscience from dead works to serve the living Elohim (God)* (Hebrews 9:14).',
       sv.verse_id, ev.verse_id, 'free', 7958
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24',
       E'The Blood of the Testament Which Elohim Hath Enjoined — Exodus 24',
       E'The writer grounds the new testament in the way the first was dedicated. *Whereupon neither the first testament was dedicated without blood. For when Moses had spoken every precept to all the people according to the law, he took the blood of calves and of goats, with water, and scarlet wool, and hyssop, and sprinkled both the book, and all the people* (Hebrews 9:18-19). This is Sinai. First the word: *And he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7). Then the blood, divided: *And Moses took half of the blood, and put it in basons; and half of the blood he sprinkled on the altar* (Exodus 24:6) — answering Hebrews'' *he sprinkled with blood both the tabernacle, and all the vessels of the ministry* (Hebrews 9:21). And the words the writer quotes are Moses'' own: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8) — *This is the blood of the testament which Elohim (God) hath enjoined unto you* (Hebrews 9:20). The covenant was sealed in blood from the beginning; the better testament is sealed the same way, by better blood, the pattern honoured and carried to its fulfilment.',
       sv.verse_id, ev.verse_id, 'free', 7959
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17',
       E'Without Shedding of Blood Is No Remission — Leviticus 17',
       E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). The writer is not announcing a new rule but stating the law''s own foundation. Yahuah (LORD) had spoken it through Moses: *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul* (Leviticus 17:11). The reason runs deeper still: *For it is the life of all flesh; the blood of it is for the life thereof... for the life of all flesh is the blood thereof* (Leviticus 17:14). Because the life is in the blood, only a life given up — blood poured out — can answer for sin. The cross does not overturn this law; it answers it perfectly. *How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* (Hebrews 9:14). The whole sacrificial order, and the once-for-all offering it foreshadowed, stand together on the one law of the life in the blood.',
       sv.verse_id, ev.verse_id, 'free', 7960
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle',
       E'The Patterns of Things in the Heavens — the Resemblance of the Tabernacle',
       E'*It was therefore necessary that the patterns of things in the heavens should be purified with these; but the heavenly things themselves with better sacrifices than these* (Hebrews 9:23). The earthly sanctuary was a copy — and it was so by Yahuah (LORD)''s own command: *And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The tabernacle was built to a heavenly original, never a human invention or a first mistake corrected. The witness runs through the whole library. Solomon, building the temple, knew it was only *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8) — the heavenly sanctuary existing before the earthly copy. Stephen testified the same before the council: the wilderness tabernacle was made *according to the fashion that he had seen* (Acts 7:44). So the conclusion: *For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The figures made with hands always pointed to the true tabernacle — and the great high priest has now entered it on our behalf.',
       sv.verse_id, ev.verse_id, 'extras', 7961
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53',
       E'Once Offered to Bear the Sins of Many — Isaiah 53',
       E'*And as it is appointed unto men once to die, but after this the judgment: So Messiah (Christ) was once offered to bear the sins of many; and unto them that look for him shall he appear the second time without sin unto salvation* (Hebrews 9:27-28). The phrase *to bear the sins of many* is drawn straight from the prophet. Isaiah saw the servant centuries before: *and he bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12). The burden laid on him was named there too: *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). The once-for-all offering of Hebrews 9 is not a doctrine invented by the writer but the suffering servant Isaiah beheld — the one who poured out his soul unto death, on whom Yahuah (LORD) laid the iniquity of the straying sheep. He bore the sin of the many once; he will appear the second time *without sin unto salvation,* to those who look for him.',
       sv.verse_id, ev.verse_id, 'free', 7962
  FROM _s222_h09_lookup sv, _s222_h09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=9 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:31 — *of beaten work shall the candlestick be made* — the candlestick of the first tabernacle (Hebrews 9:2) was Yahuah (LORD)''s own ordained design, not a human flourish.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:30 — *thou shalt set upon the table shewbread before me alway* — the shewbread of the sanctuary (Hebrews 9:2), the standing witness before Yahuah (LORD).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 25:21 — *thou shalt put the mercy seat above upon the ark* — the ark and its testimony (Hebrews 9:4), with the mercy seat set above where the blood would be sprinkled.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 25:18 — *thou shalt make two cherubims of gold... in the two ends of the mercy seat* — *the cherubims of glory shadowing the mercyseat* (Hebrews 9:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 25:22 — *there I will meet with thee, and I will commune with thee from above the mercy seat* — the mercy seat the cherubims shadowed (Hebrews 9:5) was the meeting-place of Elohim (God) and his people.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-tabernacle-and-the-mercy-seat-the-pattern-shewed-in-the-mount'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:2 — *that he come not at all times into the holy place within the vail... that he die not* — the law behind *the high priest alone once every year* (Hebrews 9:7); the closed way.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:14 — *sprinkle it with his finger upon the mercy seat... seven times* — the bullock''s blood offered first for the priest himself (Hebrews 9:7), showing why a priest *without spot* was needed.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:15 — *bring his blood within the vail... and sprinkle it upon the mercy seat* — the shadow Messiah fulfilled by entering *by his own blood... once* (Hebrews 9:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 16:34 — *to make an atonement... once a year* — the repeated rhythm of the shadow (Hebrews 9:25), needing no repetition once Messiah appeared *once in the end of the world* (Hebrews 9:26).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-high-priest-once-a-year-not-without-blood-the-day-of-atonement'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:8 — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you* — the very words the writer quotes as *the blood of the testament which Elohim (God) hath enjoined* (Hebrews 9:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:7 — *he took the book of the covenant, and read in the audience of the people* — the word read and the people pledged before the blood was sprinkled (Hebrews 9:19).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 24:6 — *half of the blood he sprinkled on the altar* — the blood that dedicated the place of service, answering *he sprinkled with blood both the tabernacle, and all the vessels of the ministry* (Hebrews 9:21).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-blood-of-the-testament-which-elohim-hath-enjoined-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 17:11 — *it is the blood that maketh an atonement for the soul* — the law''s own principle behind *without shedding of blood is no remission* (Hebrews 9:22); fulfilled, not annulled.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:14 — *the life of all flesh is the blood thereof* — because the life is in the blood, only a life poured out can answer for sin (Hebrews 9:22).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-without-shedding-of-blood-is-no-remission-leviticus-17'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:40 — *make them after their pattern, which was shewed thee in the mount* — the earthly sanctuary as *the patterns of things in the heavens* (Hebrews 9:23), a God-given copy.'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 9:8 — *a resemblance of the holy tabernacle, which you have prepared from the beginning* — Solomon knew the temple copied the heavenly original behind *the figures of the true* (Hebrews 9:24).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:44 — *made according to the fashion that he had seen* — Stephen''s witness that the tabernacle copied a shown fashion, the earthly figure of the *true* heaven into which Messiah entered (Hebrews 9:24).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-the-patterns-of-things-in-the-heavens-the-resemblance-of-the-tabernacle'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:12 — *he bare the sin of many, and made intercession for the transgressors* — the prophet''s words behind *Messiah was once offered to bear the sins of many* (Hebrews 9:28).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* — the burden laid on the servant that the once-offering bore (Hebrews 9:28).'
  FROM cross_reference_threads t, cross_references x, _s222_h09_lookup sv, _s222_h09_lookup tv
 WHERE t.slug='hebrews-9-once-offered-to-bear-the-sins-of-many-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=9 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
