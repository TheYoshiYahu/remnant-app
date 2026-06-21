-- =====================================================================
-- Session 311 — Leviticus FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /Users/mtm/Desktop/App/data-schema/migrations/session311_leviticus_cross_references.sql
-- =====================================================================

\echo 'session311 — Leviticus cross-references starting...'
BEGIN;

-- ----- fragment: minion_leviticus_1.sql (Leviticus 1) -----
-- Book: Leviticus  Chapter: 1   Tag: lev01   Session: s311
-- Sort band: base 22700, step 3  (22700, 22703, 22706, 22709)
-- Temp view: _s311_lev01_lookup
--
-- FRAMING: Leviticus opens with Yahuah calling to Moses out of the tabernacle and
-- giving the olah (the whole-burnt offering). The offerings are not a defunct ritual
-- abolished by grace; they are the Torah-architecture that foreshadows and illumines
-- the Formed Son's once-for-all self-offering — the laying-on of hands (substitution),
-- the male without blemish, the blood at the altar, the whole body consumed, the sweet
-- savour ascending. The NT reads itself back through this chapter (Eph 5:2, Heb 10,
-- Rom 12:1), and the Akedah (Gen 22) and Psalm 40 stand laterally as the type and the
-- song of the willing offering. The provision for the poor (fowls) reaches forward to
-- Miriam's turtledoves at Yahusha's presentation (Luke 2:24).
--
-- Leviticus 1 coverage:
--   v.1-2  NT:     none warranted (the call/address; weave is the Glory, lateral)
--          Extras: none warranted
--          Tanakh: Exodus 40:34-35 (the glory filling the tent the voice speaks from)
--   v.3-9  NT:     Ephesians 5:2, Hebrews 10:10 (and 10:5-9 context), Romans 12:1
--          Extras: none warranted (clean canon witnesses carry the weave)
--          Tanakh: Genesis 22:2,8,13 (the Akedah ram/lamb), Psalm 40:6-8 (willing offering)
--   v.10-13 NT:    none warranted (folded type already carried in v.3-9 thread)
--          Extras: none warranted
--          Tanakh: Genesis 22:8 (Elohim will provide himself a lamb — the flock pattern)
--   v.14-17 NT:    Luke 2:24 (the poor family's pair of turtledoves)
--          Extras: none warranted
--          Tanakh: Leviticus 5:7 (the poor man's two turtledoves / two pigeons)
--
-- THREADS (4):
--   leviticus-1-the-voice-from-the-tabernacle-where-the-glory-dwells (free) -> canon Tanakh (Exodus)
--   leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering (free) -> canon NT (Eph/Heb/Rom) + canon Tanakh (Gen/Psalm)
--   leviticus-1-the-offering-of-the-flock-a-male-without-blemish (free) -> canon Tanakh (Genesis)
--   leviticus-1-the-poor-mans-offering-of-turtledoves-and-pigeons (free) -> canon NT (Luke) + canon Tanakh (Leviticus)

-- A. Temp view -----------------------------------------------------------------
CREATE TEMP VIEW _s311_lev01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. cross_references ----------------------------------------------------------
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the voice from the tabernacle / the Glory
    ('canon','leviticus',1,1,'canon','exodus',40,34,
     E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* (Exodus 40:34) Leviticus opens the instant Exodus closed: *And Yahuah (LORD) called unto Moses, and spake unto him out of the tabernacle of the congregation* (Leviticus 1:1). The voice that gives the offering speaks from the very tent the Glory has just filled — the Formed Presence that led Yashar''el (Israel) now teaches the way of approach from within the cloud.',
     'free'),
    ('canon','leviticus',1,1,'canon','exodus',40,35,
     E'*And Moses was not able to enter into the tent of the congregation, because the cloud abode thereon, and the glory of Yahuah (LORD) filled the tabernacle.* (Exodus 40:35) Moses could not enter the Glory-filled tent — yet *Yahuah (LORD) called unto Moses, and spake unto him out of the tabernacle* (Leviticus 1:1). The offering Torah is the appointed way the Presence makes a path for sinful man to draw near to the holy.',
     'free'),

    -- Thread 2: the whole-burnt offering -> the Formed Son's self-offering
    ('canon','leviticus',1,9,'canon','ephesians',5,2,
     E'*And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour.* (Ephesians 5:2) The olah was *an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 1:9). Sha''ul (Paul) reads the Formed Son straight out of this verse: the male wholly given up, the savour ascending — Messiah is the burnt offering the Torah described.',
     'free'),
    ('canon','leviticus',1,4,'canon','hebrews',10,10,
     E'*By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all.* (Hebrews 10:10) The worshipper *shall put his hand upon the head of the burnt offering; and it shall be accepted for him to make atonement for him* (Leviticus 1:4) — the laying-on of hands transfers and substitutes. The offered body of the Formed Son is the once-for-all to which every laid-on hand pointed.',
     'free'),
    ('canon','leviticus',1,3,'canon','romans',12,1,
     E'*I beseech you therefore, brethren, by the mercies of Elohim (God), that ye present your bodies a living sacrifice, holy, acceptable unto Elohim (God), which is your reasonable service.* (Romans 12:1) The olah was *a male without blemish: he shall offer it of his own voluntary will* (Leviticus 1:3) — wholly given, willingly. The covenant people, atoned-for in the Son, become the living olah, the whole self laid on the altar by their own will.',
     'free'),
    ('canon','leviticus',1,3,'canon','genesis',22,2,
     E'*And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* (Genesis 22:2) The Akedah is the first olah in the canon — *a burnt offering*, an only son, on the mountain. Leviticus 1:3 codifies what Moriah enacted: *a burnt sacrifice of the herd... a male without blemish*, offered of voluntary will.',
     'free'),
    ('canon','leviticus',1,3,'canon','genesis',22,8,
     E'*And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* (Genesis 22:8) Abraham''s word on the mountain answers the whole offering system in advance — Yahuah Himself provides the burnt offering. The Formed Son is the lamb Elohim provides, the *male without blemish* of Leviticus 1:3.',
     'free'),
    ('canon','leviticus',1,9,'canon','genesis',22,13,
     E'*And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.* (Genesis 22:13) The ram dies *in the stead of his son* and is wholly burnt — exactly the olah of Leviticus 1:9, *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* Substitution and ascent are written into the first burnt offering.',
     'free'),
    ('canon','leviticus',1,3,'canon','psalms',40,6,
     E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required.* (Psalm 40:6) The psalm does not abolish the olah of Leviticus 1:3 but exposes its heart: Yahuah seeks the opened ear, the willing self, behind *his own voluntary will*. Hebrews 10 puts this psalm in the mouth of the Formed Son.',
     'free'),
    ('canon','leviticus',1,3,'canon','psalms',40,8,
     E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8) The voluntary will that Leviticus 1:3 requires — *he shall offer it of his own voluntary will* — finds its perfect voice here: the offering delights to do the Father''s will, the Torah within the heart. The willing olah and the Torah-on-the-heart are one.',
     'free'),

    -- Thread 3: the offering of the flock
    ('canon','leviticus',1,10,'canon','genesis',22,8,
     E'*And Abraham said, My son, Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together.* (Genesis 22:8) The flock-offering — *of the sheep, or of the goats... a male without blemish* (Leviticus 1:10) — is the lamb Abraham trusted Yahuah to provide. The same pattern of the herd descends to the flock: an unblemished male, wholly given.',
     'free'),

    -- Thread 4: the poor man's offering of fowls
    ('canon','leviticus',1,14,'canon','luke',2,24,
     E'*And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons.* (Luke 2:24) When the Formed Son was presented, his mother Miriam (Mary) brought the offering of Leviticus 1:14 — *turtledoves, or of young pigeons* — the provision Torah makes for the poor. The Son of the Most High was born into a poor family and brought the poor man''s offering.',
     'free'),
    ('canon','leviticus',1,14,'canon','leviticus',5,7,
     E'*And if he be not able to bring a lamb, then he shall bring for his trespass, which he hath committed, two turtledoves, or two young pigeons, unto Yahuah (LORD); one for a sin offering, and the other for a burnt offering.* (Leviticus 5:7) The fowl-offering of Leviticus 1:14 is Torah''s mercy to the one who *be not able to bring a lamb*; no one is shut out of atonement for poverty — the same provision Yahuah repeats for the trespass offering.',
     'free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s311_lev01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. threads -------------------------------------------------------------------
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-1-the-voice-from-the-tabernacle-where-the-glory-dwells',
       E'The Voice from the Tabernacle Where the Glory Dwells',
       E'Leviticus opens at the seam of Exodus. The last book ended with the tent finished and the Presence taking possession: *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34), so full that *Moses was not able to enter into the tent of the congregation* (Exodus 40:35). The first words of Leviticus are the voice from inside that cloud: *And Yahuah (LORD) called unto Moses, and spake unto him out of the tabernacle of the congregation* (Leviticus 1:1). The Formed Presence who led Yashar''el (Israel) through the wilderness now teaches, from within the Glory, the appointed way for a man to draw near — *If any man of you bring an offering unto Yahuah (LORD)* (Leviticus 1:2). The offering Torah is not distance from Yahuah; it is the path He opens out of His own dwelling.',
       sv.verse_id, ev.verse_id, 'free', 22700
  FROM _s311_lev01_lookup sv, _s311_lev01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering',
       E'The Whole Burnt Offering — the Formed Son''s Self-Offering',
       E'The olah, the whole-burnt offering, is the deepest type in the chapter. It is *a male without blemish*, offered *of his own voluntary will at the door of the tabernacle* (Leviticus 1:3); the worshipper *shall put his hand upon the head of the burnt offering; and it shall be accepted for him to make atonement for him* (Leviticus 1:4) — the laying-on of hands that transfers his guilt to a substitute; and the whole victim is consumed, *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 1:9). This is the Torah-shape the Formed Son fills. Sha''ul (Paul) quotes the very phrase: Messiah *hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2). Hebrews names the once-for-all: *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10), putting Psalm 40 in his mouth — *Sacrifice and offering thou didst not desire; mine ears hast thou opened* (Psalm 40:6), *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). The Akedah stands behind it all: the only son carried up *for a burnt offering* (Genesis 22:2), the lamb Yahuah Himself would provide (Genesis 22:8), the ram offered *in the stead of his son* (Genesis 22:13). And the atoned-for people answer in kind — *present your bodies a living sacrifice, holy, acceptable unto Elohim (God)* (Romans 12:1). The voluntary, unblemished, wholly-given olah is the willing self-offering of the Son and the worship it draws out of his own.',
       sv.verse_id, ev.verse_id, 'free', 22703
  FROM _s311_lev01_lookup sv, _s311_lev01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-1-the-offering-of-the-flock-a-male-without-blemish',
       E'The Offering of the Flock — a Male Without Blemish',
       E'The same pattern descends from the herd to the flock: *And if his offering be of the flocks, namely, of the sheep, or of the goats, for a burnt sacrifice; he shall bring it a male without blemish* (Leviticus 1:10). The standard never lowers — the victim is still male, still unblemished, still wholly burnt. This is the lamb Abraham trusted Yahuah to supply on Moriah: *Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together* (Genesis 22:8). The flock-olah keeps the type intact for the household of more modest means, all of it pointing to the one unblemished Lamb Yahuah provides.',
       sv.verse_id, ev.verse_id, 'free', 22706
  FROM _s311_lev01_lookup sv, _s311_lev01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-1-the-poor-mans-offering-of-turtledoves-and-pigeons',
       E'The Poor Man''s Offering of Turtledoves and Pigeons',
       E'Torah makes a way for the poor. *And if the burnt sacrifice for his offering to Yahuah (LORD) be of fowls, then he shall bring his offering of turtledoves, or of young pigeons* (Leviticus 1:14). The same provision is repeated for the one who cannot afford a lamb: *two turtledoves, or two young pigeons... one for a sin offering, and the other for a burnt offering* (Leviticus 5:7). No one is shut out of atonement for poverty. And so when the Formed Son was presented at the temple, his mother Miriam (Mary) brought exactly this offering — *A pair of turtledoves, or two young pigeons* (Luke 2:24). The Son of the Most High came into a poor family and was offered with the poor man''s offering, the mercy of Leviticus 1 made flesh.',
       sv.verse_id, ev.verse_id, 'free', 22709
  FROM _s311_lev01_lookup sv, _s311_lev01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- D. thread_members ------------------------------------------------------------
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle.* (Exodus 40:34) — the Glory that has just filled the tent is what the voice of Leviticus 1:1 speaks from.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-voice-from-the-tabernacle-where-the-glory-dwells'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Moses was not able to enter into the tent of the congregation, because the cloud abode thereon* (Exodus 40:35) — yet from that unenterable Glory Yahuah calls Moses (Leviticus 1:1) and opens the way of approach.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-voice-from-the-tabernacle-where-the-glory-dwells'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2) — the sweet savour of the olah (Leviticus 1:9) is the self-given Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10) — the laying-on of hands of Leviticus 1:4 finds its once-for-all in the offered body of the Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*present your bodies a living sacrifice, holy, acceptable unto Elohim (God)* (Romans 12:1) — the voluntary, unblemished olah of Leviticus 1:3 becomes the worship of the atoned-for people.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*offer him there for a burnt offering upon one of the mountains* (Genesis 22:2) — the Akedah is the first olah, the only son carried up the mountain, codified in Leviticus 1:3.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Elohim (God) will provide himself a lamb for a burnt offering* (Genesis 22:8) — Yahuah Himself provides the unblemished male of Leviticus 1:3; the Formed Son is that lamb.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a ram caught in a thicket... offered him up for a burnt offering in the stead of his son* (Genesis 22:13) — substitution and ascent, exactly the sweet-savour olah of Leviticus 1:9.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened* (Psalm 40:6) — the song behind the olah of Leviticus 1:3; Hebrews 10 puts it in the mouth of the Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8) — the *voluntary will* of Leviticus 1:3 voiced perfectly; the willing olah and the Torah-on-the-heart are one.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-whole-burnt-offering-the-formed-sons-self-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Elohim (God) will provide himself a lamb for a burnt offering: so they went both of them together* (Genesis 22:8) — the lamb of Moriah is the flock-olah of Leviticus 1:10, the unblemished male Yahuah provides.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-offering-of-the-flock-a-male-without-blemish'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A pair of turtledoves, or two young pigeons* (Luke 2:24) — Miriam (Mary) brings the poor man''s offering of Leviticus 1:14 at the presentation of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-poor-mans-offering-of-turtledoves-and-pigeons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if he be not able to bring a lamb, then he shall bring... two turtledoves, or two young pigeons* (Leviticus 5:7) — the same mercy for the poor repeated, so none is shut out of atonement for poverty.'
  FROM cross_reference_threads t
  JOIN _s311_lev01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s311_lev01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-1-the-poor-mans-offering-of-turtledoves-and-pigeons'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_2.sql (Leviticus 2) -----
-- Book: Leviticus  | Chapter: 2  | Tag: lev02  | Session prefix: s311
-- Temp view: _s311_lev02_lookup
-- Sort band base: 22725  step 3  (22725, 22728, 22731, 22734)
-- Slugs all prefixed leviticus-2-  (checked against EXISTING_SLUGS.txt — none pre-exist)
--
-- Leviticus 2 coverage:
--   v.1-3  NT:     none warranted (memorial/most-holy weave is Torah-internal here)
--          Extras: none warranted
--          Tanakh: Exodus 29:40-41, Numbers 15:3-4  (the grain tribute, fine flour + oil) — thread 1
--   v.4-10 NT:     none warranted (baked/pan/fryingpan variants of the same minchah)
--          Extras: none warranted
--          Tanakh: folded into thread 1 (vv.9-10 memorial + remnant most holy)
--   v.11   NT:     1 Corinthians 5:6-8, Matthew 16:6, Matthew 16:12, Galatians 5:9  — thread 2
--          Extras: none warranted
--          Tanakh: Exodus 12:15, Exodus 12:19  (no leaven found) — thread 2
--   v.12   NT:     1 Corinthians 15:20, 1 Corinthians 15:23 (Messiah the firstfruits) — thread 4
--          Extras: none warranted
--          Tanakh: Leviticus 23:10-11 (wave sheaf of firstfruits), Proverbs 3:9 — thread 4
--   v.13   NT:     Mark 9:49, Mark 9:50, Colossians 4:6, Matthew 5:13  — thread 3
--          Extras: none warranted
--          Tanakh: Numbers 18:19, 2 Chronicles 13:5  (covenant of salt for ever) — thread 3
--   v.14-16 NT:    folded into thread 4 (firstfruits of green ears / corn beaten out)
--          Extras: none warranted
--          Tanakh: folded into thread 4
--
-- Threads:
--   1. leviticus-2-the-meal-offering-a-thing-most-holy   (free) — Tanakh: Exodus 29:40-41, Numbers 15:3-4
--   2. leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven (free) — NT: 1Cor5:6-8, Matt16:6,12, Gal5:9 | Tanakh: Exod12:15,19
--   3. leviticus-2-the-salt-of-the-covenant   (free) — NT: Mark9:49-50, Col4:6, Matt5:13 | Tanakh: Num18:19, 2Chr13:5
--   4. leviticus-2-the-oblation-of-the-firstfruits   (free) — NT: 1Cor15:20,23 | Tanakh: Lev23:10-11, Prov3:9
--
-- Framework notes: leaven (v.11) = type of the corruption purged FROM the offering, the
--   Unleavened-Bread feast architecture the NT fills (Messiah our passover, keep the feast,
--   the leaven = doctrine of the Pharisees); the salt of the covenant (v.13) = the enduring,
--   incorruptible covenant of salt (Num18:19, 2Chr13:5) carried forward into the disciples'
--   own seasoning (have salt in yourselves); firstfruits (vv.12,14) = the wave-sheaf of Lev23
--   that Messiah fulfils as the firstfruits of them that slept. Free tier throughout (all
--   members canon Tanakh + NT).

CREATE TEMP VIEW _s311_lev02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the meal offering, a thing most holy
    ('canon','leviticus',2,2,'canon','exodus',29,40,'free',
     E'*And with the one lamb a tenth deal of flour mingled with the fourth part of an hin of beaten oil; and the fourth part of an hin of wine for a drink offering* (Exodus 29:40). The minchah of Leviticus 2 — *his offering shall be of fine flour; and he shall pour oil upon it* (Leviticus 2:1) — is the same grain tribute that accompanies the continual lamb of the daily service: fine flour and oil rise as a sweet savour unto Yahuah (LORD).'),
    ('canon','leviticus',2,2,'canon','exodus',29,41,'free',
     E'*And the other lamb thou shalt offer at even, and shalt do thereto according to the meat offering of the morning, and according to the drink offering thereof, for a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:41). The priest burns *the memorial of it upon the altar, to be an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 2:2) — the very phrase of the evening tribute; the meal offering belongs to the standing pattern of the altar.'),
    ('canon','leviticus',2,1,'canon','numbers',15,4,'free',
     E'*Then shall he that offereth his offering unto Yahuah (LORD) bring a meat offering of a tenth deal of flour mingled with the fourth part of an hin of oil* (Numbers 15:4). The instruction *his offering shall be of fine flour; and he shall pour oil upon it* (Leviticus 2:1) is fixed by measure in Numbers — flour and oil are the appointed grain tribute that rides upon every burnt offering.'),
    ('canon','leviticus',2,3,'canon','numbers',15,3,'free',
     E'*And will make an offering by fire unto Yahuah (LORD), a burnt offering, or a sacrifice in performing a vow, or in a freewill offering, or in your solemn feasts, to make a sweet savour unto Yahuah (LORD), of the herd, or of the flock* (Numbers 15:3). *The remnant of the meat offering shall be Aaron''s and his sons'': it is a thing most holy of the offerings of Yahuah (LORD) made by fire* (Leviticus 2:3) — the priestly portion of the same sweet-savour service that Numbers names in the solemn feasts.'),

    -- Thread 2: no leaven in the offering
    ('canon','leviticus',2,11,'canon','exodus',12,15,'free',
     E'*Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel)* (Exodus 12:15). The altar law — *No meat offering, which ye shall bring unto Yahuah (LORD), shall be made with leaven* (Leviticus 2:11) — is the offering-side of the same Feast of Unleavened Bread: leaven is put out of the house and out of the offering alike.'),
    ('canon','leviticus',2,11,'canon','exodus',12,19,'free',
     E'*Seven days shall there be no leaven found in your houses: for whosoever eateth that which is leavened, even that soul shall be cut off from the congregation of Yashar''el (Israel), whether he be a stranger, or born in the land* (Exodus 12:19). *Ye shall burn no leaven, nor any honey, in any offering of Yahuah (LORD) made by fire* (Leviticus 2:11) — what is banished from the house in the feast is banished from the fire on the altar; leaven, the type of corruption, has no place before Yahuah (LORD).'),
    ('canon','leviticus',2,11,'canon','1-corinthians',5,6,'free',
     E'*Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6). The altar''s ban on leaven — *ye shall burn no leaven... in any offering of Yahuah (LORD) made by fire* (Leviticus 2:11) — is read by Sha''ul (Paul) as the law of the congregation: corruption tolerated spreads through the whole body, as leaven through dough.'),
    ('canon','leviticus',2,11,'canon','1-corinthians',5,7,'free',
     E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The unleavened offering of Leviticus 2 stands beside the Passover lamb; *No meat offering... shall be made with leaven* (Leviticus 2:11) is fulfilled in the people purged to be a new, unleavened lump because Messiah (Christ) our passover is slain.'),
    ('canon','leviticus',2,11,'canon','1-corinthians',5,8,'free',
     E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). *Let us keep the feast* — the Feast of Unleavened Bread is kept, not abolished; the leaven barred from the meat offering (*No meat offering... shall be made with leaven*, Leviticus 2:11) is malice and wickedness purged from the body that keeps it.'),
    ('canon','leviticus',2,11,'canon','matthew',16,6,'free',
     E'*Then Yahusha (Jesus) said unto them, Take heed and beware of the leaven of the Pharisees and of the Sadducees* (Matthew 16:6). The offering admits no leaven (*ye shall burn no leaven... in any offering*, Leviticus 2:11); Yahusha (Jesus) carries the type forward — leaven is the corrupting thing to be kept out, here the teaching that would sour the whole lump.'),
    ('canon','leviticus',2,11,'canon','matthew',16,12,'free',
     E'*Then understood they how that he bade them not beware of the leaven of bread, but of the doctrine of the Pharisees and of the Sadducees* (Matthew 16:12). The leaven barred from the altar (*No meat offering, which ye shall bring unto Yahuah (LORD), shall be made with leaven*, Leviticus 2:11) is named: corrupt doctrine. What was excluded from the offering is to be excluded from the heart.'),
    ('canon','leviticus',2,11,'canon','galatians',5,9,'free',
     E'*A little leaven leaveneth the whole lump* (Galatians 5:9). The proverb that drives the altar law — keep even a little leaven from the offering (*ye shall burn no leaven*, Leviticus 2:11) — Sha''ul (Paul) sets against the error creeping into the assembly: a small corruption tolerated will work through the whole.'),

    -- Thread 3: the salt of the covenant
    ('canon','leviticus',2,13,'canon','numbers',18,19,'free',
     E'*All the heave offerings of the holy things, which the children of Yashar''el (Israel) offer unto Yahuah (LORD), have I given thee, and thy sons and thy daughters with thee, by a statute for ever: it is a covenant of salt for ever before Yahuah (LORD) unto thee and to thy seed with thee* (Numbers 18:19). *Neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering* (Leviticus 2:13) — salt seasons every offering because it seals an everlasting, incorruptible covenant, *a covenant of salt for ever*.'),
    ('canon','leviticus',2,13,'canon','2-chronicles',13,5,'free',
     E'*Ought ye not to know that Yahuah Elohim (the LORD God) of Yashar''el (Israel) gave the kingdom over Yashar''el (Israel) to David for ever, even to him and to his sons by a covenant of salt?* (2 Chronicles 13:5). The salt the meat offering must never lack (*the salt of the covenant of thy Elohim (God)*, Leviticus 2:13) is the same covenant of salt by which the throne is given to David for ever — the enduring, unbreakable bond.'),
    ('canon','leviticus',2,13,'canon','mark',9,49,'free',
     E'*For every one shall be salted with fire, and every sacrifice shall be salted with salt* (Mark 9:49). Yahusha (Jesus) reaches straight back to the altar — *with all thine offerings thou shalt offer salt* (Leviticus 2:13) — and presses it onto the disciple: every sacrifice, and every one of them, is salted; the covenant savour is upon the offered life.'),
    ('canon','leviticus',2,13,'canon','mark',9,50,'free',
     E'*Salt is good: but if the salt have lost his saltness, wherewith will ye season it? Have salt in yourselves, and have peace one with another* (Mark 9:50). The salt that must never be lacking from the offering (*neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking*, Leviticus 2:13) becomes the inward seasoning of the covenant people: *have salt in yourselves*.'),
    ('canon','leviticus',2,13,'canon','colossians',4,6,'free',
     E'*Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). The offering seasoned with covenant salt (*every oblation of thy meat offering shalt thou season with salt*, Leviticus 2:13) is carried into the speech of the saints: words preserved and savoury, never corrupt.'),
    ('canon','leviticus',2,13,'canon','matthew',5,13,'free',
     E'*Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted? it is thenceforth good for nothing, but to be cast out, and to be trodden under foot of men* (Matthew 5:13). The salt of the covenant that must season every offering (*the salt of the covenant of thy Elohim (God)*, Leviticus 2:13) is what the covenant people themselves become — the preserving, savouring salt of the earth.'),

    -- Thread 4: the oblation of the firstfruits
    ('canon','leviticus',2,12,'canon','leviticus',23,10,'free',
     E'*Speak unto the children of Yashar''el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest* (Leviticus 23:10). *As for the oblation of the firstfruits, ye shall offer them unto Yahuah (LORD)* (Leviticus 2:12) — the firstfruits named in the offering law are the wave-sheaf appointed in the feast calendar; the first of the harvest is rendered first to Yahuah (LORD).'),
    ('canon','leviticus',2,12,'canon','leviticus',23,11,'free',
     E'*And he shall wave the sheaf before Yahuah (LORD), to be accepted for you: on the morrow after the sabbath the priest shall wave it* (Leviticus 23:11). The firstfruits offered in Leviticus 2:12 (*As for the oblation of the firstfruits, ye shall offer them unto Yahuah (LORD)*) are waved to be accepted — the prophetic Firstfruits appointed time, the first sheaf lifted before Yahuah (LORD).'),
    ('canon','leviticus',2,14,'canon','1-corinthians',15,20,'free',
     E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20). The green ears offered as firstfruits — *thou shalt offer for the meat offering of thy firstfruits green ears of corn dried by the fire* (Leviticus 2:14) — find their fulfilment in the risen Messiah (Christ), the Firstfruits of the resurrection harvest, the first sheaf raised and accepted.'),
    ('canon','leviticus',2,14,'canon','1-corinthians',15,23,'free',
     E'*But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23). The firstfruits offering of Leviticus 2:14 (*if thou offer a meat offering of thy firstfruits unto Yahuah (LORD)*) sets the order: Messiah (Christ) the firstfruits first, then the full harvest gathered at his coming.'),
    ('canon','leviticus',2,12,'canon','proverbs',3,9,'free',
     E'*Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9). The law that the firstfruits be rendered unto Yahuah (LORD) — *As for the oblation of the firstfruits, ye shall offer them unto Yahuah (LORD)* (Leviticus 2:12) — is the wisdom of the whole life: the first and best of every increase belongs to him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-2-the-meal-offering-a-thing-most-holy',
       E'The meal offering — a thing most holy',
       E'The minchah is the grain tribute: *And when any will offer a meat offering unto Yahuah (LORD), his offering shall be of fine flour; and he shall pour oil upon it, and put frankincense thereon* (Leviticus 2:1). The priest burns the memorial, *to be an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 2:2), and the rest is the priests'': *the remnant of the meat offering shall be Aaron''s and his sons'': it is a thing most holy of the offerings of Yahuah (LORD) made by fire* (Leviticus 2:3). This same fine flour and oil ride upon the continual lamb — *with the one lamb a tenth deal of flour mingled with the fourth part of an hin of beaten oil* (Exodus 29:40), offered morning and evening *for a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:41) — and Numbers fixes the measure: *a meat offering of a tenth deal of flour mingled with the fourth part of an hin of oil* (Numbers 15:4), rendered in *your solemn feasts, to make a sweet savour unto Yahuah (LORD)* (Numbers 15:3). The grain tribute is woven through the whole altar service, and its priestly remnant is named most holy.',
       sv.verse_id, ev.verse_id, 'free', 22725
  FROM _s311_lev02_lookup sv, _s311_lev02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven',
       E'No leaven in the offering — purge out the old leaven',
       E'The altar admits no leaven: *No meat offering, which ye shall bring unto Yahuah (LORD), shall be made with leaven: for ye shall burn no leaven, nor any honey, in any offering of Yahuah (LORD) made by fire* (Leviticus 2:11). This is the offering-side of the Feast of Unleavened Bread, where leaven is put out of the house — *the first day ye shall put away leaven out of your houses* (Exodus 12:15), *seven days shall there be no leaven found in your houses* (Exodus 12:19). Leaven is the type of corruption, barred alike from house and altar. The apostolic word carries the type forward, never abolishing the feast but reading it: *Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6); *Purge out therefore the old leaven... for even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7); *Therefore let us keep the feast, not with old leaven... but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Yahusha (Jesus) names the leaven to beware: *Take heed and beware of the leaven of the Pharisees and of the Sadducees* (Matthew 16:6) — *not... the leaven of bread, but... the doctrine of the Pharisees and of the Sadducees* (Matthew 16:12). And the proverb that drives the law stands: *A little leaven leaveneth the whole lump* (Galatians 5:9). What is excluded from the offering is to be excluded from the body and the heart.',
       sv.verse_id, ev.verse_id, 'free', 22728
  FROM _s311_lev02_lookup sv, _s311_lev02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-2-the-salt-of-the-covenant',
       E'The salt of the covenant',
       E'Every offering must be salted: *And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). Salt seals an enduring, incorruptible bond — *it is a covenant of salt for ever before Yahuah (LORD) unto thee and to thy seed with thee* (Numbers 18:19) — the same covenant of salt by which the throne is given: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) gave the kingdom over Yashar''el (Israel) to David for ever, even to him and to his sons by a covenant of salt* (2 Chronicles 13:5). Yahusha (Jesus) presses the altar salt onto the disciple: *every sacrifice shall be salted with salt* (Mark 9:49); *Salt is good... Have salt in yourselves, and have peace one with another* (Mark 9:50). The covenant savour becomes the speech and the very identity of the people: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6); *Ye are the salt of the earth* (Matthew 5:13). The enduring covenant of salt seasons the offering, the throne, the word, and the people.',
       sv.verse_id, ev.verse_id, 'free', 22731
  FROM _s311_lev02_lookup sv, _s311_lev02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-2-the-oblation-of-the-firstfruits',
       E'The oblation of the firstfruits',
       E'The first of the harvest is rendered first to Yahuah (LORD): *As for the oblation of the firstfruits, ye shall offer them unto Yahuah (LORD)* (Leviticus 2:12), and *if thou offer a meat offering of thy firstfruits unto Yahuah (LORD), thou shalt offer for the meat offering of thy firstfruits green ears of corn dried by the fire, even corn beaten out of full ears* (Leviticus 2:14). These firstfruits are the wave-sheaf of the appointed time: *then ye shall bring a sheaf of the firstfruits of your harvest unto the priest* (Leviticus 23:10), *and he shall wave the sheaf before Yahuah (LORD), to be accepted for you: on the morrow after the sabbath* (Leviticus 23:11). The risen Messiah (Christ) fulfils the first sheaf: *now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20); *Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming* (1 Corinthians 15:23) — the first sheaf lifted, then the full harvest gathered. And the law is the wisdom of the whole life: *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* (Proverbs 3:9).',
       sv.verse_id, ev.verse_id, 'free', 22734
  FROM _s311_lev02_lookup sv, _s311_lev02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 29:40 — *a tenth deal of flour mingled with... beaten oil*: the grain tribute on the continual lamb, the same fine flour and oil of the minchah.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-meal-offering-a-thing-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 29:41 — the evening tribute *for a sweet savour, an offering made by fire unto Yahuah (LORD)*: the exact phrase of the memorial burnt in Leviticus 2:2.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-meal-offering-a-thing-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 15:4 — *a meat offering of a tenth deal of flour mingled with... oil*: the appointed measure of the flour-and-oil tribute named in Leviticus 2:1.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-meal-offering-a-thing-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 15:3 — the *sweet savour* service *in your solemn feasts*: the priestly remnant of Leviticus 2:3 is most holy of these offerings made by fire.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-meal-offering-a-thing-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 12:15 — *put away leaven out of your houses*: the feast-side of the altar ban; leaven barred from the house as from the offering.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 12:19 — *no leaven found in your houses*: corruption banished from the dwelling as it is from the fire of the altar.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 5:6 — *a little leaven leaveneth the whole lump*: the law''s logic applied to the congregation, corruption spreading through the body.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 5:7 — *Purge out... the old leaven... Messiah (Christ) our passover is sacrificed*: the unleavened offering beside the Passover lamb.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 5:8 — *let us keep the feast... with the unleavened bread of sincerity and truth*: the Feast of Unleavened Bread kept, the leaven of malice purged.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Matthew 16:6 — *beware of the leaven of the Pharisees and of the Sadducees*: the corrupting thing kept from the offering, now from the heart.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Matthew 16:12 — the leaven named: *the doctrine of the Pharisees and of the Sadducees*; corrupt teaching barred as leaven from the altar.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Galatians 5:9 — *A little leaven leaveneth the whole lump*: the proverb behind the law, set against error creeping into the assembly.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-no-leaven-in-the-offering-purge-out-the-old-leaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 18:19 — *a covenant of salt for ever*: the enduring bond the salt seals on every offering of Leviticus 2:13.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 13:5 — the throne given to David *by a covenant of salt*: the same unbreakable bond the offering must never lack.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Mark 9:49 — *every sacrifice shall be salted with salt*: Yahusha (Jesus) reaches back to the altar salt of Leviticus 2:13.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Mark 9:50 — *Have salt in yourselves*: the covenant salt becomes the inward seasoning of the people.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Colossians 4:6 — *speech... seasoned with salt*: the offering''s covenant savour carried into the words of the saints.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Matthew 5:13 — *Ye are the salt of the earth*: the covenant salt of the offering becomes the people''s very identity.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-salt-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 23:10 — *a sheaf of the firstfruits of your harvest*: the appointed wave-sheaf behind the firstfruits oblation of Leviticus 2:12.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-oblation-of-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 23:11 — *he shall wave the sheaf before Yahuah (LORD), to be accepted*: the prophetic Firstfruits appointed time, the first sheaf lifted.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-oblation-of-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 15:20 — *Messiah (Christ)... become the firstfruits of them that slept*: the risen Messiah fulfils the first sheaf, the green ears of Leviticus 2:14.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-oblation-of-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 15:23 — *Messiah (Christ) the firstfruits; afterward they that are Messiah''s*: first sheaf, then the full harvest gathered.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-oblation-of-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Proverbs 3:9 — *Honour Yahuah (LORD)... with the firstfruits of all thine increase*: the firstfruits law as the wisdom of the whole life.'
  FROM cross_reference_threads t
  JOIN _s311_lev02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s311_lev02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-2-the-oblation-of-the-firstfruits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_3.sql (Leviticus 3) -----
-- Book: Leviticus  Chapter: 3  (the peace offering / shelamim)
-- Tag: lev03   Session prefix: s311
-- Sort band: base 22750, step 3  (22750, 22753, 22756, 22759)
-- Temp view: _s311_lev03_lookup
--
-- Framing (per MINION_BRIEF_TANAKH.md lens): The peace offering (shelamim) is the
-- fellowship sacrifice — the only offering of which the worshipper ate, the shared
-- meal at the altar. The laying on of the hand, the blood sprinkled, the fat burned
-- "of a sweet savour" forwards to the peace made with Elohim through the Formed Son
-- (Romans 5:1; Colossians 1:20; Ephesians 2:14). The fat and the blood are reserved
-- wholly to Yahuah — a PERPETUAL statute throughout all dwellings — the life that
-- belongs to the Maker, never abolished (Genesis 9:4; Leviticus 17; Deuteronomy 12;
-- Acts 15). Torah is the living covenant inheritance, never the curse.
--
-- Leviticus 3 coverage:
--   v.1-5 (peace offering of the herd; hand laid, blood sprinkled, fat burned, sweet savour):
--        NT:     Romans 5:1, Colossians 1:20, Ephesians 2:14  -> thread 1
--        Extras: none warranted
--        Tanakh: Leviticus 7:11, 7:15 (the law of the peace offering / eaten) -> thread 2
--   v.6-16 (peace offering of the flock — lamb / goat; the shared fellowship meal):
--        NT:     none warranted (covered forward in thread 1)
--        Extras: none warranted
--        Tanakh: Leviticus 7:11, 7:15 (peace offering eaten — communion) -> thread 2
--   v.16  (all the fat is Yahuah''s):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Leviticus 7:23, 7:24, 7:25 (eat no fat) -> thread 3
--   v.17  (perpetual statute: eat neither fat nor blood):
--        NT:     Acts 15:20, Acts 15:29 (abstain from blood) -> thread 4
--        Extras: none warranted
--        Tanakh: Genesis 9:4, Leviticus 7:26, 7:27, Leviticus 17:11, 17:14,
--                Deuteronomy 12:23 (the life/blood reserved) -> thread 4
--
-- Threads (4):
--   1. leviticus-3-the-peace-offering-our-peace-through-the-blood   [free]  (canon NT)
--        members: Romans 5:1, Colossians 1:20, Ephesians 2:14
--   2. leviticus-3-the-fellowship-meal-of-the-peace-offering        [free]  (canon Tanakh lateral)
--        members: Leviticus 7:11, Leviticus 7:15
--   3. leviticus-3-all-the-fat-is-yahuahs                           [free]  (canon Tanakh lateral)
--        members: Leviticus 7:23, Leviticus 7:24, Leviticus 7:25
--   4. leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute    [free]  (canon Tanakh + NT)
--        members: Genesis 9:4, Leviticus 7:26, Leviticus 7:27, Leviticus 17:11,
--                 Leviticus 17:14, Deuteronomy 12:23, Acts 15:20, Acts 15:29

CREATE TEMP VIEW _s311_lev03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the peace offering -> our peace through the blood of the Formed Son
    ('canon','leviticus',3,3,'canon','romans',5,1,'free',
      E'*Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ):* (Romans 5:1). The peace offering of Leviticus 3 — *an offering made by fire unto Yahuah (LORD)* (Leviticus 3:3), the only sacrifice of which the worshipper ate at the altar — is named for what it secures: shalom, peace WITH Yahuah. What the herd-offering enacted in shadow the Formed Son accomplishes in full; the fellowship-meal at the altar is the type of the reconciled standing fulfilled in him.'),
    ('canon','leviticus',3,5,'canon','colossians',1,20,'free',
      E'*And, having made peace through the blood of his cross, by him to reconcile all things unto himself; by him, I say, whether they be things in earth, or things in heaven.* (Colossians 1:20). In Leviticus 3 the blood is sprinkled and the fat *burn[t]... upon the altar... an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 3:5). The peace offering makes peace by blood and by a sweet savour rising to Yahuah — the very grammar Colossians uses of the cross: peace MADE through blood.'),
    ('canon','leviticus',3,1,'canon','ephesians',2,14,'free',
      E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us;* (Ephesians 2:14). The shelamim — *a sacrifice of peace offering* (Leviticus 3:1) — does not merely picture peace, it IS the peace-bringer in type. The Formed Son is himself *our peace*, gathering the two houses of Yashar''el (Israel) into one, the living substance the herd-offering only foreshadowed.'),

    -- Thread 2: the fellowship meal of the peace offering (lateral, eaten)
    ('canon','leviticus',3,6,'canon','leviticus',7,11,'free',
      E'*And this is the law of the sacrifice of peace offerings, which he shall offer unto Yahuah (LORD).* (Leviticus 7:11). Leviticus 3 prescribes the peace offering *of the flock; male or female* (Leviticus 3:6); Leviticus 7 unfolds its law — uniquely among the offerings, this one is shared and eaten. The two chapters are one ordinance: the sacrifice of fellowship.'),
    ('canon','leviticus',3,7,'canon','leviticus',7,15,'free',
      E'*And the flesh of the sacrifice of his peace offerings for thanksgiving shall be eaten the same day that it is offered; he shall not leave any of it until the morning.* (Leviticus 7:15). The lamb offered *before Yahuah (LORD)* (Leviticus 3:7) becomes a meal eaten in his presence — communion at the altar. The peace offering alone is consumed by the worshipper, the table of fellowship with the Maker that the rest of the library calls eating before him.'),

    -- Thread 3: all the fat is Yahuah''s (lateral)
    ('canon','leviticus',3,16,'canon','leviticus',7,23,'free',
      E'*Speak unto the children of Yashar''el (Israel), saying, Ye shall eat no manner of fat, of ox, or of sheep, or of goat.* (Leviticus 7:23). Leviticus 3 declares *all the fat is the LORD''S* (Leviticus 3:16) and burns it on the altar; Leviticus 7 binds the people accordingly — the choicest portion is reserved wholly to Yahuah and never eaten. The same statute, stated as gift and as command.'),
    ('canon','leviticus',3,16,'canon','leviticus',7,24,'free',
      E'*And the fat of the beast that dieth of itself, and the fat of that which is torn with beasts, may be used in any other use: but ye shall in no wise eat of it.* (Leviticus 7:24). Because *all the fat is the LORD''S* (Leviticus 3:16), even fat from a carcase not offered is withheld from the table. The reservation of the fat to Yahuah reaches into every dwelling, not the altar only.'),
    ('canon','leviticus',3,16,'canon','leviticus',7,25,'free',
      E'*For whosoever eateth the fat of the beast, of which men offer an offering made by fire unto Yahuah (LORD), even the soul that eateth it shall be cut off from his people.* (Leviticus 7:25). The burning of *all the fat* as *an offering made by fire... unto Yahuah (LORD)* (Leviticus 3:16) carries a penalty for trespass: to eat what belongs to Yahuah is to be cut off. The fat is his alone.'),

    -- Thread 4: eat neither fat nor blood — a perpetual statute (Tanakh + NT)
    ('canon','leviticus',3,17,'canon','genesis',9,4,'free',
      E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4). The *perpetual statute... that ye eat neither fat nor blood* (Leviticus 3:17) does not begin at Sinai — it is given to Noah, to all flesh, after the flood. The blood is the life, and the life belongs to the Maker; Leviticus only restates the Noahic charge for the covenant people.'),
    ('canon','leviticus',3,17,'canon','leviticus',7,26,'free',
      E'*Moreover ye shall eat no manner of blood, whether it be of fowl or of beast, in any of your dwellings.* (Leviticus 7:26). Leviticus 3:17 binds the statute *throughout all your dwellings*; Leviticus 7 echoes it word for word — *in any of your dwellings*. The reach is total: not the altar only but every household of Yashar''el (Israel).'),
    ('canon','leviticus',3,17,'canon','leviticus',7,27,'free',
      E'*Whatsoever soul it be that eateth any manner of blood, even that soul shall be cut off from his people.* (Leviticus 7:27). The *perpetual statute* against eating blood (Leviticus 3:17) carries the gravest sanction — to be cut off. The life in the blood is Yahuah''s; to consume it is to seize what is his.'),
    ('canon','leviticus',3,17,'canon','leviticus',17,11,'free',
      E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* (Leviticus 17:11). Here is the reason behind the statute *that ye eat neither fat nor blood* (Leviticus 3:17): the blood is the life, given on the altar to atone. It is reserved to Yahuah because it is the appointed price of atonement — never food.'),
    ('canon','leviticus',3,17,'canon','leviticus',17,14,'free',
      E'*For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* (Leviticus 17:14). Leviticus 17 spells out the ground of Leviticus 3:17 — the blood IS the life of all flesh. The statute guards the sanctity of life itself, which is why it is perpetual and universal.'),
    ('canon','leviticus',3,17,'canon','deuteronomy',12,23,'free',
      E'*Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh.* (Deuteronomy 12:23). Moses restates the *perpetual statute* of Leviticus 3:17 in the renewed-covenant charge for the land: be SURE you eat not the blood, for the blood is the life. The instruction stands across Genesis, Leviticus, and Deuteronomy — one unbroken word.'),
    ('canon','leviticus',3,17,'canon','acts',15,20,'free',
      E'*But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood.* (Acts 15:20). The apostles, deciding what to lay upon the nations turning to Elohim (God), name *blood* among the necessary things — the very statute of Leviticus 3:17, *that ye eat neither fat nor blood*. The Noahic-Sinai charge is not abolished but reaffirmed for those joining the covenant people.'),
    ('canon','leviticus',3,17,'canon','acts',15,29,'free',
      E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication: from which if ye keep yourselves, ye shall do well. Fare ye well.* (Acts 15:29). The decree repeats the charge to abstain *from blood* — Leviticus 3:17''s *perpetual statute... throughout all your dwellings* carried forward into the assembly of the nations. The Torah''s reverence for the life in the blood remains binding, never set aside.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-3-the-peace-offering-our-peace-through-the-blood',
       E'The Peace Offering — Our Peace Through the Blood of the Formed Son',
       E'The peace offering (shelamim) of the herd is the sacrifice of fellowship: *And he shall lay his hand upon the head of his offering, and kill it at the door of the tabernacle of the congregation: and Aaron''s sons the priests shall sprinkle the blood upon the altar round about.* (Leviticus 3:2). The fat is then burned — *it is an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 3:5). This is the only offering of which the worshipper himself ate; it is named for what it secures, shalom — peace WITH Yahuah. The New Testament reads the type forward to the Formed Son: *Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ):* (Romans 5:1); *And, having made peace through the blood of his cross, by him to reconcile all things unto himself...* (Colossians 1:20); *For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us;* (Ephesians 2:14). The grammar matches the altar — peace MADE by blood, a sweet savour rising — and the Son who is himself our peace gathers the two houses of Yashar''el (Israel) into one.',
       sv.verse_id, ev.verse_id, 'free', 22750
  FROM _s311_lev03_lookup sv, _s311_lev03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-3-the-fellowship-meal-of-the-peace-offering',
       E'The Fellowship Meal of the Peace Offering',
       E'The peace offering of the flock — *And if his offering for a sacrifice of peace offering unto Yahuah (LORD) be of the flock; male or female, he shall offer it without blemish.* (Leviticus 3:6) — whether *a lamb* (Leviticus 3:7) or *a goat* (Leviticus 3:12), is the one sacrifice shared as a meal in Yahuah''s presence. The law of it is unfolded in Leviticus 7: *And this is the law of the sacrifice of peace offerings, which he shall offer unto Yahuah (LORD).* (Leviticus 7:11), and *And the flesh of the sacrifice of his peace offerings for thanksgiving shall be eaten the same day that it is offered; he shall not leave any of it until the morning.* (Leviticus 7:15). Unlike the burnt offering, wholly consumed on the altar, the shelamim returns to the worshipper as food eaten before Yahuah — communion at the table of the One who made peace. Leviticus 3 and Leviticus 7 are a single ordinance: the sacrifice that ends in a shared meal of fellowship.',
       sv.verse_id, ev.verse_id, 'free', 22753
  FROM _s311_lev03_lookup sv, _s311_lev03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-3-all-the-fat-is-yahuahs',
       E'All the Fat Is Yahuah''s',
       E'When the fat is burned, the chapter states the principle plainly: *And the priest shall burn them upon the altar: it is the food of the offering made by fire for a sweet savour: all the fat is the LORD''S.* (Leviticus 3:16). The choicest portion belongs wholly to Yahuah. Leviticus 7 binds the people to that reservation as command: *Speak unto the children of Yashar''el (Israel), saying, Ye shall eat no manner of fat, of ox, or of sheep, or of goat.* (Leviticus 7:23); even fat not offered is withheld — *but ye shall in no wise eat of it.* (Leviticus 7:24); and the trespass is grave — *even the soul that eateth it shall be cut off from his people.* (Leviticus 7:25). The fat given to Yahuah on the altar is the same fat forbidden at the table: what is his is not the worshipper''s to consume. This is the living covenant instruction of Yahuah, never a defunct rule but the ordering of life around what belongs to the Maker.',
       sv.verse_id, ev.verse_id, 'free', 22756
  FROM _s311_lev03_lookup sv, _s311_lev03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute',
       E'Eat Neither Fat Nor Blood — A Perpetual Statute',
       E'The chapter closes with a statute that binds beyond the altar: *It shall be a perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood.* (Leviticus 3:17). The fat and the blood are reserved to Yahuah, and the charge concerning blood is older than Sinai — given to Noah and to all flesh: *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4). Leviticus 7 echoes the reach — *Moreover ye shall eat no manner of blood... in any of your dwellings.* (Leviticus 7:26) — under the gravest sanction — *even that soul shall be cut off from his people.* (Leviticus 7:27). Leviticus 17 names the ground: *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls...* (Leviticus 17:11); *For it is the life of all flesh... whosoever eateth it shall be cut off.* (Leviticus 17:14). Moses restates it for the land: *Only be sure that thou eat not the blood: for the blood is the life...* (Deuteronomy 12:23). And the apostles, deciding what to lay upon the nations turning to Elohim (God), reaffirm the very charge: *that they abstain... from blood.* (Acts 15:20); *That ye abstain from meats offered to idols, and from blood...* (Acts 15:29). From Genesis to Acts the word is unbroken: the life in the blood belongs to the Maker — the statute is perpetual, not abolished.',
       sv.verse_id, ev.verse_id, 'free', 22759
  FROM _s311_lev03_lookup sv, _s311_lev03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Therefore being justified by faith, we have peace with Elohim (God) through our Lord Yahusha HaMashiach (Lord Jesus Christ):* (Romans 5:1) — the peace the shelamim secured in shadow, fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-the-peace-offering-our-peace-through-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And, having made peace through the blood of his cross...* (Colossians 1:20) — peace MADE by blood, the grammar of the altar where the fat is burned of a sweet savour.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-the-peace-offering-our-peace-through-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For he is our peace, who hath made both one...* (Ephesians 2:14) — the Son who is himself the peace the offering pictured, gathering the two houses into one.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-the-peace-offering-our-peace-through-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And this is the law of the sacrifice of peace offerings, which he shall offer unto Yahuah (LORD).* (Leviticus 7:11) — the unfolded law of the offering prescribed of the flock in Leviticus 3.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-the-fellowship-meal-of-the-peace-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And the flesh of the sacrifice of his peace offerings for thanksgiving shall be eaten the same day that it is offered...* (Leviticus 7:15) — the lamb offered before Yahuah becomes a meal eaten in his presence, communion at the altar.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-the-fellowship-meal-of-the-peace-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall eat no manner of fat, of ox, or of sheep, or of goat.* (Leviticus 7:23) — the reservation of the fat to Yahuah stated as command to the people.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-all-the-fat-is-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...but ye shall in no wise eat of it.* (Leviticus 7:24) — even fat from a carcase not offered is withheld; the reservation reaches every dwelling.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-all-the-fat-is-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...even the soul that eateth it shall be cut off from his people.* (Leviticus 7:25) — to eat what belongs to Yahuah is to be cut off; the fat is his alone.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-all-the-fat-is-yahuahs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4) — the charge against eating blood is given to Noah and all flesh, older than Sinai.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Moreover ye shall eat no manner of blood... in any of your dwellings.* (Leviticus 7:26) — the same reach as Leviticus 3:17''s *throughout all your dwellings*.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whatsoever soul it be that eateth any manner of blood, even that soul shall be cut off from his people.* (Leviticus 7:27) — the gravest sanction guards the life that is Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls...* (Leviticus 17:11) — the ground of the statute: the blood is the life, given to atone.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For it is the life of all flesh... whosoever eateth it shall be cut off.* (Leviticus 17:14) — the blood IS the life of all flesh; the statute guards the sanctity of life itself.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Only be sure that thou eat not the blood: for the blood is the life...* (Deuteronomy 12:23) — Moses restates the perpetual statute in the renewed-covenant charge for the land.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*...that they abstain... from blood.* (Acts 15:20) — the apostles name blood among the necessary things laid on the nations: the statute reaffirmed, not abolished.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*That ye abstain from meats offered to idols, and from blood...* (Acts 15:29) — the decree carries Leviticus 3:17''s charge forward into the assembly of the nations.'
  FROM cross_reference_threads t
  JOIN _s311_lev03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s311_lev03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-3-eat-neither-fat-nor-blood-a-perpetual-statute'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_4.sql (Leviticus 4) -----
-- Leviticus 4 — full-library cross-references. Tag lev04. Session prefix s311.
-- Sort band 22775, step 3: 22775, 22778, 22781, 22784, 22787.
-- View: _s311_lev04_lookup
--
-- FRAME: the sin offering (chatat) for sins of IGNORANCE — the unwitting
-- transgression of Yahuah's commandments still incurs guilt and still requires
-- blood. Four graded offerers (anointed priest, whole congregation, ruler,
-- common person), one principle: the priest makes atonement and it shall be
-- forgiven. The keystone is the bullock of the anointed priest, whose blood is
-- carried into the sanctuary and whose BODY is carried forth WITHOUT THE CAMP
-- and burned — the type Hebrews 13 names by name: the Formed Son suffered
-- WITHOUT THE GATE. The whole chapter is the blood-atonement architecture the
-- New Testament fills: without shedding of blood is no remission.
--
-- Leviticus 4 coverage:
--   v.1-2 (sin through ignorance against the commandments — unwitting guilt)
--        NT:     Hebrews 9:7 (offered for the errors of the people), Luke 23:34 (they know not what they do)
--        Extras: none warranted
--        Tanakh: Numbers 15:22-29 (the parallel ignorance-offering statute) — THREAD 1
--   v.3-12 (the anointed priest's bullock; blood sprinkled seven times before the vail;
--           the WHOLE BULLOCK carried forth WITHOUT THE CAMP and burned)
--        NT:     Hebrews 13:11-12 (bodies burned without the camp / suffered without the gate) — KEYSTONE
--        Extras: none warranted
--        Tanakh: Leviticus 16:27 (the sin-offering carcasses carried forth without the camp and burned) — THREAD 2
--   v.13-21 (the whole congregation sins ignorantly; corporate atonement; forgiven)
--        NT:     none warranted (the ignorance-forward weave carried by THREAD 1)
--        Extras: none warranted
--        Tanakh: Numbers 15:24-26 (the congregation's ignorance-offering, forgiven all the congregation) — THREAD 3
--   v.22-26 (the RULER's sin offering — a male kid; graded responsibility; atonement, forgiven)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Leviticus 4:27-28 (the common person's offering — the lesser female kid; the graded scale internal to the chapter)
--                — folded as the internal-contrast member of THREAD 4 (the blood on the horns / it shall be forgiven)
--   v.27-35 (the common person; the priest shall make an atonement for him, and it shall be forgiven him)
--        NT:     Hebrews 9:22 (without shedding of blood is no remission), 1 John 1:7 (the blood cleanseth us from all sin)
--        Extras: none warranted
--        Tanakh: (the blood-on-the-horns / atonement-and-forgiven refrain v.26,31,35) — THREAD 4 + THREAD 5
--
-- THREADS:
--   lev04: leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned (canon Tanakh + NT) [free]
--   lev04: leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate (canon Tanakh + NT) [free]
--   lev04: leviticus-4-if-the-whole-congregation-sin-through-ignorance-corporate-atonement (canon Tanakh) [free]
--   lev04: leviticus-4-the-blood-upon-the-horns-of-the-altar-graded-but-one-atonement (canon Tanakh) [free]
--   lev04: leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him (canon Tanakh + NT) [free]
--
-- Contested/load-bearing framing: 4:12 (the whole bullock carried forth WITHOUT
-- THE CAMP and burned) is read straight forward through Hebrews 13:11-12 — the
-- sin-offering body burned outside the camp is the Formed Son crucified outside
-- the gate, sanctifying the people with his own blood. Sin "through ignorance"
-- (4:2) is NOT a license-of-ignorance gloss: the unwitting transgression of
-- Yahuah's commandments still incurs real guilt and still demands blood — the
-- Torah is binding even where the breaker did not know; the offering is the
-- mercy provided, never the commandment dissolved.

CREATE TEMP VIEW _s311_lev04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: sin through ignorance — the unwitting sin atoned
    ('canon','leviticus',4,2,'canon','numbers',15,22,'free',E'*And if ye have erred, and not observed all these commandments, which Yahuah (LORD) hath spoken unto Moses* (Numbers 15:22). The same statute stands in Numbers: the sin done unwittingly is *If a soul shall sin through ignorance against any of the commandments of Yahuah (LORD) concerning things which ought not to be done* (Leviticus 4:2) — to err from the commandments is real guilt, and the Torah itself supplies the remedy.'),
    ('canon','leviticus',4,2,'canon','numbers',15,27,'free',E'*And if any soul sin through ignorance, then he shall bring a she goat of the first year for a sin offering* (Numbers 15:27). The individual unwitting sin of Numbers matches the individual chatat of Leviticus 4 — *If a soul shall sin through ignorance against any of the commandments of Yahuah (LORD)* (Leviticus 4:2) — the same provision, the same graded mercy.'),
    ('canon','leviticus',4,2,'canon','hebrews',9,7,'free',E'*But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). The high priest''s yearly blood is offered for *the errors of the people* — the very category of Leviticus 4, *If a soul shall sin through ignorance against any of the commandments of Yahuah (LORD)* (Leviticus 4:2). The errors of ignorance are exactly what the priestly blood was given to cover.'),
    ('canon','leviticus',4,2,'canon','luke',23,34,'free',E'*Then said Yahusha (Jesus), Father, forgive them; for they know not what they do* (Luke 23:34). At the cross the Formed Son pleads the very ground of the chatat — sin not in defiance but in ignorance: *If a soul shall sin through ignorance against any of the commandments of Yahuah (LORD)* (Leviticus 4:2). They know not what they do; therefore the offering is made and atonement opened for the unwitting.'),
    -- THREAD 2: the bullock burned without the camp — he suffered without the gate (KEYSTONE)
    ('canon','leviticus',4,12,'canon','hebrews',13,11,'free',E'*For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). Hebrews names this very ordinance: the bullock whose blood the anointed priest brings into the tabernacle has its body carried out — *Even the whole bullock shall he carry forth without the camp unto a clean place... and burn him on the wood with fire* (Leviticus 4:12). The blood goes in; the body goes out and is burned.'),
    ('canon','leviticus',4,12,'canon','hebrews',13,12,'free',E'*Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The body of the sin-offering bullock burned *without the camp* (Leviticus 4:12) is the shadow whose substance is the Formed Son: crucified outside the gate, sanctifying the people with his own blood — the sin offering carried forth and consumed.'),
    ('canon','leviticus',4,12,'canon','leviticus',16,27,'free',E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27). The Day of Atonement repeats the same law as the anointed-priest''s bullock: *the whole bullock shall he carry forth without the camp... and burn him on the wood with fire* (Leviticus 4:12) — the sin-offering carcass, its blood within, its body burned without.'),
    ('canon','leviticus',4,11,'canon','hebrews',13,11,'free',E'*For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). The skin, flesh, head, legs, inwards and dung of the bullock — *And the skin of the bullock, and all his flesh, with his head, and with his legs, and his inwards, and his dung* (Leviticus 4:11) — are precisely *the bodies of those beasts* that Hebrews says are burned without the camp, the whole carcass given to the fire outside.'),
    -- THREAD 3: the whole congregation sin through ignorance — corporate atonement
    ('canon','leviticus',4,13,'canon','numbers',15,24,'free',E'*Then it shall be, if ought be committed by ignorance without the knowledge of the congregation, that all the congregation shall offer one young bullock for a burnt offering... and one kid of the goats for a sin offering* (Numbers 15:24). Numbers gives the same corporate ignorance-offering as Leviticus: *And if the whole congregation of Yashar''el (Israel) sin through ignorance, and the thing be hid from the eyes of the assembly* (Leviticus 4:13) — the unwitting sin of the gathered people atoned by the congregation''s bullock.'),
    ('canon','leviticus',4,20,'canon','numbers',15,25,'free',E'*And the priest shall make an atonement for all the congregation of the children of Yashar''el (Israel), and it shall be forgiven them; for it is ignorance* (Numbers 15:25). The promise is identical to Leviticus: *the priest shall make an atonement for them, and it shall be forgiven them* (Leviticus 4:20) — corporate ignorance covered, the whole congregation forgiven through the offering.'),
    ('canon','leviticus',4,20,'canon','numbers',15,26,'free',E'*And it shall be forgiven all the congregation of the children of Yashar''el (Israel), and the stranger that sojourneth among them; seeing all the people were in ignorance* (Numbers 15:26). The same forgiveness extends to all the congregation — *the priest shall make an atonement for them, and it shall be forgiven them* (Leviticus 4:20) — the gathered people, native and sojourner, covered by the one atonement.'),
    -- THREAD 4: the blood upon the horns of the altar — graded offerers, one atonement
    ('canon','leviticus',4,25,'canon','leviticus',4,30,'free',E'*And the priest shall take of the blood thereof with his finger, and put it upon the horns of the altar of burnt offering* (Leviticus 4:30). The ruler''s blood-rite — *the priest shall take of the blood of the sin offering with his finger, and put it upon the horns of the altar of burnt offering* (Leviticus 4:25) — is the same as the common person''s: the offerer changes, the offering is graded, but the blood is put on the horns of the one altar for every rank alike.'),
    ('canon','leviticus',4,23,'canon','leviticus',4,28,'free',E'*Or if his sin, which he hath sinned, come to his knowledge: then he shall bring his offering, a kid of the goats, a female without blemish, for his sin which he hath sinned* (Leviticus 4:28). The graded scale is internal to the chapter: the ruler brings *a kid of the goats, a male without blemish* (Leviticus 4:23) and the common person the lesser female kid — responsibility scaled to station, yet the same chatat for the same kind of sin.'),
    -- THREAD 5: the priest shall make an atonement, and it shall be forgiven him
    ('canon','leviticus',4,26,'canon','hebrews',9,22,'free',E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). The refrain of the chapter — *the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him* (Leviticus 4:26) — rests on the principle Hebrews states outright: there is no forgiveness without shed blood, and the chatat is precisely the blood shed that remission may come.'),
    ('canon','leviticus',4,31,'canon','hebrews',9,22,'free',E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). *The priest shall make an atonement for him, and it shall be forgiven him* (Leviticus 4:31): the common person''s forgiveness is purchased the same way — blood on the altar, the law''s own purging, without which no sin is remitted.'),
    ('canon','leviticus',4,35,'canon','hebrews',9,22,'free',E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). The chapter closes on the same word — *the priest shall make an atonement for his sin that he hath committed, and it shall be forgiven him* (Leviticus 4:35) — every offerer, every rank, brought to forgiveness by the one law of atoning blood.'),
    ('canon','leviticus',4,35,'canon','1-john',1,7,'free',E'*But if we walk in the light, as he is in the light, we have fellowship one with another, and the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). The repeated chatat promise — *the priest shall make an atonement for his sin... and it shall be forgiven him* (Leviticus 4:35) — finds its substance in the cleansing blood of the Formed Son, the atonement of the sin offering reaching forward to the blood that cleanseth from all sin.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned',
       E'"If a soul shall sin through ignorance" — the unwitting sin atoned',
       E'The chatat (sin offering) opens with the case of the unwitting transgressor: *Speak unto the children of Yashar''el (Israel), saying, If a soul shall sin through ignorance against any of the commandments of Yahuah (LORD) concerning things which ought not to be done, and shall do against any of them* (Leviticus 4:2). Note what is NOT said: ignorance does not erase guilt. To err from the commandments — even unknowingly — is real sin against Yahuah, and the Torah itself supplies the remedy. The same statute is set down in Numbers: *And if ye have erred, and not observed all these commandments, which Yahuah (LORD) hath spoken unto Moses* (Numbers 15:22), and for the single soul, *And if any soul sin through ignorance, then he shall bring a she goat of the first year for a sin offering* (Numbers 15:27). Hebrews names this very category of the priestly blood: *into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7) — the errors of ignorance are exactly what the blood was given to cover. And at the cross the Formed Son pleads that same ground for those who put him to death: *Then said Yahusha (Jesus), Father, forgive them; for they know not what they do* (Luke 23:34). The commandment stands; the offering is the mercy provided for those who broke it unawares.',
       sv.verse_id, ev.verse_id, 'free', 22775
  FROM _s311_lev04_lookup sv, _s311_lev04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate',
       E'The bullock burned without the camp — he suffered without the gate',
       E'When the anointed priest sins, his blood-rite is the gravest of the chapter: *the priest that is anointed shall take of the bullock''s blood, and bring it to the tabernacle of the congregation: And the priest shall dip his finger in the blood, and sprinkle of the blood seven times before Yahuah (LORD), before the vail of the sanctuary* (Leviticus 4:5-6). The blood is brought IN. But the body is carried OUT: *And the skin of the bullock, and all his flesh, with his head, and with his legs, and his inwards, and his dung, Even the whole bullock shall he carry forth without the camp unto a clean place, where the ashes are poured out, and burn him on the wood with fire* (Leviticus 4:11-12). The Day of Atonement repeats the law exactly: *the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27). Hebrews names this very ordinance and reads its substance: *For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp. Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:11-12). The blood within, the body without: the sin-offering bullock burned outside the camp is the Formed Son crucified outside the gate, sanctifying the people with his own blood.',
       sv.verse_id, ev.verse_id, 'free', 22778
  FROM _s311_lev04_lookup sv, _s311_lev04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-4-if-the-whole-congregation-sin-through-ignorance-corporate-atonement',
       E'"If the whole congregation sin through ignorance" — corporate atonement',
       E'The chatat rises from the individual to the gathered people: *And if the whole congregation of Yashar''el (Israel) sin through ignorance, and the thing be hid from the eyes of the assembly, and they have done somewhat against any of the commandments of Yahuah (LORD) concerning things which should not be done, and are guilty* (Leviticus 4:13). The elders lay their hands on the bullock''s head for the whole body, and the promise comes: *the priest shall make an atonement for them, and it shall be forgiven them* (Leviticus 4:20). The same corporate ignorance-offering is set down in Numbers — *if ought be committed by ignorance without the knowledge of the congregation, that all the congregation shall offer one young bullock for a burnt offering... and one kid of the goats for a sin offering* (Numbers 15:24) — with the identical promise: *And the priest shall make an atonement for all the congregation of the children of Yashar''el (Israel), and it shall be forgiven them; for it is ignorance* (Numbers 15:25), reaching even *the stranger that sojourneth among them; seeing all the people were in ignorance* (Numbers 15:26). The whole congregation of Yashar''el (Israel), native and sojourner, covered by one bullock and one atonement — the two-house people held together under the same blood.',
       sv.verse_id, ev.verse_id, 'free', 22781
  FROM _s311_lev04_lookup sv, _s311_lev04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-4-the-blood-upon-the-horns-of-the-altar-graded-but-one-atonement',
       E'The blood upon the horns of the altar — graded, but one atonement',
       E'The chapter scales the offering to the station of the offerer, yet binds them all to one altar. When *a ruler hath sinned, and done somewhat through ignorance against any of the commandments of Yahuah Elohav (the LORD his God)* (Leviticus 4:22), he brings *a kid of the goats, a male without blemish* (Leviticus 4:23); when *any one of the common people sin through ignorance* (Leviticus 4:27), the lesser offering is brought — *a kid of the goats, a female without blemish, for his sin which he hath sinned* (Leviticus 4:28). Responsibility is graded by rank — the anointed priest and the whole congregation bring a bullock, the ruler a male kid, the common person a female kid — but the blood-rite is one and the same: *the priest shall take of the blood of the sin offering with his finger, and put it upon the horns of the altar of burnt offering* (Leviticus 4:25), and so likewise for the common person, *the priest shall take of the blood thereof with his finger, and put it upon the horns of the altar of burnt offering* (Leviticus 4:30). No man is too high to need the blood, and none too low to be covered by it; the horns of the one altar receive the blood for every rank alike.',
       sv.verse_id, ev.verse_id, 'free', 22784
  FROM _s311_lev04_lookup sv, _s311_lev04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=4 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him',
       E'"The priest shall make an atonement... and it shall be forgiven him"',
       E'The refrain that closes each case is the heartbeat of the chatat: *the priest shall make an atonement for him as concerning his sin, and it shall be forgiven him* (Leviticus 4:26), again for the common person, *the priest shall make an atonement for him, and it shall be forgiven him* (Leviticus 4:31), and once more at the chapter''s close, *the priest shall make an atonement for his sin that he hath committed, and it shall be forgiven him* (Leviticus 4:35). The mechanism is never moralism nor mere remorse — it is blood. Hebrews states the principle the chapter enacts: *almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). And the blood of the sin offering is the shadow whose substance cleanses utterly: *the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7). Every offerer, every rank, brought to the same forgiveness by the one law of atoning blood — the chatat pointing forward to the blood of the Formed Son that cleanseth from all sin.',
       sv.verse_id, ev.verse_id, 'free', 22787
  FROM _s311_lev04_lookup sv, _s311_lev04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=4 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1: the unwitting sin atoned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And if ye have erred, and not observed all these commandments* (Numbers 15:22) — the parallel statute: to err from the commandments is real guilt with a Torah-given remedy.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And if any soul sin through ignorance, then he shall bring a she goat of the first year for a sin offering* (Numbers 15:27) — the individual unwitting sin, same provision as the chatat.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7) — the priestly blood given precisely for the errors of ignorance.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Father, forgive them; for they know not what they do* (Luke 23:34) — the Formed Son pleads the chatat ground: sin in ignorance, opened to atonement.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-a-soul-shall-sin-through-ignorance-the-unwitting-sin-atoned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the bullock burned without the camp
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the skin of the bullock, and all his flesh, with his head, and with his legs, and his inwards, and his dung* (Leviticus 4:11) is *the bodies of those beasts* burned without the camp (Hebrews 13:11) — the whole carcass to the fire outside.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11) — blood in, body out, the ordinance of Leviticus 4:12 named.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Wherefore Yahusha (Jesus) also... suffered without the gate* (Hebrews 13:12) — the bullock burned without the camp is the Formed Son crucified outside the gate.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27) — the Day of Atonement repeats the same law of the sin-offering carcass.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-bullock-burned-without-the-camp-he-suffered-without-the-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: corporate atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if ought be committed by ignorance without the knowledge of the congregation, that all the congregation shall offer one young bullock* (Numbers 15:24) — the same corporate ignorance-offering.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-the-whole-congregation-sin-through-ignorance-corporate-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the priest shall make an atonement for all the congregation... and it shall be forgiven them; for it is ignorance* (Numbers 15:25) — the identical promise to Leviticus 4:20.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-the-whole-congregation-sin-through-ignorance-corporate-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*it shall be forgiven all the congregation... and the stranger that sojourneth among them* (Numbers 15:26) — native and sojourner covered by the one atonement.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=15 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-if-the-whole-congregation-sin-through-ignorance-corporate-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the blood upon the horns of the altar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*put it upon the horns of the altar of burnt offering* (Leviticus 4:30) — the common person''s blood-rite is the same as the ruler''s (4:25): one altar for every rank.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-blood-upon-the-horns-of-the-altar-graded-but-one-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a kid of the goats, a female without blemish, for his sin which he hath sinned* (Leviticus 4:28) — the lesser offering of the common person against the ruler''s male kid (4:23): responsibility graded to station.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-blood-upon-the-horns-of-the-altar-graded-but-one-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the priest shall make an atonement, and it shall be forgiven him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*without shedding of blood is no remission* (Hebrews 9:22) — the ruler''s forgiveness (4:26) rests on the principle of atoning blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*without shedding of blood is no remission* (Hebrews 9:22) — the common person''s forgiveness (4:31) purchased the same way, by the law''s own purging blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=31
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*without shedding of blood is no remission* (Hebrews 9:22) — the chapter''s closing atonement (4:35) brought to forgiveness by the one law of atoning blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the blood of Yahusha HaMashiach (Jesus Christ) his Son cleanseth us from all sin* (1 John 1:7) — the chatat''s forgiveness (4:35) finds its substance in the cleansing blood of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s311_lev04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-4-the-priest-shall-make-an-atonement-and-it-shall-be-forgiven-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_5.sql (Leviticus 5) -----
-- Book: Leviticus  Chapter: 5  | session prefix s311 | tag lev05
-- Temp view: _s311_lev05_lookup
-- Sort band base 22800, step 3  (22800, 22803, 22806, 22809)
-- All targets are canon (Tanakh + NT) -> every thread tier_required='free'.
--
-- Leviticus 5 coverage:
--   v.1-6  NT:     1 John 1:9 (confession precedes forgiveness) -- USED
--          Extras: none warranted (the confession-before-atonement weave is fully canon)
--          Tanakh: Numbers 5:6-7, Psalm 32:5, Proverbs 28:13 -- USED
--   v.7-13 NT:     Luke 2:24 (the poor family's turtledove offering) -- USED
--          Extras: none warranted
--          Tanakh: Leviticus 1:14 (fowls for the burnt offering), Leviticus 12:8 (poor mother's two birds) -- USED
--   v.14-16 NT:    Luke 19:8 (Zacchaeus: restitution fourfold) -- USED
--          Extras: none warranted
--          Tanakh: Numbers 5:7 (recompense + the fifth part), Exodus 22:1 (restitution for theft) -- USED
--   v.17-19 NT:    none warranted (the secret-fault weave is carried by Psalm 19)
--          Extras: none warranted
--          Tanakh: Psalm 19:12 (cleanse thou me from secret faults) -- USED
--
-- Threads (4):
--   leviticus-5-when-he-shall-be-guilty-he-shall-confess   [free] -> canon: 1-john, numbers, psalms, proverbs
--   leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability  [free] -> canon: luke, leviticus
--   leviticus-5-he-shall-add-the-fifth-part-thereto-restitution  [free] -> canon: luke, numbers, exodus
--   leviticus-5-though-he-wist-it-not-yet-is-he-guilty-secret-faults  [free] -> canon: psalms
--
-- Framework notes: 5:5-6 confession (he shall CONFESS that he hath sinned) is the act that
-- precedes atonement -- the same order 1 John 1:9 names (if we confess... he is faithful and
-- just to forgive). 5:7-13 graded provision is Yahuah's mercy reaching the poorest -- the very
-- offering the Messiah's own poor family brings (Luke 2:24). 5:16 restitution + the fifth part
-- = repentance with reparation, fulfilled in Zacchaeus. 5:17 guilt though he wist it not =
-- the secret faults of Psalm 19:12. No Torah-as-curse reading: atonement is covenant mercy.

CREATE TEMP VIEW _s311_lev05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: confession before atonement (5:5-6)
    ('canon','leviticus',5,5,'canon','1-john',1,9,'free',
     E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). The trespass offering of Leviticus 5 is reached only through an open mouth: *when he shall be guilty in one of these things, that he shall confess that he hath sinned in that thing* (Leviticus 5:5). Confession is the act that precedes atonement -- the same order the apostle names, the faithful and just forgiveness that the priest''s atonement always pointed toward.'),
    ('canon','leviticus',5,6,'canon','1-john',1,9,'free',
     E'*If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). After the confession comes the blood: *he shall bring his trespass offering unto Yahuah (LORD) for his sin which he hath sinned... and the priest shall make an atonement for him concerning his sin* (Leviticus 5:6). The cleansing-from-all-unrighteousness is the fulfilled atonement the trespass offering prefigured.'),
    ('canon','leviticus',5,5,'canon','numbers',5,7,'free',
     E'*Then they shall confess their sin which they have done: and he shall recompense his trespass...* (Numbers 5:7). The parallel Torah law of the trespass offering names the same first step Leviticus 5:5 requires -- *he shall confess that he hath sinned* -- confession spoken before recompense and atonement are made.'),
    ('canon','leviticus',5,5,'canon','psalms',32,5,'free',
     E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin.* (Psalm 32:5). David sings the very motion Leviticus 5:5 commands -- *he shall confess that he hath sinned* -- and Yahuah''s forgiveness follows the unhidden confession.'),
    ('canon','leviticus',5,5,'canon','proverbs',28,13,'free',
     E'*He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* (Proverbs 28:13). Wisdom states the principle of Leviticus 5:5 -- the guilty man who will *confess that he hath sinned* finds mercy, while the one who covers it forfeits the atonement.'),
    -- Thread 2: graded provision for the poor (5:7, 5:11, 5:13)
    ('canon','leviticus',5,7,'canon','luke',2,24,'free',
     E'*And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons.* (Luke 2:24). The Messiah''s own family brings the poor man''s offering of Leviticus 5:7 -- *if he be not able to bring a lamb, then he shall bring... two turtledoves, or two young pigeons* -- atonement graded down to the reach of the lowly, fulfilled in the household that received the Lamb himself.'),
    ('canon','leviticus',5,11,'canon','luke',2,24,'free',
     E'*And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons.* (Luke 2:24). Even below the birds the Torah descends -- *the tenth part of an ephah of fine flour* (Leviticus 5:11) -- so that no poverty bars the way to atonement; the pigeon offering Mary brings is itself the lower rung Yahuah''s mercy provided.'),
    ('canon','leviticus',5,7,'canon','leviticus',1,14,'free',
     E'*And if the burnt sacrifice for his offering to Yahuah (LORD) be of fowls, then he shall bring his offering of turtledoves, or of young pigeons.* (Leviticus 1:14). The same gracious provision opens the burnt offering law -- the poor man''s bird stands beside the rich man''s bullock -- so Leviticus 5:7''s *two turtledoves, or two young pigeons* belongs to a Torah already shaped to the poor.'),
    ('canon','leviticus',5,7,'canon','leviticus',12,8,'free',
     E'*And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons...* (Leviticus 12:8). The purification law repeats Leviticus 5:7''s exact mercy almost word for word -- *if he be not able to bring a lamb* -- and this is the very text Luke 2:24 cites of the Messiah''s poor mother, the threads bound together.'),
    -- Thread 3: restitution + the fifth part (5:16)
    ('canon','leviticus',5,16,'canon','luke',19,8,'free',
     E'*And Zacchaeus stood, and said unto Yahuah (Lord); Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold.* (Luke 19:8). Zacchaeus lives out Leviticus 5:16 -- *he shall make amends for the harm that he hath done... and shall add the fifth part thereto* -- repentance that does not merely confess but restores, the trespass-offering principle made flesh.'),
    ('canon','leviticus',5,16,'canon','numbers',5,7,'free',
     E'*Then they shall confess their sin which they have done: and he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof...* (Numbers 5:7). The companion law states Leviticus 5:16''s reparation in the same measure -- the principal plus *the fifth part thereto* -- restitution to the wronged is bound into the trespass offering itself.'),
    ('canon','leviticus',5,16,'canon','exodus',22,1,'free',
     E'*If a man shall steal an ox, or a sheep, and kill it, or sell it; he shall restore five oxen for an ox, and four sheep for a sheep.* (Exodus 22:1). The covenant law of restitution stands behind Leviticus 5:16''s *he shall make amends for the harm that he hath done* -- the harm done to another must be repaid, with addition, before atonement is complete.'),
    -- Thread 4: guilt of secret / unknown sin (5:17)
    ('canon','leviticus',5,17,'canon','psalms',19,12,'free',
     E'*Who can understand his errors? cleanse thou me from secret faults.* (Psalm 19:12). Leviticus 5:17 weighs the sin a man does not even know he did -- *though he wist it not, yet is he guilty, and shall bear his iniquity* -- and David prays the answer to that hidden guilt: cleansing from the secret faults no man can see in himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-5-when-he-shall-be-guilty-he-shall-confess',
       E'Leviticus 5: When He Shall Be Guilty, He Shall Confess',
       E'The trespass offering does not begin with blood; it begins with a spoken mouth. *And it shall be, when he shall be guilty in one of these things, that he shall confess that he hath sinned in that thing* (Leviticus 5:5), and only then *he shall bring his trespass offering unto Yahuah (LORD) for his sin which he hath sinned... and the priest shall make an atonement for him concerning his sin* (Leviticus 5:6). Confession precedes atonement -- this is the unbroken order of the covenant. The companion law says it the same way: *Then they shall confess their sin which they have done* (Numbers 5:7). David sings it: *I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5). Wisdom warns the man who reverses it: *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13). And the apostle names the faithful forgiveness the whole offering pointed toward: *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness* (1 John 1:9). The cleansing is mercy, never a defunct ritual -- the same just God forgiving the confessed sin.',
       sv.verse_id, ev.verse_id, 'free', 22800
  FROM _s311_lev05_lookup sv, _s311_lev05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability',
       E'Leviticus 5: If He Be Not Able to Bring a Lamb -- Mercy Graded to Ability',
       E'Yahuah''s atonement is built so that no poverty can shut a man out. If he cannot bring the lamb of verse 6, the Torah descends: *And if he be not able to bring a lamb, then he shall bring for his trespass... two turtledoves, or two young pigeons* (Leviticus 5:7); and if even the birds are beyond him, *the tenth part of an ephah of fine flour for a sin offering* (Leviticus 5:11) -- *and it shall be forgiven him* (Leviticus 5:13). The same gracious provision opens the burnt-offering law -- *if the burnt sacrifice... be of fowls, then he shall bring his offering of turtledoves, or of young pigeons* (Leviticus 1:14) -- and the purification law repeats it nearly word for word: *And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons* (Leviticus 12:8). That lowest rung is the very offering the Messiah''s own poor family brings: *And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons* (Luke 2:24). The Lamb himself was received in a house that could only afford the poor man''s birds -- mercy graded to ability, written into Torah from the start.',
       sv.verse_id, ev.verse_id, 'free', 22803
  FROM _s311_lev05_lookup sv, _s311_lev05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-5-he-shall-add-the-fifth-part-thereto-restitution',
       E'Leviticus 5: He Shall Add the Fifth Part Thereto -- Repentance That Restores',
       E'The trespass offering for the holy things is not satisfied by sacrifice alone; the harm done must be repaid. *And he shall make amends for the harm that he hath done in the holy thing, and shall add the fifth part thereto, and give it unto the priest: and the priest shall make an atonement for him with the ram of the trespass offering, and it shall be forgiven him* (Leviticus 5:16). The companion law states the same measure -- *he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof* (Numbers 5:7) -- and the covenant law of theft demands restitution multiplied: *he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1). True repentance does not merely confess; it returns what was taken, with addition. Zacchaeus lives the law out before the Messiah''s eyes: *Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8) -- the trespass-offering principle made flesh, the heart that adds the fifth part and more.',
       sv.verse_id, ev.verse_id, 'free', 22806
  FROM _s311_lev05_lookup sv, _s311_lev05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-5-though-he-wist-it-not-yet-is-he-guilty-secret-faults',
       E'Leviticus 5: Though He Wist It Not, Yet Is He Guilty -- The Secret Faults',
       E'The Torah weighs even the sin a man never knew he committed. *And if a soul sin, and commit any of these things which are forbidden to be done by the commandments of Yahuah (LORD); though he wist it not, yet is he guilty, and shall bear his iniquity* (Leviticus 5:17), and the priest *shall make an atonement for him concerning his ignorance wherein he erred and wist it not, and it shall be forgiven him* (Leviticus 5:18). Guilt before Yahuah is not measured by what the conscience happened to notice. David prays the only answer to that hidden weight: *Who can understand his errors? cleanse thou me from secret faults* (Psalm 19:12). The unknown trespass still needs atonement; the secret fault still needs cleansing -- and Yahuah''s provision reaches even the sin the sinner cannot see.',
       sv.verse_id, ev.verse_id, 'free', 22809
  FROM _s311_lev05_lookup sv, _s311_lev05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If we confess our sins, he is faithful and just to forgive us our sins...* (1 John 1:9) -- the forgiveness that follows confession, the answer to Leviticus 5:5.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-when-he-shall-be-guilty-he-shall-confess'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If we confess our sins, he is faithful and just to forgive us...* (1 John 1:9) -- the atonement of Leviticus 5:6 fulfilled in the cleansing from all unrighteousness.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-when-he-shall-be-guilty-he-shall-confess'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then they shall confess their sin which they have done...* (Numbers 5:7) -- the companion trespass law names the same first step as Leviticus 5:5.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-when-he-shall-be-guilty-he-shall-confess'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5) -- David lives the motion Leviticus 5:5 commands.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-when-he-shall-be-guilty-he-shall-confess'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...whoso confesseth and forsaketh them shall have mercy* (Proverbs 28:13) -- wisdom states the principle of the confessing penitent in Leviticus 5:5.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-when-he-shall-be-guilty-he-shall-confess'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A pair of turtledoves, or two young pigeons* (Luke 2:24) -- the Messiah''s poor family brings the very offering of Leviticus 5:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A pair of turtledoves, or two young pigeons* (Luke 2:24) -- even below the birds (fine flour, Leviticus 5:11), the pigeon offering remains within the poor''s reach.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...then he shall bring his offering of turtledoves, or of young pigeons* (Leviticus 1:14) -- the burnt-offering law also makes room for the poor man''s bird.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons* (Leviticus 12:8) -- the purification law repeats Leviticus 5:7''s mercy; it is the text Luke 2:24 cites.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-if-he-be-not-able-to-bring-a-lamb-mercy-graded-to-ability'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8) -- Zacchaeus lives out the restitution of Leviticus 5:16.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-he-shall-add-the-fifth-part-thereto-restitution'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...and add unto it the fifth part thereof* (Numbers 5:7) -- the companion law states Leviticus 5:16''s exact measure of reparation.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-he-shall-add-the-fifth-part-thereto-restitution'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...he shall restore five oxen for an ox, and four sheep for a sheep* (Exodus 22:1) -- the covenant restitution law behind Leviticus 5:16''s amends for harm done.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-he-shall-add-the-fifth-part-thereto-restitution'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who can understand his errors? cleanse thou me from secret faults* (Psalm 19:12) -- David prays the answer to the unknown guilt of Leviticus 5:17.'
  FROM cross_reference_threads t
  JOIN _s311_lev05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s311_lev05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-5-though-he-wist-it-not-yet-is-he-guilty-secret-faults'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session311 — Leviticus cross-references complete.'
