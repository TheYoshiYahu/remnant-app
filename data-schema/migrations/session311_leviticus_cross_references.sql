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

-- ----- fragment: minion_leviticus_6.sql (Leviticus 6) -----
--
-- Book: Leviticus  Chapter: 6   Tag: lev06   Session prefix: s311
-- Sort band base: 22825, step 3  -> 22825, 22828, 22831, 22834, 22837
-- Temp view: _s311_lev06_lookup
--
-- FRAMING: Leviticus 6 gathers the priestly "laws" of the offerings — the trespass against a
-- neighbour and its restitution (vv.1-7), the law of the burnt offering with the perpetual
-- altar-fire (vv.8-13), the law of the meat offering most holy and unleavened (vv.14-18), the
-- priest's daily meal offering at his anointing wholly burnt (vv.19-23), and the law of the sin
-- offering most holy (vv.24-30). The chapter shows the Torah as the living covenant instruction:
-- sin against the neighbour is sin against Yahuah and demands restitution before atonement; the
-- devotion-fire never goes out; the holiness of the offerings is transmitted. The NT does not
-- abolish these — it fills them (first be reconciled; quench not the Spirit; keep the feast
-- unleavened; Messiah our passover).
--
-- Lev 6 coverage:
--   v.1   NT: none warranted   Extras: none warranted   Tanakh: none warranted (speech formula)
--   v.2-3 NT: none direct      Extras: none warranted   Tanakh: Num 5:6 / Exod 22:7 (trespass-against-neighbour) [thread 1]
--   v.4   NT: Eph 4:28 (restore/labour)  Extras: none   Tanakh: Exod 22:9 [thread 1]
--   v.5   NT: Luke 19:8 (Zacchaeus restores) / Matt 5:23-24 (be reconciled first)  Extras: none  Tanakh: Num 5:7 (add the fifth part) [thread 1]
--   v.6-7 NT: none direct      Extras: none warranted   Tanakh: covered by thread 1 (ram/atonement)
--   v.8   NT: none warranted   Extras: none warranted   Tanakh: none (speech formula)
--   v.9   NT: none direct      Extras: none warranted   Tanakh: Lev 9:24 (fire out from Yahuah) [thread 2]
--   v.10-11 NT: none warranted Extras: none warranted   Tanakh: none warranted (ashes/garments)
--   v.12  NT: 1 Thess 5:19 (quench not) / Rom 12:11 (fervent)  Extras: none  Tanakh: thread 2
--   v.13  NT: 2 Tim 1:6 (stir up the gift)  Extras: none  Tanakh: thread 2 (fire never go out)
--   v.14-15 NT: none direct    Extras: none warranted    Tanakh: Lev 2:1 (law of the meat offering) [thread 3]
--   v.16-17 NT: 1 Cor 5:7-8 (unleavened, keep the feast)  Extras: none  Tanakh: Lev 2:3 / Lev 2:11 (most holy, no leaven) [thread 3]
--   v.18  NT: none direct      Extras: none warranted    Tanakh: thread 3 (touch them shall be holy)
--   v.19  NT: none warranted   Extras: none warranted    Tanakh: none (speech formula)
--   v.20-23 NT: none direct    Extras: none warranted    Tanakh: Exod 29:38 / 29:39 / 29:42 (continual offering) [thread 4]
--   v.24  NT: none warranted   Extras: none warranted    Tanakh: none (speech formula)
--   v.25  NT: none direct      Extras: none warranted    Tanakh: Lev 4:3 / 4:24 / 4:29 / 4:33 (law of the sin offering, slain where the burnt offering) [thread 5]
--   v.26-30 NT: none direct    Extras: none warranted    Tanakh: thread 5 (most holy, blood)
--
-- Threads (5):
--   1. leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part  (Tanakh + NT) band 22825
--   2. leviticus-6-the-fire-upon-the-altar-shall-never-go-out  (Tanakh + NT) band 22828
--   3. leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy  (Tanakh + NT) band 22831
--   4. leviticus-6-the-priests-daily-offering-at-his-anointing-wholly-burnt  (Tanakh only) band 22834
--   5. leviticus-6-the-law-of-the-sin-offering-it-is-most-holy  (Tanakh only) band 22837
--

CREATE TEMP VIEW _s311_lev06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: trespass against the neighbour, restore and add the fifth part
    ('canon','leviticus',6,2,'canon','numbers',5,6,'free',
      E'*Speak unto the children of Yashar''el (Israel), When a man or woman shall commit any sin that men commit, to do a trespass against Yahuah (LORD), and that person be guilty;* (Numbers 5:6). The companion law makes plain what Leviticus 6 assumes: when a soul will *lie unto his neighbour in that which was delivered him to keep, or in fellowship, or in a thing taken away by violence* (Leviticus 6:2), the wrong against the neighbour is *a trespass against Yahuah (LORD)*. There is no purely horizontal sin.'),
    ('canon','leviticus',6,5,'canon','numbers',5,7,'free',
      E'*Then they shall confess their sin which they have done: and he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof, and give it unto him against whom he hath trespassed.* (Numbers 5:7). The identical measure of Leviticus 6:5 — *he shall even restore it in the principal, and shall add the fifth part more thereto* — restitution is not optional almsgiving but the very shape of repentance: confess, restore the principal, add the fifth.'),
    ('canon','leviticus',6,2,'canon','exodus',22,7,'free',
      E'*If a man shall deliver unto his neighbour money or stuff to keep, and it be stolen out of the man''s house; if the thief be found, let him pay double.* (Exodus 22:7). The case of the deposit betrayed in Exodus stands behind Leviticus 6:2''s *which was delivered him to keep* — the Torah binds the keeper of another man''s goods, and a breach of that trust is reckoned before Yahuah.'),
    ('canon','leviticus',6,4,'canon','exodus',22,9,'free',
      E'*For all manner of trespass, whether it be for ox, for ass, for sheep, for raiment, or for any manner of lost thing, which another challengeth to be his, the cause of both parties shall come before the judges; and whom the judges shall condemn, he shall pay double unto his neighbour.* (Exodus 22:9). The same *lost thing* of Leviticus 6:4 — *the lost thing which he found* — is adjudicated here; the Torah''s civil law and its altar-law are one cloth, and both demand the wrong be made right.'),
    ('canon','leviticus',6,5,'canon','luke',19,8,'free',
      E'*And Zacchæus stood, and said unto Yahuah (Lord); Behold, Yahuah (Lord), the half of my goods I give to the poor; and if I have taken any thing from any man by false accusation, I restore him fourfold.* (Luke 19:8). Zacchaeus does Leviticus 6 exactly — having *deceived his neighbour* (Leviticus 6:2), he restores the principal and adds to it. Salvation comes to his house not by faith severed from obedience but by repentance that restores; the Torah''s restitution is written on his heart.'),
    ('canon','leviticus',6,5,'canon','matthew',5,24,'free',
      E'*Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift.* (Matthew 5:24). Leviticus 6 sets the order Messiah keeps: the trespasser must *give it unto him to whom it appertaineth, in the day of his trespass offering* (Leviticus 6:5) — make right with the brother before bringing the offering. The gift at the altar is not accepted over an unhealed wrong against the neighbour.'),
    ('canon','leviticus',6,4,'canon','ephesians',4,28,'free',
      E'*Let him that stole steal no more: but rather let him labour, working with his hands the thing which is good, that he may have to give to him that needeth.* (Ephesians 4:28). The same turning Leviticus 6:4 commands — *he shall restore that which he took violently away, or the thing which he hath deceitfully gotten* — the apostolic word does not abolish but applies: the one who took by violence now labours and gives. Repentance reverses the trespass.'),

    -- Thread 2: the fire upon the altar shall never go out
    ('canon','leviticus',6,9,'canon','leviticus',9,24,'free',
      E'*And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces.* (Leviticus 9:24). The fire that Leviticus 6:9 commands to be kept — *the fire of the altar shall be burning in it* — is the very fire Yahuah Himself sent down from before His presence. The priests guard a kindling that is not their own; it descended from heaven and must never be let die.'),
    ('canon','leviticus',6,12,'canon','1-thessalonians',5,19,'free',
      E'*Quench not the Spirit.* (1 Thessalonians 5:19). Leviticus 6:12 charges *the fire upon the altar shall be burning in it; it shall not be put out* — and the apostolic word reaches the same charge inward. The altar-fire that may never be quenched is the figure of the Ruach (Spirit) that must not be smothered; devotion is a flame to be fed every morning, never let go cold.'),
    ('canon','leviticus',6,12,'canon','romans',12,11,'free',
      E'*Not slothful in business; fervent in spirit; serving Yahuah (Lord);* (Romans 12:11). The morning wood laid on the altar so that *the fire upon the altar shall be burning in it; it shall not be put out* (Leviticus 6:12) is the picture of the *fervent in spirit* heart — the believer keeps the fire of service burning, adding fuel daily lest the flame fall slack.'),
    ('canon','leviticus',6,13,'canon','2-timothy',1,6,'free',
      E'*Wherefore I put thee in remembrance that thou stir up the gift of Elohim (God), which is in thee by the putting on of my hands.* (2 Timothy 1:6). *The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13) — and Paul charges Timothy to *stir up the gift*, to fan the coals back to flame. The perpetual altar-fire becomes the pattern of a gift that must be tended, never allowed to die down to ash.'),

    -- Thread 3: the law of the meat offering, unleavened and most holy
    ('canon','leviticus',6,14,'canon','leviticus',2,1,'free',
      E'*And when any will offer a meat offering unto Yahuah (LORD), his offering shall be of fine flour; and he shall pour oil upon it, and put frankincense thereon:* (Leviticus 2:1). Leviticus 6:14 opens *the law of the meat offering* that Leviticus 2 first set forth — flour, oil, frankincense; chapter 6 now gives the priests'' portion of that same offering. The instruction is one continuous Torah, the offering described and then its handling commanded.'),
    ('canon','leviticus',6,17,'canon','leviticus',2,3,'free',
      E'*And the remnant of the meat offering shall be Aaron''s and his sons'': it is a thing most holy of the offerings of Yahuah (LORD) made by fire.* (Leviticus 2:3). Leviticus 6:17 echoes it — *it is most holy, as is the sin offering, and as the trespass offering* — the priests'' bread is not common food but holy, and Leviticus 6:18 adds that *every one that toucheth them shall be holy*: the holiness is contagious, set apart unto Yahuah.'),
    ('canon','leviticus',6,17,'canon','leviticus',2,11,'free',
      E'*No meat offering, which ye shall bring unto Yahuah (LORD), shall be made with leaven: for ye shall burn no leaven, nor any honey, in any offering of Yahuah (LORD) made by fire.* (Leviticus 2:11). The ban Leviticus 6:16-17 repeats — *with unleavened bread shall it be eaten... It shall not be baken with leaven* — leaven, the figure of corruption puffing up, has no place in what is offered to Yahuah.'),
    ('canon','leviticus',6,17,'canon','1-corinthians',5,8,'free',
      E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth.* (1 Corinthians 5:8). The unleavened rule of Leviticus 6:16-17 is not abolished but unfolded: *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7), and so the apostle says *let us keep the feast* — the appointed time stands, the leaven of corruption still purged out.'),

    -- Thread 4: the priest's daily offering at his anointing, wholly burnt
    ('canon','leviticus',6,20,'canon','exodus',29,38,'free',
      E'*Now this is that which thou shalt offer upon the altar; two lambs of the first year day by day continually.* (Exodus 29:38). The priest''s own meal offering of Leviticus 6:20 — *half of it in the morning, and half thereof at night* — keeps the rhythm of the continual offering Yahuah set at the consecration of the altar: morning and evening, day by day, without ceasing.'),
    ('canon','leviticus',6,20,'canon','exodus',29,39,'free',
      E'*The one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even:* (Exodus 29:39). The twofold daily measure of Leviticus 6:20 — *half of it in the morning, and half thereof at night* — mirrors the morning-and-evening lambs; the priest who offers for the people also brings his own perpetual offering on the same unbroken schedule.'),
    ('canon','leviticus',6,22,'canon','exodus',29,42,'free',
      E'*This shall be a continual burnt offering throughout your generations at the door of the tabernacle of the congregation before Yahuah (LORD): where I will meet you, to speak there unto thee.* (Exodus 29:42). Leviticus 6:22 calls the priest''s offering *a statute for ever unto Yahuah (LORD); it shall be wholly burnt* — wholly given, never eaten; the one who mediates keeps nothing back, an offering consumed entirely before the One who meets His people at the door.'),

    -- Thread 5: the law of the sin offering, it is most holy
    ('canon','leviticus',6,25,'canon','leviticus',4,3,'free',
      E'*If the priest that is anointed do sin according to the sin of the people; then let him bring for his sin, which he hath sinned, a young bullock without blemish unto Yahuah (LORD) for a sin offering.* (Leviticus 4:3). Leviticus 6:25 gives *the law of the sin offering* that Leviticus 4 first instituted; chapter 6 now adds where it is slain and how its holiness is handled — the same offering, the instruction completed.'),
    ('canon','leviticus',6,25,'canon','leviticus',4,24,'free',
      E'*And he shall lay his hand upon the head of the goat, and kill it in the place where they kill the burnt offering before Yahuah (LORD): it is a sin offering.* (Leviticus 4:24). The very rule Leviticus 6:25 states — *In the place where the burnt offering is killed shall the sin offering be killed before Yahuah (LORD): it is most holy* — the sin offering and the burnt offering share one holy ground; sin is dealt with at the same altar where devotion ascends.'),
    ('canon','leviticus',6,25,'canon','leviticus',4,29,'free',
      E'*And he shall lay his hand upon the head of the sin offering, and slay the sin offering in the place of the burnt offering.* (Leviticus 4:29). Leviticus 6:25 binds the common people''s sin offering to the same holy place — *In the place where the burnt offering is killed shall the sin offering be killed* — one appointed ground for the lifting away of sin, declared *most holy*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part',
       E'The trespass against the neighbour — restore, and add the fifth part',
       E'Leviticus 6 opens with sin against the neighbour, and reads it as sin against Yahuah: *If a soul sin, and commit a trespass against Yahuah (LORD), and lie unto his neighbour in that which was delivered him to keep, or in fellowship, or in a thing taken away by violence, or hath deceived his neighbour* (Leviticus 6:2). The horizontal wrong is a vertical trespass — Numbers 5:6 names the same act *a trespass against Yahuah (LORD)*. The remedy is restitution before atonement: *he shall even restore it in the principal, and shall add the fifth part more thereto, and give it unto him to whom it appertaineth, in the day of his trespass offering* (Leviticus 6:5), exactly as *he shall recompense his trespass with the principal thereof, and add unto it the fifth part thereof* (Numbers 5:7). The civil law stands behind it — the betrayed deposit and the lost-and-denied thing of *Exodus 22:7* and *Exodus 22:9*. And the Torah''s restitution is no defunct ordinance: Zacchaeus does it — *if I have taken any thing from any man by false accusation, I restore him fourfold* (Luke 19:8); Messiah commands its order — *first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24); and the apostle applies it — *let him that stole steal no more: but rather let him labour... that he may have to give to him that needeth* (Ephesians 4:28). The gift at the altar is never accepted over an unhealed wrong against the brother.',
       sv.verse_id, ev.verse_id, 'free', 22825
  FROM _s311_lev06_lookup sv, _s311_lev06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-6-the-fire-upon-the-altar-shall-never-go-out',
       E'The fire upon the altar shall never go out',
       E'The law of the burnt offering centres on a flame that may never die: *the fire of the altar shall be burning in it* (Leviticus 6:9), *the fire upon the altar shall be burning in it; it shall not be put out* (Leviticus 6:12), *The fire shall ever be burning upon the altar; it shall never go out* (Leviticus 6:13). This is no ordinary kindling — it descended from Yahuah Himself: *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat* (Leviticus 9:24). The priests are keepers of a heaven-sent flame, feeding it wood every morning lest it fall cold. The apostolic word reaches the same charge inward: *Quench not the Spirit* (1 Thessalonians 5:19); *Not slothful in business; fervent in spirit; serving Yahuah (Lord)* (Romans 12:11); *stir up the gift of Elohim (God), which is in thee* (2 Timothy 1:6). The perpetual altar-fire is the figure of a devotion and a Ruach (Spirit) that must be tended daily, never let go out.',
       sv.verse_id, ev.verse_id, 'free', 22828
  FROM _s311_lev06_lookup sv, _s311_lev06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy',
       E'The law of the meat offering — unleavened, and most holy',
       E'Leviticus 6:14 opens *the law of the meat offering* that Leviticus 2 first set forth — *his offering shall be of fine flour; and he shall pour oil upon it, and put frankincense thereon* (Leviticus 2:1) — and now gives the priests their portion of it: *the remainder thereof shall Aaron and his sons eat: with unleavened bread shall it be eaten in the holy place* (Leviticus 6:16). It carries Leviticus 2''s holiness — *it is a thing most holy of the offerings of Yahuah (LORD) made by fire* (Leviticus 2:3) — and its ban on leaven — *shall ye burn no leaven, nor any honey, in any offering of Yahuah (LORD) made by fire* (Leviticus 2:11). Leviticus 6:17 binds both: *It shall not be baken with leaven... it is most holy*; and 6:18 adds the holiness is contagious — *every one that toucheth them shall be holy*. The NT does not abolish the rule but unfolds it: *Messiah (Christ) our passover is sacrificed for us* — *Therefore let us keep the feast, not with old leaven... but with the unleavened bread of sincerity and truth* (1 Corinthians 5:7-8). The appointed time stands; the leaven of corruption is still purged out.',
       sv.verse_id, ev.verse_id, 'free', 22831
  FROM _s311_lev06_lookup sv, _s311_lev06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-6-the-priests-daily-offering-at-his-anointing-wholly-burnt',
       E'The priest''s daily offering at his anointing — wholly burnt',
       E'The priest who offers for the people brings also his own perpetual offering: *the tenth part of an ephah of fine flour for a meat offering perpetual, half of it in the morning, and half thereof at night* (Leviticus 6:20), and *it is a statute for ever unto Yahuah (LORD); it shall be wholly burnt* (Leviticus 6:22) — wholly given, *it shall not be eaten* (Leviticus 6:23). This keeps the rhythm Yahuah set at the consecration of the altar: *two lambs of the first year day by day continually* (Exodus 29:38), *The one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* (Exodus 29:39), *a continual burnt offering throughout your generations at the door of the tabernacle of the congregation before Yahuah (LORD): where I will meet you, to speak there unto thee* (Exodus 29:42). The mediator keeps nothing of his own offering back; it is consumed entirely, morning and evening, before the One who meets His people.',
       sv.verse_id, ev.verse_id, 'free', 22834
  FROM _s311_lev06_lookup sv, _s311_lev06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-6-the-law-of-the-sin-offering-it-is-most-holy',
       E'The law of the sin offering — it is most holy',
       E'Leviticus 6:25 gives *the law of the sin offering* that Leviticus 4 first instituted — *let him bring for his sin... a young bullock without blemish unto Yahuah (LORD) for a sin offering* (Leviticus 4:3) — and now declares where it is slain: *In the place where the burnt offering is killed shall the sin offering be killed before Yahuah (LORD): it is most holy* (Leviticus 6:25). That is the very ground Leviticus 4 appointed — *kill it in the place where they kill the burnt offering before Yahuah (LORD): it is a sin offering* (Leviticus 4:24); *slay the sin offering in the place of the burnt offering* (Leviticus 4:29). Sin and devotion are dealt with on one holy ground. The chapter underscores its holiness — *Whatsoever shall touch the flesh thereof shall be holy* (Leviticus 6:27), *All the males among the priests shall eat thereof: it is most holy* (Leviticus 6:29). The lifting away of sin is no common thing; it is most holy unto Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 22837
  FROM _s311_lev06_lookup sv, _s311_lev06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=6 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*to do a trespass against Yahuah (LORD)* (Numbers 5:6) — the wrong against the neighbour is named a trespass against Yahuah; no purely horizontal sin.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*add unto it the fifth part thereof* (Numbers 5:7) — the identical measure: confess, restore the principal, add the fifth.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*money or stuff to keep* (Exodus 22:7) — the betrayed deposit behind *which was delivered him to keep* (Leviticus 6:2).'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*any manner of lost thing* (Exodus 22:9) — the same lost-and-denied thing of *the lost thing which he found* (Leviticus 6:4), adjudicated before the judges.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I restore him fourfold* (Luke 19:8) — Zacchaeus does Leviticus 6 exactly; salvation comes by repentance that restores.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24) — Messiah keeps Leviticus 6''s order: make right before bringing the offering.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*let him that stole steal no more: but rather let him labour* (Ephesians 4:28) — repentance reverses the trespass: the one who took now labours and gives.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-trespass-against-the-neighbour-restore-and-add-the-fifth-part'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a fire out from before Yahuah (LORD)* (Leviticus 9:24) — the altar-fire descended from Yahuah''s presence; the priests guard a kindling not their own.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-fire-upon-the-altar-shall-never-go-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Quench not the Spirit* (1 Thessalonians 5:19) — the fire that *shall not be put out* (Leviticus 6:12) is the figure of the Ruach (Spirit) that must not be smothered.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-fire-upon-the-altar-shall-never-go-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*fervent in spirit; serving Yahuah (Lord)* (Romans 12:11) — the morning wood kept the flame; the believer keeps the fire of service burning.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-fire-upon-the-altar-shall-never-go-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*stir up the gift of Elohim (God)* (2 Timothy 1:6) — *it shall never go out* (Leviticus 6:13): the gift must be fanned back to flame, never let die to ash.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-fire-upon-the-altar-shall-never-go-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his offering shall be of fine flour* (Leviticus 2:1) — Leviticus 6 gives the priests'' handling of the meat offering Leviticus 2 first set forth.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*it is a thing most holy* (Leviticus 2:3) — the priests'' bread is holy, not common; *every one that toucheth them shall be holy* (Leviticus 6:18).'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*shall ye burn no leaven* (Leviticus 2:11) — leaven, the figure of corruption, has no place in what is offered to Yahuah; *It shall not be baken with leaven* (Leviticus 6:17).'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8) — the unleavened rule unfolded, not abolished; Messiah our passover.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-meat-offering-unleavened-and-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*two lambs of the first year day by day continually* (Exodus 29:38) — the priest''s perpetual offering keeps the continual rhythm of the consecrated altar.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-priests-daily-offering-at-his-anointing-wholly-burnt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The one lamb thou shalt offer in the morning; and the other lamb thou shalt offer at even* (Exodus 29:39) — mirrors *half of it in the morning, and half thereof at night* (Leviticus 6:20).'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-priests-daily-offering-at-his-anointing-wholly-burnt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a continual burnt offering throughout your generations* (Exodus 29:42) — *it shall be wholly burnt* (Leviticus 6:22): the mediator keeps nothing of his own offering back.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-priests-daily-offering-at-his-anointing-wholly-burnt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a young bullock without blemish... for a sin offering* (Leviticus 4:3) — Leviticus 6 completes the law of the sin offering Leviticus 4 first instituted.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-sin-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*in the place where they kill the burnt offering* (Leviticus 4:24) — the very ground Leviticus 6:25 names: sin and devotion dealt with on one holy place.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-sin-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*slay the sin offering in the place of the burnt offering* (Leviticus 4:29) — the common people''s sin offering bound to the same appointed, most-holy ground.'
  FROM cross_reference_threads t
  JOIN _s311_lev06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s311_lev06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-6-the-law-of-the-sin-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_7.sql (Leviticus 7) -----
-- Book: Leviticus  Chapter: 7  | session prefix s311 | tag lev07
-- Temp view: _s311_lev07_lookup
-- Sort band base 22850, step 3  (22850, 22853, 22856, 22859, 22862)
-- All targets are canon (Tanakh + NT) -> every thread tier_required='free'.
--
-- Leviticus 7 coverage:
--   v.1-10  NT:     none warranted (the priests'-portion weave is fully Torah-lateral here; 9:13 carried in thread 4)
--           Extras: none warranted
--           Tanakh: Leviticus 6:25-26 (the sin offering eaten in the holy place), Leviticus 6:17-18 (most holy, the priests' due) -- USED
--   v.11-21 NT:     Hebrews 13:15 (the sacrifice of praise), 1 Corinthians 10:16-17 (the communion of the body), 1 Corinthians 11:27-29 (eat not unworthily) -- USED
--           Extras: none warranted (the thanksgiving/communion weave is fully canon)
--           Tanakh: none warranted (the forward weave carries the thanksgiving meal)
--   v.22-27 NT:     Acts 15:20, Acts 15:29 (abstain from blood) -- USED
--           Extras: none warranted
--           Tanakh: Leviticus 3:17 (perpetual statute: eat neither fat nor blood), Leviticus 17:10-14 (the life is in the blood), Genesis 9:4 (flesh with the blood ye shall not eat), Deuteronomy 12:16,23 (pour the blood as water) -- USED
--   v.28-36 NT:     1 Corinthians 9:13-14 (they which wait at the altar are partakers with the altar) -- USED
--           Extras: none warranted
--           Tanakh: Numbers 18:8-19 (the priestly portion by a covenant of salt for ever) -- USED
--   v.37-38 NT:     none warranted (summary verse, the offerings commanded in mount Sinai)
--           Extras: none warranted
--           Tanakh: Leviticus 1:1-2 (the opening of the laws of the offerings) -- USED
--
-- Threads (5):
--   leviticus-7-the-law-of-the-trespass-offering-it-is-most-holy   [free] -> canon: leviticus (laterals 6)
--   leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day   [free] -> canon: hebrews, 1-corinthians
--   leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood            [free] -> canon: leviticus, genesis, deuteronomy, acts
--   leviticus-7-the-wave-breast-and-the-heave-shoulder             [free] -> canon: numbers, 1-corinthians
--   leviticus-7-this-is-the-law-commanded-in-mount-sinai           [free] -> canon: leviticus (lateral 1)
--
-- Framework notes: 7:11-21 the PEACE/thanksgiving (todah) offering -- the fellowship meal eaten
-- the same day -- weaves FORWARD to Hebrews 13:15 (the sacrifice of praise, the fruit of our
-- lips) and to the communion of 1 Corinthians 10:16-17, with the cut-off-while-unclean warning
-- answered by eat-not-unworthily (1 Cor 11:27-29). 7:22-27 the perpetual fat/blood prohibition
-- is NOT abolished: it is Torah carried unbroken from Genesis 9:4 (Noah) through Leviticus 3:17
-- and 17:10-14 and Deuteronomy 12 to the Jerusalem council (Acts 15:20,29 abstain from blood) --
-- the apostles re-affirm it, never repeal it. 7:28-36 the priestly portion by a statute for ever
-- foreshadows 1 Cor 9:13-14 (they which wait at the altar). No Torah-as-curse reading anywhere.

CREATE TEMP VIEW _s311_lev07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the law of the trespass offering, most holy, the priests' portion (7:1-10)
    ('canon','leviticus',7,6,'canon','leviticus',6,26,'free',
     E'*The priest that offereth it for sin shall eat it: in the holy place shall it be eaten, in the court of the tabernacle of the congregation.* (Leviticus 6:26). The trespass-offering law of Leviticus 7:6 -- *Every male among the priests shall eat thereof: it shall be eaten in the holy place: it is most holy* -- matches the sin-offering law that precedes it, one body of instruction; the priest who makes atonement is fed by the altar he serves.'),
    ('canon','leviticus',7,7,'canon','leviticus',6,25,'free',
     E'*Speak unto Aaron and to his sons, saying, This is the law of the sin offering: In the place where the burnt offering is killed shall the sin offering be killed before Yahuah (LORD): it is most holy.* (Leviticus 6:25). Leviticus 7:7 binds the two together explicitly -- *As the sin offering is, so is the trespass offering: there is one law for them: the priest that maketh atonement therewith shall have it* -- the same holiness, the same place, the same portion.'),
    ('canon','leviticus',7,9,'canon','leviticus',6,17,'free',
     E'*It shall not be baken with leaven. I have given it unto them for their portion of my offerings made by fire; it is most holy, as is the sin offering, and as the trespass offering.* (Leviticus 6:17). The meat-offering portion of Leviticus 7:9 -- *all the meat offering that is baken in the oven... shall be the priest''s that offereth it* -- is the very portion Yahuah names in the prior chapter, the priests'' bread drawn from the altar.'),
    -- Thread 2: the peace/thanksgiving offering, the fellowship meal (7:11-21)
    ('canon','leviticus',7,12,'canon','hebrews',13,15,'free',
     E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* (Hebrews 13:15). The peace offering of Leviticus 7:12 is the thanksgiving (todah): *If he offer it for a thanksgiving, then he shall offer with the sacrifice of thanksgiving unleavened cakes mingled with oil.* The sacrifice of praise the apostle names is this very todah lifted forward -- the thank-offering of a grateful heart, the fruit of the lips that confess his name.'),
    ('canon','leviticus',7,15,'canon','1-corinthians',10,16,'free',
     E'*The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16). The peace offering is the one sacrifice the offerer eats in fellowship: *the flesh of the sacrifice of his peace offerings for thanksgiving shall be eaten the same day that it is offered* (Leviticus 7:15). The communion table is the peace offering fulfilled -- a shared meal of fellowship with Yahuah at his own altar.'),
    ('canon','leviticus',7,15,'canon','1-corinthians',10,17,'free',
     E'*For we being many are one bread, and one body: for we are all partakers of that one bread.* (1 Corinthians 10:17). The peace offering eaten *the same day* (Leviticus 7:15) gathers the worshippers into one fellowship meal; Paul names the same communion -- one bread, one body, all partakers -- the table that binds the many into one before Yahuah.'),
    ('canon','leviticus',7,18,'canon','1-corinthians',11,27,'free',
     E'*Wherefore whosoever shall eat this bread, and drink this cup of Yahusha (the Lord), unworthily, shall be guilty of the body and blood of Yahusha (the Lord).* (1 Corinthians 11:27). Leviticus 7:18 warns that the peace-offering flesh eaten wrongly is rejected -- *it shall not be accepted, neither shall it be imputed unto him that offereth it: it shall be an abomination* -- the same gravity Paul presses on the fellowship table: the meal of communion is not to be eaten unworthily.'),
    ('canon','leviticus',7,20,'canon','1-corinthians',11,29,'free',
     E'*For he that eateth and drinketh unworthily, eateth and drinketh judgment to himself, not discerning the body of Yahusha (the Lord).* (1 Corinthians 11:29). The peace offering eaten in uncleanness brings cutting off: *the soul that eateth of the flesh of the sacrifice of peace offerings... having his uncleanness upon him, even that soul shall be cut off from his people* (Leviticus 7:20). The undiscerned, unclean approach to the holy meal carries judgment then as now.'),
    -- Thread 3: ye shall eat no manner of fat nor blood (7:22-27)
    ('canon','leviticus',7,23,'canon','leviticus',3,17,'free',
     E'*It shall be a perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood.* (Leviticus 3:17). The fat prohibition of Leviticus 7:23 -- *Ye shall eat no manner of fat, of ox, or of sheep, or of goat* -- is sealed in the peace-offering law as a *perpetual statute*, the fat that belongs to Yahuah upon the altar and never to the eater.'),
    ('canon','leviticus',7,26,'canon','leviticus',17,11,'free',
     E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* (Leviticus 17:11). Leviticus 7:26 forbids the blood -- *ye shall eat no manner of blood, whether it be of fowl or of beast, in any of your dwellings* -- because the blood is the life given for atonement; it is too holy to be eaten, reserved for the altar.'),
    ('canon','leviticus',7,27,'canon','leviticus',17,14,'free',
     E'*For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* (Leviticus 17:14). The cutting-off of Leviticus 7:27 -- *Whatsoever soul it be that eateth any manner of blood, even that soul shall be cut off from his people* -- is repeated and grounded: the blood is the life, and the life is not man''s to consume.'),
    ('canon','leviticus',7,26,'canon','genesis',9,4,'free',
     E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4). The blood prohibition reaches back before Sinai to the covenant with Noah: long before Leviticus 7:26 said *ye shall eat no manner of blood*, Yahuah set this law over all flesh, a command for all the sons of Noah, not Israel alone.'),
    ('canon','leviticus',7,26,'canon','deuteronomy',12,23,'free',
     E'*Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh.* (Deuteronomy 12:23). Moses repeats Leviticus 7:26''s charge in the land -- the blood poured out as water (Deuteronomy 12:16), never eaten -- because the life is in it; the prohibition stands wherever Israel dwells.'),
    ('canon','leviticus',7,27,'canon','acts',15,20,'free',
     E'*But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood.* (Acts 15:20). When the apostles met at Jerusalem they did not repeal Leviticus 7:27''s *eateth any manner of blood... shall be cut off* -- they re-affirmed it: the believing Gentiles must abstain from blood, the perpetual statute carried unbroken into the assembly.'),
    ('canon','leviticus',7,27,'canon','acts',15,29,'free',
     E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication: from which if ye keep yourselves, ye shall do well. Fare ye well.* (Acts 15:29). The council''s letter names blood again as a thing to abstain from -- the very command of Leviticus 7:27 -- spoken by the Ruach HaKodesh (Holy Spirit) and the apostles; the Torah''s blood law is honoured, never abolished.'),
    -- Thread 4: the wave breast and the heave shoulder, the priestly portion (7:28-36)
    ('canon','leviticus',7,34,'canon','numbers',18,19,'free',
     E'*All the heave offerings of the holy things, which the children of Yashar''el (Israel) offer unto Yahuah (LORD), have I given thee, and thy sons and thy daughters with thee, by a statute for ever: it is a covenant of salt for ever before Yahuah (LORD) unto thee and to thy seed with thee.* (Numbers 18:19). Leviticus 7:34 gives Aaron the wave breast and heave shoulder *by a statute for ever*; Numbers seals the same priestly portion as a *covenant of salt for ever* -- the ministers of the altar are fed from the altar by perpetual decree.'),
    ('canon','leviticus',7,34,'canon','numbers',18,11,'free',
     E'*And this is thine; the heave offering of their gift, with all the wave offerings of the children of Yashar''el (Israel): I have given them unto thee, and to thy sons and to thy daughters with thee, by a statute for ever.* (Numbers 18:11). The wave offerings of Leviticus 7:34 are named again in Numbers as the priest''s perpetual due -- *given... by a statute for ever* -- the same heave-and-wave portion confirmed for Aaron''s house.'),
    ('canon','leviticus',7,35,'canon','1-corinthians',9,13,'free',
     E'*Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13). The portion of the anointing in Leviticus 7:35 -- the priest fed *out of the offerings of Yahuah (LORD) made by fire* -- is the very principle Paul invokes: those who serve the altar share in it, the laborer is worthy of his support.'),
    ('canon','leviticus',7,34,'canon','1-corinthians',9,14,'free',
     E'*Even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel.* (1 Corinthians 9:14). As the wave breast and heave shoulder were given to Aaron''s sons *by a statute for ever* (Leviticus 7:34), so Yahuah ordains that the messengers of the good news live of it -- the altar-portion principle carried forward.'),
    -- Thread 5: the summary, the law commanded in mount Sinai (7:37-38)
    ('canon','leviticus',7,37,'canon','leviticus',1,2,'free',
     E'*Speak unto the children of Yashar''el (Israel), and say unto them, If any man of you bring an offering unto Yahuah (LORD), ye shall bring your offering of the cattle, even of the herd, and of the flock.* (Leviticus 1:2). Leviticus 7:37 closes the section it opened -- *This is the law of the burnt offering, of the meat offering, and of the sin offering, and of the trespass offering... and of the sacrifice of the peace offerings* -- gathering into one summary the whole body of offering-law that began at Leviticus 1:2.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-7-the-law-of-the-trespass-offering-it-is-most-holy',
       E'Leviticus 7: The Law of the Trespass Offering -- It Is Most Holy',
       E'The chapter opens by completing the offering-laws and binding them into one body. *Likewise this is the law of the trespass offering: it is most holy* (Leviticus 7:1), and the priest who serves is fed from what he offers: *Every male among the priests shall eat thereof: it shall be eaten in the holy place: it is most holy* (Leviticus 7:6). The text ties it back to the sin offering by name: *As the sin offering is, so is the trespass offering: there is one law for them: the priest that maketh atonement therewith shall have it* (Leviticus 7:7) -- the same instruction that said *In the place where the burnt offering is killed shall the sin offering be killed before Yahuah (LORD): it is most holy* (Leviticus 6:25) and *The priest that offereth it for sin shall eat it: in the holy place shall it be eaten* (Leviticus 6:26). The meat-offering portion is the priests'' bread already named in the prior chapter: *I have given it unto them for their portion of my offerings made by fire; it is most holy* (Leviticus 6:17). One law, one holiness, one altar that feeds its ministers -- the covenant ordering its own household.',
       sv.verse_id, ev.verse_id, 'free', 22850
  FROM _s311_lev07_lookup sv, _s311_lev07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day',
       E'Leviticus 7: The Sacrifice of Thanksgiving -- The Fellowship Meal',
       E'The peace offering is the one sacrifice the worshipper eats -- a shared meal of fellowship and praise before Yahuah. *If he offer it for a thanksgiving, then he shall offer with the sacrifice of thanksgiving unleavened cakes mingled with oil* (Leviticus 7:12); this todah, the thank-offering, is *the sacrifice of praise to Elohim (God)... the fruit of our lips giving thanks to his name* (Hebrews 13:15) lifted forward. *And the flesh of the sacrifice of his peace offerings for thanksgiving shall be eaten the same day that it is offered* (Leviticus 7:15) -- the fellowship meal that gathers the many into one: *The cup of blessing which we bless, is it not the communion of the blood of Messiah (Christ)? The bread which we break, is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16), *for we being many are one bread, and one body* (1 Corinthians 10:17). And as the peace-offering flesh eaten wrongly was rejected -- *it shall not be accepted... it shall be an abomination* (Leviticus 7:18), *the soul that eateth... having his uncleanness upon him... shall be cut off* (Leviticus 7:20) -- so the apostle warns of the holy table: *whosoever shall eat this bread, and drink this cup... unworthily, shall be guilty of the body and blood of Yahusha (the Lord)* (1 Corinthians 11:27), for *he that eateth and drinketh unworthily, eateth and drinketh judgment to himself, not discerning the body* (1 Corinthians 11:29). The thanksgiving meal at Yahuah''s altar, then and now, is fellowship that must not be eaten in uncleanness.',
       sv.verse_id, ev.verse_id, 'free', 22853
  FROM _s311_lev07_lookup sv, _s311_lev07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=7 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood',
       E'Leviticus 7: Ye Shall Eat No Manner of Fat, Nor Blood -- The Perpetual Statute',
       E'The fat and the blood belong to Yahuah, not to the eater -- a command older than Sinai and re-affirmed long after. *Ye shall eat no manner of fat, of ox, or of sheep, or of goat* (Leviticus 7:23); *whosoever eateth the fat... shall be cut off from his people* (Leviticus 7:25); *ye shall eat no manner of blood, whether it be of fowl or of beast* (Leviticus 7:26); *Whatsoever soul it be that eateth any manner of blood, even that soul shall be cut off from his people* (Leviticus 7:27). This is sealed as *a perpetual statute for your generations throughout all your dwellings, that ye eat neither fat nor blood* (Leviticus 3:17). The blood is forbidden because it is life: *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls* (Leviticus 17:11), *whosoever eateth it shall be cut off* (Leviticus 17:14). The law reaches back to Noah: *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4); and forward into the land: *Only be sure that thou eat not the blood: for the blood is the life* (Deuteronomy 12:23). And when the apostles met at Jerusalem they did not abolish it -- they kept it: *that they abstain... from blood* (Acts 15:20), *from which if ye keep yourselves, ye shall do well* (Acts 15:29). The blood prohibition stands unbroken from Noah to the council.',
       sv.verse_id, ev.verse_id, 'free', 22856
  FROM _s311_lev07_lookup sv, _s311_lev07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-7-the-wave-breast-and-the-heave-shoulder',
       E'Leviticus 7: The Wave Breast and the Heave Shoulder -- The Altar Feeds Its Ministers',
       E'Yahuah assigns the priests a perpetual portion from the peace offerings -- the altar feeds those who serve it. *And the right shoulder shall ye give unto the priest for an heave offering of the sacrifices of your peace offerings* (Leviticus 7:32); *For the wave breast and the heave shoulder have I taken of the children of Yashar''el (Israel)... and have given them unto Aaron the priest and unto his sons by a statute for ever* (Leviticus 7:34); *This is the portion of the anointing of Aaron, and of the anointing of his sons, out of the offerings of Yahuah (LORD) made by fire* (Leviticus 7:35). Numbers seals the very same portion: *And this is thine; the heave offering of their gift, with all the wave offerings... I have given them unto thee... by a statute for ever* (Numbers 18:11), *it is a covenant of salt for ever before Yahuah (LORD) unto thee and to thy seed with thee* (Numbers 18:19). Paul draws the principle straight from this Torah: *they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13), and *Even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14). The one who ministers the holy things is sustained by them -- a statute for ever, carried into the assembly.',
       sv.verse_id, ev.verse_id, 'free', 22859
  FROM _s311_lev07_lookup sv, _s311_lev07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=7 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-7-this-is-the-law-commanded-in-mount-sinai',
       E'Leviticus 7: This Is the Law -- The Offerings Commanded in Mount Sinai',
       E'The chapter closes by gathering the whole body of offering-law into one summary seal. *This is the law of the burnt offering, of the meat offering, and of the sin offering, and of the trespass offering, and of the consecrations, and of the sacrifice of the peace offerings* (Leviticus 7:37), *Which Yahuah (LORD) commanded Moses in mount Sinai, in the day that he commanded the children of Yashar''el (Israel) to offer their oblations unto Yahuah (LORD), in the wilderness of Sinai* (Leviticus 7:38). This colophon closes the section that opened the book: *Speak unto the children of Yashar''el (Israel), and say unto them, If any man of you bring an offering unto Yahuah (LORD), ye shall bring your offering of the cattle, even of the herd, and of the flock* (Leviticus 1:2). What began in Leviticus 1 with the first offering ends here -- one ordered instruction, commanded at Sinai, framing the worship of the covenant people.',
       sv.verse_id, ev.verse_id, 'free', 22862
  FROM _s311_lev07_lookup sv, _s311_lev07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=7 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The priest that offereth it for sin shall eat it: in the holy place shall it be eaten* (Leviticus 6:26) -- the sin-offering law matches the trespass portion of Leviticus 7:6.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-law-of-the-trespass-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*This is the law of the sin offering... it is most holy* (Leviticus 6:25) -- the one law Leviticus 7:7 binds the trespass offering to.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-law-of-the-trespass-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I have given it unto them for their portion of my offerings made by fire; it is most holy* (Leviticus 6:17) -- the priests'' portion already named, matching Leviticus 7:9.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-law-of-the-trespass-offering-it-is-most-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...the sacrifice of praise to Elohim (God)... the fruit of our lips giving thanks to his name* (Hebrews 13:15) -- the todah of Leviticus 7:12 lifted forward.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...is it not the communion of the body of Messiah (Christ)?* (1 Corinthians 10:16) -- the fellowship meal of Leviticus 7:15 fulfilled at the communion table.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For we being many are one bread, and one body* (1 Corinthians 10:17) -- the same-day peace-offering meal gathers the many into one.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=15
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...shall eat this bread, and drink this cup... unworthily, shall be guilty of the body and blood* (1 Corinthians 11:27) -- the rejection of Leviticus 7:18 pressed onto the holy table.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...eateth and drinketh judgment to himself, not discerning the body* (1 Corinthians 11:29) -- the cut-off-while-unclean of Leviticus 7:20 answered.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-sacrifice-of-thanksgiving-eaten-the-same-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...a perpetual statute for your generations... that ye eat neither fat nor blood* (Leviticus 3:17) -- the fat law of Leviticus 7:23 sealed as perpetual.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For the life of the flesh is in the blood... it is the blood that maketh an atonement* (Leviticus 17:11) -- why the blood of Leviticus 7:26 may not be eaten.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...whosoever eateth it shall be cut off* (Leviticus 17:14) -- the cutting-off of Leviticus 7:27 grounded in the life-blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) -- the blood law given to Noah, older than Leviticus 7:26.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Only be sure that thou eat not the blood: for the blood is the life* (Deuteronomy 12:23) -- Moses repeats Leviticus 7:26 in the land.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*...that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood* (Acts 15:20) -- the apostles re-affirm Leviticus 7:27, not repeal it.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication* (Acts 15:29) -- the council''s letter keeps the blood law of Leviticus 7:27.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-ye-shall-eat-no-manner-of-fat-nor-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...by a statute for ever... it is a covenant of salt for ever* (Numbers 18:19) -- the priestly portion of Leviticus 7:34 sealed as a covenant of salt.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=34
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-wave-breast-and-the-heave-shoulder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...the wave offerings of the children of Yashar''el (Israel)... given... by a statute for ever* (Numbers 18:11) -- the same wave-and-heave portion as Leviticus 7:34.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=34
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-wave-breast-and-the-heave-shoulder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13) -- the portion-of-the-anointing principle of Leviticus 7:35.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=35
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-wave-breast-and-the-heave-shoulder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...they which preach the gospel should live of the gospel* (1 Corinthians 9:14) -- the for-ever altar-portion of Leviticus 7:34 carried forward.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=34
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-the-wave-breast-and-the-heave-shoulder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If any man of you bring an offering unto Yahuah (LORD), ye shall bring your offering of the cattle* (Leviticus 1:2) -- the opening of the offering-laws Leviticus 7:37 summarizes and seals.'
  FROM cross_reference_threads t
  JOIN _s311_lev07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=7 AND sv.verse_number=37
  JOIN _s311_lev07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-7-this-is-the-law-commanded-in-mount-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_8.sql (Leviticus 8) -----
--
-- Chapter: Leviticus 8 — the consecration of Aaron and his sons (fulfilling the
--          command of Exodus 28-29 / 40:12-15). Moses washes, robes, anoints, and
--          consecrates the priesthood by blood; the seven-day ordination at the door.
-- Tag: lev08    Session prefix: s311    Temp view: _s311_lev08_lookup
-- Sort band: base 22875, step 3 (22875, 22878, 22881, 22884, 22887)
-- All targets canon (Tanakh + NT) => tier 'free' on every row & thread.
--
-- ---- Leviticus 8 coverage ----
--   v.1-13  (washing, robing, anointing the priesthood)
--        NT:     Hebrews 5:4 (called of Elohim, as was Aaron); Hebrews 7:26-28 (greater High Priest) -> threaded
--        Extras: none warranted
--        Tanakh: Exodus 28:2/28:30; Exodus 29:4-9; Exodus 40:12-15; Psalm 133:2 -> threaded
--   v.14-17 (sin offering bullock; atonement of the altar)
--        NT:     none warranted (Heb 13:11 candidate held back -> belongs to the without-the-camp thread elsewhere)
--        Extras: none warranted
--        Tanakh: Leviticus 4:3-4; Exodus 29:10-14 -> threaded
--   v.18-21 (ram for the burnt offering; sweet savour)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 29:15-18 -> threaded
--   v.22-30 (ram of consecration; blood on ear/thumb/toe; oil + blood sprinkled)
--        NT:     1 Peter 2:5 (holy priesthood / spiritual sacrifices); 1 Peter 2:9 (royal priesthood) -> threaded
--        Extras: none warranted
--        Tanakh: Exodus 29:19-21; Leviticus 14:14 (same ear/thumb/toe blood, cleansed leper) -> threaded
--   v.31-36 (eat at the door; seven days; that ye die not; keep the charge)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 29:35-37 -> threaded
--
-- ---- Threads (5) ----
--   leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated
--        [free] Exod 28:2/28:30, Exod 29:4-9, Exod 40:12-15, Psalm 133:2, Heb 5:4, Heb 7:26 (canon Tanakh + NT)
--   leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar
--        [free] Lev 4:3, Lev 4:4, Exod 29:10, Exod 29:14 (canon Tanakh)
--   leviticus-8-the-ram-for-the-burnt-offering-a-sweet-savour
--        [free] Exod 29:15, Exod 29:18 (canon Tanakh)
--   leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe
--        [free] Exod 29:20, Exod 29:21, Lev 14:14, 1 Pet 2:5, 1 Pet 2:9 (canon Tanakh + NT)
--   leviticus-8-seven-days-at-the-door-that-ye-die-not-the-ordination
--        [free] Exod 29:35, Exod 29:36, Exod 29:37 (canon Tanakh)
--

CREATE TEMP VIEW _s311_lev08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: washing, robing, anointing -> the priesthood consecrated
    ('canon','leviticus',8,6,'canon','exodus',29,4,'free',
      E'*And Aaron and his sons thou shalt bring unto the door of the tabernacle of the congregation, and shalt wash them with water* (Exodus 29:4). Leviticus 8 is Moses obeying to the letter what Exodus 29 commanded: *And Moses brought Aaron and his sons, and washed them with water* (Leviticus 8:6). The consecration begins with washing — the priest must be cleansed before he can stand at the altar.'),
    ('canon','leviticus',8,7,'canon','exodus',28,2,'free',
      E'*And thou shalt make holy garments for Aaron thy brother for glory and for beauty* (Exodus 28:2). The robing of Leviticus 8 — *he put upon him the coat, and girded him with the girdle, and clothed him with the robe, and put the ephod upon him* (Leviticus 8:7) — clothes Aaron in the very garments Exodus 28 ordained, glory and beauty set apart for the priest of Yahuah (LORD).'),
    ('canon','leviticus',8,8,'canon','exodus',28,30,'free',
      E'*And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD)* (Exodus 28:30). When Moses *put the breastplate upon him: also he put in the breastplate the Urim and the Thummim* (Leviticus 8:8), the high priest bears the judgment of the twelve tribes upon his heart — the whole house of Yashar''el (Israel) carried before Yahuah continually.'),
    ('canon','leviticus',8,9,'canon','exodus',29,6,'free',
      E'*And thou shalt put the mitre upon his head, and put the holy crown upon the mitre* (Exodus 29:6). Leviticus 8:9 sets the same crown: *he put the mitre upon his head; also upon the mitre, even upon his forefront, did he put the golden plate, the holy crown.* The plate engraved HOLINESS TO Yahuah (LORD) marks the priest as wholly belonging to the Most High.'),
    ('canon','leviticus',8,10,'canon','exodus',40,9,'free',
      E'*And thou shalt take the anointing oil, and anoint the tabernacle, and all that is therein, and shalt hallow it* (Exodus 40:9). Moses does exactly this in Leviticus 8:10 — *Moses took the anointing oil, and anointed the tabernacle and all that was therein, and sanctified them* — the dwelling and its furniture set apart by the oil before the priest may serve in it.'),
    ('canon','leviticus',8,12,'canon','exodus',29,7,'free',
      E'*Then shalt thou take the anointing oil, and pour it upon his head, and anoint him* (Exodus 29:7). Leviticus 8:12 fulfils it: *he poured of the anointing oil upon Aaron''s head, and anointed him, to sanctify him.* The poured oil is what makes Aaron the mashiach (anointed one) — the office the Formed Son would fill as the true Anointed.'),
    ('canon','leviticus',8,12,'canon','psalms',133,2,'free',
      E'*It is like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard: that went down to the skirts of his garments* (Psalm 133:2). The psalm sings the very moment of Leviticus 8:12 — *he poured of the anointing oil upon Aaron''s head* — and reads the running oil as the picture of brethren dwelling together in unity, *for there Yahuah (LORD) commanded the blessing, even life for evermore.*'),
    ('canon','leviticus',8,13,'canon','exodus',40,12,'free',
      E'*And thou shalt bring Aaron and his sons unto the door of the tabernacle of the congregation, and wash them with water* (Exodus 40:12). The whole sequence of Leviticus 8 — wash, robe, anoint Aaron and his sons — is the everlasting priesthood Exodus 40:13-15 promised: *their anointing shall surely be an everlasting priesthood throughout their generations.*'),
    ('canon','leviticus',8,12,'canon','hebrews',5,4,'free',
      E'*And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). The anointing of Leviticus 8:12 is Yahuah''s calling, not Aaron''s ambition; Hebrews names Aaron as the very pattern of a priesthood received by appointment, and so the Formed Son too *glorified not himself to be made an high priest* (Hebrews 5:5).'),
    ('canon','leviticus',8,12,'canon','hebrews',7,26,'free',
      E'*For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26). Aaron, anointed and set apart in Leviticus 8:12, is the shadow whose substance is the greater High Priest — *the word of the oath... maketh the Son, who is consecrated for evermore* (Hebrews 7:28), the priest after the order of Melek Tsadiq (Melchizedek) the Aaronic line foreshadowed.'),

    -- THREAD 2: the sin offering bullock -> reconciliation upon the altar
    ('canon','leviticus',8,14,'canon','exodus',29,10,'free',
      E'*And thou shalt cause a bullock to be brought before the tabernacle of the congregation: and Aaron and his sons shall put their hands upon the head of the bullock* (Exodus 29:10). Leviticus 8:14 performs it: *Aaron and his sons laid their hands upon the head of the bullock for the sin offering* — the laying-on of hands transfers the sin of the priests onto the substitute before it is slain.'),
    ('canon','leviticus',8,14,'canon','leviticus',4,3,'free',
      E'*If the priest that is anointed do sin according to the sin of the people; then let him bring for his sin, which he hath sinned, a young bullock without blemish unto Yahuah (LORD) for a sin offering* (Leviticus 4:3). The bullock of Leviticus 8:14 follows the very law of the priest''s sin offering; before Aaron can atone for others he must first be atoned for himself.'),
    ('canon','leviticus',8,14,'canon','leviticus',4,4,'free',
      E'*And he shall bring the bullock unto the door of the tabernacle of the congregation before Yahuah (LORD); and shall lay his hand upon the bullock''s head, and kill the bullock before Yahuah (LORD)* (Leviticus 4:4). The hands-on-the-head rite that opens Leviticus 8:14 is exactly the sin-offering procedure of Leviticus 4 — the appointed way guilt is laid upon the offering.'),
    ('canon','leviticus',8,15,'canon','exodus',29,14,'free',
      E'*But the flesh of the bullock, and his skin, and his dung, shalt thou burn with fire without the camp: it is a sin offering* (Exodus 29:14). Leviticus 8:15-17 carries it out — Moses puts the blood on the horns of the altar *to make reconciliation upon it*, then burns the bullock *without the camp* — the altar itself first cleansed and reconciled before any worship can proceed.'),

    -- THREAD 3: the ram for the burnt offering -> a sweet savour
    ('canon','leviticus',8,18,'canon','exodus',29,15,'free',
      E'*Thou shalt also take one ram; and Aaron and his sons shall put their hands upon the head of the ram* (Exodus 29:15). Leviticus 8:18 obeys it word for word: *he brought the ram for the burnt offering: and Aaron and his sons laid their hands upon the head of the ram* — the whole ram given up to Yahuah (LORD) as total consecration.'),
    ('canon','leviticus',8,21,'canon','exodus',29,18,'free',
      E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). Leviticus 8:21 fulfils it — *Moses burnt the whole ram upon the altar: it was a burnt sacrifice for a sweet savour* — nothing held back, the priest''s life wholly ascending to the Most High.'),

    -- THREAD 4: the ram of consecration -> blood on the ear, the thumb, the toe
    ('canon','leviticus',8,23,'canon','exodus',29,20,'free',
      E'*Then shalt thou kill the ram, and take of his blood, and put it upon the tip of the right ear of Aaron, and upon the tip of the right ear of his sons, and upon the thumb of their right hand, and upon the great toe of their right foot* (Exodus 29:20). Leviticus 8:23 performs the rite — blood on the right ear, right thumb, right great toe — the whole man consecrated: the ear to hear Yahuah''s word, the hand to do it, the foot to walk in it.'),
    ('canon','leviticus',8,24,'canon','leviticus',14,14,'free',
      E'*And the priest shall take some of the blood of the trespass offering, and the priest shall put it upon the tip of the right ear of him that is to be cleansed, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 14:14). The very blood-mark that consecrates the priest in Leviticus 8:24 is the blood-mark that restores the cleansed leper — both the set-apart one and the brought-back one claimed by blood on ear, hand, and foot.'),
    ('canon','leviticus',8,30,'canon','exodus',29,21,'free',
      E'*And thou shalt take of the blood that is upon the altar, and of the anointing oil, and sprinkle it upon Aaron, and upon his garments, and upon his sons, and upon the garments of his sons with him: and he shall be hallowed* (Exodus 29:21). Leviticus 8:30 does this exactly — blood and oil together sprinkled on the priests and their garments — consecration is by blood and by anointing joined, sacrifice and Spirit inseparable.'),
    ('canon','leviticus',8,30,'canon','1-peter',2,5,'free',
      E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). The blood-and-oil consecration of Leviticus 8:30 is the shadow of the holy priesthood the restored people of Yashar''el (Israel) are made — set apart by blood, filled by the Spirit, to bring near acceptable offerings.'),
    ('canon','leviticus',8,30,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). What Aaron and his sons became by the consecration of Leviticus 8 — a priesthood set apart to Yahuah — is what the gathered house is called to be, *which in time past were not a people, but are now the people of Elohim (God)* (1 Peter 2:10), the two houses made one royal priesthood.'),

    -- THREAD 5: seven days at the door -> that ye die not (the ordination)
    ('canon','leviticus',8,33,'canon','exodus',29,35,'free',
      E'*And thus shalt thou do unto Aaron, and to his sons, according to all things which I have commanded thee: seven days shalt thou consecrate them* (Exodus 29:35). Leviticus 8:33 keeps the charge — *ye shall not go out of the door of the tabernacle of the congregation in seven days, until the days of your consecration be at an end* — the full seven days of ordination, not one cut short.'),
    ('canon','leviticus',8,34,'canon','exodus',29,36,'free',
      E'*And thou shalt offer every day a bullock for a sin offering for atonement: and thou shalt cleanse the altar, when thou hast made an atonement for it* (Exodus 29:36). Leviticus 8:34 names the purpose of the whole week — *so Yahuah (LORD) hath commanded to do, to make an atonement for you* — daily atonement repeated until priest and altar are wholly sanctified.'),
    ('canon','leviticus',8,35,'canon','exodus',29,37,'free',
      E'*Seven days thou shalt make an atonement for the altar, and sanctify it; and it shall be an altar most holy: whatsoever toucheth the altar shall be holy* (Exodus 29:37). The seven-day abiding of Leviticus 8:35 — *that ye die not: for so I am commanded* — guards the awful holiness of the place; to draw near to Yahuah unsanctified is death, so the charge is kept day and night.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated',
       E'Moses washed, robed, and anointed Aaron — the priesthood consecrated',
       E'Leviticus 8 is the obedience to the blueprint of Exodus 28-29 and 40:12-15. Moses *brought Aaron and his sons, and washed them with water* (Leviticus 8:6), fulfilling *shalt wash them with water* (Exodus 29:4) — the priest cleansed before he stands at the altar. Then the robing: *he put upon him the coat, and girded him with the girdle, and clothed him with the robe, and put the ephod upon him* (Leviticus 8:7), the *holy garments for Aaron... for glory and for beauty* (Exodus 28:2); and the breastplate with *the Urim and the Thummim* (Leviticus 8:8), by which Aaron bears *the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually* (Exodus 28:30) — the whole house carried before the Most High. The mitre receives *the holy crown* (Leviticus 8:9 / Exodus 29:6), the plate engraved HOLINESS TO Yahuah. Then the oil: Moses *anointed the tabernacle and all that was therein, and sanctified them* (Leviticus 8:10 / Exodus 40:9), and *poured of the anointing oil upon Aaron''s head, and anointed him, to sanctify him* (Leviticus 8:12 / Exodus 29:7). Psalm 133 sings that very moment — *like the precious ointment upon the head, that ran down upon the beard, even Aaron''s beard* (Psalm 133:2) — the running oil the picture of unity where *Yahuah (LORD) commanded the blessing, even life for evermore.* This anointing makes Aaron the mashiach, the anointed priest, and Hebrews reads it forward: *no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4) — the office Yahuah gives, never seizes. Aaron is the shadow; the substance is the greater High Priest, *holy, harmless, undefiled, separate from sinners* (Hebrews 7:26), the Formed Son consecrated for evermore.',
       sv.verse_id, ev.verse_id, 'free', 22875
  FROM _s311_lev08_lookup sv, _s311_lev08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar',
       E'The sin offering bullock — to make reconciliation upon the altar',
       E'Before Aaron can mediate for the people he must first be atoned for himself, and the altar itself cleansed. In Leviticus 8:14 *Aaron and his sons laid their hands upon the head of the bullock for the sin offering* — the rite of Exodus 29:10, *shall put their hands upon the head of the bullock*, by which guilt is transferred to the substitute. This follows the very law of the anointed priest''s sin offering: *if the priest that is anointed do sin... then let him bring... a young bullock without blemish unto Yahuah (LORD) for a sin offering* (Leviticus 4:3), *and shall lay his hand upon the bullock''s head, and kill the bullock before Yahuah (LORD)* (Leviticus 4:4). Then Moses *took the blood, and put it upon the horns of the altar round about with his finger, and purified the altar... to make reconciliation upon it* (Leviticus 8:15), and burned the body *without the camp* — *it is a sin offering* (Exodus 29:14). The altar where worship will be offered is itself first reconciled by blood; nothing approaches Yahuah until atonement has gone before.',
       sv.verse_id, ev.verse_id, 'free', 22878
  FROM _s311_lev08_lookup sv, _s311_lev08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-8-the-ram-for-the-burnt-offering-a-sweet-savour',
       E'The ram for the burnt offering — a sweet savour',
       E'The first ram is wholly burnt — total consecration, nothing reserved. *He brought the ram for the burnt offering: and Aaron and his sons laid their hands upon the head of the ram* (Leviticus 8:18), exactly as commanded: *Aaron and his sons shall put their hands upon the head of the ram* (Exodus 29:15). Moses then *burnt the whole ram upon the altar: it was a burnt sacrifice for a sweet savour, and an offering made by fire unto Yahuah (LORD)* (Leviticus 8:21) — fulfilling *burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour* (Exodus 29:18). The burnt offering is the priest''s whole life ascending to the Most High, held back in no part — the entire ram given up, the entire man given over.',
       sv.verse_id, ev.verse_id, 'free', 22881
  FROM _s311_lev08_lookup sv, _s311_lev08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe',
       E'The ram of consecration — blood on the ear, the thumb, the toe',
       E'The second ram is the ram of consecration, and its blood marks the whole man. Moses *took of the blood of it, and put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 8:23), and did the same for his sons (Leviticus 8:24) — fulfilling Exodus 29:20 to the letter. The ear, the hand, the foot: the consecrated man''s hearing set apart to receive Yahuah''s word, his doing set apart to obey it, his walking set apart to keep His way — the whole life claimed by blood. The same blood-mark in the same three places restores the cleansed leper — *upon the tip of the right ear... and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 14:14) — so both the set-apart priest and the brought-back outcast are owned by the same atoning blood. Then *of the anointing oil, and of the blood which was upon the altar* Moses *sprinkled it upon Aaron, and upon his garments, and upon his sons* (Leviticus 8:30 / Exodus 29:21): consecration is blood and oil joined, sacrifice and Spirit inseparable. This is the shadow whose substance is the gathered people made *an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God)* (1 Peter 2:5) — *a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9), the two houses *which in time past were not a people, but are now the people of Elohim (God)* (1 Peter 2:10), set apart by blood and filled by the Spirit.',
       sv.verse_id, ev.verse_id, 'free', 22884
  FROM _s311_lev08_lookup sv, _s311_lev08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=8 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-8-seven-days-at-the-door-that-ye-die-not-the-ordination',
       E'Seven days at the door, that ye die not — the ordination',
       E'The consecration is not a single act but a full week kept at the door. *Ye shall not go out of the door of the tabernacle of the congregation in seven days, until the days of your consecration be at an end: for seven days shall he consecrate you* (Leviticus 8:33) — exactly *seven days shalt thou consecrate them* (Exodus 29:35). Each day a bullock for atonement, *to cleanse the altar, when thou hast made an atonement for it* (Exodus 29:36); the purpose named in Leviticus 8:34, *so Yahuah (LORD) hath commanded to do, to make an atonement for you.* So *seven days thou shalt make an atonement for the altar, and sanctify it; and it shall be an altar most holy* (Exodus 29:37) — until priest and altar alike are wholly set apart. And the charge is guarded with a warning: *therefore shall ye abide at the door... day and night seven days, and keep the charge of Yahuah (LORD), that ye die not* (Leviticus 8:35). The holiness of the place is no light thing; to draw near to Yahuah unsanctified is death, so the ordination is kept in full, not cut short. *So Aaron and his sons did all things which Yahuah (LORD) commanded by the hand of Moses* (Leviticus 8:36).',
       sv.verse_id, ev.verse_id, 'free', 22887
  FROM _s311_lev08_lookup sv, _s311_lev08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=8 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*shalt wash them with water* (Exodus 29:4) — Leviticus 8:6 obeys the command: the priest cleansed before he serves.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*holy garments for Aaron... for glory and for beauty* (Exodus 28:2) — the very garments Moses puts on Aaron in Leviticus 8:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Urim and the Thummim... upon Aaron''s heart* (Exodus 28:30) — the breastplate of judgment set in Leviticus 8:8; the twelve tribes borne before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*put the holy crown upon the mitre* (Exodus 29:6) — the golden plate, the holy crown, set in Leviticus 8:9: HOLINESS TO Yahuah.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=9
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*anoint the tabernacle, and all that is therein, and shalt hallow it* (Exodus 40:9) — Leviticus 8:10 sanctifies the dwelling by the oil.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*pour it upon his head, and anoint him* (Exodus 29:7) — the oil poured on Aaron in Leviticus 8:12 makes him the mashiach, the anointed priest.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the precious ointment upon the head... even Aaron''s beard* (Psalm 133:2) — the psalm sings the very anointing of Leviticus 8:12 as the picture of unity and blessing.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=133 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*bring Aaron and his sons unto the door... and wash them* (Exodus 40:12) — the whole rite of Leviticus 8 is the everlasting priesthood Exodus 40:12-15 ordained.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4) — the anointed office is Yahuah''s calling, the pattern fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*such an high priest... holy, harmless, undefiled, separate from sinners* (Hebrews 7:26) — Aaron the shadow, the greater High Priest the substance, consecrated for evermore.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-moses-washed-and-robed-and-anointed-aaron-the-priesthood-consecrated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*shall put their hands upon the head of the bullock* (Exodus 29:10) — the laying-on of hands in Leviticus 8:14 transfers the priests'' guilt to the substitute.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if the priest that is anointed do sin... a young bullock... for a sin offering* (Leviticus 4:3) — the law the priest''s own atonement follows; Aaron atoned before he atones for others.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*lay his hand upon the bullock''s head, and kill the bullock before Yahuah (LORD)* (Leviticus 4:4) — the appointed sin-offering rite enacted in Leviticus 8:14.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the flesh of the bullock... shalt thou burn with fire without the camp: it is a sin offering* (Exodus 29:14) — Leviticus 8:15-17 reconciles the altar by blood, then burns the body outside.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=15
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-sin-offering-bullock-to-make-reconciliation-upon-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*shall put their hands upon the head of the ram* (Exodus 29:15) — Leviticus 8:18 obeys it: the whole ram given up to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-for-the-burnt-offering-a-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*burn the whole ram upon the altar... a sweet savour* (Exodus 29:18) — fulfilled in Leviticus 8:21: nothing held back, the priest''s whole life ascending.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-for-the-burnt-offering-a-sweet-savour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*upon the tip of the right ear... the thumb... the great toe* (Exodus 29:20) — Leviticus 8:23 enacts it: the whole man consecrated, hearing, doing, walking.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*upon the tip of the right ear... the thumb... the great toe* of the cleansed leper (Leviticus 14:14) — the same blood-mark restores the outcast that consecrates the priest in Leviticus 8:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=24
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the blood... and the anointing oil... sprinkle it upon Aaron... and he shall be hallowed* (Exodus 29:21) — Leviticus 8:30 joins blood and oil: sacrifice and Spirit inseparable.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*an holy priesthood, to offer up spiritual sacrifices* (1 Peter 2:5) — the consecration of Leviticus 8:30 is the shadow of the gathered people made a priesthood by blood and Spirit.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9) — what Aaron became in Leviticus 8 is what the two houses are called to be, the people of Elohim restored.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-the-ram-of-consecration-blood-on-the-ear-the-thumb-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*seven days shalt thou consecrate them* (Exodus 29:35) — Leviticus 8:33 keeps the full week at the door, not one day cut short.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-seven-days-at-the-door-that-ye-die-not-the-ordination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*offer every day a bullock for a sin offering for atonement... cleanse the altar* (Exodus 29:36) — the purpose named in Leviticus 8:34: to make an atonement for you.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=34
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-seven-days-at-the-door-that-ye-die-not-the-ordination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*seven days... an altar most holy: whatsoever toucheth the altar shall be holy* (Exodus 29:37) — Leviticus 8:35 guards the holiness with its warning, that ye die not.'
  FROM cross_reference_threads t
  JOIN _s311_lev08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s311_lev08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-8-seven-days-at-the-door-that-ye-die-not-the-ordination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_9.sql (Leviticus 9) -----
-- Book: Leviticus  Chapter: 9  Tag: lev09  Session: s311
-- Sort band base 22900 step 3 -> 22900, 22903, 22906, 22909
-- Theme: THE EIGHTH DAY — the priesthood begins to minister, atonement is made,
--        the priestly blessing is lifted, the glory appears, and fire from before
--        Yahuah falls and consumes the offering.
--
-- Leviticus 9 coverage:
--   v.1-7  (eighth day; Aaron's sin+burnt offering FIRST for himself then the people; "for to day Yahuah will appear")
--          NT:     Hebrews 7:27 (high priest offers first for his own sins then the people's; Messiah once for all)
--          Extras: none warranted
--          Tanakh: Exodus 29:43-44 (the tabernacle sanctified by my glory; Aaron+sons sanctified to minister)
--   v.8-21 (Aaron performs sin/burnt/meat/peace offerings — the FIRST full priestly service)
--          NT:     none warranted (the priestly fulfilment is carried on thread 1 via Hebrews)
--          Extras: none warranted
--          Tanakh: Leviticus 7:37 (the roll-call of all the offerings — now first performed); Leviticus 1:9 (burnt offering law: wash inwards+legs)
--   v.22-23 (Aaron lifts his hand and blesses; Moses+Aaron bless; the glory appears to all the people)
--          NT:     Luke 24:50, 24:51 (Yahusha lifted up his hands and blessed them; was carried up)
--          Extras: none warranted
--          Tanakh: Numbers 6:23, 6:27 (the Aaronic blessing; put my name upon Yashar'el)
--   v.24  ★ (fire out from before Yahuah consumes the burnt offering; people shout and fall on faces)
--          NT:     Acts 2:3 (cloven tongues like as of fire — the Spirit at Shavuot accepting the new house)
--          Extras: none warranted
--          Tanakh: Genesis 15:17; Judges 6:21; 1 Kings 18:38; 2 Chronicles 7:1 (the accepted offering by heavenly fire)
--
-- Threads (4):
--   leviticus-9-the-eighth-day-atonement-first-for-himself-then-the-people  [free] -> Hebrews(NT), Exodus(Tanakh)
--   leviticus-9-the-first-full-priestly-service                            [free] -> Leviticus 7, Leviticus 1 (Tanakh)
--   leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people            [free] -> Numbers(Tanakh), Luke(NT)
--   leviticus-9-fire-out-from-before-yahuah-consumed-the-offering          [free] -> Genesis/Judges/1Kings/2Chron(Tanakh), Acts(NT)

CREATE TEMP VIEW _s311_lev09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the eighth day — atonement first for himself, then the people
    ('canon','leviticus',9,7,'canon','hebrews',7,27,'free',
     E'*Who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself.* (Hebrews 7:27). On the eighth day Moses charges Aaron, *offer thy sin offering, and thy burnt offering, and make an atonement for thyself, and for the people* (Leviticus 9:7) — the earthly high priest must cleanse his own sin before he can stand for Yashar''el (Israel). The book of Hebrews reads this Levitical order forward to the Formed Son, the High Priest after Melek Tsadiq (Melchizedek), who needed no offering for himself and offered up himself once for all.'),
    ('canon','leviticus',9,6,'canon','exodus',29,43,'free',
     E'*And there I will meet with the children of Yashar''el (Israel), and the tabernacle shall be sanctified by my glory.* (Exodus 29:43). At the consecration Yahuah (LORD) had promised that his glory would sanctify the tent; now on the eighth day Moses declares it come, *the glory of Yahuah (LORD) shall appear unto you* (Leviticus 9:6). The promise of Exodus 29 is the seed of which Leviticus 9 is the harvest — the dwelling of Yahuah with his covenant people.'),
    ('canon','leviticus',9,7,'canon','exodus',29,44,'free',
     E'*And I will sanctify the tabernacle of the congregation, and the altar: I will sanctify also both Aaron and his sons, to minister to me in the priest''s office.* (Exodus 29:44). Yahuah (LORD) had set apart Aaron and his sons to minister; in Leviticus 9 that office is first exercised — Moses says, *Go unto the altar, and offer thy sin offering... as Yahuah (LORD) commanded* (Leviticus 9:7). The sanctifying word of Exodus 29 becomes the working priesthood of Leviticus 9.'),

    -- Thread 2: the first full priestly service
    ('canon','leviticus',9,15,'canon','leviticus',7,37,'free',
     E'*This is the law of the burnt offering, of the meat offering, and of the sin offering, and of the trespass offering, and of the consecrations, and of the sacrifice of the peace offerings;* (Leviticus 7:37). Leviticus 1-7 had laid down the laws of every offering; Leviticus 9 is the day they are first carried out — Aaron *brought the people''s offering, and took the goat, which was the sin offering for the people, and slew it, and offered it for sin, as the first* (Leviticus 9:15). The written Torah of offerings now becomes living service before Yahuah (LORD).'),
    ('canon','leviticus',9,14,'canon','leviticus',1,9,'free',
     E'*But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 1:9). The very rite of the burnt offering commanded in Leviticus 1 is the rite Aaron performs in Leviticus 9 — *he did wash the inwards and the legs, and burnt them upon the burnt offering on the altar* (Leviticus 9:14). The instruction and the obedience answer word for word.'),

    -- Thread 3: Aaron lifted up his hand and blessed the people
    ('canon','leviticus',9,22,'canon','numbers',6,23,'free',
     E'*Speak unto Aaron and unto his sons, saying, On this wise ye shall bless the children of Yashar''el (Israel), saying unto them,* (Numbers 6:23). When *Aaron lifted up his hand toward the people, and blessed them* (Leviticus 9:22), he begins the priestly blessing that Numbers 6 sets in words — *Yahuah (LORD) bless thee, and keep thee.* The lifted hand of the high priest carries the Name down upon the covenant people.'),
    ('canon','leviticus',9,22,'canon','numbers',6,27,'free',
     E'*And they shall put my name upon the children of Yashar''el (Israel); and I will bless them.* (Numbers 6:27). The Aaronic blessing is no mere wish — it sets Yahuah''s (LORD''s) own Name upon his people, and he himself blesses. So when *Aaron lifted up his hand toward the people, and blessed them* (Leviticus 9:22), it is the Name being laid on Yashar''el (Israel), the two-house people marked as his own.'),
    ('canon','leviticus',9,22,'canon','luke',24,50,'free',
     E'*And he led them out as far as to Bethany, and he lifted up his hands, and blessed them.* (Luke 24:50). As Aaron *lifted up his hand toward the people, and blessed them* (Leviticus 9:22) at the close of the first priestly service, so the Formed Son, the true High Priest, lifts up his hands and blesses his own at the close of his earthly ministry. The priestly gesture of Leviticus 9 is fulfilled in Yahusha (Jesus).'),
    ('canon','leviticus',9,23,'canon','luke',24,51,'free',
     E'*And it came to pass, while he blessed them, he was parted from them, and carried up into heaven.* (Luke 24:51). In Leviticus 9, after the blessing, *the glory of Yahuah (LORD) appeared unto all the people* (Leviticus 9:23) — the priest blesses and the Glory is revealed. In Luke 24 the High Priest blesses and is taken up into that very Glory; the pattern of Leviticus 9 reaches its end in the ascension of the Formed Son.'),

    -- Thread 4: fire out from before Yahuah consumed the offering
    ('canon','leviticus',9,24,'canon','genesis',15,17,'free',
     E'*And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* (Genesis 15:17). When Yahuah (LORD) cut covenant with Abram, fire passed between the pieces of the sacrifice — the divine flame accepting and sealing the offering. So in Leviticus 9, *there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering* (Leviticus 9:24): the same covenant-fire that fell at the seed-promise now seals the priesthood.'),
    ('canon','leviticus',9,24,'canon','judges',6,21,'free',
     E'*Then the angel of Yahuah (LORD) put forth the end of the staff that was in his hand, and touched the flesh and the unleavened cakes; and there rose up fire out of the rock, and consumed the flesh and the unleavened cakes.* (Judges 6:21). The Angel of Yahuah (LORD) — the Formed Son who bears the Name — brings fire to consume Gideon''s offering, the sign that it is received. The same heavenly fire that *consumed upon the altar the burnt offering* (Leviticus 9:24) marks an offering accepted.'),
    ('canon','leviticus',9,24,'canon','1-kings',18,38,'free',
     E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.* (1 Kings 18:38). At Carmel the fire of Yahuah (LORD) falls and consumes Elijah''s offering before all Yashar''el (Israel), the proof of the true Elohim (God). It is the same witness given at the dedication of the priesthood — *there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering* (Leviticus 9:24).'),
    ('canon','leviticus',9,24,'canon','2-chronicles',7,1,'free',
     E'*Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* (2 Chronicles 7:1). When the temple is dedicated, fire from heaven consumes the offering and the Glory fills the house — exactly as at the dedication of the tabernacle priesthood, where *there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat* (Leviticus 9:24). The fire and the Glory together declare the dwelling accepted.'),
    ('canon','leviticus',9,24,'canon','acts',2,3,'free',
     E'*And there appeared unto them cloven tongues like as of fire, and it sat upon each of them.* (Acts 2:3). At Shavuot the fire descends not on an altar of stone but upon the gathered people, the Spirit accepting the new house. As at the founding of the priesthood *there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering* (Leviticus 9:24), so at the appointed feast the heavenly fire rests upon Yahuah''s (LORD''s) own — the offering received and the dwelling sealed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-9-the-eighth-day-atonement-first-for-himself-then-the-people',
       E'The eighth day: atonement first for himself, then for the people',
       E'On the eighth day the priesthood at last begins to minister. Moses charges Aaron, *offer thy sin offering, and thy burnt offering, and make an atonement for thyself, and for the people: and offer the offering of the people, and make an atonement for them; as Yahuah (LORD) commanded* (Leviticus 9:7). The earthly high priest must first be cleansed of his own sin before he can stand for Yashar''el (Israel) — and Moses promises the reward of obedience, *for to day Yahuah (LORD) will appear unto you* (Leviticus 9:4), *the glory of Yahuah (LORD) shall appear unto you* (Leviticus 9:6).\n\nThis was the very thing Yahuah (LORD) had pledged at the consecration: *And there I will meet with the children of Yashar''el (Israel), and the tabernacle shall be sanctified by my glory* (Exodus 29:43), *I will sanctify also both Aaron and his sons, to minister to me in the priest''s office* (Exodus 29:44). The word of Exodus 29 is the seed; Leviticus 9 is its harvest.\n\nThe order — first for himself, then for the people — is exactly what the book of Hebrews reads forward to the Formed Son: *Who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself* (Hebrews 7:27). Aaron''s twofold atonement is the shadow; the High Priest after Melek Tsadiq (Melchizedek), without sin of his own, is the substance.',
       sv.verse_id, ev.verse_id, 'free', 22900
  FROM _s311_lev09_lookup sv, _s311_lev09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-9-the-first-full-priestly-service',
       E'The first full priestly service',
       E'Leviticus 1-7 had laid down the law of every offering — the burnt, the meat, the sin, the trespass, the peace offerings. Leviticus 9 is the day those laws are first carried out by the consecrated priesthood. Aaron *brought the people''s offering, and took the goat, which was the sin offering for the people, and slew it, and offered it for sin, as the first* (Leviticus 9:15), then the burnt offering, the meat offering, and the peace offerings in turn — the whole roster summed up in the Torah, *This is the law of the burnt offering, of the meat offering, and of the sin offering, and of the trespass offering, and of the consecrations, and of the sacrifice of the peace offerings* (Leviticus 7:37).\n\nThe obedience answers the instruction word for word. The burnt-offering law commanded, *his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 1:9) — and Aaron *did wash the inwards and the legs, and burnt them upon the burnt offering on the altar* (Leviticus 9:14). The written Torah of offerings becomes living service; the covenant instruction is not a dead letter but a walk performed before Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 22903
  FROM _s311_lev09_lookup sv, _s311_lev09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=9 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people',
       E'Aaron lifted up his hand and blessed the people',
       E'When the offerings are finished, *Aaron lifted up his hand toward the people, and blessed them, and came down from offering of the sin offering, and the burnt offering, and peace offerings* (Leviticus 9:22); then *Moses and Aaron went into the tabernacle of the congregation, and came out, and blessed the people: and the glory of Yahuah (LORD) appeared unto all the people* (Leviticus 9:23). The lifted hand of the high priest is the priestly blessing that Numbers sets in words — *On this wise ye shall bless the children of Yashar''el (Israel)... Yahuah (LORD) bless thee, and keep thee* (Numbers 6:23-24). And the blessing is no mere wish: *they shall put my name upon the children of Yashar''el (Israel); and I will bless them* (Numbers 6:27). The Name is laid on the two-house people, marked as his own.\n\nThe pattern reaches its fulfilment in the Formed Son, the true High Priest. *And he led them out as far as to Bethany, and he lifted up his hands, and blessed them* (Luke 24:50) — the same lifted hands, the same blessing. And as in Leviticus 9 the blessing is answered by the Glory revealed, so *while he blessed them, he was parted from them, and carried up into heaven* (Luke 24:51): Yahusha (Jesus) blesses and is taken up into that very Glory. The priesthood of Leviticus 9 is the shadow of which the ascension is the substance.',
       sv.verse_id, ev.verse_id, 'free', 22906
  FROM _s311_lev09_lookup sv, _s311_lev09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=9 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-9-fire-out-from-before-yahuah-consumed-the-offering',
       E'Fire out from before Yahuah consumed the offering',
       E'The chapter closes with the seal of heaven upon the new priesthood: *And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces* (Leviticus 9:24). Fire from before Yahuah (LORD) is the witness of an offering accepted, and it runs as a thread through the whole canon.\n\nIt fell at the seed-covenant with Abram — *behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17). The Angel of Yahuah (LORD), the Formed Son who bears the Name, brought it to Gideon: *there rose up fire out of the rock, and consumed the flesh and the unleavened cakes* (Judges 6:21). It fell at Carmel against the prophets of Baal — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice* (1 Kings 18:38) — and it fell at the dedication of the temple: *the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1). Always the same testimony: fire and Glory together declare the dwelling received.\n\nAt the appointed feast of Shavuot the fire descends once more, no longer on an altar of stone but upon the gathered people: *there appeared unto them cloven tongues like as of fire, and it sat upon each of them* (Acts 2:3). The Spirit rests upon Yahuah''s (LORD''s) own, the offering received and the new house sealed — the consummation of the fire that first fell upon the altar in Leviticus 9.',
       sv.verse_id, ev.verse_id, 'free', 22909
  FROM _s311_lev09_lookup sv, _s311_lev09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=9 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1: the eighth day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who needeth not daily... to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself* (Hebrews 7:27) — the order of Leviticus 9:7 read forward to the sinless High Priest.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-the-eighth-day-atonement-first-for-himself-then-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the tabernacle shall be sanctified by my glory* (Exodus 29:43) — the promised Glory that Leviticus 9:6 declares come on the eighth day.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-the-eighth-day-atonement-first-for-himself-then-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will sanctify also both Aaron and his sons, to minister to me in the priest''s office* (Exodus 29:44) — the office set apart, now first exercised at Leviticus 9:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-the-eighth-day-atonement-first-for-himself-then-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the first full priestly service
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*This is the law of the burnt offering, of the meat offering, and of the sin offering... and of the sacrifice of the peace offerings* (Leviticus 7:37) — the roll-call of Leviticus 1-7 now first performed in Leviticus 9:15.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-the-first-full-priestly-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his inwards and his legs shall he wash in water: and the priest shall burn all on the altar* (Leviticus 1:9) — the burnt-offering law answered word for word in Leviticus 9:14.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-the-first-full-priestly-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: Aaron lifted up his hand and blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23) — the priestly blessing whose words Aaron''s lifted hand carries in Leviticus 9:22.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall put my name upon the children of Yashar''el (Israel); and I will bless them* (Numbers 6:27) — the Name laid on the two-house people through the high priest''s blessing of Leviticus 9:22.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he led them out as far as to Bethany, and he lifted up his hands, and blessed them* (Luke 24:50) — the Formed Son, the true High Priest, repeats Aaron''s lifted-hand blessing of Leviticus 9:22.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=22
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*while he blessed them, he was parted from them, and carried up into heaven* (Luke 24:51) — the blessing answered by the Glory, as in Leviticus 9:23 the Glory appears to all the people.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-aaron-lifted-up-his-hand-and-blessed-the-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: fire out from before Yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17) — the covenant-fire of the seed-promise, kin to the fire that consumes the altar in Leviticus 9:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-fire-out-from-before-yahuah-consumed-the-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there rose up fire out of the rock, and consumed the flesh and the unleavened cakes* (Judges 6:21) — the Angel of Yahuah brings the accepting fire, as at the altar of Leviticus 9:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-fire-out-from-before-yahuah-consumed-the-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice* (1 Kings 18:38) — the Carmel fire of acceptance, the same witness as Leviticus 9:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-fire-out-from-before-yahuah-consumed-the-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the fire came down from heaven, and consumed the burnt offering... and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1) — fire and Glory together at the temple, as at the tabernacle altar of Leviticus 9:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-fire-out-from-before-yahuah-consumed-the-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*there appeared unto them cloven tongues like as of fire, and it sat upon each of them* (Acts 2:3) — the heavenly fire at Shavuot resting on the people, the consummation of the altar-fire of Leviticus 9:24.'
  FROM cross_reference_threads t
  JOIN _s311_lev09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s311_lev09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-9-fire-out-from-before-yahuah-consumed-the-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_10.sql (Leviticus 10) -----
-- Chapter: Leviticus 10  |  tag: lev10  |  session prefix: s311
-- Sort band base 22925 step 3  -> 22925, 22928, 22931, 22934
--
-- Leviticus 10 coverage:
--   v.1-3  NT:     Acts 5:5/5:10 (Ananias & Sapphira), Heb 12:28-29 (consuming fire), Heb 10:31 (FORWARD)
--          Extras: none warranted
--          Tanakh: Deut 12:32 (add-not), Exod 30:9 (no strange incense), 1 Chr 13:9-10 (Uzza) (LATERAL)
--   v.4-5  NT:     none warranted
--          Extras: none warranted
--          Tanakh: folded into v.6-7 thread (carrying out / not mourning)
--   v.6-7  NT:     none warranted
--          Extras: none warranted
--          Tanakh: Lev 21:10-12 (high priest not to mourn / not leave sanctuary, anointing oil) (LATERAL)
--   v.8-11 NT:     1 Tim 3:2-3 (bishop sober, apt to teach, not given to wine) (FORWARD)
--          Extras: none warranted
--          Tanakh: Ezek 44:23 (teach the difference holy/profane, clean/unclean), Mal 2:7 (priest's lips
--                  keep knowledge / Torah at his mouth), Lev 11:47 (make a difference) (LATERAL)
--   v.12-20 NT:    1 Cor 9:13 (they that wait at the altar are partakers with the altar) (FORWARD)
--          Extras: none warranted
--          Tanakh: Num 18:9-10 (most holy things the priests' due, eaten in the holy place) (LATERAL)
--
-- Threads (4):
--   leviticus-10-strange-fire-which-he-commanded-not  [free]
--        -> Deut 12:32, Exod 30:9, 1 Chr 13:9, 1 Chr 13:10, Acts 5:5, Acts 5:10, Heb 12:28, Heb 12:29, Heb 10:31
--   leviticus-10-the-priest-set-apart-even-from-grief  [free]
--        -> Lev 21:10, Lev 21:11, Lev 21:12
--   leviticus-10-sober-to-teach-the-difference-holy-and-clean  [free]
--        -> 1 Tim 3:2, 1 Tim 3:3, Ezek 44:23, Mal 2:7, Lev 11:47
--   leviticus-10-the-priests-due-eaten-in-the-holy-place  [free]
--        -> Num 18:9, Num 18:10, 1 Cor 9:13
--
-- Framework note: 10:1-3 strange fire = unauthorized worship. The holiness of approach — Yahuah is
-- worshipped ONLY as he commanded, never by man's invention (the very principle of Deut 12:32 add-not).
-- The fire that devoured Nadab and Abihu is the same consuming-fire holiness the new assembly meets in
-- Acts 5 and Heb 12:28-29. 10:10-11 establishes the priest's discerning/teaching office (Ezek 44:23,
-- Mal 2:7) — Torah taught and the clean/unclean distinction (Lev 11:47) STANDS, never abolished.

CREATE TEMP VIEW _s311_lev10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ---- 10:1-3 strange fire ----
    ('canon','leviticus',10,1,'canon','deuteronomy',12,32,'free',
      E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it.* (Deuteronomy 12:32). Nadab and Abihu *offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1) — the precise violation of the add-not law. Worship is rendered ONLY as Yahuah commanded; man''s invention added to the altar is not zeal but transgression.'),
    ('canon','leviticus',10,1,'canon','exodus',30,9,'free',
      E'*Ye shall offer no strange incense thereon, nor burnt sacrifice, nor meat offering; neither shall ye pour drink offering thereon.* (Exodus 30:9). The altar of incense had already been fenced with this exact prohibition. When the sons of Aaron *put incense thereon, and offered strange fire* (Leviticus 10:1), they crossed a line Yahuah had drawn in plain words — the unauthorized offering the law named beforehand.'),
    ('canon','leviticus',10,2,'canon','1-chronicles',13,9,'free',
      E'*And when they came unto the threshingfloor of Chidon, Uzza put forth his hand to hold the ark; for the oxen stumbled.* (1 Chronicles 13:9). As *there went out fire from Yahuah (LORD), and devoured them* (Leviticus 10:2), so Uzza reached toward the holy thing his own way. The holiness of approach is not a matter of good intentions but of Yahuah''s appointed manner.'),
    ('canon','leviticus',10,2,'canon','1-chronicles',13,10,'free',
      E'*And the anger of Yahuah (LORD) was kindled against Uzza, and he smote him, because he put his hand to the ark: and there he died before Elohim (God).* (1 Chronicles 13:10). The same stroke that fell on Nadab and Abihu fell on Uzza — *they died before Yahuah (LORD)* (Leviticus 10:2). Both died at the point of holy contact taken on man''s terms rather than Yahuah''s.'),
    ('canon','leviticus',10,3,'canon','acts',5,5,'free',
      E'*And Ananias hearing these words fell down, and gave up the ghost: and great fear came on all them that heard these things.* (Acts 5:5). *I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3) — the holiness of approach carries forward into the new assembly. As fire devoured the sons of Aaron at the threshold of worship, so Ananias fell at the threshold of the gathered body.'),
    ('canon','leviticus',10,3,'canon','acts',5,10,'free',
      E'*Then fell she down straightway at his feet, and yielded up the ghost: and the young men came in, and found her dead, and, carrying her forth, buried her by her husband.* (Acts 5:10). As Sapphira fell, so the principle of *before all the people I will be glorified* (Leviticus 10:3) holds — the same holiness that struck two sons of Aaron strikes two members of the assembly, that the people might fear and the Name be sanctified among them.'),
    ('canon','leviticus',10,3,'canon','hebrews',12,28,'free',
      E'*Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear:* (Hebrews 12:28). *I will be sanctified in them that come nigh me* (Leviticus 10:3) is the reverence Hebrews names — to come near is to come near acceptably, in the manner he commanded, with godly fear.'),
    ('canon','leviticus',10,3,'canon','hebrews',12,29,'free',
      E'*For our Elohim (God) is a consuming fire.* (Hebrews 12:29). The fire that *devoured them* (Leviticus 10:2) is the same Elohim the assembly serves still. *Before all the people I will be glorified* (Leviticus 10:3) — his holiness is not diminished but is the very ground of reverent approach.'),
    ('canon','leviticus',10,3,'canon','hebrews',10,31,'free',
      E'*It is a fearful thing to fall into the hands of the living Elohim (God).* (Hebrews 10:31). Nadab and Abihu fell into those hands at the altar; *Aaron held his peace* (Leviticus 10:3). The dread of unauthorized approach to the living Elohim is one across both Testaments.'),
    -- ---- 10:6-7 priest set apart even from grief ----
    ('canon','leviticus',10,6,'canon','leviticus',21,10,'free',
      E'*And he that is the high priest among his brethren, upon whose head the anointing oil was poured, and that is consecrated to put on the garments, shall not uncover his head, nor rend his clothes;* (Leviticus 21:10). *Uncover not your heads, neither rend your clothes; lest ye die* (Leviticus 10:6) is here made permanent statute — the priest set apart even from the ordinary signs of mourning.'),
    ('canon','leviticus',10,6,'canon','leviticus',21,11,'free',
      E'*Neither shall he go in to any dead body, nor defile himself for his father, or for his mother;* (Leviticus 21:11). Aaron is forbidden to bewail his own sons, *but let your brethren, the whole house of Yashar''el (Israel), bewail the burning* (Leviticus 10:6) — the priest''s separation runs deeper than his own grief, even for nearest kin.'),
    ('canon','leviticus',10,7,'canon','leviticus',21,12,'free',
      E'*Neither shall he go out of the sanctuary, nor profane the sanctuary of his Elohim (God); for the crown of the anointing oil of his Elohim (God) is upon him: I am Yahuah (LORD).* (Leviticus 21:12). The reason Aaron may *not go out from the door of the tabernacle* is named identically: *for the anointing oil of Yahuah (LORD) is upon you* (Leviticus 10:7). The oil binds the priest to his post above his own sorrow.'),
    -- ---- 10:8-11 sober, teach the difference ----
    ('canon','leviticus',10,9,'canon','1-timothy',3,3,'free',
      E'*Not given to wine, no striker, not greedy of filthy lucre; but patient, not a brawler, not covetous;* (1 Timothy 3:3). *Do not drink wine nor strong drink... when ye go into the tabernacle* (Leviticus 10:9) carries forward to the overseer of the assembly — the one who serves the holy things must be sober, then as now.'),
    ('canon','leviticus',10,11,'canon','1-timothy',3,2,'free',
      E'*A bishop then must be blameless, the husband of one wife, vigilant, sober, of good behaviour, given to hospitality, apt to teach;* (1 Timothy 3:2). The priest''s charge to *teach the children of Yashar''el (Israel) all the statutes which Yahuah (LORD) hath spoken* (Leviticus 10:11) is the same office — sober and apt to teach. The teaching of the statutes is not retired but renewed in the overseer.'),
    ('canon','leviticus',10,10,'canon','ezekiel',44,23,'free',
      E'*And they shall teach my people the difference between the holy and profane, and cause them to discern between the unclean and the clean.* (Ezekiel 44:23). This is Leviticus 10:10 spoken again over the priesthood of the restored temple — *that ye may put difference between holy and unholy, and between unclean and clean*. The discerning office endures into Ezekiel''s vision of the gathered house.'),
    ('canon','leviticus',10,11,'canon','malachi',2,7,'free',
      E'*For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* (Malachi 2:7). The priest is the teacher of Torah — *that ye may teach the children of Yashar''el (Israel) all the statutes* (Leviticus 10:11). Malachi indicts the priesthood precisely for failing this Levitical commission.'),
    ('canon','leviticus',10,10,'canon','leviticus',11,47,'free',
      E'*To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten.* (Leviticus 11:47). The very next chapter applies the discerning charge — *that ye may put difference... between unclean and clean* (Leviticus 10:10) — to the dietary law. The clean/unclean distinction is the priest''s to teach and Yashar''el''s to keep; it stands, never abolished.'),
    -- ---- 10:12-20 the priests' due ----
    ('canon','leviticus',10,13,'canon','numbers',18,9,'free',
      E'*This shall be thine of the most holy things, reserved from the fire: every oblation of theirs, every meat offering of theirs, and every sin offering of theirs, and every trespass offering of theirs, which they shall render unto me, shall be most holy for thee and for thy sons.* (Numbers 18:9). *It is thy due, and thy sons'' due, of the sacrifices of Yahuah (LORD) made by fire* (Leviticus 10:13) — the priests'' portion of the most holy things, confirmed as Yahuah''s ordinance.'),
    ('canon','leviticus',10,13,'canon','numbers',18,10,'free',
      E'*In the most holy place shalt thou eat it; every male shall eat it: it shall be holy unto thee.* (Numbers 18:10). The command to *eat it in the holy place* (Leviticus 10:13) is reaffirmed — the priests'' due is eaten where it is holy, not carried out as common bread.'),
    ('canon','leviticus',10,17,'canon','1-corinthians',9,13,'free',
      E'*Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13). *Elohim (God) hath given it you... to make atonement for them* (Leviticus 10:17) — the priests eat the sin offering as their due. Paul reaches back to this very ordinance: those who serve the altar live of the altar.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-10-strange-fire-which-he-commanded-not',
       E'Strange fire: I will be sanctified in them that come nigh me',
       E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not. And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD).* (Leviticus 10:1-2). The offence is named exactly: fire *which he commanded them not*. This is the holiness of approach — Yahuah is worshipped only as he commanded, never by man''s invention. It is the very principle of the add-not law: *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32), and the prior fence on the altar of incense, *Ye shall offer no strange incense thereon* (Exodus 30:9). The same stroke fell on Uzza, who *put forth his hand to hold the ark* and *died before Elohim (God)* (1 Chronicles 13:9-10) — holy contact taken on man''s terms. Moses gives the meaning: *I will be sanctified in them that come nigh me, and before all the people I will be glorified. And Aaron held his peace* (Leviticus 10:3). That holiness does not retire. In the new assembly Ananias and Sapphira *fell down... and gave up the ghost* (Acts 5:5,10) at the threshold of the gathered body. *For our Elohim (God) is a consuming fire* (Hebrews 12:29); *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28); *It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31). Strange fire is unauthorized worship, and the consuming-fire holiness is one across the whole library.',
       sv.verse_id, ev.verse_id, 'free', 22925
  FROM _s311_lev10_lookup sv, _s311_lev10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-10-the-priest-set-apart-even-from-grief',
       E'The priest set apart even from grief',
       E'With his two sons just dead, Aaron is forbidden the ordinary signs of mourning: *Uncover not your heads, neither rend your clothes; lest ye die, and lest wrath come upon all the people: but let your brethren, the whole house of Yashar''el (Israel), bewail the burning which Yahuah (LORD) hath kindled* (Leviticus 10:6). Nor may he leave his post: *ye shall not go out from the door of the tabernacle of the congregation, lest ye die: for the anointing oil of Yahuah (LORD) is upon you* (Leviticus 10:7). The oil binds the priest to his service above his own sorrow. This is made permanent statute for the high priest: *upon whose head the anointing oil was poured... shall not uncover his head, nor rend his clothes* (Leviticus 21:10); *neither shall he... defile himself for his father, or for his mother* (Leviticus 21:11); *neither shall he go out of the sanctuary... for the crown of the anointing oil of his Elohim (God) is upon him: I am Yahuah (LORD)* (Leviticus 21:12). The set-apart one grieves as no other man may, because the oil of Yahuah is upon him.',
       sv.verse_id, ev.verse_id, 'free', 22928
  FROM _s311_lev10_lookup sv, _s311_lev10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-10-sober-to-teach-the-difference-holy-and-clean',
       E'The priest sober, the priest the teacher of the difference',
       E'*Do not drink wine nor strong drink, thou, nor thy sons with thee, when ye go into the tabernacle of the congregation, lest ye die: it shall be a statute for ever throughout your generations* (Leviticus 10:9). The reason follows in two charges that define the priestly office: *And that ye may put difference between holy and unholy, and between unclean and clean; And that ye may teach the children of Yashar''el (Israel) all the statutes which Yahuah (LORD) hath spoken unto them by the hand of Moses* (Leviticus 10:10-11). The priest must be sober because he is the discerner and the teacher. The discerning charge is applied at once to the dietary law — *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47) — a distinction that stands, never abolished. The prophets hold the priesthood to this very commission: *they shall teach my people the difference between the holy and profane, and cause them to discern between the unclean and the clean* (Ezekiel 44:23); *the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7). And the office carries forward to the overseer of the assembly, who must be *sober... apt to teach* (1 Timothy 3:2) and *not given to wine* (1 Timothy 3:3). The teaching/discerning office endures.',
       sv.verse_id, ev.verse_id, 'free', 22931
  FROM _s311_lev10_lookup sv, _s311_lev10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-10-the-priests-due-eaten-in-the-holy-place',
       E'The priests'' due, eaten in the holy place',
       E'The portions of the offerings are the priests'' rightful due, and must be eaten where they are holy: *ye shall eat it in the holy place, because it is thy due, and thy sons'' due, of the sacrifices of Yahuah (LORD) made by fire: for so I am commanded* (Leviticus 10:13). This is the ordinance confirmed in Numbers: *This shall be thine of the most holy things, reserved from the fire... most holy for thee and for thy sons* (Numbers 18:9); *In the most holy place shalt thou eat it; every male shall eat it: it shall be holy unto thee* (Numbers 18:10). When Aaron does not eat the sin offering on the day his sons died, Moses presses the reason: *Elohim (God) hath given it you to bear the iniquity of the congregation, to make atonement for them before Yahuah (LORD)* (Leviticus 10:17); yet hearing Aaron''s reverent answer, *Moses heard that, he was content* (Leviticus 10:20). The priests'' eating of the holy things is part of the atonement, not a mere meal — and Paul reaches back to it: *they which wait at the altar are partakers with the altar* (1 Corinthians 9:13). Those who serve the altar live of the altar, by Yahuah''s own appointment.',
       sv.verse_id, ev.verse_id, 'free', 22934
  FROM _s311_lev10_lookup sv, _s311_lev10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=10 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1: strange fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 12:32 — *thou shalt not add thereto, nor diminish from it*: the add-not law that strange fire breaks.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 30:9 — *Ye shall offer no strange incense thereon*: the prior fence on the altar that names the offence beforehand.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 13:9 — Uzza puts forth his hand to the ark: holy contact taken on man''s terms.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Chronicles 13:10 — *the anger of Yahuah (LORD) was kindled against Uzza... there he died*: the same stroke as the sons of Aaron.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 5:5 — Ananias falls dead at the threshold of the assembly: the holiness of approach into the new gathering.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Acts 5:10 — Sapphira falls likewise: *before all the people I will be glorified* carried into the new assembly.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Hebrews 12:28 — *serve Elohim (God) acceptably with reverence and godly fear*: to come near is to come near as commanded.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Hebrews 12:29 — *For our Elohim (God) is a consuming fire*: the fire that devoured them is the Elohim we serve still.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Hebrews 10:31 — *It is a fearful thing to fall into the hands of the living Elohim (God)*: the dread of unauthorized approach, one across both Testaments.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=3
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-strange-fire-which-he-commanded-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: priest set apart even from grief
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 21:10 — the high priest *shall not uncover his head, nor rend his clothes*: Leviticus 10:6 made permanent statute.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=21 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priest-set-apart-even-from-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 21:11 — not to defile himself even *for his father, or for his mother*: the priest''s separation runs deeper than nearest kin.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=21 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priest-set-apart-even-from-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 21:12 — *neither shall he go out of the sanctuary... for the crown of the anointing oil... is upon him*: the same reason given in Leviticus 10:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=7
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=21 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priest-set-apart-even-from-grief'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: sober to teach the difference
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Timothy 3:3 — *Not given to wine*: the overseer of the assembly sober, as the priest who goes into the tabernacle.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-sober-to-teach-the-difference-holy-and-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 11:47 — *To make a difference between the unclean and the clean*: the discerning charge applied to the dietary law, which stands.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-sober-to-teach-the-difference-holy-and-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezekiel 44:23 — *they shall teach my people the difference between the holy and profane*: Leviticus 10:10 over the restored priesthood.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-sober-to-teach-the-difference-holy-and-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Timothy 3:2 — the overseer *sober... apt to teach*: the priest''s teaching commission renewed.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-sober-to-teach-the-difference-holy-and-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Malachi 2:7 — *the priest''s lips should keep knowledge, and they should seek the law at his mouth*: the Levitical commission to teach Torah.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-sober-to-teach-the-difference-holy-and-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the priests' due
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 18:9 — the most holy things *most holy for thee and for thy sons*: the priests'' due confirmed as Yahuah''s ordinance.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priests-due-eaten-in-the-holy-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 18:10 — *In the most holy place shalt thou eat it*: the command to eat the due in the holy place reaffirmed.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priests-due-eaten-in-the-holy-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 9:13 — *they which wait at the altar are partakers with the altar*: Paul reaches back to this very ordinance.'
  FROM cross_reference_threads t
  JOIN _s311_lev10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s311_lev10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-10-the-priests-due-eaten-in-the-holy-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session311 — Leviticus cross-references complete.'
