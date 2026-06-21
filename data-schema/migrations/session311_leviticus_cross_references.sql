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

-- ----- fragment: minion_leviticus_11.sql (Leviticus 11) -----
--
-- BOOK: Leviticus  CHAPTER: 11  TAG: lev11  SESSION: s311
-- SORT BAND: base 22950 step 3  (22950, 22953, 22956, 22959, 22962, 22965)
-- VIEW: _s311_lev11_lookup
--
-- FRAMING: Leviticus 11 is THE clean/unclean dietary law — STANDING Torah, the ground of
-- holiness, never abolished. It is read in its own dietary context: the distinction between
-- clean and unclean is what it MEANS to be set apart unto Yahuah. The prophets carry it
-- forward to the consummation (Isaiah 65/66 — eaters of swine's flesh judged at the end), and
-- the apostles KEEP it after the resurrection (1 Peter quotes "be ye holy" FROM this chapter;
-- Acts 10 is Peter's OWN interpretation — "I should not call any MAN common or unclean,"
-- about the two-house ingathering of men, NOT a repeal of the menu). No license; no abolition.
--
-- Curated thematically (5–7 threads), NOT animal-by-animal.
--
-- COVERAGE CHECKLIST:
--   v.1-8  (clean/unclean BEASTS — part the hoof AND chew the cud; camel/coney/hare/swine unclean)
--        NT:     Isaiah carried fwd to NT not directly; framed via 11:44-47 thread — 'none warranted' here
--        Extras: none warranted
--        Tanakh: Deuteronomy 14:3-8 (same law restated); Genesis 7:2 (clean/unclean before Sinai);
--                Isaiah 65:4 + Isaiah 66:17 (swine-eaters judged at the end)  [thread 1]
--   v.9-12 (clean/unclean WATER creatures — fins and scales clean, else abomination)
--        NT:     none warranted   Extras: none warranted
--        Tanakh: Deuteronomy 14:9-10  [thread 2]
--   v.13-23 (unclean BIRDS + winged creeping things)
--        NT:     none warranted   Extras: none warranted
--        Tanakh: Deuteronomy 14:11-20  [thread 3]
--   v.24-40 (uncleanness from touching/bearing carcases — the contagion of the unclean)
--        NT:     none warranted   Extras: none warranted
--        Tanakh: Leviticus 11:43-44 self (holiness motive); kept within the be-holy thread — bound to v.44  [thread 4]
--   v.41-43 (creeping/swarming things forbidden — make not yourselves abominable / defiled)
--        NT:     none warranted   Extras: none warranted
--        Tanakh: bound forward to 11:44 (holiness motive)  [thread 5]
--   v.44-47 (★★ I am Yahuah... be ye holy for I am holy; make a DIFFERENCE between unclean/clean)
--        NT:     1 Peter 1:15-16 (Peter quotes THIS verse); Acts 10:14-15,28 (Peter keeps it,
--                interprets the vision as about MEN not food); 2 Corinthians 6:17 (touch not the unclean)
--        Extras: none warranted
--        Tanakh: Leviticus 20:25-26 (put difference / severed you); Ezekiel 44:23 (teach the difference)  [thread 6]
--
-- THREADS (6):
--   leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth          [Tanakh: Deut, Gen, Isaiah]  free
--   leviticus-11-fins-and-scales-the-clean-of-the-waters               [Tanakh: Deut]               free
--   leviticus-11-the-unclean-fowls-and-the-winged-creeping-things      [Tanakh: Deut]               free
--   leviticus-11-the-contagion-of-the-carcase                          [Tanakh: Leviticus self]     free
--   leviticus-11-defile-not-yourselves-with-the-creeping-things        [Tanakh: Leviticus self]     free
--   leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands   [NT + Tanakh]                free
--
-- All slugs start leviticus-11- ; none in EXISTING_SLUGS.txt.

CREATE TEMP VIEW _s311_lev11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: clean/unclean beasts (11:3, 11:7, 11:8)
    ('canon','leviticus',11,3,'canon','deuteronomy',14,6,'free',
      E'*And every beast that parteth the hoof, and cleaveth the cleft into two claws, and cheweth the cud among the beasts, that ye shall eat* (Deuteronomy 14:6). The same Torah restated to the second generation: *Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3). One law, twice given — the standing rule of what may be eaten among Yahuah''s set-apart people.'),
    ('canon','leviticus',11,7,'canon','deuteronomy',14,8,'free',
      E'*And the swine, because it divideth the hoof, yet cheweth not the cud, it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase* (Deuteronomy 14:8). Moses restates the swine''s exclusion verbatim with Leviticus: *the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* (Leviticus 11:7). The pig is the type-case of the unclean throughout the canon.'),
    ('canon','leviticus',11,4,'canon','deuteronomy',14,7,'free',
      E'*Nevertheless these ye shall not eat of them that chew the cud, or of them that divide the cloven hoof; as the camel, and the hare, and the coney: for they chew the cud, but divide not the hoof; therefore they are unclean unto you* (Deuteronomy 14:7). The same camel, hare, and coney that Leviticus names — *the camel, because he cheweth the cud, but divideth not the hoof; he is unclean unto you* (Leviticus 11:4) — the half-mark is not enough; both signs together, or it is unclean.'),
    ('canon','leviticus',11,2,'canon','genesis',7,2,'free',
      E'*Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female* (Genesis 7:2). The clean/unclean distinction is older than Sinai — Noah already knew it at the ark, generations before *These are the beasts which ye shall eat* (Leviticus 11:2) was spoken to Yashar''el (Israel). Leviticus 11 codifies a difference Yahuah had drawn from the foundation of the world.'),
    ('canon','leviticus',11,8,'canon','isaiah',65,4,'free',
      E'*Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels* (Isaiah 65:4). Centuries after Leviticus said *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8), Isaiah indicts a people for eating that very swine''s flesh — the law still binding, the violation still provoking Yahuah to His face.'),
    ('canon','leviticus',11,8,'canon','isaiah',66,17,'free',
      E'*They that sanctify themselves, and purify themselves in the gardens behind one tree in the midst, eating swine''s flesh, and the abomination, and the mouse, shall be consumed together, saith Yahuah (LORD)* (Isaiah 66:17). At the consummation, in the very last chapter of Isaiah, the eaters of swine''s flesh and the mouse are consumed together — proof the dietary law of *they are unclean to you* (Leviticus 11:8) stands to the end of the age, never abolished.'),

    -- THREAD 2: water creatures (11:9, 11:10)
    ('canon','leviticus',11,9,'canon','deuteronomy',14,9,'free',
      E'*These ye shall eat of all that are in the waters: all that have fins and scales shall ye eat* (Deuteronomy 14:9). The water-rule restated for the second generation, word for word with *These shall ye eat of all that are in the waters: whatsoever hath fins and scales in the waters, in the seas, and in the rivers, them shall ye eat* (Leviticus 11:9).'),
    ('canon','leviticus',11,10,'canon','deuteronomy',14,10,'free',
      E'*And whatsoever hath not fins and scales ye may not eat; it is unclean unto you* (Deuteronomy 14:10). Moses repeats the exclusion of Leviticus — *all that have not fins and scales in the seas, and in the rivers... they shall be an abomination unto you* (Leviticus 11:10) — the one test, fins and scales, settling clean from unclean in the waters.'),

    -- THREAD 3: fowls + winged creeping (11:13, 11:20)
    ('canon','leviticus',11,13,'canon','deuteronomy',14,12,'free',
      E'*But these are they of which ye shall not eat: the eagle, and the ossifrage, and the ospray* (Deuteronomy 14:12). The forbidden-fowl list of Leviticus restated — *these are they which ye shall have in abomination among the fowls; they shall not be eaten, they are an abomination: the eagle, and the ossifrage, and the ospray* (Leviticus 11:13) — the birds of prey and carrion the same in both tellings of the Torah.'),
    ('canon','leviticus',11,20,'canon','deuteronomy',14,19,'free',
      E'*And every creeping thing that flieth is unclean unto you: they shall not be eaten* (Deuteronomy 14:19). The winged swarmers forbidden in Leviticus — *All fowls that creep, going upon all four, shall be an abomination unto you* (Leviticus 11:20) — are excluded again in Deuteronomy, save the leaping locust kinds Leviticus permits.'),

    -- THREAD 4: contagion of the carcase (11:24, 11:32, 11:39)
    ('canon','leviticus',11,24,'canon','leviticus',11,44,'free',
      E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth* (Leviticus 11:44). The carcase-uncleanness — *whosoever toucheth the carcase of them shall be unclean until the even* (Leviticus 11:24) — is not arbitrary ritual: it is the outworking of the holiness Yahuah names as its ground. The contagion teaches that uncleanness spreads, and holiness must be guarded.'),
    ('canon','leviticus',11,32,'canon','leviticus',11,47,'free',
      E'*To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47). The vessel that the dead unclean thing falls upon — *it shall be unclean... it must be put into water, and it shall be unclean until the even; so it shall be cleansed* (Leviticus 11:32) — enacts in everyday objects the very difference the chapter exists to draw.'),

    -- THREAD 5: defile not yourselves with creeping things (11:41, 11:43)
    ('canon','leviticus',11,43,'canon','leviticus',11,44,'free',
      E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). The warning *Ye shall not make yourselves abominable with any creeping thing that creepeth, neither shall ye make yourselves unclean with them, that ye should be defiled thereby* (Leviticus 11:43) flows straight into its reason: because Yahuah Himself is holy, His people are not to defile themselves. The dietary command is grounded in the character of Yahuah.'),
    ('canon','leviticus',11,41,'canon','leviticus',11,42,'free',
      E'*Whatsoever goeth upon the belly, and whatsoever goeth upon all four, or whatsoever hath more feet among all creeping things that creep upon the earth, them ye shall not eat; for they are an abomination* (Leviticus 11:42). The blanket ban — *every creeping thing that creepeth upon the earth shall be an abomination; it shall not be eaten* (Leviticus 11:41) — is spelled out by the mode of their going, the serpent-belly-crawler chief among the abominable.'),

    -- THREAD 6: be ye holy / the difference that stands (11:44, 11:45, 11:47)
    ('canon','leviticus',11,44,'canon','1-peter',1,16,'free',
      E'*Because it is written, Be ye holy; for I am holy* (1 Peter 1:16). Peter cites THIS verse by name — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44) — long after the resurrection, binding the holiness call of Leviticus on the scattered believers. The dietary holiness law is quoted as living Scripture, not a defunct ordinance.'),
    ('canon','leviticus',11,45,'canon','1-peter',1,15,'free',
      E'*But as he which hath called you is holy, so be ye holy in all manner of conversation* (1 Peter 1:15). The redemption-ground of Leviticus — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45) — becomes Peter''s ground: the Yahuah who called and redeemed His people calls them to be holy as He is holy.'),
    ('canon','leviticus',11,47,'canon','acts',10,14,'free',
      E'*But Peter said, Not so, Yahuah (Lord); for I have never eaten any thing that is common or unclean* (Acts 10:14). Years after the resurrection Peter STILL keeps the difference Leviticus draws — *to make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47) — refusing to eat the unclean. The vision does not change his diet; he never does eat.'),
    ('canon','leviticus',11,47,'canon','acts',10,15,'free',
      E'*And the voice spake unto him again the second time, What Elohim (God) hath cleansed, that call not thou common* (Acts 10:15). The cleansing in view is not a repeal of *the difference between the unclean and the clean* (Leviticus 11:47); Peter himself supplies the meaning — the sheet of beasts is a parable about people, the Gentile (two-house) ingathering Yahuah is cleansing.'),
    ('canon','leviticus',11,47,'canon','acts',10,28,'free',
      E'*And he said unto them, Ye know how that it is an unlawful thing for a man that is a Yahudi (Jew) to keep company, or come unto one of another nation; but Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). Peter interprets his OWN vision: it is about MEN, not menu. The difference of Leviticus 11:47 stands; what was abolished was the man-made wall barring the nations from the household — the two houses gathered, not the dietary law repealed.'),
    ('canon','leviticus',11,44,'canon','2-corinthians',6,17,'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (LORD), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17, with v.17 here quoted in part). Paul echoes the Leviticus call — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves* (Leviticus 11:44) — *touch not the unclean thing* drawn straight from the language of separation unto Yahuah.'),
    ('canon','leviticus',11,47,'canon','leviticus',20,25,'free',
      E'*Ye shall therefore put difference between clean beasts and unclean, and between unclean fowls and clean: and ye shall not make your souls abominable by beast, or by fowl, or by any manner of living thing that creepeth on the ground, which I have separated from you as unclean* (Leviticus 20:25). The very charge of Leviticus 11:47 — *to make a difference between the unclean and the clean* — is repeated as the seal of holiness, the dietary line drawn because Yahuah has separated His people unto Himself.'),
    ('canon','leviticus',11,45,'canon','leviticus',20,26,'free',
      E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The refrain of Leviticus 11 — *ye shall therefore be holy, for I am holy* (Leviticus 11:45) — is restated as election: the dietary difference is the everyday badge of a people severed unto Yahuah.'),
    ('canon','leviticus',11,47,'canon','ezekiel',44,23,'free',
      E'*And they shall teach my people the difference between the holy and profane, and cause them to discern between the unclean and the clean* (Ezekiel 44:23). The priestly task in the restored temple is precisely to keep teaching the difference of Leviticus 11:47 — *to make a difference between the unclean and the clean* — proof the discernment between clean and unclean endures into the prophesied age of restoration.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth',
  E'The Clean and the Unclean Beasts of the Earth',
  E'The land-animal rule opens the dietary law: *Whatsoever parteth the hoof, and is clovenfooted, and cheweth the cud, among the beasts, that shall ye eat* (Leviticus 11:3) — both signs together, or unclean. The camel, coney, hare, and chief of all the swine fail the test: *the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you* (Leviticus 11:7), and *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you* (Leviticus 11:8). This is not a fleeting ceremonial whim. The same law is restated to the second generation — *And every beast that parteth the hoof, and cleaveth the cleft into two claws, and cheweth the cud among the beasts, that ye shall eat* (Deuteronomy 14:6) — and the distinction is older than Sinai: *Of every clean beast thou shalt take to thee by sevens... and of beasts that are not clean by two* (Genesis 7:2), Noah keeping it at the ark. It stands to the very end of the age: Isaiah indicts a people *which eat swine''s flesh, and broth of abominable things is in their vessels* (Isaiah 65:4), and in his last chapter declares that they that purify themselves *eating swine''s flesh, and the abomination, and the mouse, shall be consumed together, saith Yahuah (LORD)* (Isaiah 66:17). The clean/unclean line is standing Torah from the flood to the consummation.',
  sv.verse_id, ev.verse_id, 'free', 22950
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-fins-and-scales-the-clean-of-the-waters',
  E'Fins and Scales — The Clean of the Waters',
  E'One simple test settles the waters: *These shall ye eat of all that are in the waters: whatsoever hath fins and scales in the waters, in the seas, and in the rivers, them shall ye eat* (Leviticus 11:9). All else is barred — *all that have not fins and scales in the seas, and in the rivers... they shall be an abomination unto you* (Leviticus 11:10). The same rule is given again to the second generation: *These ye shall eat of all that are in the waters: all that have fins and scales shall ye eat* (Deuteronomy 14:9), and *whatsoever hath not fins and scales ye may not eat; it is unclean unto you* (Deuteronomy 14:10). The Torah speaks with one voice across both tellings.',
  sv.verse_id, ev.verse_id, 'free', 22953
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-the-unclean-fowls-and-the-winged-creeping-things',
  E'The Unclean Fowls and the Winged Creeping Things',
  E'The birds of prey and carrion are named and barred: *these are they which ye shall have in abomination among the fowls; they shall not be eaten, they are an abomination: the eagle, and the ossifrage, and the ospray* (Leviticus 11:13), through the owl, raven, stork, and bat. The winged swarmers too — *All fowls that creep, going upon all four, shall be an abomination unto you* (Leviticus 11:20) — save the leaping locust kinds that may be eaten. The list is restated to the second generation almost word for word: *these are they of which ye shall not eat: the eagle, and the ossifrage, and the ospray* (Deuteronomy 14:12), and *every creeping thing that flieth is unclean unto you: they shall not be eaten* (Deuteronomy 14:19). One Torah, twice spoken.',
  sv.verse_id, ev.verse_id, 'free', 22956
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-the-contagion-of-the-carcase',
  E'The Contagion of the Carcase',
  E'Uncleanness is not abstract — it spreads, and the chapter shows how. *Whosoever toucheth the carcase of them shall be unclean until the even* (Leviticus 11:24); the dead thing defiles the one who bears it, the vessel it falls into, the oven, the food and the drink. *Upon whatsoever any of them, when they are dead, doth fall, it shall be unclean... it must be put into water, and it shall be unclean until the even; so it shall be cleansed* (Leviticus 11:32). This is the everyday enactment of the chapter''s whole purpose — *to make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47) — and it is grounded in the holiness Yahuah names directly: *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). The contagion teaches that holiness must be guarded, for defilement does not stay still.',
  sv.verse_id, ev.verse_id, 'free', 22959
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-defile-not-yourselves-with-the-creeping-things',
  E'Defile Not Yourselves with the Creeping Things',
  E'The swarming, crawling things are wholly forbidden: *every creeping thing that creepeth upon the earth shall be an abomination; it shall not be eaten* (Leviticus 11:41), and the law marks them by their very mode of going — *Whatsoever goeth upon the belly, and whatsoever goeth upon all four, or whatsoever hath more feet among all creeping things that creep upon the earth, them ye shall not eat; for they are an abomination* (Leviticus 11:42), the serpent-belly-crawler the chief of the abominable. Then comes the heart of it: *Ye shall not make yourselves abominable with any creeping thing that creepeth, neither shall ye make yourselves unclean with them, that ye should be defiled thereby* (Leviticus 11:43). The command is not arbitrary; it flows straight into its reason — *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). The diet is grounded in the character of Yahuah.',
  sv.verse_id, ev.verse_id, 'free', 22962
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=41
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands',
  E'Be Ye Holy, for I Am Holy — the Difference That Stands',
  E'Here is the ground of the whole chapter and the verse the apostles carry forward: *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44), with the redemption-ground added — *For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45). The chapter closes naming its own purpose: *To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten* (Leviticus 11:47). Peter quotes THIS verse by name after the resurrection — *Because it is written, Be ye holy; for I am holy* (1 Peter 1:16), *as he which hath called you is holy, so be ye holy in all manner of conversation* (1 Peter 1:15) — citing the dietary holiness law as living Scripture. And in Acts 10 Peter STILL keeps the difference: *Not so, Yahuah (Lord); for I have never eaten any thing that is common or unclean* (Acts 10:14). The vision does not change his menu; he interprets it himself — *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28). What was cleansed was MEN, not meat: the two-house ingathering of the nations Yahuah is gathering, *What Elohim (God) hath cleansed, that call not thou common* (Acts 10:15). Paul echoes the same separation — *touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). And the Torah itself seals the charge twice over — *Ye shall therefore put difference between clean beasts and unclean* (Leviticus 20:25); *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26) — and the restored-temple priests will keep teaching it: *they shall teach my people the difference between the holy and profane, and cause them to discern between the unclean and the clean* (Ezekiel 44:23). The dietary distinction is standing Torah, the ground of holiness, never repealed.',
  sv.verse_id, ev.verse_id, 'free', 22965
  FROM _s311_lev11_lookup sv, _s311_lev11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=44
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=11 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 14:6 — *every beast that parteth the hoof... and cheweth the cud, that ye shall eat*: the same eating-rule restated to the second generation.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 14:7 — *the camel, and the hare, and the coney... they chew the cud, but divide not the hoof; therefore they are unclean*: the half-sign animals barred again.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 14:8 — *the swine... it is unclean unto you: ye shall not eat of their flesh, nor touch their dead carcase*: the pig''s exclusion restated verbatim.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 7:2 — *Of every clean beast... by sevens... and of beasts that are not clean by two*: the distinction known to Noah before Sinai, older than the giving of the Torah.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Isaiah 65:4 — *which eat swine''s flesh, and broth of abominable things is in their vessels*: the swine-law still binding, the violation still provoking Yahuah.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 66:17 — eaters of *swine''s flesh, and the abomination, and the mouse, shall be consumed together*: the dietary law standing to the consummation, the last chapter of Isaiah.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-clean-and-the-unclean-beasts-of-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 14:9 — *all that have fins and scales shall ye eat*: the water-rule restated for the second generation.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-fins-and-scales-the-clean-of-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 14:10 — *whatsoever hath not fins and scales ye may not eat; it is unclean unto you*: the same exclusion, the one test repeated.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-fins-and-scales-the-clean-of-the-waters'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 14:12 — *the eagle, and the ossifrage, and the ospray*: the forbidden-fowl list restated nearly word for word.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-unclean-fowls-and-the-winged-creeping-things'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 14:19 — *every creeping thing that flieth is unclean unto you*: the winged swarmers barred again, save the leaping locust kinds.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-unclean-fowls-and-the-winged-creeping-things'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 11:44 — *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy*: the holiness that grounds the carcase-contagion rule.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=24
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-contagion-of-the-carcase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 11:47 — *to make a difference between the unclean and the clean*: the chapter''s stated purpose, enacted in the defiled vessel.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=32
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-the-contagion-of-the-carcase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 11:42 — *whatsoever goeth upon the belly... them ye shall not eat; for they are an abomination*: the crawling things marked by their mode of going.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=41
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-defile-not-yourselves-with-the-creeping-things'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 11:44 — *For I am Yahuah Elohaychem... be holy; for I am holy*: the reason the defiling crawlers are forbidden, the diet grounded in Yahuah''s holiness.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=43
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-defile-not-yourselves-with-the-creeping-things'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Peter 1:16 — *Because it is written, Be ye holy; for I am holy*: Peter cites Leviticus 11:44 by name, the dietary holiness law quoted as living Scripture after the resurrection.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=44
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Peter 1:15 — *as he which hath called you is holy, so be ye holy in all manner of conversation*: the redemption-ground of Leviticus 11:45 made Peter''s ground for holy living.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=45
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 10:14 — *I have never eaten any thing that is common or unclean*: Peter STILL keeps the difference years after the resurrection; the vision never changes his diet.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=47
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 10:15 — *What Elohim (God) hath cleansed, that call not thou common*: the cleansing is of MEN, the two-house ingathering — not a repeal of the clean/unclean menu.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=47
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 10:28 — *Elohim (God) hath shewed me that I should not call any man common or unclean*: Peter''s OWN interpretation — the vision is about MEN, not menu; the dietary difference stands.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=47
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Corinthians 6:17 — *touch not the unclean thing; and I will receive you*: Paul draws straight from the Leviticus 11:44 language of separation unto Yahuah.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=44
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Leviticus 20:25 — *Ye shall therefore put difference between clean beasts and unclean*: the charge of 11:47 sealed again as the badge of holiness.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=47
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Leviticus 20:26 — *ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people*: the be-holy refrain of 11:45 restated as election.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=45
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Ezekiel 44:23 — *cause them to discern between the unclean and the clean*: the restored-temple priests still teaching the difference of 11:47, the discernment enduring into the prophesied age.'
  FROM cross_reference_threads t
  JOIN _s311_lev11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=11 AND sv.verse_number=47
  JOIN _s311_lev11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-11-be-ye-holy-for-i-am-holy-the-difference-that-stands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_12.sql (Leviticus 12) -----
-- Book: Leviticus  Chapter: 12  Tag: lev12  Session: s311
-- Sort band base: 22975, step 3  (22975, 22978)
-- Temp view: _s311_lev12_lookup
--
-- FRAMING: The purification of the woman after childbirth. Two framework-bearing
-- weaves: (1) the eighth-day circumcision of the man child (v.3), the sign of the
-- everlasting covenant cut into the flesh of Abraham's seed (Gen 17:12), kept exactly
-- on Yahusha himself (Luke 1:59 / 2:21) and defended by him as a Torah ordinance
-- (John 7:22-23), Paul's own credential (Phil 3:5) — Torah affirmed, never abolished.
-- (2) The graded offering (v.6-8): a lamb for the well-off, but two turtledoves /
-- two young pigeons for the poor — atonement scaled so none is shut out; the law of
-- the poor that Miriam (Mary) fulfilled when she presented Yahusha (Luke 2:22-24),
-- the Most High born into a poor household. Lateral to the same poor-provision in
-- the sin/trespass offering (Lev 5:7) and the bird burnt-offering (Lev 1:14).
--
-- Leviticus 12 coverage:
--   v.1-2  NT:     none warranted (purification frame; fulfilled in the offering weave at v.6-8)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.3    NT:     Luke 1:59, Luke 2:21, John 7:22, John 7:23, Philippians 3:5  -> THREAD 1
--          Extras: none warranted (Jub 15 circumcision-covenant noted but bird/eighth-day handled by canon witnesses)
--          Tanakh: Genesis 17:12  -> THREAD 1
--   v.4-5  NT:     none warranted (continues purification reckoning; covered by v.6-8 offering)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.6    NT:     Luke 2:22, Luke 2:24  -> THREAD 2
--          Extras: none warranted
--          Tanakh: Leviticus 1:14  -> THREAD 2
--   v.7    NT:     none warranted (atonement summary; carried by v.6/v.8 weave)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.8    NT:     Luke 2:24  -> THREAD 2
--          Extras: none warranted
--          Tanakh: Leviticus 5:7  -> THREAD 2
--
-- THREADS:
--   T1 leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised
--      members: Genesis 17:12 (canon/Tanakh), Luke 1:59 (canon/NT), Luke 2:21 (canon/NT),
--               John 7:22 (canon/NT), John 7:23 (canon/NT), Philippians 3:5 (canon/NT)
--      tier free (all canon)
--   T2 leviticus-12-two-turtledoves-the-offering-of-the-poor
--      members: Luke 2:24 (canon/NT), Luke 2:22 (canon/NT), Leviticus 5:7 (canon/Tanakh),
--               Leviticus 1:14 (canon/Tanakh)
--      tier free (all canon)
--
-- CONTESTED/LOAD-BEARING: v.3 + John 7:22-23 framed as Torah AFFIRMED — Yahusha holds
-- circumcision (a Torah/fathers ordinance) above even a Sabbath scruple, never as a
-- thing abolished; Phil 3:5 is Paul keeping the same eighth-day ordinance, his credential
-- in the flesh, not a relic discarded. v.8 + Luke 2:24 framed as atonement graded to the
-- poor (the Most High born poor), never the Torah as burden.

CREATE TEMP VIEW _s311_lev12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the eighth-day circumcision (v.3)
    ('canon','leviticus',12,3,'canon','genesis',17,12,'free',
     E'*And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed.* (Genesis 17:12). Leviticus'' law of the eighth day — *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) — is the standing ordinance of the everlasting covenant Yahuah cut with Abraham''s seed. The day is fixed; the sign is in the flesh of the paternal bloodline.'),
    ('canon','leviticus',12,3,'canon','luke',1,59,'free',
     E'*And it came to pass, that on the eighth day they came to circumcise the child; and they called him Zacharias, after the name of his father.* (Luke 1:59). The eighth-day ordinance of *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) is kept exactly in the household of Zacharias the priest — the Torah is not a defunct relic but the living custom of the covenant-faithful at John''s birth.'),
    ('canon','leviticus',12,3,'canon','luke',2,21,'free',
     E'*And when eight days were accomplished for the circumcising of the child, his name was called Yahusha (JESUS), which was so named of the angel before he was conceived in the womb.* (Luke 2:21). The Most High''s own Son is brought under *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) — the Formed Son enters the covenant in the flesh on the appointed eighth day, the very ordinance he gave.'),
    ('canon','leviticus',12,3,'canon','john',7,22,'free',
     E'*Moses therefore gave unto you circumcision; (not because it is of Moses, but of the fathers;) and ye on the sabbath day circumcise a man.* (John 7:22). Yahusha himself names *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) as an ordinance reaching back through Moses to the fathers — so binding that it is performed even on the Sabbath day. Torah affirmed, traced to Abraham, never abolished.'),
    ('canon','leviticus',12,3,'canon','john',7,23,'free',
     E'*If a man on the sabbath day receive circumcision, that the law of Moses should not be broken; are ye angry at me, because I have made a man every whit whole on the sabbath day?* (John 7:23). The eighth-day cut of *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) overrides even a Sabbath scruple — Yahusha reasons from the law''s own weight, *that the law of Moses should not be broken*, defending the Torah rather than discarding it.'),
    ('canon','leviticus',12,3,'canon','philippians',3,5,'free',
     E'*Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee;* (Philippians 3:5). Paul names his own keeping of *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3) as the first of his covenant credentials in the flesh — the ordinance was kept on him too; what he later counts loss is flesh-confidence, not the Torah itself.'),
    -- THREAD 2: two turtledoves, the offering of the poor (v.6-8)
    ('canon','leviticus',12,6,'canon','luke',2,22,'free',
     E'*And when the days of her purification according to the law of Moses were accomplished, they brought him to Jerusalem, to present him to Yahuah (Lord);* (Luke 2:22). Miriam (Mary) fulfils to the letter *And when the days of her purifying are fulfilled... she shall bring a lamb of the first year for a burnt offering, and a young pigeon, or a turtledove, for a sin offering* (Leviticus 12:6) — the days reckoned, the child brought up to the tabernacle, the law of Moses obeyed at the presentation of the Most High''s Son.'),
    ('canon','leviticus',12,6,'canon','leviticus',1,14,'free',
     E'*And if the burnt sacrifice for his offering to Yahuah (LORD) be of fowls, then he shall bring his offering of turtledoves, or of young pigeons.* (Leviticus 1:14). The same bird-offering provided in *a young pigeon, or a turtledove, for a sin offering* (Leviticus 12:6) — the burnt-offering law already makes room for the turtledove and the pigeon, the offering within reach of the poor.'),
    ('canon','leviticus',12,8,'canon','luke',2,24,'free',
     E'*And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons.* (Luke 2:24). This is the very provision of the poor — *And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons* (Leviticus 12:8). Miriam brings not the lamb but the two birds: the Most High''s Son is born into a poor household, atonement graded so that poverty shuts no one out.'),
    ('canon','leviticus',12,8,'canon','leviticus',5,7,'free',
     E'*And if he be not able to bring a lamb, then he shall bring for his trespass, which he hath committed, two turtledoves, or two young pigeons, unto Yahuah (LORD); one for a sin offering, and the other for a burnt offering.* (Leviticus 5:7). The same mercy runs through the sin offering as through childbirth purification — *And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons* (Leviticus 12:8). Throughout the Torah atonement is scaled to the means of the poor, never beyond their reach.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised',
       E'The eighth day: the flesh of his foreskin circumcised',
       E'In the midst of the law of purification after childbirth stands the sign of the covenant: *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). This is no new commandment but the standing ordinance Yahuah cut with Abraham — *And he that is eight days old shall be circumcised among you, every man child in your generations, he that is born in the house, or bought with money of any stranger, which is not of thy seed* (Genesis 17:12) — the token of the everlasting covenant in the flesh of the paternal bloodline.\n\nThe covenant-faithful keep it exactly. At John''s birth: *And it came to pass, that on the eighth day they came to circumcise the child* (Luke 1:59). And the Formed Son himself is brought under it: *And when eight days were accomplished for the circumcising of the child, his name was called Yahusha (JESUS)* (Luke 2:21). The One who gave the ordinance enters the covenant in the flesh on the appointed day.\n\nYahusha defends the ordinance to the very teachers of Israel, tracing it past Moses to the fathers and showing it so weighty it is done even on the Sabbath: *Moses therefore gave unto you circumcision; (not because it is of Moses, but of the fathers;) and ye on the sabbath day circumcise a man* (John 7:22); *If a man on the sabbath day receive circumcision, that the law of Moses should not be broken... are ye angry at me, because I have made a man every whit whole on the sabbath day?* (John 7:23). He reasons FROM the law''s authority, *that the law of Moses should not be broken* — Torah affirmed, not abolished.\n\nAnd Paul names his own keeping of it as the first of his fleshly credentials: *Circumcised the eighth day, of the stock of Yashar''el (Israel)... as touching the law, a Pharisee* (Philippians 3:5). What he later counts loss is confidence in the flesh, never the Torah itself. The eighth day stands from Abraham to the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 22975
  FROM _s311_lev12_lookup sv, _s311_lev12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-12-two-turtledoves-the-offering-of-the-poor',
       E'Two turtledoves: the offering of the poor',
       E'When the days of purifying are fulfilled the woman brings her offering — *she shall bring a lamb of the first year for a burnt offering, and a young pigeon, or a turtledove, for a sin offering, unto the door of the tabernacle of the congregation, unto the priest* (Leviticus 12:6). But the Torah does not leave the poor outside: *And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons; the one for the burnt offering, and the other for a sin offering: and the priest shall make an atonement for her, and she shall be clean* (Leviticus 12:8). Atonement is graded to the means of the worshipper, so that poverty shuts no one out.\n\nThis same mercy runs throughout the offerings. The bird is provided for the burnt sacrifice — *And if the burnt sacrifice for his offering to Yahuah (LORD) be of fowls, then he shall bring his offering of turtledoves, or of young pigeons* (Leviticus 1:14) — and for the sin and trespass offering of the one who cannot afford a lamb: *And if he be not able to bring a lamb, then he shall bring for his trespass... two turtledoves, or two young pigeons, unto Yahuah (LORD); one for a sin offering, and the other for a burnt offering* (Leviticus 5:7).\n\nMiriam (Mary) keeps this law to the letter at the presentation of the Most High''s Son: *And when the days of her purification according to the law of Moses were accomplished, they brought him to Jerusalem, to present him to Yahuah (Lord)* (Luke 2:22). And the offering she brings is the offering of the poor — *And to offer a sacrifice according to that which is said in the law of Yahuah (Lord), A pair of turtledoves, or two young pigeons* (Luke 2:24). Not the lamb of the well-off but the two birds: the King of glory is born into a poor household, and the graded mercy of the Torah receives him.',
       sv.verse_id, ev.verse_id, 'free', 22978
  FROM _s311_lev12_lookup sv, _s311_lev12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 17:12 — *he that is eight days old shall be circumcised* : the eighth-day ordinance is the token of the everlasting covenant cut with Abraham''s seed, the root of Leviticus 12:3.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Luke 1:59 — *on the eighth day they came to circumcise the child* : the priest Zacharias'' household keeps the Torah ordinance exactly at John''s birth.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=59
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Luke 2:21 — *when eight days were accomplished for the circumcising of the child* : the Formed Son enters the covenant in the flesh on the appointed eighth day.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 7:22 — *Moses therefore gave unto you circumcision; (not because it is of Moses, but of the fathers)* : Yahusha traces the ordinance past Moses to Abraham, so binding it is done on the Sabbath.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'John 7:23 — *that the law of Moses should not be broken* : Yahusha reasons from the law''s own authority, defending the Torah rather than discarding it.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Philippians 3:5 — *Circumcised the eighth day, of the stock of Yashar''el (Israel)* : Paul kept the same ordinance; what he counts loss is flesh-confidence, not the Torah.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-the-eighth-day-the-flesh-of-his-foreskin-circumcised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Luke 2:24 — *A pair of turtledoves, or two young pigeons* : Miriam brings the offering of the poor of Leviticus 12:8, not the lamb — the Most High''s Son born into a poor household.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-two-turtledoves-the-offering-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Luke 2:22 — *when the days of her purification according to the law of Moses were accomplished* : Miriam fulfils the purifying-and-offering law of Leviticus 12:6 to the letter.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-two-turtledoves-the-offering-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 5:7 — *if he be not able to bring a lamb... two turtledoves, or two young pigeons* : the same poor-provision in the sin/trespass offering — atonement scaled to the means throughout the Torah.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-two-turtledoves-the-offering-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Leviticus 1:14 — *turtledoves, or... young pigeons* : the burnt-offering law already provides the bird within reach of the poor, the offering of Leviticus 12:6.'
  FROM cross_reference_threads t
  JOIN _s311_lev12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s311_lev12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-12-two-turtledoves-the-offering-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_13.sql (Leviticus 13) -----
-- Book: Leviticus  Chapter: 13  (the law of the plague of leprosy / tzaraat)
-- Tag: lev13   Session prefix: s311   Temp view: _s311_lev13_lookup
-- Sort band base 23000, step 3  ->  23000, 23003, 23006
--
-- Framing: the long law of leprosy is a curated chapter. Three framework-bearing threads:
-- (1) the PRIEST (not a physician) examines the plague, shuts up the suspect seven days,
--     and PRONOUNCES clean or unclean -> Yahusha sends the cleansed leper to the priest
--     to offer the gift Moses commanded "for a testimony" (Matt8:4/Mark1:44/Luke5:14/Luke17:14):
--     the Torah's priestly discernment of sin stands; Messiah affirms it, does not abolish it.
-- (2) 13:45-46 the leper rent, bare, crying Unclean, dwelling alone WITHOUT THE CAMP ->
--     the reproach of the unclean; lateral Num5:2-3 / Num12:14-15 (Miriam shut out seven days);
--     forward Luke17:12 (lepers stood afar off) and Heb13:12-13 (Yahusha suffered WITHOUT THE
--     GATE; let us go forth unto him WITHOUT THE CAMP, bearing his reproach) -- He took the
--     leper's place of reproach.
-- (3) 13:47-59 the leprosy in a GARMENT, washed or burned -> the defilement purged from what
--     is worn; lateral Jude1:23 (hating even the garment spotted by the flesh).
--
-- Leviticus 13 coverage:
--   v.1-3   (the priest looks and pronounces unclean)
--           NT:     Matt8:4, Mark1:44, Luke5:14, Luke17:14 (shew thyself to the priest)  [thread 1]
--           Extras: none warranted
--           Tanakh: none warranted (priestly office est. Lev/Exod already)
--   v.4-44  (procedure: shut up seven days, raw flesh, scall, bald, examination details)
--           NT:     none warranted (covered by the priest-examination thread anchor)
--           Extras: none warranted
--           Tanakh: none warranted
--   v.13    (all turned white = clean) folded into thread 1 anchor-end
--   v.45    (clothes rent, head bare, cry Unclean, unclean)
--           NT:     Luke17:12 (stood afar off), Heb13:12-13 (without the gate/camp, reproach)  [thread 2]
--           Extras: none warranted
--           Tanakh: Num5:2-3 (put out of the camp), Num12:14-15 (Miriam shut out seven days)  [thread 2]
--   v.46    (dwell alone; without the camp) folded into thread 2 anchor-end
--   v.47-59 (leprosy in a garment: woollen/linen, washed or burnt)
--           NT:     Jude1:23 (hating even the garment spotted by the flesh)  [thread 3]
--           Extras: none warranted
--           Tanakh: none warranted
--
-- Threads:
--   leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced  (free; NT)
--   leviticus-13-without-the-camp-the-reproach-of-the-unclean                     (free; NT + Tanakh)
--   leviticus-13-the-garment-spotted-by-the-flesh                                 (free; NT)

CREATE TEMP VIEW _s311_lev13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the priest examines and pronounces -> shew thyself to the priest
    ('canon','leviticus',13,3,'canon','matthew',8,4,'free',
      E'*And Yahusha (Jesus) saith unto him, See thou tell no man; but go thy way, shew thyself to the priest, and offer the gift that Moses commanded, for a testimony unto them.* (Matthew 8:4). The Torah gives the priest the office of discernment: *the priest shall look on the plague... and pronounce him unclean* (Leviticus 13:3). When Yahusha (Jesus) cleanses the leper he does not bypass that office — he sends the man straight to it, to *offer the gift that Moses commanded*. The law of Leviticus 13 stands as the witness; Messiah upholds it.'),
    ('canon','leviticus',13,3,'canon','mark',1,44,'free',
      E'*And saith unto him, See thou say nothing to any man: but go thy way, shew thyself to the priest, and offer for thy cleansing those things which Moses commanded, for a testimony unto them.* (Mark 1:44). The priest is the appointed discerner — *the priest shall look on the plague in the skin of the flesh... and pronounce him unclean* (Leviticus 13:3) — and Yahusha (Jesus) returns the cleansed man to that exact priestly verdict, commanding *those things which Moses commanded*. The Torah is affirmed, not set aside.'),
    ('canon','leviticus',13,3,'canon','luke',5,14,'free',
      E'*And he charged him to tell no man: but go, and shew thyself to the priest, and offer for thy cleansing, according as Moses commanded, for a testimony unto them.* (Luke 5:14). The chapter places the verdict in the priest''s mouth — *and the priest shall look on him, and pronounce him unclean* (Leviticus 13:3) — and the cleansed leper is sent back to confirm it *according as Moses commanded*. The priestly examination of Leviticus 13 is the standing testimony Messiah honours.'),
    ('canon','leviticus',13,3,'canon','luke',17,14,'free',
      E'*And when he saw them, he said unto them, Go shew yourselves unto the priests. And it came to pass, that, as they went, they were cleansed.* (Luke 17:14). Ten lepers are sent to the very office Leviticus 13 ordains — *he shall be brought unto Aaron the priest, or unto one of his sons the priests... and the priest shall look on the plague... and pronounce him unclean* (Leviticus 13:2-3). Yahusha (Jesus) cleanses them on the road to the priest, fulfilling the Torah''s pattern rather than nullifying it.'),
    -- THREAD 2: without the camp, the reproach of the unclean
    ('canon','leviticus',13,46,'canon','numbers',5,2,'free',
      E'*Command the children of Yashar''el (Israel), that they put out of the camp every leper, and every one that hath an issue, and whosoever is defiled by the dead:* (Numbers 5:2). This is the same removal Leviticus 13 commands of the leper — *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). The unclean is set outside the dwelling of Yahuah (LORD) so the camp where He dwells is not defiled.'),
    ('canon','leviticus',13,46,'canon','numbers',12,14,'free',
      E'*And Yahuah (LORD) said unto Moses, If her father had but spit in her face, should she not be ashamed seven days? let her be shut out from the camp seven days, and after that let her be received in again.* (Numbers 12:14). When Miriam becomes leprous, the law of Leviticus 13 falls on her — *without the camp shall his habitation be* (Leviticus 13:46) — she is *shut out from the camp seven days* (Numbers 12:15), the seven-day shutting-up of the chapter enacted, then received in again upon cleansing.'),
    ('canon','leviticus',13,45,'canon','luke',17,12,'free',
      E'*And as he entered into a certain village, there met him ten men that were lepers, which stood afar off:* (Luke 17:12). The lepers keep the distance Leviticus 13 imposes — the leper *shall cry, Unclean, unclean* (Leviticus 13:45) and dwell apart — so they *stood afar off* and lifted their voices instead of drawing near. Messiah meets them across that gulf of reproach and cleanses it.'),
    ('canon','leviticus',13,46,'canon','hebrews',13,12,'free',
      E'*Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate.* (Hebrews 13:12). The leper''s sentence — *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46) — becomes the place Messiah takes for himself: he *suffered without the gate*, bearing the reproach of the unclean to sanctify the people.'),
    ('canon','leviticus',13,46,'canon','hebrews',13,13,'free',
      E'*Let us go forth therefore unto him without the camp, bearing his reproach.* (Hebrews 13:13). Leviticus 13 banishes the unclean to the outside — *without the camp shall his habitation be* (Leviticus 13:46); Yahusha (Jesus) goes to that outside place and calls his people to follow him there, *bearing his reproach*. He stands where the leper stood, and the place of defilement is turned into the place of communion with him.'),
    -- THREAD 3: the garment spotted by the flesh
    ('canon','leviticus',13,47,'canon','jude',1,23,'free',
      E'*And others save with fear, pulling them out of the fire; hating even the garment spotted by the flesh.* (Jude 1:23). The law of the leprous garment — *the garment also that the plague of leprosy is in... it is a plague of leprosy, and shall be shewed unto the priest* (Leviticus 13:47-49), washed or else burnt in the fire — gives Jude his figure: the defilement that clings to what is worn must be purged, *hating even the garment spotted by the flesh*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced',
       E'Shew Thyself unto the Priest: the Plague Examined and Pronounced',
       E'The law of leprosy hands the verdict not to a physician but to a priest. *He shall be brought unto Aaron the priest, or unto one of his sons the priests: and the priest shall look on the plague in the skin of the flesh... and the priest shall look on him, and pronounce him unclean* (Leviticus 13:2-3). The priest shuts the suspect up seven days, looks again, and either pronounces clean — *he shall pronounce him clean that hath the plague: it is all turned white: he is clean* (Leviticus 13:13) — or unclean. Sin is examined and judged by the appointed office.\n\nWhen Yahusha (Jesus) cleanses lepers he does not abolish that office; he sends them to it. *Go thy way, shew thyself to the priest, and offer the gift that Moses commanded, for a testimony unto them* (Matthew 8:4); *shew thyself to the priest, and offer for thy cleansing those things which Moses commanded* (Mark 1:44); *according as Moses commanded* (Luke 5:14); and to the ten, *Go shew yourselves unto the priests. And it came to pass, that, as they went, they were cleansed* (Luke 17:14). The Torah of Leviticus 13 is the standing testimony Messiah upholds — the law that discerns sin is affirmed, not set aside.',
       sv.verse_id, ev.verse_id, 'free', 23000
  FROM _s311_lev13_lookup sv, _s311_lev13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-13-without-the-camp-the-reproach-of-the-unclean',
       E'Without the Camp: the Reproach of the Unclean',
       E'The leper carries his sentence in his own body and voice. *And the leper in whom the plague is, his clothes shall be rent, and his head bare, and he shall put a covering upon his upper lip, and shall cry, Unclean, unclean* (Leviticus 13:45); *he shall dwell alone; without the camp shall his habitation be* (Leviticus 13:46). The defiled is set outside the dwelling of Yahuah (LORD).\n\nThe Torah keeps this rule across the camp: *put out of the camp every leper... without the camp shall ye put them; that they defile not their camps, in the midst whereof I dwell* (Numbers 5:2-3); and when Miriam is struck leprous she is *shut out from the camp seven days, and after that let her be received in again* (Numbers 12:14-15) — the seven-day shutting-up of Leviticus 13 enacted.\n\nThen Messiah comes to the outside place. The ten lepers *stood afar off* (Luke 17:12), keeping the distance the law imposed, and he cleansed them across that gulf. And he took the leper''s station as his own: *Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). *Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13). The place of the unclean becomes the place where his people meet him.',
       sv.verse_id, ev.verse_id, 'free', 23003
  FROM _s311_lev13_lookup sv, _s311_lev13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=45
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=13 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-13-the-garment-spotted-by-the-flesh',
       E'The Garment Spotted by the Flesh',
       E'The plague of leprosy reaches even to what is worn. *The garment also that the plague of leprosy is in, whether it be a woollen garment, or a linen garment* (Leviticus 13:47) is shewed unto the priest, shut up seven days, washed — and if the plague abides, *He shall therefore burn that garment... for it is a fretting leprosy; it shall be burnt in the fire* (Leviticus 13:52). The defilement that clings must be purged from the cloth itself, by washing or by fire.\n\nJude takes up this very figure of the contaminated garment: *And others save with fear, pulling them out of the fire; hating even the garment spotted by the flesh* (Jude 1:23). The thing touched by the plague of the flesh is to be hated and cleansed, not embraced — the law of the leprous garment read forward into the rescue of the defiled.',
       sv.verse_id, ev.verse_id, 'free', 23006
  FROM _s311_lev13_lookup sv, _s311_lev13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=47
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=13 AND ev.verse_number=59
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS: THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*shew thyself to the priest, and offer the gift that Moses commanded, for a testimony unto them* (Matthew 8:4) — Yahusha (Jesus) sends the cleansed leper to the priestly office of Leviticus 13.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*shew thyself to the priest, and offer for thy cleansing those things which Moses commanded* (Mark 1:44) — the Torah''s verdict honoured, not abolished.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=1 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*shew thyself to the priest, and offer for thy cleansing, according as Moses commanded* (Luke 5:14) — the priestly examination is the standing testimony.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Go shew yourselves unto the priests. And it came to pass, that, as they went, they were cleansed* (Luke 17:14) — ten lepers sent to the office Leviticus 13 ordains.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-shew-thyself-unto-the-priest-the-plague-examined-and-pronounced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS: THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*put out of the camp every leper... without the camp shall ye put them; that they defile not their camps, in the midst whereof I dwell* (Numbers 5:2-3) — the same removal of the unclean from Yahuah (LORD)''s dwelling.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=46
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-without-the-camp-the-reproach-of-the-unclean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*let her be shut out from the camp seven days, and after that let her be received in again* (Numbers 12:14) — Miriam under the very law of Leviticus 13, the seven-day shutting-up enacted.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=46
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-without-the-camp-the-reproach-of-the-unclean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there met him ten men that were lepers, which stood afar off* (Luke 17:12) — the distance Leviticus 13 imposes, crossed by Messiah''s mercy.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=45
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-without-the-camp-the-reproach-of-the-unclean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12) — Messiah takes the leper''s place outside the camp.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=46
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-without-the-camp-the-reproach-of-the-unclean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13) — the place of the unclean turned into communion with him.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=46
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-without-the-camp-the-reproach-of-the-unclean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS: THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*hating even the garment spotted by the flesh* (Jude 1:23) — Jude''s figure drawn from the leprous garment washed or burnt in Leviticus 13:47-59.'
  FROM cross_reference_threads t
  JOIN _s311_lev13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=13 AND sv.verse_number=47
  JOIN _s311_lev13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-13-the-garment-spotted-by-the-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_14.sql (Leviticus 14) -----
-- Book: Leviticus  Chapter: 14  (the law of the leper in the day of his cleansing)
-- Session prefix: s311   Tag: lev14   Temp view: _s311_lev14_lookup
-- Sort band: base 23025, step 3  (23025, 23028, 23031, 23034, 23037)
--
-- Leviticus 14 coverage checklist:
--   v.1-9  (two birds: one slain over running water, the living bird dipped in the blood with
--           cedar/scarlet/hyssop and let loose into the open field) — the death-and-life type
--     NT:     Romans 4:25 (delivered for offences, raised for justification); Hebrews 9:19
--             (Moses took blood with water, scarlet wool, hyssop); 1 Peter 1:18-19 (precious blood)
--     Extras: none warranted
--     Tanakh: Leviticus 16:7-10,21-22 (the two goats — one slain, one released alive)
--   v.10-20 (eighth-day trespass/sin/burnt/meat offerings; the priest makes an atonement, he is clean)
--     NT:     none warranted (the consecration-of-priest weave is carried by thread 3)
--     Extras: none warranted
--     Tanakh: Leviticus 8:1-13 (Aaron and his sons washed, robed, atoned, consecrated)
--   v.14-18 (blood of the trespass offering + oil on the right ear, thumb, great toe — exactly the
--            priest-consecration rite of Lev 8:23-24; the cleansed man set apart like a priest)
--     NT:     1 Peter 2:9 (a royal priesthood, an holy nation, a peculiar people)
--     Extras: none warranted
--     Tanakh: Leviticus 8:23-24 (blood on Aaron's and his sons' right ear, thumb, toe)
--   v.21-32 (the provision for the poor leper — two turtledoves/pigeons and less flour; atonement
--            graded to ability)
--     NT:     none warranted
--     Extras: none warranted
--     Tanakh: Leviticus 5:7,11 (if not able to bring a lamb — two turtledoves, or fine flour);
--             Leviticus 12:8 (if she be not able to bring a lamb — two turtles or two young pigeons)
--   v.33-57 (the leprosy in a house — stones removed, house scraped/broken down, then cleansed
--            with the SAME two-bird rite, the living bird let go into the open fields)
--     NT:     none warranted
--     Extras: none warranted
--     Tanakh: Leviticus 16:21-22 (the live goat let go — the defilement carried away from the dwelling)
--
-- Threads (5):
--   1. leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood   [free+NT, tier free]
--        members: Romans 4:25, Hebrews 9:19, 1 Peter 1:19, Leviticus 16:10  -> the death-and-life atonement
--   2. leviticus-14-the-eighth-day-offerings-and-he-shall-be-clean            [free, Tanakh-only]
--        members: Leviticus 8:6, Leviticus 8:12                              -> full restoration / consecration pattern
--   3. leviticus-14-the-blood-and-the-oil-on-the-ear-the-thumb-and-the-toe    [free+NT, tier free]
--        members: Leviticus 8:23, Leviticus 8:24, 1 Peter 2:9               -> cleansed leper consecrated like a priest
--   4. leviticus-14-atonement-graded-to-the-hand-of-the-poor                  [free, Tanakh-only]
--        members: Leviticus 5:7, Leviticus 5:11, Leviticus 12:8             -> the grace graded to ability
--   5. leviticus-14-the-leprosy-purged-even-from-the-house                    [free, Tanakh-only]
--        members: Leviticus 16:22                                           -> the defilement carried away from the dwelling
--
-- All targets are canon (Tanakh + NT) -> every cross_reference tier is 'free'; no extras in this chapter.

CREATE TEMP VIEW _s311_lev14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the two birds — one slain, one set free alive in the blood (the death-and-life type)
    ('canon','leviticus',14,7,'canon','romans',4,25,'free',
     E'*Who was delivered for our offences, and was raised again for our justification.* (Romans 4:25) The two-bird rite holds both halves of the atonement in one picture: *the priest shall command that one of the birds be killed in an earthen vessel over running water* (Leviticus 14:5), and *as for the living bird... he shall let the living bird loose into the open field* (Leviticus 14:7). One bird dies; the other, dipped in the blood of the slain, goes free alive — delivered for the offence, raised for the justification.'),
    ('canon','leviticus',14,6,'canon','hebrews',9,19,'free',
     E'*For when Moses had spoken every precept to all the people according to the law, he took the blood of calves and of goats, with water, and scarlet wool, and hyssop, and sprinkled both the book, and all the people* (Hebrews 9:19). The very materials of the leper''s cleansing — *the cedar wood, and the scarlet, and the hyssop... dip them and the living bird in the blood of the bird that was killed over the running water* (Leviticus 14:6) — are the same blood-with-water-scarlet-hyssop the writer names as the pattern of the better blood. The Torah''s rite is the figure he reads forward.'),
    ('canon','leviticus',14,5,'canon','1-peter',1,19,'free',
     E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The slain bird, *killed in an earthen vessel over running water* (Leviticus 14:5), pours out the blood that cleanses — the figure of the precious blood not of *corruptible things, as silver and gold* (1 Peter 1:18) but of the spotless one. The clean bird must die before the leper can be pronounced clean.'),
    ('canon','leviticus',14,7,'canon','leviticus',16,10,'free',
     E'*But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* (Leviticus 16:10) The two goats of the Day of Atonement repeat the two birds exactly: one slain for the blood, *the living bird... let loose into the open field* (Leviticus 14:7) answered by the live goat *let go... into the wilderness* (Leviticus 16:22). One death, one release — the single atonement told twice in the Torah.'),
    -- Thread 2: the eighth-day offerings — and he shall be clean (full restoration / consecration pattern)
    ('canon','leviticus',14,8,'canon','leviticus',8,6,'free',
     E'*And Moses brought Aaron and his sons, and washed them with water.* (Leviticus 8:6) The cleansed leper is brought through the same threshold as the priest at his consecration: *he that is to be cleansed shall wash his clothes... and wash himself in water, that he may be clean* (Leviticus 14:8). The washing that begins the priesthood is the washing that restores the leper — both made ready to draw near.'),
    ('canon','leviticus',14,18,'canon','leviticus',8,12,'free',
     E'*And he poured of the anointing oil upon Aaron''s head, and anointed him, to sanctify him.* (Leviticus 8:12) The eighth-day rite ends as the consecration of Aaron ended — oil poured on the head: *the remnant of the oil that is in the priest''s hand he shall pour upon the head of him that is to be cleansed: and the priest shall make an atonement for him* (Leviticus 14:18). The leper, atoned for, is anointed on the head as a priest is anointed — wholly restored before Yahuah (LORD).'),
    -- Thread 3: the blood and the oil on the ear, the thumb, and the toe (cleansed leper consecrated like a priest)
    ('canon','leviticus',14,14,'canon','leviticus',8,23,'free',
     E'*And he slew it; and Moses took of the blood of it, and put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot.* (Leviticus 8:23) The cleansed leper receives precisely the priest''s consecration: *the priest shall take some of the blood of the trespass offering, and the priest shall put it upon the tip of the right ear of him that is to be cleansed, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 14:14). Ear, hand, foot — hearing, doing, walking — the same blood that set Aaron apart now sets apart the man brought back from the dead-flesh of leprosy.'),
    ('canon','leviticus',14,17,'canon','leviticus',8,24,'free',
     E'*And he brought Aaron''s sons, and Moses put of the blood upon the tip of their right ear, and upon the thumbs of their right hands, and upon the great toes of their right feet* (Leviticus 8:24). What was done to the priests is done to the cleansed leper, and the oil is laid upon the very same places: *of the rest of the oil... shall the priest put upon the tip of the right ear of him that is to be cleansed, and upon the thumb of his right hand, and upon the great toe of his right foot, upon the blood of the trespass offering* (Leviticus 14:17). Blood then oil — the consecration of a priest worked upon a restored man.'),
    ('canon','leviticus',14,14,'canon','1-peter',2,9,'free',
     E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). The leper marked with blood and oil on ear, thumb, and toe — *upon the tip of the right ear of him that is to be cleansed, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 14:14) — is the unclean made into a priest. So Yashar''el (Israel), called out of the leprous darkness, is consecrated a royal priesthood.'),
    -- Thread 4: atonement graded to the hand of the poor
    ('canon','leviticus',14,22,'canon','leviticus',5,7,'free',
     E'*And if he be not able to bring a lamb, then he shall bring for his trespass, which he hath committed, two turtledoves, or two young pigeons, unto Yahuah (LORD); one for a sin offering, and the other for a burnt offering.* (Leviticus 5:7) The poor leper is met by the same mercy: *if he be poor, and cannot get so much... two turtledoves, or two young pigeons, such as he is able to get* (Leviticus 14:21-22). The atonement is graded to the hand of the bringer — none too poor to be made clean.'),
    ('canon','leviticus',14,21,'canon','leviticus',5,11,'free',
     E'*But if he be not able to bring two turtledoves, or two young pigeons, then he that sinned shall bring for his offering the tenth part of an ephah of fine flour for a sin offering* (Leviticus 5:11). The Torah steps the offering down for the poorest, just as the leper''s law lowers the flour: *one tenth deal of fine flour mingled with oil for a meat offering* (Leviticus 14:21) for him *whose hand is not able to get that which pertaineth to his cleansing* (Leviticus 14:32). The way of cleansing reaches all the way down to the empty-handed.'),
    ('canon','leviticus',14,22,'canon','leviticus',12,8,'free',
     E'*And if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons; the one for the burnt offering, and the other for a sin offering: and the priest shall make an atonement for her, and she shall be clean.* (Leviticus 12:8) The same graded provision given the new mother is given the cleansed leper — *two turtledoves, or two young pigeons, such as he is able to get* (Leviticus 14:22). The poor are not shut out of cleanness; the priest makes an atonement and they shall be clean.'),
    -- Thread 5: the leprosy purged even from the house
    ('canon','leviticus',14,53,'canon','leviticus',16,22,'free',
     E'*And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* (Leviticus 16:22) The defilement is carried away even from the dwelling: *he shall let go the living bird out of the city into the open fields, and make an atonement for the house: and it shall be clean* (Leviticus 14:53). As the scapegoat bears the iniquity away to an uninhabited land, the living bird carries the house''s plague out of the city — the uncleanness purged from the very stones and timber of the home.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood',
       E'The two birds — one slain, one set free alive in the blood',
       E'The cleansing of the leper opens with a sign that holds the whole atonement in one frame. *Then shall the priest command to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop* (Leviticus 14:4). One bird is *killed in an earthen vessel over running water* (Leviticus 14:5); the other, *the living bird... and the cedar wood, and the scarlet, and the hyssop... dip them and the living bird in the blood of the bird that was killed over the running water* (Leviticus 14:6), and then *he shall let the living bird loose into the open field* (Leviticus 14:7). One dies; the other goes free alive in the blood of the slain — *delivered for our offences, and... raised again for our justification* (Romans 4:25). Hebrews reads the very materials as the pattern: *the blood of calves and of goats, with water, and scarlet wool, and hyssop* (Hebrews 9:19); 1 Peter names the blood the slain bird foreshadows: *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). And the Torah tells the same death-and-release twice — the two goats of the Day of Atonement: *the living... let him go for a scapegoat into the wilderness* (Leviticus 16:10). One death, one release; the single atonement of the Formed Son set in the law of the leper.',
       sv.verse_id, ev.verse_id, 'free', 23025
  FROM _s311_lev14_lookup sv, _s311_lev14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-14-the-eighth-day-offerings-and-he-shall-be-clean',
       E'The eighth-day offerings — and he shall be clean',
       E'On the eighth day the restored leper is brought through the full round of offerings — *two he lambs without blemish, and one ewe lamb... three tenth deals of fine flour for a meat offering* (Leviticus 14:10) — the trespass, the sin, the burnt, and the meat offering, until *the priest shall make an atonement for him, and he shall be clean* (Leviticus 14:20). The pattern is the consecration of the priesthood itself. As Aaron and his sons were first *washed... with water* (Leviticus 8:6), so the leper must wash; and as Moses *poured of the anointing oil upon Aaron''s head, and anointed him, to sanctify him* (Leviticus 8:12), so *the remnant of the oil... he shall pour upon the head of him that is to be cleansed* (Leviticus 14:18). The man brought back from the living death of leprosy is not merely readmitted — he is washed, atoned, and anointed in the very pattern by which Yahuah (LORD) sets apart His priests.',
       sv.verse_id, ev.verse_id, 'free', 23028
  FROM _s311_lev14_lookup sv, _s311_lev14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-14-the-blood-and-the-oil-on-the-ear-the-thumb-and-the-toe',
       E'The blood and the oil on the ear, the thumb, and the toe',
       E'At the heart of the cleansing comes a startling honour: *the priest shall take some of the blood of the trespass offering, and the priest shall put it upon the tip of the right ear of him that is to be cleansed, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 14:14), and then the oil upon the same places (Leviticus 14:17), and the rest *upon the head of him that is to be cleansed* (Leviticus 14:18). This is exactly the consecration of the priesthood: *Moses took of the blood of it, and put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot* (Leviticus 8:23), and likewise upon his sons (Leviticus 8:24). Ear, hand, foot — hearing, doing, walking — the cleansed leper is set apart with the priest''s own rite, the unclean made wholly restored and consecrated. So Yashar''el (Israel), called out of leprous darkness, is made *a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9).',
       sv.verse_id, ev.verse_id, 'free', 23031
  FROM _s311_lev14_lookup sv, _s311_lev14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-14-atonement-graded-to-the-hand-of-the-poor',
       E'Atonement graded to the hand of the poor',
       E'The cleansing is not shut to the poor. *And if he be poor, and cannot get so much; then he shall take one lamb for a trespass offering... and two turtledoves, or two young pigeons, such as he is able to get* (Leviticus 14:21-22), *whose hand is not able to get that which pertaineth to his cleansing* (Leviticus 14:32). This grading runs all through the Torah''s mercy: for the trespass offering, *if he be not able to bring a lamb, then he shall bring... two turtledoves, or two young pigeons* (Leviticus 5:7), and lower still, *the tenth part of an ephah of fine flour* (Leviticus 5:11); for the new mother, *if she be not able to bring a lamb, then she shall bring two turtles, or two young pigeons... and the priest shall make an atonement for her, and she shall be clean* (Leviticus 12:8). The way back to cleanness reaches all the way down to the empty-handed — atonement measured to ability, never to wealth.',
       sv.verse_id, ev.verse_id, 'free', 23034
  FROM _s311_lev14_lookup sv, _s311_lev14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=14 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-14-the-leprosy-purged-even-from-the-house',
       E'The leprosy purged even from the house',
       E'The same rite that cleanses the man cleanses his dwelling. When the plague is in a house, *the priest shall command that they take away the stones in which the plague is* (Leviticus 14:40), the house *scraped within round about* (Leviticus 14:41), and if it spreads, *he shall break down the house, the stones of it, and the timber thereof* (Leviticus 14:45). Then it is cleansed with the very rite of the leper — *two birds, and cedar wood, and scarlet, and hyssop* (Leviticus 14:49), one slain over running water, *and he shall let go the living bird out of the city into the open fields, and make an atonement for the house: and it shall be clean* (Leviticus 14:53). As the scapegoat *shall bear upon him all their iniquities unto a land not inhabited... and he shall let go the goat in the wilderness* (Leviticus 16:22), so the living bird carries the house''s plague away out of the city. The defilement is purged even from the stones and timber of the home — nothing of the dwelling left under the plague.',
       sv.verse_id, ev.verse_id, 'free', 23037
  FROM _s311_lev14_lookup sv, _s311_lev14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=14 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who was delivered for our offences, and was raised again for our justification.* (Romans 4:25) — one bird slain, the living bird set free: the two halves of the atonement in one rite.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=7
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...with water, and scarlet wool, and hyssop...* (Hebrews 9:19) — the same blood-with-water-scarlet-hyssop named as the pattern of the better blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19) — the slain bird pours out the figure of the precious blood.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...shall be presented alive... to let him go for a scapegoat into the wilderness.* (Leviticus 16:10) — the two goats repeat the two birds: one slain, one released alive.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=7
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-two-birds-one-slain-one-set-free-alive-in-the-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Moses brought Aaron and his sons, and washed them with water.* (Leviticus 8:6) — the washing that begins the priesthood restores the leper.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-eighth-day-offerings-and-he-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And he poured of the anointing oil upon Aaron''s head, and anointed him, to sanctify him.* (Leviticus 8:12) — oil poured on the head, as upon the cleansed leper.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=18
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-eighth-day-offerings-and-he-shall-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...put it upon the tip of Aaron''s right ear, and upon the thumb of his right hand, and upon the great toe of his right foot.* (Leviticus 8:23) — the priest''s consecration rite worked upon the cleansed leper.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-blood-and-the-oil-on-the-ear-the-thumb-and-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...the blood upon the tip of their right ear, and upon the thumbs of their right hands, and upon the great toes of their right feet* (Leviticus 8:24) — done to the priests, now to the restored man; blood then oil.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=17
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-blood-and-the-oil-on-the-ear-the-thumb-and-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...a royal priesthood, an holy nation, a peculiar people...* (1 Peter 2:9) — the unclean marked with blood and oil made into a priest; Yashar''el (Israel) consecrated.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-blood-and-the-oil-on-the-ear-the-thumb-and-the-toe'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...if he be not able to bring a lamb... two turtledoves, or two young pigeons...* (Leviticus 5:7) — the same mercy for the poor leper.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-atonement-graded-to-the-hand-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...the tenth part of an ephah of fine flour for a sin offering...* (Leviticus 5:11) — the offering stepped down to the poorest hand.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-atonement-graded-to-the-hand-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...two turtles, or two young pigeons... and the priest shall make an atonement for her, and she shall be clean.* (Leviticus 12:8) — the same graded provision; the poor not shut out of cleanness.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-atonement-graded-to-the-hand-of-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...the goat shall bear upon him all their iniquities unto a land not inhabited... he shall let go the goat in the wilderness.* (Leviticus 16:22) — the living bird carries the house''s plague away out of the city, the defilement purged from the dwelling.'
  FROM cross_reference_threads t
  JOIN _s311_lev14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=14 AND sv.verse_number=53
  JOIN _s311_lev14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-14-the-leprosy-purged-even-from-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_15.sql (Leviticus 15) -----
-- Leviticus 15 — the law of bodily issues / running discharges (the man's issue,
--   the uncleanness of seed, the woman's separation and her issue of blood, and the
--   charge to separate Yashar'el from their uncleanness lest they defile the tabernacle).
-- Tag: lev15  |  session prefix: s311  |  temp view: _s311_lev15_lookup
-- Sort band: base 23050 step 3  ->  23050, 23053, 23056, 23059
--
-- Leviticus 15 coverage:
--   v.1-15 (the man's running issue; touch/lie/sit defiles; seven-day cleansing,
--           washing in running water, two birds = sin + burnt offering, atonement):
--        NT:     none warranted (the issue-of-blood healing belongs to v.19-30 thread)
--        Extras: none warranted
--        Tanakh: Leviticus 11:24-25 (lateral — to touch the unclean defiles, must wash,
--                unclean until even); Leviticus 11:44 (lateral — be holy)
--                -> threaded in the running-issue thread.
--   v.16-18 (seed of copulation, intercourse — wash, unclean until even):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 19:15 (lateral ★ — "come not at your wives" before Sinai,
--                sanctification through abstinence) -> seed-of-copulation thread.
--   v.19-30 (★ the woman in her separation; the issue of blood beyond her time;
--            what she touches unclean; seven-day cleansing, two birds, atonement):
--        NT:     ★ Mark 5:25-34, Matthew 9:20-22, Luke 8:43-48 (the woman with the
--                issue of blood twelve years who touched the hem and was healed —
--                the uncleanness reversed, his cleanness flowing out to make her whole)
--        Extras: none warranted
--        Tanakh: Leviticus 15:25-27 (the source-block itself; quoted in prose, not a member)
--                -> woman-issue-of-blood thread.
--   v.31 (★ "Thus shall ye separate the children of Yashar'el from their uncleanness;
--          that they die not... when they defile my tabernacle that is among them"):
--        NT:     ★ 2 Corinthians 6:16-17 (ye are the temple... come out... be separate...
--                touch not the unclean thing); 1 Corinthians 6:19 (your body is the temple)
--        Extras: none warranted
--        Tanakh: Leviticus 11:44 (lateral — sanctify yourselves and be holy, for I am holy)
--                -> separation-unto-holiness thread.
--   v.32-33 (the summary subscription "this is the law of him that hath an issue"):
--        NT/Extras/Tanakh: none warranted (legal colophon).
--
-- Threads (4):
--   leviticus-15-the-running-issue-made-clean-by-water-and-the-two-birds  [free; Tanakh]
--   leviticus-15-the-seed-of-copulation-washed-and-sanctified            [free; Tanakh]
--   leviticus-15-the-woman-with-the-issue-of-blood-made-whole            [free; Tanakh + NT]
--   leviticus-15-separate-them-lest-they-defile-my-tabernacle            [free; Tanakh + NT]

CREATE TEMP VIEW _s311_lev15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the running issue made clean (lateral to Leviticus 11)
    ('canon','leviticus',15,7,  'canon','leviticus',11,24,
      'free', E'*And for these ye shall be unclean: whosoever toucheth the carcase of them shall be unclean until the even* (Leviticus 11:24). The same law of contagion governs the man with the issue — *And he that toucheth the flesh of him that hath the issue shall wash his clothes, and bathe himself in water, and be unclean until the even* (Leviticus 15:7). Uncleanness spreads outward by touch in both chapters, and water carries it away.'),
    ('canon','leviticus',15,7,  'canon','leviticus',11,25,
      'free', E'*And whosoever beareth ought of the carcase of them shall wash his clothes, and be unclean until the even* (Leviticus 11:25). As bearing the dead defiles and is purged by washing, so *he that toucheth the flesh of him that hath the issue shall wash his clothes, and bathe himself in water, and be unclean until the even* (Leviticus 15:7) — one consistent statute of defilement and cleansing through Torah.'),

    -- Thread 2: the seed of copulation washed and sanctified (lateral Exodus 19:15)
    ('canon','leviticus',15,18, 'canon','exodus',19,15,
      'free', E'*And he said unto the people, Be ready against the third day: come not at your wives* (Exodus 19:15). Before Yashar''el (Israel) stood at Sinai to meet Yahuah (LORD) they were sanctified by abstaining — the very act that Leviticus 15 marks as a temporary uncleanness: *The woman also with whom man shall lie with seed of copulation, they shall both bathe themselves in water, and be unclean until the even* (Leviticus 15:18). Drawing near to the holy required first washing and a setting-apart from the ordinary flesh.'),

    -- Thread 3: the woman with the issue of blood made whole (forward to the Gospels)
    ('canon','leviticus',15,25, 'canon','mark',5,25,
      'free', E'*And a certain woman, which had an issue of blood twelve years* (Mark 5:25). Hers was exactly the case Torah names — *And if a woman have an issue of her blood many days out of the time of her separation... all the days of the issue of her uncleanness shall be as the days of her separation: she shall be unclean* (Leviticus 15:25). Twelve years she had borne the very uncleanness this chapter legislates.'),
    ('canon','leviticus',15,25, 'canon','mark',5,28,
      'free', E'*For she said, If I may touch but his clothes, I shall be whole* (Mark 5:28). Under Leviticus 15 her touch would have defiled — *whosoever toucheth her shall be unclean until the even* (Leviticus 15:19); *whosoever toucheth those things shall be unclean* (Leviticus 15:27). Yet instead of her uncleanness passing to him, his cleanness passed to her.'),
    ('canon','leviticus',15,25, 'canon','mark',5,29,
      'free', E'*And straightway the fountain of her blood was dried up; and she felt in her body that she was healed of that plague* (Mark 5:29). The flow that made her unclean *many days out of the time of her separation* (Leviticus 15:25) is staunched at the source — the uncleanness of Leviticus 15 reversed in the Formed Son, the contagion running backward from him to her.'),
    ('canon','leviticus',15,25, 'canon','mark',5,34,
      'free', E'*And he said unto her, Daughter, thy faith hath made thee whole; go in peace, and be whole of thy plague* (Mark 5:34). The woman who under Torah was *unclean* and put apart is named *Daughter* and sent in shalom — the separation of Leviticus 15 answered by restoration, the unclean made whole instead of the clean made unclean.'),
    ('canon','leviticus',15,25, 'canon','matthew',9,20,
      'free', E'*And, behold, a woman, which was diseased with an issue of blood twelve years, came behind him, and touched the hem of his garment* (Matthew 9:20). The fringe she grasped is the border that under Leviticus 15 her touch would have rendered unclean — *every thing that she lieth upon in her separation shall be unclean* (Leviticus 15:20) — yet the hem of the Formed Son carries cleansing, not defilement.'),
    ('canon','leviticus',15,25, 'canon','matthew',9,22,
      'free', E'*But Yahusha (Jesus) turned him about, and when he saw her, he said, Daughter, be of good comfort; thy faith hath made thee whole. And the woman was made whole from that hour* (Matthew 9:22). The years of uncleanness named in *all the days of the issue of her uncleanness* (Leviticus 15:25) end in a moment — Torah''s separation closed by the One greater than the offering of two birds.'),
    ('canon','leviticus',15,25, 'canon','luke',8,43,
      'free', E'*And a woman having an issue of blood twelve years, which had spent all her living upon physicians, neither could be healed of any* (Luke 8:43). No priest''s seven days and no two turtledoves (Leviticus 15:28-30) had availed her — *all the days of the issue of her uncleanness... she shall be unclean* (Leviticus 15:25) — until she came to him whose cleanness is the true cleansing.'),
    ('canon','leviticus',15,25, 'canon','luke',8,44,
      'free', E'*Came behind him, and touched the border of his garment: and immediately her issue of blood stanched* (Luke 8:44). The issue that Leviticus 15 declared *unclean* and unending in her flesh is stopped at his border — *if a woman have an issue of her blood many days* (Leviticus 15:25) finds its end at the hem of the Formed Son.'),

    -- Thread 4: separate them lest they defile my tabernacle (forward to the temple of the body)
    ('canon','leviticus',15,31, 'canon','leviticus',11,44,
      'free', E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* (Leviticus 11:44). The dietary law and the law of issues share one purpose — separation unto holiness: *Thus shall ye separate the children of Yashar''el (Israel) from their uncleanness; that they die not in their uncleanness, when they defile my tabernacle that is among them* (Leviticus 15:31).'),
    ('canon','leviticus',15,31, 'canon','2-corinthians',6,16,
      'free', E'*And what agreement hath the temple of Elohim (God) with idols? for ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16). The dwelling that may not be defiled has become the very people in whom Yahuah (LORD) dwells — *when they defile my tabernacle that is among them* (Leviticus 15:31) carried forward to the indwelt body.'),
    ('canon','leviticus',15,31, 'canon','2-corinthians',6,17,
      'free', E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). *Touch not the unclean thing* is the whole burden of Leviticus 15, and *be ye separate* is its charge — *Thus shall ye separate the children of Yashar''el (Israel) from their uncleanness* (Leviticus 15:31) — the same holiness, never abolished, kept by the same separated people.'),
    ('canon','leviticus',15,31, 'canon','1-corinthians',6,19,
      'free', E'*What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* (1 Corinthians 6:19). The tabernacle that uncleanness might defile (Leviticus 15:31) is now the body itself — the reason the children of Yashar''el (Israel) were separated from their uncleanness, *that they die not in their uncleanness*, stands when the dwelling-place is the body of the redeemed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
-- Thread 1: the running issue made clean
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-15-the-running-issue-made-clean-by-water-and-the-two-birds',
       E'The Running Issue Made Clean by Water and the Two Birds',
       E'The man with a running issue out of his flesh is unclean, and the uncleanness spreads outward by contact — *Every bed, whereon he lieth that hath the issue, is unclean: and every thing, whereon he sitteth, shall be unclean* (Leviticus 15:4); *And he that toucheth the flesh of him that hath the issue shall wash his clothes, and bathe himself in water, and be unclean until the even* (Leviticus 15:7). This is the same law of contagion that runs through the dietary chapter — *And for these ye shall be unclean: whosoever toucheth the carcase of them shall be unclean until the even* (Leviticus 11:24); *And whosoever beareth ought of the carcase of them shall wash his clothes, and be unclean until the even* (Leviticus 11:25). One consistent Torah of defilement and washing.\n\nThe cleansing is not by mere time but by water, days numbered, and atoning blood: *And when he that hath an issue is cleansed of his issue; then he shall number to himself seven days for his cleansing, and wash his clothes, and bathe his flesh in running water, and shall be clean* (Leviticus 15:13). On the eighth day he brings *two turtledoves, or two young pigeons* (Leviticus 15:14), and *the priest shall offer them, the one for a sin offering, and the other for a burnt offering; and the priest shall make an atonement for him before Yahuah (LORD) for his issue* (Leviticus 15:15). The bodily flow that defiles is answered by running water and a blood-offering — the pattern of all true cleansing in the covenant.',
       sv.verse_id, ev.verse_id, 'free', 23050
  FROM _s311_lev15_lookup sv, _s311_lev15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=15 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: the seed of copulation washed and sanctified
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-15-the-seed-of-copulation-washed-and-sanctified',
       E'The Seed of Copulation Washed and Sanctified',
       E'The discharge of seed and the act of intercourse carry a temporary uncleanness, washed away in water: *And if any man''s seed of copulation go out from him, then he shall wash all his flesh in water, and be unclean until the even* (Leviticus 15:16); *The woman also with whom man shall lie with seed of copulation, they shall both bathe themselves in water, and be unclean until the even* (Leviticus 15:18). This is not sin but a marking-off — the ordinary flesh set apart from the holy until evening and water restore.\n\nThe same setting-apart precedes the nearest approach to Yahuah (LORD) in all the Torah. At the foot of Sinai, before the people met their Elohim (God), Moses charged them: *And he said unto the people, Be ready against the third day: come not at your wives* (Exodus 19:15). To draw near the mountain of fire required the very abstinence and sanctification that Leviticus 15 frames — the flesh consecrated, the body washed, before standing in the presence of the Holy One.',
       sv.verse_id, ev.verse_id, 'free', 23053
  FROM _s311_lev15_lookup sv, _s311_lev15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=15 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: the woman with the issue of blood made whole
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-15-the-woman-with-the-issue-of-blood-made-whole',
       E'The Woman with the Issue of Blood Made Whole',
       E'The woman in her separation is unclean, and so is everything she touches: *And if a woman have an issue, and her issue in her flesh be blood, she shall be put apart seven days: and whosoever toucheth her shall be unclean until the even* (Leviticus 15:19); *And every thing that she lieth upon in her separation shall be unclean: every thing also that she sitteth upon shall be unclean* (Leviticus 15:20). And if the flow runs beyond its time, the uncleanness becomes long and unrelenting: *And if a woman have an issue of her blood many days out of the time of her separation, or if it run beyond the time of her separation; all the days of the issue of her uncleanness shall be as the days of her separation: she shall be unclean* (Leviticus 15:25); *whosoever toucheth those things shall be unclean* (Leviticus 15:27).\n\nThis is the very woman the Gospels bring before us: *And a certain woman, which had an issue of blood twelve years* (Mark 5:25) — twelve years bearing exactly the uncleanness Torah names. *For she said, If I may touch but his clothes, I shall be whole* (Mark 5:28), and *And, behold, a woman... came behind him, and touched the hem of his garment* (Matthew 9:20). Under Leviticus 15 her touch would have defiled him; instead his cleanness flowed the other way — *And straightway the fountain of her blood was dried up; and she felt in her body that she was healed of that plague* (Mark 5:29); *immediately her issue of blood stanched* (Luke 8:44). The flow that made her unclean *many days* is dried up at the source. And the One she feared to defile names her *Daughter, thy faith hath made thee whole; go in peace, and be whole of thy plague* (Mark 5:34). In the Formed Son the uncleanness of Leviticus 15 is reversed — not the clean made unclean, but the unclean made whole.',
       sv.verse_id, ev.verse_id, 'free', 23056
  FROM _s311_lev15_lookup sv, _s311_lev15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=15 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: separate them lest they defile my tabernacle
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-15-separate-them-lest-they-defile-my-tabernacle',
       E'Separate Them Lest They Defile My Tabernacle',
       E'The whole law of issues comes to its purpose in one verse: *Thus shall ye separate the children of Yashar''el (Israel) from their uncleanness; that they die not in their uncleanness, when they defile my tabernacle that is among them* (Leviticus 15:31). The point of the seven days, the washing, and the two birds is holiness — that the dwelling of Yahuah (LORD) in the midst of his people not be defiled. This is the same charge the dietary law carries: *For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* (Leviticus 11:44). One holiness, guarding one dwelling.\n\nThe New Testament does not abolish this separation; it deepens it, because the tabernacle is now the people and the body. *For ye are the temple of the living Elohim (God); as Elohim (God) hath said, I will dwell in them, and walk in them; and I will be their Elohim (God), and they shall be my people* (2 Corinthians 6:16) — and therefore *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). *Touch not the unclean thing* is the very burden of Leviticus 15; *be ye separate* is its very charge. *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you... and ye are not your own?* (1 Corinthians 6:19). The reason Yashar''el (Israel) was separated from its uncleanness, *that they die not... when they defile my tabernacle*, stands fast when the dwelling-place is the redeemed body itself — the separation unto holiness, the root the whole library grows from.',
       sv.verse_id, ev.verse_id, 'free', 23059
  FROM _s311_lev15_lookup sv, _s311_lev15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=15 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And for these ye shall be unclean: whosoever toucheth the carcase of them shall be unclean until the even* (Leviticus 11:24) — the same law of contagion by touch that governs the man with the issue.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=7
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-running-issue-made-clean-by-water-and-the-two-birds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And whosoever beareth ought of the carcase of them shall wash his clothes, and be unclean until the even* (Leviticus 11:25) — washing purges the uncleanness, the same remedy as Leviticus 15:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=7
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-running-issue-made-clean-by-water-and-the-two-birds'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Be ready against the third day: come not at your wives* (Exodus 19:15) — the Sinai abstinence and sanctification that Leviticus 15:18 marks as a setting-apart of the flesh before drawing near the Holy One.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-seed-of-copulation-washed-and-sanctified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And a certain woman, which had an issue of blood twelve years* (Mark 5:25) — exactly the case of Leviticus 15:25, the issue running beyond the time of her separation.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If I may touch but his clothes, I shall be whole* (Mark 5:28) — under Leviticus 15:19,27 her touch would defile; instead his cleanness flows to her.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=5 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And straightway the fountain of her blood was dried up... she was healed of that plague* (Mark 5:29) — the flow of Leviticus 15:25 staunched at its source in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=5 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Daughter, thy faith hath made thee whole; go in peace, and be whole of thy plague* (Mark 5:34) — the unclean of Leviticus 15 named Daughter and made whole, the separation reversed.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=5 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*A woman, which was diseased with an issue of blood twelve years... touched the hem of his garment* (Matthew 9:20) — the fringe that under Leviticus 15:20 her touch would defile carries cleansing instead.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Daughter, be of good comfort; thy faith hath made thee whole. And the woman was made whole from that hour* (Matthew 9:22) — the days of uncleanness of Leviticus 15:25 ended in a moment.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*A woman having an issue of blood twelve years... neither could be healed of any* (Luke 8:43) — no seven days nor two turtledoves of Leviticus 15:28-30 had availed her.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Touched the border of his garment: and immediately her issue of blood stanched* (Luke 8:44) — the issue Leviticus 15:25 declared unending is stopped at his border.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=25
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=8 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-the-woman-with-the-issue-of-blood-made-whole'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44) — the dietary law and the law of issues share one purpose, separation unto holiness (Leviticus 15:31).'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-separate-them-lest-they-defile-my-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye are the temple of the living Elohim (God)... I will dwell in them, and walk in them* (2 Corinthians 6:16) — the dwelling that may not be defiled becomes the indwelt people of Leviticus 15:31.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-separate-them-lest-they-defile-my-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Come out from among them, and be ye separate... and touch not the unclean thing* (2 Corinthians 6:17) — the very burden and charge of Leviticus 15:31, never abolished.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-separate-them-lest-they-defile-my-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you* (1 Corinthians 6:19) — the tabernacle of Leviticus 15:31 is now the body itself.'
  FROM cross_reference_threads t
  JOIN _s311_lev15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=15 AND sv.verse_number=31
  JOIN _s311_lev15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-15-separate-them-lest-they-defile-my-tabernacle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_16.sql (Leviticus 16) -----
-- Book: Leviticus | Chapter: 16 — THE DAY OF ATONEMENT (Yom Kippur), the supreme keystone.
-- Session prefix: s311 | Tag: lev16 | Temp view: _s311_lev16_lookup
-- Sort band: base 23075, step 3 (23075, 23078, 23081, 23084, 23087, 23090, 23093)
--
-- FRAMING (lens applied): the appointed-time atonement is the SHADOW the Formed Son fills once
-- for all. The high priest entering within the veil with blood upon the mercy seat = the Formed
-- Son entered once into the holy place by his own blood (Heb 9). The two goats = the dual aspect
-- of the one atonement: the slain (blood within the veil) + the live sin-bearer carried away.
-- "Once a year" repeated forever = the shadow that could never take away sins, contrasted with the
-- ONE offering once for all (Heb 10) — the feast STANDING, fulfilled NOT abolished (still an
-- everlasting statute, still afflict-your-souls, still a sabbath of rest, still reckoned the Fast
-- by the apostolic-era believers, Acts 27:9).
--
-- Leviticus 16 coverage:
--   v.1-2  NT:     Hebrews 9:7-8 (high priest alone once a year, way into holiest not yet manifest)
--          Extras: none warranted
--          Tanakh: Exodus 25:22 (I will commune from above the mercy seat); Exodus 30:10 (atonement once a year)
--   v.3-6  NT:     (covered with blood thread, Heb 9:11-12)
--          Extras: none warranted
--          Tanakh: (Exodus 25:17 mercy seat)
--   v.7-10 NT:     (two-goats thread — the dual atonement)
--          Extras: none warranted (Azazel/1En10 belongs on the scapegoat send-away thread)
--          Tanakh: Leviticus 14:4-7 (two birds, one killed/one let go); Isaiah 53:6 (laid on him the iniquity of us all)
--   v.11-14 NT:    Hebrews 9:11-12, 9:24-25 (by his own blood entered once); Romans 3:25 (a propitiation/mercy seat)
--          Extras: none warranted
--          Tanakh: Exodus 25:17 (the mercy seat of pure gold)
--   v.15-19 NT:    (blood thread)
--          Extras: none warranted
--          Tanakh: (within the blood/two-goats threads)
--   v.20-22 NT:    John 1:29 (Lamb that taketh away the sin of the world); Isaiah 53:11-12 (he bare the sin of many); Hebrews 13:11-12 (suffered without the gate)
--          Extras: 1 Enoch 10:4 (bind Azazel, cast into the desert) — clean witness, scapegoat/Azazel sent to the wilderness
--          Tanakh: Micah 7:19 (cast all their sins into the depths of the sea); Psalm 103:12 (as far as the east from the west)
--   v.23-28 NT:    Hebrews 13:11-12 (bodies burned without the camp; Yahusha suffered without the gate)
--          Extras: none warranted
--          Tanakh: Leviticus 4:12 (the whole bullock carried forth without the camp and burnt)
--   v.29-31 NT:    Acts 27:9 (the Fast — Yom Kippur — still reckoned by apostolic-era believers)
--          Extras: none warranted
--          Tanakh: Leviticus 23:27-32 (the day of atonement, afflict your souls, a sabbath of rest); Numbers 29:7 (tenth day seventh month, afflict your souls)
--   v.32-34 NT:    Hebrews 9:25-28 (offer himself once); Hebrews 10:1-4 (year by year can never take away sins); Hebrews 10:11-14 (one offering perfected for ever); Hebrews 10:19-22 (boldness to enter the holiest by the blood)
--          Extras: none warranted
--          Tanakh: (within once-a-year thread)
--
-- Threads (7):
--   lev16-the-veil-the-cloud-and-the-mercy-seat          [free]  Tanakh(Ex25:22, Ex30:10) + NT(Heb9:7-8)
--   lev16-the-blood-sprinkled-upon-the-mercy-seat        [free]  Tanakh(Ex25:17) + NT(Heb9:11-12, Heb9:24-25, Rom3:25)
--   lev16-the-two-goats-and-the-casting-of-lots          [free]  Tanakh(Lev14:4-7, Isa53:6)
--   lev16-the-scapegoat-bears-away-all-their-iniquities  [extras] NT(John1:29, Isa53:11-12, Heb13:11-12) + Tanakh(Micah7:19, Ps103:12) + Extras(1En10:4)
--   lev16-the-sin-offering-burned-without-the-camp       [free]  Tanakh(Lev4:12) + NT(Heb13:11-12)
--   lev16-afflict-your-souls-a-sabbath-of-rest-for-ever  [free]  Tanakh(Lev23:27-32, Num29:7) + NT(Acts27:9)
--   lev16-once-a-year-the-shadow-once-for-all-the-substance [free] NT(Heb9:25-28, Heb10:1-4, Heb10:11-14, Heb10:19-22)

-- =========================================================================================
-- A. Temp view
-- =========================================================================================
CREATE TEMP VIEW _s311_lev16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================================
-- B. cross_references INSERT
-- =========================================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the veil, the cloud, the mercy seat
    ('canon','leviticus',16,2,'canon','exodus',25,22,'free',
     E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). The mercy seat is the appointed meeting-place of Yahuah (LORD) with His people; here in Leviticus 16:2 the priest is warned *that he come not at all times into the holy place within the vail before the mercy seat... that he die not: for I will appear in the cloud upon the mercy seat* — the cloud-Glory above the blood-covered seat is the Formed Son''s presence.'),
    ('canon','leviticus',16,2,'canon','exodus',30,10,'free',
     E'*And Aaron shall make an atonement upon the horns of it once in a year with the blood of the sin offering of atonements: once in the year shall he make atonement upon it throughout your generations* (Exodus 30:10). The "once in the year" of the incense altar binds to the single annual approach of Leviticus 16, the rhythm of the Day of Atonement set into the standing service.'),
    ('canon','leviticus',16,2,'canon','hebrews',9,7,'free',
     E'*But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7). The apostle reads Leviticus 16 exactly: Aaron alone, once a year, never *without blood*. He continues — *the Ruach HaKodesh (Holy Spirit) this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8) — the once-a-year barring of the veil testifies that the full way in awaited the Formed Son.'),
    ('canon','leviticus',16,2,'canon','hebrews',9,8,'free',
     E'*The Ruach HaKodesh (Holy Spirit) this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8). The very restriction of Leviticus 16:2 — *that he come not at all times into the holy place within the vail* — is the Spirit''s sign that the open way was reserved for the once-for-all entry of Messiah (Christ).'),

    -- Thread 2: the blood sprinkled upon the mercy seat
    ('canon','leviticus',16,14,'canon','exodus',25,17,'free',
     E'*And thou shalt make a mercy seat of pure gold: two cubits and a half shall be the length thereof, and a cubit and a half the breadth thereof* (Exodus 25:17). The mercy seat upon which Aaron sprinkles the blood *seven times* (Leviticus 16:14) is the pure-gold lid of the ark — the place where blood meets the testimony of the Torah, atonement covering the broken covenant.'),
    ('canon','leviticus',16,14,'canon','hebrews',9,12,'free',
     E'*Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12). What Aaron does with bullock-blood sprinkled before the mercy seat, the Formed Son fulfils with *his own blood*, entering *once* — the eternal redemption the annual sprinkling only foreshadowed.'),
    ('canon','leviticus',16,15,'canon','hebrews',9,11,'free',
     E'*But Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building* (Hebrews 9:11). The goat slain *for the people* whose blood is brought *within the vail* (Leviticus 16:15) is the type; the Formed Son is the great High Priest entering the greater tabernacle.'),
    ('canon','leviticus',16,15,'canon','hebrews',9,25,'free',
     E'*Nor yet that he should offer himself often, as the high priest entereth into the holy place every year with blood of others* (Hebrews 9:25). The blood *of others* — the goat''s — brought yearly *within the vail* (Leviticus 16:15) is precisely the repetition the Formed Son breaks by offering himself once.'),
    ('canon','leviticus',16,15,'canon','romans',3,25,'free',
     E'*Whom Elohim (God) hath set forth to be a propitiation through faith in his blood, to declare his righteousness for the remission of sins that are past* (Romans 3:25). The word rendered "propitiation" is the mercy-seat itself: the blood sprinkled *upon the mercy seat, and before the mercy seat* (Leviticus 16:15) is the very pattern of the Formed Son set forth in his blood.'),

    -- Thread 3: the two goats and the casting of lots
    ('canon','leviticus',16,8,'canon','leviticus',14,4,'free',
     E'*Then shall the priest command to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop* (Leviticus 14:4). The cleansing of the leper rehearses the same two-fold pattern as the Day of Atonement: of the *two birds*, one is killed and one *let loose into the open field* (Leviticus 14:7), as here *Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat* (Leviticus 16:8) — death and release as one act of atonement.'),
    ('canon','leviticus',16,8,'canon','leviticus',14,7,'free',
     E'*And he shall sprinkle upon him that is to be cleansed from the leprosy seven times, and shall pronounce him clean, and shall let the living bird loose into the open field* (Leviticus 14:7). The living bird *let loose* mirrors the live goat sent away; both witness that the one atonement has two aspects — the slain and the bearer carried off.'),
    ('canon','leviticus',16,10,'canon','isaiah',53,6,'free',
     E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). The scapegoat *presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10) is the living picture of the Servant on whom *Yahuah (LORD) hath laid... the iniquity of us all*.'),

    -- Thread 4: the scapegoat bears away all their iniquities  [extras]
    ('canon','leviticus',16,21,'canon','john',1,29,'free',
     E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). Aaron lays *both his hands upon the head of the live goat, and confess over him all the iniquities of the children of Yashar''el (Israel)... putting them upon the head of the goat* (Leviticus 16:21); the Formed Son is the one who *taketh away the sin* — the sin laid on and carried off.'),
    ('canon','leviticus',16,22,'canon','isaiah',53,11,'free',
     E'*He shall see of the travail of his soul, and shall be satisfied: by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). *And the goat shall bear upon him all their iniquities unto a land not inhabited* (Leviticus 16:22) — the sin-bearing Servant who *shall bear their iniquities* is the scapegoat carrying the people''s guilt away.'),
    ('canon','leviticus',16,22,'canon','isaiah',53,12,'free',
     E'*...he hath poured out his soul unto death: and he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12). The goat *bear upon him all their iniquities* (Leviticus 16:22) is the figure of him who *bare the sin of many*.'),
    ('canon','leviticus',16,22,'canon','hebrews',13,12,'free',
     E'*Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). As the goat is sent *unto a land not inhabited* (Leviticus 16:22), the Formed Son bears the sin outside, *without the gate* — the sin-bearer carried away from the camp.'),
    ('canon','leviticus',16,22,'canon','micah',7,19,'free',
     E'*He will turn again, he will have compassion upon us; he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:19). The goat carrying *all their iniquities unto a land not inhabited* (Leviticus 16:22) is the same mercy that *cast all their sins into the depths of the sea* — removed, irretrievable.'),
    ('canon','leviticus',16,22,'canon','psalms',103,12,'free',
     E'*As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12). The scapegoat sent away *into the wilderness* (Leviticus 16:22) enacts the distance of Psalm 103: the iniquity borne off and removed beyond return.'),
    ('canon','leviticus',16,21,'enoch','1-enoch',10,4,'extras',
     E'*And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein* (1 Enoch 10:4). The live goat is the goat *for the scapegoat* (Hebrew Azazel), sent *by the hand of a fit man into the wilderness* (Leviticus 16:21); 1 Enoch names Azazel bound and cast into the desert to bear the corruption — the wilderness as the place where defilement is removed from the camp of Yahuah.'),

    -- Thread 5: the sin offering burned without the camp
    ('canon','leviticus',16,27,'canon','leviticus',4,12,'free',
     E'*Even the whole bullock shall he carry forth without the camp unto a clean place, where the ashes are poured out, and burn him on the wood with fire* (Leviticus 4:12). The Day-of-Atonement command that *the bullock for the sin offering, and the goat for the sin offering... shall one carry forth without the camp; and they shall burn in the fire* (Leviticus 16:27) follows the sin-offering pattern already set in Leviticus 4: the body bearing sin consumed outside.'),
    ('canon','leviticus',16,27,'canon','hebrews',13,11,'free',
     E'*For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). The apostle quotes Leviticus 16:27 directly — *the bodies... burned without the camp* — and draws the fulfilment: *Wherefore Yahusha (Jesus) also... suffered without the gate* (Hebrews 13:12). The sin-offering burned outside is the Formed Son crucified outside the city.'),

    -- Thread 6: afflict your souls, a sabbath of rest, a statute for ever
    ('canon','leviticus',16,29,'canon','leviticus',23,27,'free',
     E'*Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto Yahuah (LORD)* (Leviticus 23:27). The appointed time of Leviticus 16:29 — *in the seventh month, on the tenth day of the month, ye shall afflict your souls* — is enrolled in the calendar of feasts of Leviticus 23 as the Day of Atonement, an appointed time of Yahuah, not abolished but standing.'),
    ('canon','leviticus',16,31,'canon','leviticus',23,32,'free',
     E'*It shall be unto you a sabbath of rest, and ye shall afflict your souls: in the ninth day of the month at even, from even unto even, shall ye celebrate your sabbath* (Leviticus 23:32). *It shall be a sabbath of rest unto you, and ye shall afflict your souls, by a statute for ever* (Leviticus 16:31) — the Day of Atonement is a high sabbath, kept from even unto even.'),
    ('canon','leviticus',16,29,'canon','numbers',29,7,'free',
     E'*And ye shall have on the tenth day of this seventh month an holy convocation; and ye shall afflict your souls: ye shall not do any work therein* (Numbers 29:7). The same tenth-day affliction and rest of Leviticus 16:29 is repeated in the order of offerings — the Day of Atonement woven through the Torah as one standing appointment.'),
    ('canon','leviticus',16,29,'canon','acts',27,9,'free',
     E'*Now when much time was spent, and when sailing was now dangerous, because the fast was now already past, Paul admonished them* (Acts 27:9). "The fast" is the Day of Atonement; the apostolic-era believers still reckoned the sailing season by Yom Kippur — Leviticus 16:29''s *ye shall afflict your souls* kept and counted, the feast standing in the assembly of the Way.'),

    -- Thread 7: once a year the shadow, once for all the substance
    ('canon','leviticus',16,34,'canon','hebrews',9,28,'free',
     E'*So Messiah (Christ) was once offered to bear the sins of many; and unto them that look for him shall he appear the second time without sin unto salvation* (Hebrews 9:28). *To make an atonement for the children of Yashar''el (Israel) for all their sins once a year* (Leviticus 16:34); against the yearly repetition the apostle sets the Formed Son *once offered to bear the sins of many* — the once-a-year shadow filled by the once-for-all substance.'),
    ('canon','leviticus',16,34,'canon','hebrews',10,4,'free',
     E'*For it is not possible that the blood of bulls and of goats should take away sins* (Hebrews 10:4). The atonement *once a year* (Leviticus 16:34) was *a shadow of good things to come... can never with those sacrifices which they offered year by year continually make the comers thereunto perfect* (Hebrews 10:1) — the shadow pointing beyond itself, fulfilled not voided.'),
    ('canon','leviticus',16,34,'canon','hebrews',10,12,'free',
     E'*But this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God)* (Hebrews 10:12). Where the priest of Leviticus 16:34 must atone *once a year* again and again, the Formed Son offered *one sacrifice for sins for ever* — *for by one offering he hath perfected for ever them that are sanctified* (Hebrews 10:14).'),
    ('canon','leviticus',16,34,'canon','hebrews',10,19,'free',
     E'*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus)* (Hebrews 10:19). The veil that once barred all but the high priest *once a year* (Leviticus 16:34) is opened: *a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh* (Hebrews 10:20) — the substance the Day of Atonement foreshadowed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================================
-- C. threads INSERT
-- =========================================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-the-veil-the-cloud-and-the-mercy-seat',
       E'The veil, the cloud, and the mercy seat',
       E'Aaron is warned *that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat* (Leviticus 16:2). The mercy seat is where Yahuah (LORD) had said *there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims* (Exodus 25:22); the incense cloud rises *that the cloud of the incense may cover the mercy seat... that he die not* (Leviticus 16:13). This single guarded approach is reckoned *once in the year* in the service of the altar (Exodus 30:10). The apostle reads the restriction as a prophecy: *into the second went the high priest alone once every year, not without blood* (Hebrews 9:7), *the Ruach HaKodesh (Holy Spirit) this signifying, that the way into the holiest of all was not yet made manifest, while as the first tabernacle was yet standing* (Hebrews 9:8). The closed veil testifies that the open way awaited the Formed Son.',
       sv.verse_id, ev.verse_id, 'free', 23075
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-the-blood-sprinkled-upon-the-mercy-seat',
       E'The blood sprinkled upon the mercy seat',
       E'Aaron *shall take of the blood of the bullock, and sprinkle it with his finger upon the mercy seat eastward; and before the mercy seat shall he sprinkle of the blood with his finger seven times* (Leviticus 16:14), then *shall he kill the goat of the sin offering, that is for the people, and bring his blood within the vail... and sprinkle it upon the mercy seat, and before the mercy seat* (Leviticus 16:15). The seat itself is the pure-gold lid over the testimony (Exodus 25:17) — blood meeting the Torah, atonement covering the broken covenant. The Formed Son fills it: *Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle* (Hebrews 9:11), *by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12) — not yearly *with blood of others* (Hebrews 9:25). And Romans names the mercy seat outright: *whom Elohim (God) hath set forth to be a propitiation through faith in his blood* (Romans 3:25). The blood on the mercy seat is the pattern of the once-for-all blood of the Formed Son.',
       sv.verse_id, ev.verse_id, 'free', 23078
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-the-two-goats-and-the-casting-of-lots',
       E'The two goats and the casting of lots',
       E'*And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat* (Leviticus 16:8). The goat *upon which the LORD''S lot fell* is offered *for a sin offering* (Leviticus 16:9); the other *shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10). Two goats, one atonement with two aspects — the slain and the bearer let go. The same pattern cleanses the leper: of *two birds alive and clean* (Leviticus 14:4) one is killed and the other *let loose into the open field* (Leviticus 14:7). And the living picture stands in the Servant: *all we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6) — the slain offering and the iniquity-bearer are one Lamb.',
       sv.verse_id, ev.verse_id, 'free', 23081
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-the-scapegoat-bears-away-all-their-iniquities',
       E'The scapegoat bears away all their iniquities',
       E'*And Aaron shall lay both his hands upon the head of the live goat, and confess over him all the iniquities of the children of Yashar''el (Israel), and all their transgressions in all their sins, putting them upon the head of the goat, and shall send him away by the hand of a fit man into the wilderness: and the goat shall bear upon him all their iniquities unto a land not inhabited* (Leviticus 16:21-22). This is the sin-bearer carried away. The Formed Son fills it: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29); *he bare the sin of many, and made intercession for the transgressors* (Isaiah 53:12); *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). As the goat is sent to *a land not inhabited*, the Formed Son *suffered without the gate* (Hebrews 13:12). The removal is total: *thou wilt cast all their sins into the depths of the sea* (Micah 7:19); *as far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12). And the restored witness names the goat *for the scapegoat* — Azazel: *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert... and cast him therein* (1 Enoch 10:4), the wilderness as the place where the defilement is borne away from the camp of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 23084
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-the-sin-offering-burned-without-the-camp',
       E'The sin offering burned without the camp',
       E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27). The pattern was set already in the law of the sin offering: *the whole bullock shall he carry forth without the camp unto a clean place... and burn him on the wood with fire* (Leviticus 4:12). The apostle quotes the Day-of-Atonement command and draws the fulfilment: *for the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp. Wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:11-12). The body bearing sin consumed outside the camp is the Formed Son crucified outside the city.',
       sv.verse_id, ev.verse_id, 'free', 23087
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-afflict-your-souls-a-sabbath-of-rest-for-ever',
       E'Afflict your souls — a sabbath of rest for ever',
       E'*And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls, and do no work at all* (Leviticus 16:29); *it shall be a sabbath of rest unto you, and ye shall afflict your souls, by a statute for ever* (Leviticus 16:31). This is an appointed time of Yahuah, enrolled in the feast-calendar — *the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation... and ye shall afflict your souls* (Leviticus 23:27), *a sabbath of rest... from even unto even, shall ye celebrate your sabbath* (Leviticus 23:32) — and repeated in the order of offerings (Numbers 29:7). It is not abolished: the apostolic-era believers still reckoned time by it, *because the fast was now already past* (Acts 27:9). "The fast" is the Day of Atonement, kept and counted — the appointed time standing.',
       sv.verse_id, ev.verse_id, 'free', 23090
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-16-once-a-year-the-shadow-once-for-all-the-substance',
       E'Once a year the shadow, once for all the substance',
       E'*And this shall be an everlasting statute unto you, to make an atonement for the children of Yashar''el (Israel) for all their sins once a year* (Leviticus 16:34). The "once a year," endlessly repeated, is the shadow that points beyond itself. Hebrews holds the two together without voiding the first: *for the law having a shadow of good things to come... can never with those sacrifices which they offered year by year continually make the comers thereunto perfect* (Hebrews 10:1), *for it is not possible that the blood of bulls and of goats should take away sins* (Hebrews 10:4). Against the yearly repetition stands the Formed Son: *Messiah (Christ) was once offered to bear the sins of many* (Hebrews 9:28); *this man, after he had offered one sacrifice for sins for ever, sat down on the right hand of Elohim (God)* (Hebrews 10:12), *for by one offering he hath perfected for ever them that are sanctified* (Hebrews 10:14). And the veil that barred all but the priest once a year is now opened: *having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus)* (Hebrews 10:19). The once-a-year shadow is fulfilled in the once-for-all substance.',
       sv.verse_id, ev.verse_id, 'free', 23093
  FROM _s311_lev16_lookup sv, _s311_lev16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=16 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================================
-- D. thread_members INSERT (one block per member)
-- =========================================================================================

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 25:22 — *there I will meet with thee... from above the mercy seat* — the appointed meeting-place guarded in Leviticus 16:2.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=2
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-veil-the-cloud-and-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 30:10 — *once in the year shall he make atonement* — the single annual approach set into the standing service.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=2
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-veil-the-cloud-and-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 9:7 — *the high priest alone once every year, not without blood* — the apostle reads Leviticus 16 exactly.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=2
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-veil-the-cloud-and-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 9:8 — *the way into the holiest of all was not yet made manifest* — the closed veil as the Spirit''s sign.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=2
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-veil-the-cloud-and-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 25:17 — *a mercy seat of pure gold* — the seat sprinkled seven times, blood over the testimony.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-blood-sprinkled-upon-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 9:12 — *by his own blood he entered in once* — the eternal redemption the yearly sprinkling foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-blood-sprinkled-upon-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 9:11 — *an high priest of good things to come, by a greater and more perfect tabernacle* — the goat-blood within the veil is the type.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-blood-sprinkled-upon-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 9:25 — *with blood of others... every year* — the very repetition the Formed Son breaks.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-blood-sprinkled-upon-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 3:25 — *a propitiation through faith in his blood* — the word is the mercy-seat itself.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-blood-sprinkled-upon-the-mercy-seat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 14:4 — *two birds alive and clean* — the same two-fold cleansing pattern as the two goats.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-two-goats-and-the-casting-of-lots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 14:7 — *let the living bird loose into the open field* — the living bird mirrors the live goat sent away.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-two-goats-and-the-casting-of-lots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 53:6 — *Yahuah (LORD) hath laid on him the iniquity of us all* — the living picture of both goats in one Lamb.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-two-goats-and-the-casting-of-lots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 1:29 — *the Lamb of Elohim (God), which taketh away the sin of the world* — the Formed Son who carries off the sin laid on.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=21
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 53:11 — *he shall bear their iniquities* — the sin-bearing Servant who is the scapegoat.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 53:12 — *he bare the sin of many, and made intercession for the transgressors* — the goat bearing all their iniquities.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 13:12 — *suffered without the gate* — as the goat is sent unto a land not inhabited, the Formed Son bears the sin outside.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Micah 7:19 — *thou wilt cast all their sins into the depths of the sea* — the iniquity removed, irretrievable.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 103:12 — *as far as the east is from the west, so far hath he removed our transgressions* — the distance the scapegoat enacts.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'1 Enoch 10:4 — *Bind Azâzêl... and make an opening in the desert... and cast him therein* — the goat for Azazel, the wilderness where defilement is borne away.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=21
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-scapegoat-bears-away-all-their-iniquities'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 4:12 — *the whole bullock shall he carry forth without the camp... and burn him on the wood with fire* — the sin-offering pattern already set.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=27
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-sin-offering-burned-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 13:11 — *the bodies... are burned without the camp* — the apostle quotes Leviticus 16:27, the Formed Son crucified outside the city.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=27
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-the-sin-offering-burned-without-the-camp'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 23:27 — *a day of atonement... ye shall afflict your souls* — the appointed time enrolled in the feast-calendar.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-afflict-your-souls-a-sabbath-of-rest-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 23:32 — *a sabbath of rest... from even unto even* — the Day of Atonement is a high sabbath.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=31
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-afflict-your-souls-a-sabbath-of-rest-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 29:7 — *the tenth day of this seventh month... ye shall afflict your souls* — the same appointment repeated in the order of offerings.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=29 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-afflict-your-souls-a-sabbath-of-rest-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 27:9 — *because the fast was now already past* — the apostolic-era believers still reckoned time by Yom Kippur; the feast standing.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=27 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-afflict-your-souls-a-sabbath-of-rest-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hebrews 9:28 — *Messiah (Christ) was once offered to bear the sins of many* — the once-for-all against the once-a-year.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-once-a-year-the-shadow-once-for-all-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 10:4 — *not possible that the blood of bulls and of goats should take away sins* — the shadow pointing beyond itself.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-once-a-year-the-shadow-once-for-all-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 10:12 — *one sacrifice for sins for ever* — the priest of Leviticus 16 must atone yearly; the Formed Son offered once.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-once-a-year-the-shadow-once-for-all-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 10:19 — *boldness to enter into the holiest by the blood of Yahusha (Jesus)* — the veil opened, the substance the Day foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s311_lev16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s311_lev16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-16-once-a-year-the-shadow-once-for-all-the-substance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_17.sql (Leviticus 17) -----
-- Book: Leviticus  Chapter: 17  | tag: lev17 | session prefix: s311
-- Sort band base 23100 step 3 -> 23100, 23103, 23106, 23109
-- Temp view: _s311_lev17_lookup
--
-- FRAMING: Leviticus 17 is the blood chapter — slaughter centralized at the door of the
-- tabernacle (not the open field, not to devils), the central blood-atonement declaration
-- (the life is in the blood, given upon the altar to make atonement), the universal blood
-- prohibition, and the law of that which died of itself. All four threads are Torah-affirmed,
-- never abolished: the NT (Hebrews, Matthew, the apostolic decree of Acts 15) fills and
-- confirms these statutes, it does not cancel them. The blood-atonement verse (17:11) is the
-- root the whole sacrificial system — and the Formed Son's own blood — grows from.
--
-- Leviticus 17 coverage:
--   v.1-9   NT:     1 Corinthians 10:20-21 (Gentiles sacrifice to devils; cannot share
--                   Yahuah's table and the table of devils) — WARRANTED
--           Extras: none warranted (Tanakh + NT carry the devils/centralization weave fully)
--           Tanakh: Deuteronomy 12:5,13-14 (the one place He chooses); Deuteronomy 32:17
--                   (sacrificed unto devils); Psalm 106:37 (sacrificed unto devils) — WARRANTED
--   v.10-12 NT:     Hebrews 9:22 (without shedding of blood no remission); Matthew 26:28
--                   (my blood of the new testament for remission); Hebrews 9:14 (blood of
--                   Messiah); 1 Peter 1:18-19 (precious blood of Messiah); Acts 15:20 and
--                   Acts 15:29 (abstain from blood) — WARRANTED
--           Extras: none warranted
--           Tanakh: Genesis 9:4 (flesh with the blood ye shall not eat); Deuteronomy 12:23
--                   (the blood is the life) — WARRANTED
--   v.13-14 NT:     none warranted (the apostolic decree already carried under v.10-12)
--           Extras: none warranted
--           Tanakh: Genesis 9:4; Deuteronomy 12:16; Deuteronomy 12:24 (pour the blood as
--                   water) — WARRANTED
--   v.15-16 NT:     none warranted
--           Extras: none warranted
--           Tanakh: Leviticus 11:39-40; Exodus 22:31; Ezekiel 44:31 (the priests shall not
--                   eat of any thing dead of itself or torn) — WARRANTED
--
-- THREADS (4):
--   leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils  [free]
--       targets: canon NT (1-corinthians), canon Tanakh (deuteronomy, psalms)
--   leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement  [free]
--       targets: canon NT (hebrews, matthew, 1-peter, acts), canon Tanakh (genesis, deuteronomy)
--   leviticus-17-the-blood-of-it-is-for-the-life-thereof-eat-no-blood  [free]
--       targets: canon Tanakh (genesis, deuteronomy)
--   leviticus-17-that-which-died-of-itself-or-was-torn  [free]
--       targets: canon Tanakh (leviticus, exodus, ezekiel)
--
-- CONTESTED/LOAD-BEARING: 17:11 framed as the live root of blood-atonement — the same statute
-- the Formed Son's blood fulfills (Matt 26:28, Heb 9:14), and Acts 15 keeps the blood
-- prohibition binding on the Gentiles turned to Yahuah — Torah affirmed, not abolished.

CREATE TEMP VIEW _s311_lev17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: bring them unto the door — offer no more unto devils (v.1-9)
    ('canon','leviticus',17,7,'canon','1-corinthians',10,20, 'free',
      E'*But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* (1 Corinthians 10:20). Leviticus warns *they shall no more offer their sacrifices unto devils, after whom they have gone a whoring* (Leviticus 17:7); Sha''ul (Paul) names the same enemy — sacrifice in the open field, outside the door of the tabernacle, is sacrifice to demons, and the redeemed may have no fellowship with them.'),
    ('canon','leviticus',17,7,'canon','1-corinthians',10,21, 'free',
      E'*Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* (1 Corinthians 10:21). The whole point of bringing every slaughter *unto the door of the tabernacle of the congregation* (Leviticus 17:5) is that worship is Yahuah''s table alone — *they shall no more offer their sacrifices unto devils* (Leviticus 17:7). One table or the other; never both.'),
    ('canon','leviticus',17,5,'canon','deuteronomy',12,5, 'free',
      E'*But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there, even unto his habitation shall ye seek, and thither thou shalt come* (Deuteronomy 12:5). Leviticus commands the same centralization — *that they may bring them unto Yahuah (LORD), unto the door of the tabernacle of the congregation* (Leviticus 17:5). Worship is not wherever a man pleases; it is the one place where the Name dwells.'),
    ('canon','leviticus',17,3,'canon','deuteronomy',12,13, 'free',
      E'*Take heed to thyself that thou offer not thy burnt offerings in every place that thou seest: But in the place which Yahuah (LORD) shall choose in one of thy tribes, there thou shalt offer thy burnt offerings* (Deuteronomy 12:13-14). This is the very statute Leviticus 17:3-4 enforces — the man who *killeth it out of the camp* and *bringeth it not unto the door of the tabernacle* has shed blood and is cut off. The open field is forbidden; the chosen place is required.'),
    ('canon','leviticus',17,7,'canon','deuteronomy',32,17, 'free',
      E'*They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The Song of Moses names exactly what Leviticus 17:7 forbids — *they shall no more offer their sacrifices unto devils* — the open-field sacrifice is not neutral; it is the worship of demons that provokes Yahuah to jealousy.'),
    ('canon','leviticus',17,7,'canon','psalms',106,37, 'free',
      E'*Yea, they sacrificed their sons and their daughters unto devils* (Psalm 106:37). The Psalmist sings the history of the very apostasy Leviticus 17:7 was given to prevent — *after whom they have gone a whoring* — sacrifice that leaves the door of the tabernacle descends into the worship of devils and the blood of children.'),

    -- THREAD 2: the life of the flesh is in the blood — it maketh atonement (v.10-12)
    ('canon','leviticus',17,11,'canon','hebrews',9,22, 'free',
      E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission.* (Hebrews 9:22). This is the New-Testament echo of Leviticus 17:11 — *it is the blood that maketh an atonement for the soul* — Hebrews does not abolish the principle, it confirms it as the law''s own rule: atonement runs on blood, and only blood.'),
    ('canon','leviticus',17,11,'canon','matthew',26,28, 'free',
      E'*For this is my blood of the new testament, which is shed for many for the remission of sins.* (Matthew 26:28). Leviticus declares *the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls* (Leviticus 17:11). At the table the Formed Son names His own blood as the atoning blood — the life poured out, the statute fulfilled, not cancelled.'),
    ('canon','leviticus',17,11,'canon','hebrews',9,14, 'free',
      E'*How much more shall the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot to Elohim (God), purge your conscience from dead works to serve the living Elohim (God)?* (Hebrews 9:14). Because *the life of the flesh is in the blood* (Leviticus 17:11), the blood of the Formed Son — His own life laid upon the altar — is the atonement the chapter was always pointing toward.'),
    ('canon','leviticus',17,11,'canon','1-peter',1,19, 'free',
      E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). Leviticus grounds atonement in the life carried by the blood — *it is the blood that maketh an atonement for the soul* (Leviticus 17:11). Kepha (Peter) names the lamb whose blood pays the price, the unblemished life given upon the altar of Yahuah.'),
    ('canon','leviticus',17,12,'canon','acts',15,20, 'free',
      E'*But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood.* (Acts 15:20). The apostolic decree keeps the Leviticus 17 statute binding on the Gentiles turned to Yahuah — *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* (Leviticus 17:12); the stranger''s blood prohibition is carried straight into the assembly, Torah affirmed.'),
    ('canon','leviticus',17,12,'canon','acts',15,29, 'free',
      E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication: from which if ye keep yourselves, ye shall do well.* (Acts 15:29). The council names the blood-of-the-stranger command of Leviticus 17:12 — *neither shall any stranger that sojourneth among you eat blood* — as a present, living obligation, not an abolished shadow.'),
    ('canon','leviticus',17,11,'canon','genesis',9,4, 'free',
      E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4). The blood prohibition is older than Sinai — given to Noah for all flesh — and Leviticus 17:11 gives the reason: *the life of the flesh is in the blood*. The life belongs to Yahuah upon the altar; man may not consume it.'),
    ('canon','leviticus',17,11,'canon','deuteronomy',12,23, 'free',
      E'*Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh.* (Deuteronomy 12:23). Moses repeats the very ground of Leviticus 17:11 — *the life of the flesh is in the blood* — the blood is the life, reserved for atonement upon the altar, never to be eaten with the flesh.'),

    -- THREAD 3: the blood of it is for the life thereof — eat no blood (v.13-14)
    ('canon','leviticus',17,14,'canon','genesis',9,4, 'free',
      E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4). Leviticus 17:14 restates the Noahic law for every beast and fowl that is hunted — *the life of all flesh is the blood thereof... Ye shall eat the blood of no manner of flesh* — the universal prohibition given to all mankind in Noah.'),
    ('canon','leviticus',17,13,'canon','deuteronomy',12,16, 'free',
      E'*Only ye shall not eat the blood; ye shall pour it upon the earth as water.* (Deuteronomy 12:16). Leviticus 17:13 gives the same command for the hunted beast — *he shall even pour out the blood thereof, and cover it with dust* — the life-bearing blood is returned to the ground, never eaten.'),
    ('canon','leviticus',17,14,'canon','deuteronomy',12,24, 'free',
      E'*Thou shalt not eat it; thou shalt pour it upon the earth as water.* (Deuteronomy 12:24). The Deuteronomy renewal seals the Leviticus 17:14 statute — *whosoever eateth it shall be cut off* — the blood, being the life of all flesh, is poured out as water, not consumed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 4: that which died of itself or was torn (v.15-16)
    ('canon','leviticus',17,15,'canon','leviticus',11,39, 'free',
      E'*And if any beast, of which ye may eat, die; he that toucheth the carcase thereof shall be unclean until the even.* (Leviticus 11:39). The dietary chapter already set the rule that Leviticus 17:15 applies to eating — *every soul that eateth that which died of itself, or that which was torn with beasts... shall be unclean until the even* — death-of-itself defiles, and the law of cleansing follows.'),
    ('canon','leviticus',17,15,'canon','leviticus',11,40, 'free',
      E'*And he that eateth of the carcase of it shall wash his clothes, and be unclean until the even: he also that beareth the carcase of it shall wash his clothes, and be unclean until the even.* (Leviticus 11:40). This is the cleansing Leviticus 17:15 prescribes — *he shall both wash his clothes, and bathe himself in water, and be unclean until the even: then shall he be clean* — washing and waiting for the carcase that died of itself.'),
    ('canon','leviticus',17,15,'canon','exodus',22,31, 'free',
      E'*And ye shall be holy men unto me: neither shall ye eat any flesh that is torn of beasts in the field; ye shall cast it to the dogs.* (Exodus 22:31). The same statute against flesh *torn with beasts* (Leviticus 17:15) is rooted in holiness — torn flesh is for the dogs, not the holy people of Yahuah.'),
    ('canon','leviticus',17,15,'canon','ezekiel',44,31, 'free',
      E'*The priests shall not eat of any thing that is dead of itself, or torn, whether it be fowl or beast.* (Ezekiel 44:31). The prophet of the restored temple binds the Leviticus 17:15 law upon the priesthood especially — *that which died of itself, or that which was torn with beasts* — the standard endures into the age to come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils',
       E'Bring Them Unto the Door — Offer No More Unto Devils',
       E'Leviticus 17 opens by drawing every slaughter to one place. *What man soever there be of the house of Yashar''el (Israel), that killeth an ox, or lamb, or goat... And bringeth it not unto the door of the tabernacle of the congregation... blood shall be imputed unto that man; he hath shed blood; and that man shall be cut off* (Leviticus 17:3-4). The reason is named plainly: *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring* (Leviticus 17:7). Open-field sacrifice is not private piety; it is the worship of demons. Moses had already sung it — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not* (Deuteronomy 32:17) — and the Psalmist mourns its end: *Yea, they sacrificed their sons and their daughters unto devils* (Psalm 106:37). Worship must come *unto the place which Yahuah Elohaychem (the LORD your God) shall choose... to put his name there* (Deuteronomy 12:5; cf. 12:13-14). Sha''ul (Paul) carries the same line into the assembly: *the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God)* and *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils* (1 Corinthians 10:20-21). One table, or the table of devils — never both.',
       sv.verse_id, ev.verse_id, 'free', 23100
  FROM _s311_lev17_lookup sv, _s311_lev17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=17 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement',
       E'The Life of the Flesh Is in the Blood — It Maketh Atonement',
       E'Here is the central declaration of the whole sacrificial system: *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul* (Leviticus 17:11). The life belongs to Yahuah; therefore *No soul of you shall eat blood, neither shall any stranger that sojourneth among you eat blood* (Leviticus 17:12). The prohibition is older than Sinai — *flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) — and repeated at the renewal: *the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23). The New Testament does not cancel this; it fulfills it. *Without shedding of blood is no remission* (Hebrews 9:22); the Formed Son names His own blood at the table — *this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28) — *the blood of Messiah (Christ), who through the eternal Spirit offered himself without spot* (Hebrews 9:14), *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). And the apostolic council keeps the statute binding on the strangers turned to Yahuah: *abstain... from blood* (Acts 15:20,29). The life-in-the-blood that makes atonement is the root the Lamb''s own blood grows from.',
       sv.verse_id, ev.verse_id, 'free', 23103
  FROM _s311_lev17_lookup sv, _s311_lev17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=17 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-17-the-blood-of-it-is-for-the-life-thereof-eat-no-blood',
       E'The Blood of It Is for the Life Thereof — Eat No Blood',
       E'The blood prohibition is not for altar-beasts only; it reaches every creature that is hunted. *Whatsoever man... which hunteth and catcheth any beast or fowl that may be eaten; he shall even pour out the blood thereof, and cover it with dust* (Leviticus 17:13), *For it is the life of all flesh; the blood of it is for the life thereof... Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off* (Leviticus 17:14). This is the universal law given to all mankind in Noah — *flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) — and pressed again in Deuteronomy: *ye shall not eat the blood; ye shall pour it upon the earth as water* (Deuteronomy 12:16), *Thou shalt not eat it; thou shalt pour it upon the earth as water* (Deuteronomy 12:24). The life-bearing blood is returned to the ground, never consumed; the life belongs to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'free', 23106
  FROM _s311_lev17_lookup sv, _s311_lev17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-17-that-which-died-of-itself-or-was-torn',
       E'That Which Died of Itself or Was Torn',
       E'The chapter closes with the carcase that was not slaughtered for the altar — its blood not drained, its death defiling. *And every soul that eateth that which died of itself, or that which was torn with beasts... he shall both wash his clothes, and bathe himself in water, and be unclean until the even: then shall he be clean. But if he wash them not, nor bathe his flesh; then he shall bear his iniquity* (Leviticus 17:15-16). The dietary law had already set the standard — *if any beast, of which ye may eat, die; he that toucheth the carcase thereof shall be unclean until the even* (Leviticus 11:39), with washing and waiting (Leviticus 11:40). Holiness is the ground: *ye shall be holy men unto me: neither shall ye eat any flesh that is torn of beasts in the field; ye shall cast it to the dogs* (Exodus 22:31). And the prophet of the restored temple binds it upon the priesthood for the age to come: *The priests shall not eat of any thing that is dead of itself, or torn, whether it be fowl or beast* (Ezekiel 44:31). The standard endures.',
       sv.verse_id, ev.verse_id, 'free', 23109
  FROM _s311_lev17_lookup sv, _s311_lev17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=17 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Sha''ul (Paul) names the open-field sacrifice for what it is: *the things which the Gentiles sacrifice, they sacrifice to devils* (1 Corinthians 10:20) — the same devils of Leviticus 17:7.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye cannot... be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21) — one table or the other, the principle of the door of the tabernacle.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The one place where the Name dwells: *the place which Yahuah Elohaychem (the LORD your God) shall choose... to put his name there* (Deuteronomy 12:5).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=5
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*offer not thy burnt offerings in every place... But in the place which Yahuah (LORD) shall choose* (Deuteronomy 12:13-14) — the very statute Leviticus 17:3-4 enforces against the open field.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The Song of Moses names the same demons: *They sacrificed unto devils, not to Elohim (God)* (Deuteronomy 32:17).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Where leaving the door leads: *they sacrificed their sons and their daughters unto devils* (Psalm 106:37).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-bring-them-unto-the-door-and-offer-no-more-unto-devils'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The law''s own rule, confirmed: *without shedding of blood is no remission* (Hebrews 9:22).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The Formed Son names His own atoning blood: *this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the blood of Messiah (Christ)... offered himself without spot to Elohim (God)* (Hebrews 9:14) — the life laid upon the altar, fulfilled.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'The unblemished Lamb whose blood pays: *the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The apostolic decree keeps the blood prohibition binding: *abstain... from blood* (Acts 15:20) — Leviticus 17:12''s stranger-command carried into the assembly.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'The council seals it: *abstain... from blood, and from things strangled* (Acts 15:29) — a living obligation, Torah affirmed.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Older than Sinai, given to Noah: *flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'The renewal repeats the ground: *the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-life-of-the-flesh-is-in-the-blood-it-maketh-atonement'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The Noahic universal law: *flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-blood-of-it-is-for-the-life-thereof-eat-no-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Pour it out, do not eat it: *ye shall not eat the blood; ye shall pour it upon the earth as water* (Deuteronomy 12:16) — the hunted beast of Leviticus 17:13.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-blood-of-it-is-for-the-life-thereof-eat-no-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The renewal seals it: *Thou shalt not eat it; thou shalt pour it upon the earth as water* (Deuteronomy 12:24).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-the-blood-of-it-is-for-the-life-thereof-eat-no-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The dietary law''s standard: *if any beast, of which ye may eat, die; he that toucheth the carcase thereof shall be unclean until the even* (Leviticus 11:39).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-that-which-died-of-itself-or-was-torn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The cleansing prescribed: *he that eateth of the carcase of it shall wash his clothes, and be unclean until the even* (Leviticus 11:40) — the washing of Leviticus 17:15.'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-that-which-died-of-itself-or-was-torn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Holiness is the ground: *ye shall be holy men unto me: neither shall ye eat any flesh that is torn of beasts in the field* (Exodus 22:31).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-that-which-died-of-itself-or-was-torn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Bound on the restored priesthood for the age to come: *The priests shall not eat of any thing that is dead of itself, or torn* (Ezekiel 44:31).'
  FROM cross_reference_threads t
  JOIN _s311_lev17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s311_lev17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-17-that-which-died-of-itself-or-was-torn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_18.sql (Leviticus 18) -----
-- Book: Leviticus  Chapter: 18  (the forbidden unions / the sexual holiness code)
-- Tag: lev18   Session prefix: s311   Temp view: _s311_lev18_lookup
-- Sort band base: 23125  step 3  ->  23125, 23128, 23131, 23134, 23137
-- All slugs prefixed leviticus-18- (checked against EXISTING_SLUGS.txt: 0 present)
--
-- Leviticus 18 coverage:
--   v.1-4  be unlike the nations / do my judgments
--          NT:     none warranted (the call is laterally answered in Torah/prophets)
--          Extras: Jubilees 30:11 (command not to walk after the nations)
--          Tanakh: Deuteronomy 18:9 (learn not the abominations of the nations), Ezekiel 20:18-19 (walk not in the statutes of your fathers; walk in my statutes)
--   v.5    ★★ keep my statutes... which if a man do, he shall LIVE in them
--          NT:     Romans 10:5, Galatians 3:12, Luke 10:28 (this do, and thou shalt live)
--          Extras: none warranted (the canon carries the life-in-Torah chain fully)
--          Tanakh: Ezekiel 20:11, Nehemiah 9:29, Deuteronomy 30:15-16 (life set before them)
--   v.6-18 the forbidden incestuous unions (near of kin)
--          NT:     none warranted (capital boundaries are restated in Torah, not the NT)
--          Extras: Jubilees 33:10 (Reuben/Bilhah; father's wife/skirt = death, on the heavenly tables)
--          Tanakh: Leviticus 20:11 (lieth with father's wife = death — the penalty pair)
--   v.19-23 ★ menstruous woman, adultery, seed to Molech, mankind/abomination, beast/confusion
--          NT:     Romans 1:26-27 (against nature), 1 Corinthians 6:9 (shall not inherit), Matthew 19:4-6 (male and female from the beginning),
--          Extras: Jubilees 30:10 (given of his seed to Moloch — defilement, rooted out)
--          Tanakh: Jeremiah 32:35 (sons through fire to Molech in Hinnom), Leviticus 20:13 (lie with mankind = death)
--   v.24-30 ★ the land defiled VOMITETH out her inhabitants / cut off
--          NT:     none warranted (the land-holiness principle is Torah/prophet ground)
--          Extras: Jubilees 30:15 (plague, curse; defile the sanctuary -> whole nation judged)
--          Tanakh: Leviticus 20:22-23 (the land spue you not out), Deuteronomy 9:5 (cast out for wickedness of the nations), Ezra 9:11 (an unclean land filled with abominations)
--
-- Threads (5):
--   leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do  (free; Tanakh + extras Jub) -> NO, has Jub member => extras
--   leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them  (free; all canon NT+Tanakh)
--   leviticus-18-none-shall-approach-to-any-near-of-kin-to-uncover-nakedness  (extras; Tanakh + Jub)
--   leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion  (extras; NT + Tanakh + Jub)
--   leviticus-18-the-land-itself-vomiteth-out-her-inhabitants  (extras; Tanakh + Jub)

CREATE TEMP VIEW _s311_lev18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: after the doings of Egypt and Canaan, shall ye not do (v.3-4)
    ('canon','leviticus',18,3,'canon','deuteronomy',18,9,'free',
      E'*When thou art come into the land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9). Moses restates the very fence Leviticus draws: *after the doings of the land of Egypt... and after the doings of the land of Canaan, whither I bring you, shall ye not do* (Leviticus 18:3) — the covenant people are formed to be unlike the nations they came out of and the nations they enter.'),
    ('canon','leviticus',18,4,'canon','ezekiel',20,18,'free',
      E'*But I said unto their children in the wilderness, Walk ye not in the statutes of your fathers, neither observe their judgments, nor defile yourselves with their idols* (Ezekiel 20:18). Ezekiel sets the two walks side by side, exactly as Leviticus does — *neither shall ye walk in their ordinances. Ye shall do my judgments, and keep mine ordinances, to walk therein* (Leviticus 18:3-4): the nations'' ordinances renounced, Yahuah''s judgments walked in.'),
    ('canon','leviticus',18,4,'canon','ezekiel',20,19,'free',
      E'*I am Yahuah Elohaychem (the LORD your God); walk in my statutes, and keep my judgments, and do them* (Ezekiel 20:19). The prophet answers Leviticus word for word — *Ye shall do my judgments, and keep mine ordinances, to walk therein: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 18:4): the same Name seals the same command across the centuries.'),
    ('canon','leviticus',18,3,'jubilees','jubilees',30,11,'extras',
      E'*And do you, Moses, command the children of Yashar''el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11). The restored witness presses the same wall Leviticus builds — *after the doings of the land of Canaan, whither I bring you, shall ye not do* (Leviticus 18:3): the holy seed is not to be mingled into the abominations of the nations.'),

    -- THREAD 2: keep my statutes, which if a man do, he shall LIVE in them (v.5)
    ('canon','leviticus',18,5,'canon','romans',10,5,'free',
      E'*For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5). Paul quotes this very verse — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5): the Torah was given for LIFE, not death, and the apostle names Moses as its author and means no abolishing of it.'),
    ('canon','leviticus',18,5,'canon','galatians',3,12,'free',
      E'*And the law is not of faith: but, The man that doeth them shall live in them* (Galatians 3:12). Paul cites Leviticus again — *which if a man do, he shall live in them* (Leviticus 18:5) — distinguishing the way of faith from the bare doing for self-justification, never denying that the statutes themselves are statutes given unto life.'),
    ('canon','leviticus',18,5,'canon','luke',10,28,'free',
      E'*And he said unto him, Thou hast answered right: this do, and thou shalt live* (Luke 10:28). Yahusha (Jesus) speaks Leviticus 18:5 straight to the lawyer — *which if a man do, he shall live in them* (Leviticus 18:5): love of Yahuah and neighbour kept is the doing that is life.'),
    ('canon','leviticus',18,5,'canon','ezekiel',20,11,'free',
      E'*And I gave them my statutes, and shewed them my judgments, which if a man do, he shall even live in them* (Ezekiel 20:11). Ezekiel echoes Leviticus to the letter — *which if a man do, he shall live in them* (Leviticus 18:5): the wilderness gift of statutes was a gift of life, and the prophet mourns Israel''s refusal of it.'),
    ('canon','leviticus',18,5,'canon','nehemiah',9,29,'free',
      E'*And testifiedst against them, that thou mightest bring them again unto thy law: yet they dealt proudly, and hearkened not unto thy commandments, but sinned against thy judgments, (which if a man do, he shall live in them;)* (Nehemiah 9:29). The Levites'' confession folds Leviticus 18:5 into Israel''s whole story — *which if a man do, he shall live in them* (Leviticus 18:5): the judgments were unto life, and forsaking them was the wound.'),
    ('canon','leviticus',18,5,'canon','deuteronomy',30,16,'free',
      E'*In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply* (Deuteronomy 30:16). Moses sets life before Israel through the keeping of the same statutes — *which if a man do, he shall live in them* (Leviticus 18:5): the Torah is the path of life and good, not death and evil.'),

    -- THREAD 3: none shall approach to near of kin to uncover nakedness (v.6-8)
    ('canon','leviticus',18,8,'canon','leviticus',20,11,'free',
      E'*And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death; their blood shall be upon them* (Leviticus 20:11). Chapter 20 supplies the penalty for the boundary set here — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8): the prohibition of chapter 18 and its capital weight in chapter 20 are one law of family holiness.'),
    ('canon','leviticus',18,8,'jubilees','jubilees',33,10,'extras',
      E'*For this reason it is written and ordained on the heavenly tables that a man should not lie with his father''s wife, and should not uncover his father''s skirt, for this is unclean: they shall surely die together, the man who lies with his father''s wife and the woman also, for they have wrought uncleanness on the earth* (Jubilees 33:10). The restored witness traces this very statute to Reuben and Bilhah and writes it on the heavenly tables — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8): the near-of-kin fence is ancient, ordained, and unatonable when broken.'),

    -- THREAD 4: thy seed to Molech, lie with mankind = abomination, beast = confusion (v.21-23)
    ('canon','leviticus',18,21,'canon','jeremiah',32,35,'free',
      E'*And they built the high places of Baal, which are in the valley of the son of Hinnom, to cause their sons and their daughters to pass through the fire unto Molech; which I commanded them not, neither came it into my mind, that they should do this abomination, to cause Yahudah (Judah) to sin* (Jeremiah 32:35). Jeremiah names the very crime Leviticus forbade — *And thou shalt not let any of thy seed pass through the fire to Molech* (Leviticus 18:21): child sacrifice is the abomination that never entered Yahuah''s mind to command.'),
    ('canon','leviticus',18,22,'canon','leviticus',20,13,'free',
      E'*If a man also lie with mankind, as he lieth with a woman, both of them have committed an abomination: they shall surely be put to death; their blood shall be upon them* (Leviticus 20:13). Chapter 20 carries the penalty of the word spoken here — *Thou shalt not lie with mankind, as with womankind: it is abomination* (Leviticus 18:22): the same creation-order holiness named twice, that those caught in it might be turned, not hated.'),
    ('canon','leviticus',18,22,'canon','romans',1,27,'free',
      E'*And likewise also the men, leaving the natural use of the woman, burned in their lust one toward another; men with men working that which is unseemly, and receiving in themselves that recompence of their error which was meet* (Romans 1:27). Paul reads the same created order Leviticus guards — *Thou shalt not lie with mankind, as with womankind: it is abomination* (Leviticus 18:22): a leaving of the natural use, named soberly as error to be recovered from.'),
    ('canon','leviticus',18,22,'canon','1-corinthians',6,9,'free',
      E'*Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind* (1 Corinthians 6:9). Paul lists the abominations Leviticus catalogues — *Thou shalt not lie with mankind, as with womankind: it is abomination* (Leviticus 18:22) — yet the next breath, *and such were some of you: but ye are washed* (1 Corinthians 6:11), holds out cleansing, not condemnation only.'),
    ('canon','leviticus',18,23,'canon','matthew',19,4,'free',
      E'*And he answered and said unto them, Have ye not read, that he which made them at the beginning made them male and female* (Matthew 19:4). Yahusha (Jesus) grounds the whole sexual order in creation, the same order Leviticus defends against confusion — *Neither shalt thou lie with any beast to defile thyself therewith: neither shall any woman stand before a beast to lie down thereto: it is confusion* (Leviticus 18:23): what was made male and female is not to be confounded.'),
    ('canon','leviticus',18,21,'jubilees','jubilees',30,10,'extras',
      E'*And to this law there is no limit of days, and no remission, nor any atonement: but the man who has defiled his daughter shall be rooted out in the midst of all Yashar''el (Israel), because he has given of his seed to Moloch, and wrought impiously so as to defile it* (Jubilees 30:10). The restored witness binds the giving of seed to Moloch to defilement and rooting-out — *And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God)* (Leviticus 18:21): to give seed to Molech is to profane the Name and defile the holy nation.'),

    -- THREAD 5: the land itself vomiteth out her inhabitants (v.25,28)
    ('canon','leviticus',18,25,'canon','leviticus',20,22,'free',
      E'*Ye shall therefore keep all my statutes, and all my judgments, and do them: that the land, whither I bring you to dwell therein, spue you not out* (Leviticus 20:22). Chapter 20 repeats the land-warning of chapter 18 — *And the land is defiled... and the land itself vomiteth out her inhabitants* (Leviticus 18:25): the land is holy, and defilement makes it cast out whoever defiles it, Israelite or nation alike.'),
    ('canon','leviticus',18,25,'canon','deuteronomy',9,5,'free',
      E'*Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land: but for the wickedness of these nations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee* (Deuteronomy 9:5). Moses gives the reason the land emptied — *therefore I do visit the iniquity thereof upon it, and the land itself vomiteth out her inhabitants* (Leviticus 18:25): the nations were cast out for their abominations, a warning Israel inherits, not an exemption it owns.'),
    ('canon','leviticus',18,25,'canon','ezra',9,11,'free',
      E'*Which thou hast commanded by thy servants the prophets, saying, The land, unto which ye go to possess it, is an unclean land with the filthiness of the people of the lands, with their abominations, which have filled it from one end to another with their uncleanness* (Ezra 9:11). Ezra confesses the very defilement Leviticus warned of — *for in all these the nations are defiled which I cast out before you: And the land is defiled* (Leviticus 18:24-25): the abominations of the peoples filled and fouled the land.'),
    ('canon','leviticus',18,28,'jubilees','jubilees',30,15,'extras',
      E'*For there will be plague upon plague, and curse upon curse, and every judgment and plague and curse will come (upon him): if he do this thing, or hide his eyes from those who commit uncleanness, or those who defile the sanctuary of Yahuah (God), or those who profane His holy name, (then) will the whole nation together be judged* (Jubilees 30:15). The restored witness names the corporate reckoning Leviticus warns of — *That the land spue not you out also, when ye defile it, as it spued out the nations that were before you* (Leviticus 18:28): defilement unjudged draws the curse on the whole people and the land.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

-- Thread 1: after the doings of Egypt and Canaan, shall ye not do (extras: has Jub member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do',
  E'After the doings of Egypt and Canaan, shall ye not do',
  E'Leviticus 18 opens by setting the covenant people apart from the two worlds that bracket them: *After the doings of the land of Egypt, wherein ye dwelt, shall ye not do: and after the doings of the land of Canaan, whither I bring you, shall ye not do: neither shall ye walk in their ordinances* (Leviticus 18:3). The fence is not arbitrary; it is the shape of a holy people — *Ye shall do my judgments, and keep mine ordinances, to walk therein: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 18:4). Moses presses the same wall: *thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9). Ezekiel sets the two walks side by side — *Walk ye not in the statutes of your fathers... I am Yahuah Elohaychem (the LORD your God); walk in my statutes, and keep my judgments, and do them* (Ezekiel 20:18-19). And the restored witness exhorts the same separation of the holy seed: *not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11). The nations'' ordinances renounced; Yahuah''s judgments walked in.',
  sv.verse_id, ev.verse_id, 'extras', 23125
  FROM _s311_lev18_lookup sv, _s311_lev18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: keep my statutes, which if a man do, he shall live in them (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them',
  E'Keep my statutes — which if a man do, he shall live in them',
  E'At the head of the holiness code stands the verse that names the Torah''s purpose: *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD)* (Leviticus 18:5). The statutes are given unto LIFE, never as a sentence of death. Ezekiel preserves the words exactly — *I gave them my statutes... which if a man do, he shall even live in them* (Ezekiel 20:11) — and the Levites'' confession folds them into Israel''s whole story: *thy judgments, (which if a man do, he shall live in them;)* (Nehemiah 9:29). Moses sets the choice plainly: *to keep his commandments and his statutes and his judgments, that thou mayest live and multiply* (Deuteronomy 30:16). The New Testament reaches back to this very line. Paul names its author: *For Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them* (Romans 10:5), and again, *The man that doeth them shall live in them* (Galatians 3:12) — distinguishing the way of faith from bare self-justification, never denying that the statutes are statutes of life. And Yahusha (Jesus) speaks Leviticus 18:5 straight to the lawyer who summed the Torah in love of Yahuah and neighbour: *Thou hast answered right: this do, and thou shalt live* (Luke 10:28). The Torah is the path of life and good.',
  sv.verse_id, ev.verse_id, 'free', 23128
  FROM _s311_lev18_lookup sv, _s311_lev18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: none shall approach to near of kin to uncover nakedness (extras: Jub member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-18-none-shall-approach-to-any-near-of-kin-to-uncover-nakedness',
  E'None shall approach to any near of kin to uncover nakedness',
  E'The heart of the chapter draws the family fence: *None of you shall approach to any that is near of kin to him, to uncover their nakedness: I am Yahuah (LORD)* (Leviticus 18:6), and among the first named, *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8). Chapter 20 supplies the capital weight of the same boundary: *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death* (Leviticus 20:11) — prohibition and penalty are one law of family holiness. The restored witness traces this very statute back to Reuben and Bilhah and writes it on the heavenly tables: *a man should not lie with his father''s wife, and should not uncover his father''s skirt, for this is unclean: they shall surely die together... for they have wrought uncleanness on the earth* (Jubilees 33:10). The near-of-kin fence is ancient, ordained, and grave.',
  sv.verse_id, ev.verse_id, 'extras', 23131
  FROM _s311_lev18_lookup sv, _s311_lev18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: thy seed to Molech and the abomination, it is confusion (extras: Jub member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion',
  E'Thy seed to Molech, the abomination, and the confusion',
  E'Past the family boundaries the chapter names the gravest defilements: *thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God)* (Leviticus 18:21); *Thou shalt not lie with mankind, as with womankind: it is abomination* (Leviticus 18:22); and *Neither shalt thou lie with any beast... it is confusion* (Leviticus 18:23). Each is restated in Torah and prophet. Jeremiah names the very crime: *to cause their sons and their daughters to pass through the fire unto Molech; which I commanded them not, neither came it into my mind* (Jeremiah 32:35). Chapter 20 carries the penalty: *If a man also lie with mankind, as he lieth with a woman, both of them have committed an abomination* (Leviticus 20:13). The New Testament reads the same created order: Paul writes of *leaving the natural use* (Romans 1:27) and lists *abusers of themselves with mankind* among the unrighteous — yet adds *and such were some of you: but ye are washed* (1 Corinthians 6:9, 6:11), holding out cleansing. Yahusha (Jesus) grounds the whole order in creation: *he which made them at the beginning made them male and female* (Matthew 19:4) — what was made male and female is not to be confounded. The restored witness binds the seed given to Moloch to defilement and rooting-out: *because he has given of his seed to Moloch, and wrought impiously so as to defile it* (Jubilees 30:10). These are standing creation-order statutes, named soberly, that those caught in sin might be turned, not hated.',
  sv.verse_id, ev.verse_id, 'extras', 23134
  FROM _s311_lev18_lookup sv, _s311_lev18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=18 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: the land itself vomiteth out her inhabitants (extras: Jub member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-18-the-land-itself-vomiteth-out-her-inhabitants',
  E'The land itself vomiteth out her inhabitants',
  E'The chapter closes on the land''s own holiness: *Defile not ye yourselves in any of these things: for in all these the nations are defiled which I cast out before you: And the land is defiled... and the land itself vomiteth out her inhabitants* (Leviticus 18:24-25), and the warning turns on Israel too — *That the land spue not you out also, when ye defile it, as it spued out the nations that were before you* (Leviticus 18:28); *whosoever shall commit any of these abominations... shall be cut off from among their people* (Leviticus 18:29). Chapter 20 repeats it: *that the land... spue you not out* (Leviticus 20:22). Moses gives the reason the land emptied: *for the wickedness of these nations Yahuah Elohayka (the LORD thy God) doth drive them out* (Deuteronomy 9:5) — a warning Israel inherits, never an exemption it owns. Ezra confesses the very defilement: *an unclean land with the filthiness of the people of the lands, with their abominations, which have filled it from one end to another* (Ezra 9:11). And the restored witness names the corporate reckoning: *plague upon plague, and curse upon curse... if he do this thing, or hide his eyes from those who commit uncleanness... then will the whole nation together be judged* (Jubilees 30:15). The land is holy; defilement unjudged draws the curse on the whole people and the land.',
  sv.verse_id, ev.verse_id, 'extras', 23137
  FROM _s311_lev18_lookup sv, _s311_lev18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=18 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 18:9 — *thou shalt not learn to do after the abominations of those nations*: the same fence against the nations.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezekiel 20:18 — *Walk ye not in the statutes of your fathers... nor defile yourselves with their idols*: the nations'' walk renounced.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezekiel 20:19 — *walk in my statutes, and keep my judgments, and do them*: Yahuah''s judgments walked in, the same Name sealing both.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jubilees 30:11 (extras) — *not to give their daughters to the nations... for this is abominable before Yahuah (God)*: the holy seed not mingled into the abominations of the nations.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-after-the-doings-of-egypt-and-canaan-shall-ye-not-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 10:5 — *Moses describeth the righteousness which is of the law, That the man which doeth those things shall live by them*: Paul names Moses, no abolishing.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Galatians 3:12 — *The man that doeth them shall live in them*: Leviticus 18:5 cited; the statutes are statutes given unto life.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Luke 10:28 — *this do, and thou shalt live*: Yahusha speaks Leviticus 18:5 to the lawyer; love kept is life.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ezekiel 20:11 — *which if a man do, he shall even live in them*: the wilderness gift of statutes was a gift of life.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Nehemiah 9:29 — *thy judgments, (which if a man do, he shall live in them;)*: the Levites'' confession folds Leviticus 18:5 into Israel''s story.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Deuteronomy 30:16 — *to keep his commandments and his statutes and his judgments, that thou mayest live and multiply*: life set before Israel through the statutes.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-keep-my-statutes-which-if-a-man-do-he-shall-live-in-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 20:11 — *the man that lieth with his father''s wife... both of them shall surely be put to death*: the penalty pair for the boundary set in 18:8.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=8
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-none-shall-approach-to-any-near-of-kin-to-uncover-nakedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jubilees 33:10 (extras) — *a man should not lie with his father''s wife... ordained on the heavenly tables*: the near-of-kin fence traced to Reuben and Bilhah, ancient and grave.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=8
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=33 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-none-shall-approach-to-any-near-of-kin-to-uncover-nakedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 32:35 — *to cause their sons and their daughters to pass through the fire unto Molech; which I commanded them not*: the child-sacrifice abomination named.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=21
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 20:13 — *both of them have committed an abomination: they shall surely be put to death*: the penalty for the word of 18:22.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=22
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Romans 1:27 — *leaving the natural use of the woman*: Paul reads the same created order, named soberly as error to recover from.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=22
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 6:9 — *abusers of themselves with mankind*: the abominations listed, with cleansing held out in 6:11 (*but ye are washed*).'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=22
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Matthew 19:4 — *made them male and female*: Yahusha grounds the order in creation; what was made male and female is not to be confounded (18:23 confusion).'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=23
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Jubilees 30:10 (extras) — *because he has given of his seed to Moloch... shall be rooted out*: seed to Moloch binds to defilement and rooting-out; profaning the Name.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=21
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-thy-seed-to-molech-and-the-abomination-it-is-confusion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 20:22 — *that the land... spue you not out*: chapter 20 repeats the land-warning of 18:25,28.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=25
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-the-land-itself-vomiteth-out-her-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 9:5 — *for the wickedness of these nations Yahuah doth drive them out*: the reason the land emptied; a warning Israel inherits, not an exemption.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=25
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-the-land-itself-vomiteth-out-her-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezra 9:11 — *an unclean land with the filthiness of the people of the lands, with their abominations*: the very defilement Leviticus warned of, confessed.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=25
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-the-land-itself-vomiteth-out-her-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jubilees 30:15 (extras) — *plague upon plague, and curse upon curse... the whole nation together be judged*: defilement unjudged draws the curse on the whole people and land.'
  FROM cross_reference_threads t
  JOIN _s311_lev18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=18 AND sv.verse_number=28
  JOIN _s311_lev18_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-18-the-land-itself-vomiteth-out-her-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_19.sql (Leviticus 19) -----
-- Chapter: Leviticus 19 — THE HOLINESS CHAPTER (the moral heart of Leviticus; love thy neighbour)
-- Tag: lev19 | Session prefix: s311 | Temp view: _s311_lev19_lookup
-- Sort band base 23150 step 3 → 23150,23153,23156,23159,23162,23165,23168,23171
-- All targets are CANON (Tanakh + NT) → every thread tier_required='free'; all member rows tier='free'.
--
-- Leviticus 19 coverage:
--   v.1-2  ★ "Ye shall be holy: for I Yahuah Elohaychem am holy"
--          NT:     1 Peter 1:15-16 (be ye holy... Be ye holy; for I am holy)
--          Extras: none warranted
--          Tanakh: Leviticus 11:44-45; Leviticus 20:7,26 (the holiness call repeated)
--   v.3-4  fear mother/father, keep my sabbaths, turn not to idols
--          NT:     none warranted (lateral Decalogue is the weave)
--          Extras: none warranted
--          Tanakh: Exodus 20:8-12; Deuteronomy 5:16 (the Decalogue echoed)
--   v.5-8  peace offering / eaten by third day / cut off — folded into the holiness summary; no separate thread (procedural)
--          NT/Extras/Tanakh: none warranted
--   v.9-13 ★ corners of the field / gleanings for poor & stranger; not steal/lie/defraud; hired wage not abide all night
--          NT:     James 1:27 (pure religion: visit fatherless & widows); James 2:5 (chosen the poor rich in faith);
--                  James 5:4 (hire of the labourers kept back by fraud crieth); Ephesians 4:28 (let him labour... to give to him that needeth)
--          Extras: none warranted
--          Tanakh: Leviticus 23:22; Deuteronomy 24:14-15,19-21; Ruth 2:2-3
--   v.14-16 curse not deaf / stumblingblock before blind / fear thy Elohim; just judgment, no respect of persons; no talebearer
--          NT:     Romans 14:13 (no stumblingblock); James 2:1,9 (respect of persons = sin, transgressors of the law)
--          Extras: none warranted
--          Tanakh: Deuteronomy 16:19; Deuteronomy 27:18
--   v.17-18 ★★★ hate not thy brother, rebuke, not avenge nor grudge, LOVE THY NEIGHBOUR AS THYSELF
--          NT:     Matthew 22:39 / Mark 12:31 (second great commandment); Romans 13:9 (briefly comprehended);
--                  Galatians 5:14 (all the law fulfilled in one word); James 2:8 (the royal law); Matthew 5:43-44 (extended, not abolished)
--          Extras: none warranted
--          Tanakh: Leviticus 19:34 (love the stranger — same word, own thread below)
--   v.19 / v.26-31 keep distinctions: cattle/seed/garment not mingled; eat not with blood, no enchantment/observing times,
--          round not head/beard, no cuttings/marks for dead, no whoredom, keep sabbaths, no familiar spirits/wizards
--          NT:     none warranted (Torah-distinction statutes; framed against pagan syncretism)
--          Extras: none warranted
--          Tanakh: Deuteronomy 22:9-11 (the mingling triad); Deuteronomy 18:10-11; Leviticus 20:6 (familiar spirits)
--   v.20-25 bondmaid trespass / trespass offering / uncircumcised fruit three years, fourth year holy — folded; firstfruits patience
--          NT:     none warranted | Extras: none warranted | Tanakh: Leviticus 23 (firstfruits) — light, folded into separation note context, no own thread
--   v.32-34 ★ rise before the hoary head; LOVE THE STRANGER as thyself; ye were strangers in Egypt
--          NT:     Ephesians 2:12,19 (no more strangers, fellowcitizens of the commonwealth of Israel); Galatians 3:28 (all one)
--          Extras: none warranted
--          Tanakh: Deuteronomy 10:19; Exodus 22:21
--   v.35-37 ★ just balances, just weights, a just ephah and a just hin
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 25:13-16; Proverbs 11:1; Micah 6:10-11; Amos 8:4-6
--
-- Threads (8):
--   23150 leviticus-19-ye-shall-be-holy-for-i-yahuah-am-holy                         [free] NT(1-peter) + Tanakh(leviticus)
--   23153 leviticus-19-fear-mother-and-father-keep-my-sabbaths-the-ten-words-echoed  [free] Tanakh(exodus,deuteronomy)
--   23156 leviticus-19-leave-the-corners-for-the-poor-and-the-labourers-wage         [free] NT(james,ephesians) + Tanakh(leviticus,deuteronomy,ruth)
--   23159 leviticus-19-no-stumblingblock-no-respect-of-persons-righteous-judgment    [free] NT(romans,james) + Tanakh(deuteronomy)
--   23162 leviticus-19-thou-shalt-love-thy-neighbour-as-thyself-the-royal-law        [free] NT(matthew,mark,romans,galatians,james) + Tanakh(leviticus)
--   23165 leviticus-19-keep-my-statutes-no-mingling-no-pagan-practice-separation     [free] Tanakh(deuteronomy,leviticus)
--   23168 leviticus-19-love-the-stranger-as-one-born-among-you                       [free] NT(ephesians,galatians) + Tanakh(deuteronomy,exodus)
--   23171 leviticus-19-just-balances-just-weights-a-just-ephah-and-a-just-hin        [free] Tanakh(deuteronomy,proverbs,micah,amos)

CREATE TEMP VIEW _s311_lev19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- B. cross_references
-- =========================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- ---- Thread 1: holiness call (19:2) ----
  ('canon','leviticus',19,2,'canon','1-peter',1,15,'free',
   E'*But as he which hath called you is holy, so be ye holy in all manner of conversation* (1 Peter 1:15). Kepha (Peter) does not announce a new standard; he reaches straight back to Leviticus, where the source is the call itself — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). Holiness is grounded in the holiness of Yahuah, the same root in both Testaments.'),
  ('canon','leviticus',19,2,'canon','1-peter',1,16,'free',
   E'*Because it is written, Be ye holy; for I am holy* (1 Peter 1:16). Kepha (Peter) quotes Leviticus by name as binding Scripture — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). The apostolic command IS the Torah command carried forward, not replaced.'),
  ('canon','leviticus',19,2,'canon','leviticus',11,44,'free',
   E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). The dietary chapter rests on the same ground as the moral chapter — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). One holiness binds the whole Torah, table and neighbour alike.'),
  ('canon','leviticus',19,2,'canon','leviticus',20,7,'free',
   E'*Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 20:7). The chapter that follows repeats the command of *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2), framing the whole Holiness Code with the same refrain.'),
  ('canon','leviticus',19,2,'canon','leviticus',20,26,'free',
   E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). Holiness is severance unto Yahuah — the seal on the command *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2); the set-apart people belongs to a set-apart Elohim.'),

  -- ---- Thread 2: the Ten Words echoed (19:3-4) ----
  ('canon','leviticus',19,3,'canon','exodus',20,12,'free',
   E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). The Holiness Code re-voices the fifth word — *Ye shall fear every man his mother, and his father* (Leviticus 19:3) — the Decalogue woven into daily statute.'),
  ('canon','leviticus',19,3,'canon','exodus',20,8,'free',
   E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The fourth word stands beside the fifth in the chapter — *and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:3). The Sabbath is the appointed sign carried from Sinai into the Holiness Code unchanged.'),
  ('canon','leviticus',19,4,'canon','exodus',20,4,'free',
   E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above* (Exodus 20:4). The second word answers *Turn ye not unto idols, nor make to yourselves molten gods* (Leviticus 19:4); the Ten Words are the spine the Holiness chapter is built upon.'),
  ('canon','leviticus',19,3,'canon','deuteronomy',5,16,'free',
   E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:16). Moshe (Moses) repeats the same word in Deuteronomy that Leviticus restates — *Ye shall fear every man his mother, and his father, and keep my sabbaths* (Leviticus 19:3); one covenant, one commandment, spoken three times.'),

  -- ---- Thread 3: leave the corners / the labourer's wage (19:9-13) ----
  ('canon','leviticus',19,10,'canon','leviticus',23,22,'free',
   E'*And when ye reap the harvest of your land, thou shalt not make clean riddance of the corners of thy field when thou reapest, neither shalt thou gather any gleaning of thy harvest: thou shalt leave them unto the poor, and to the stranger* (Leviticus 23:22). The very statute of *thou shalt leave them for the poor and stranger* (Leviticus 19:10) is set among the feasts — harvest welfare woven into the appointed times.'),
  ('canon','leviticus',19,10,'canon','deuteronomy',24,19,'free',
   E'*When thou cuttest down thine harvest in thy field, and hast forgot a sheaf in the field, thou shalt not go again to fetch it: it shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:19). Deuteronomy spells out the gleaning law of *thou shalt leave them for the poor and stranger* (Leviticus 19:10); the forgotten sheaf belongs to the needy by covenant right.'),
  ('canon','leviticus',19,10,'canon','ruth',2,2,'free',
   E'*And Ruth the Moabitess said unto Naomi, Let me now go to the field, and glean ears of corn after him in whose sight I shall find grace. And she said unto her, Go, my daughter* (Ruth 2:2). The Torah statute *thou shalt leave them for the poor and stranger* (Leviticus 19:10) becomes flesh in Ruth — a stranger fed by the gleaning law, grafted into the line of David and Messiah.'),
  ('canon','leviticus',19,10,'canon','ruth',2,3,'free',
   E'*And she went, and came, and gleaned in the field after the reapers: and her hap was to light on a part of the field belonging unto Boaz* (Ruth 2:3). The gleaning of *thou shalt leave them for the poor and stranger* (Leviticus 19:10) is the providence that brings Ruth to Boaz the kinsman-redeemer; the welfare statute carries the seed of promise.'),
  ('canon','leviticus',19,13,'canon','deuteronomy',24,15,'free',
   E'*At his day thou shalt give him his hire, neither shall the sun go down upon it; for he is poor, and setteth his heart upon it: lest he cry against thee unto Yahuah (LORD), and it be sin unto thee* (Deuteronomy 24:15). Deuteronomy expounds *the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13) — the labourer''s cry rises to Yahuah Himself.'),
  ('canon','leviticus',19,13,'canon','james',5,4,'free',
   E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). Ya''aqov (James) prosecutes the exact sin Torah forbids in *the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:13); the withheld wage still cries to Yahuah in the last days.'),
  ('canon','leviticus',19,13,'canon','ephesians',4,28,'free',
   E'*Let him that stole steal no more: but rather let him labour, working with his hands the thing which is good, that he may have to give to him that needeth* (Ephesians 4:28). Sha''ul (Paul) turns *Ye shall not steal* and *Thou shalt not defraud thy neighbour* (Leviticus 19:11,13) into honest labour overflowing to the poor — the same Torah ethic, fulfilled in giving.'),
  ('canon','leviticus',19,10,'canon','james',1,27,'free',
   E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). Ya''aqov (James) names the heart of *thou shalt leave them for the poor and stranger* (Leviticus 19:10) — care for the helpless is the religion Yahuah calls pure.'),
  ('canon','leviticus',19,10,'canon','james',2,5,'free',
   E'*Hath not Elohim (God) chosen the poor of this world rich in faith, and heirs of the kingdom which he hath promised to them that love him?* (James 2:5). The gleaning law''s regard for the poor in *thou shalt leave them for the poor and stranger* (Leviticus 19:10) is Yahuah''s own posture — He elects the poor as heirs of the kingdom.'),

  -- ---- Thread 4: no stumblingblock / no respect of persons (19:14-16) ----
  ('canon','leviticus',19,14,'canon','romans',14,13,'free',
   E'*Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13). Sha''ul (Paul) carries forward *nor put a stumblingblock before the blind, but shalt fear thy Elohim* (Leviticus 19:14); the Torah law against tripping the helpless becomes the law of love among brethren.'),
  ('canon','leviticus',19,14,'canon','deuteronomy',27,18,'free',
   E'*Cursed be he that maketh the blind to wander out of the way. And all the people shall say, Amen* (Deuteronomy 27:18). The covenant curse of Ebal seals the statute *nor put a stumblingblock before the blind* (Leviticus 19:14); to exploit the helpless is to stand under the curse of the covenant.'),
  ('canon','leviticus',19,15,'canon','james',2,9,'free',
   E'*But if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). Ya''aqov (James) judges partiality by the Torah itself — *thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15); respect of persons is transgression of the law, not freedom from it.'),
  ('canon','leviticus',19,15,'canon','deuteronomy',16,19,'free',
   E'*Thou shalt not wrest judgment; thou shalt not respect persons, neither take a gift: for a gift doth blind the eyes of the wise, and pervert the words of the righteous* (Deuteronomy 16:19). Deuteronomy''s charge to judges echoes *Ye shall do no unrighteousness in judgment* (Leviticus 19:15); impartial justice is the one standard for poor and mighty alike.'),

  -- ---- Thread 5: love thy neighbour as thyself — the royal law (19:17-18) ----
  ('canon','leviticus',19,18,'canon','matthew',22,39,'free',
   E'*And the second is like unto it, Thou shalt love thy neighbour as thyself* (Matthew 22:39). Yahusha (Jesus) names this verse — *thou shalt love thy neighbour as thyself: I am Yahuah* (Leviticus 19:18) — as the second of the two commandments on which *hang all the law and the prophets* (Matthew 22:40). The whole Torah is summed here, not abolished.'),
  ('canon','leviticus',19,18,'canon','mark',12,31,'free',
   E'*And the second is like, namely this, Thou shalt love thy neighbour as thyself. There is none other commandment greater than these* (Mark 12:31). Yahusha (Jesus) sets *thou shalt love thy neighbour as thyself* (Leviticus 19:18) beside the Shema as the greatest commandments — Leviticus and Deuteronomy together as the heart of the Law.'),
  ('canon','leviticus',19,18,'canon','romans',13,9,'free',
   E'*and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). Sha''ul (Paul) gathers the commandments into *thou shalt love thy neighbour as thyself* (Leviticus 19:18) and concludes *love is the fulfilling of the law* (Romans 13:10) — love fulfils Torah, it does not cancel it.'),
  ('canon','leviticus',19,18,'canon','galatians',5,14,'free',
   E'*For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). Sha''ul (Paul) makes *thou shalt love thy neighbour as thyself* (Leviticus 19:18) the single word that fulfils the whole law — the Torah summed in love, the Spirit and the commandment inseparable.'),
  ('canon','leviticus',19,18,'canon','james',2,8,'free',
   E'*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8). Ya''aqov (James) calls *thou shalt love thy neighbour as thyself* (Leviticus 19:18) the royal law of Scripture — the king''s own law, binding and good, to be fulfilled and not merely admired.'),
  ('canon','leviticus',19,18,'canon','matthew',5,44,'free',
   E'*But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you* (Matthew 5:44). Yahusha (Jesus) extends *Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself* (Leviticus 19:18) to the enemy — drawing out the fullness of the Torah, not loosing it; the men of old had paired it with a hatred Torah never commanded (Matthew 5:43).'),
  ('canon','leviticus',19,18,'canon','leviticus',19,34,'free',
   E'*the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34). The same chapter widens *thou shalt love thy neighbour as thyself* (Leviticus 19:18) to the sojourner — the love-command was never tribal; it reaches the stranger by the same word.'),

  -- ---- Thread 6: keep my statutes — no mingling, no pagan practice (19:19,26-31) ----
  ('canon','leviticus',19,19,'canon','deuteronomy',22,9,'free',
   E'*Thou shalt not sow thy vineyard with divers seeds: lest the fruit of thy seed which thou hast sown, and the fruit of thy vineyard, be defiled* (Deuteronomy 22:9). Deuteronomy repeats the mingling-statute of *thou shalt not sow thy field with mingled seed* (Leviticus 19:19); the people of distinction must not blur the kinds Yahuah set apart.'),
  ('canon','leviticus',19,19,'canon','deuteronomy',22,11,'free',
   E'*Thou shalt not wear a garment of divers sorts, as of woollen and linen together* (Deuteronomy 22:11). The garment statute of *neither shall a garment mingled of linen and woollen come upon thee* (Leviticus 19:19) is restated in Deuteronomy — the unmingling worn on the body as a sign of a separated people.'),
  ('canon','leviticus',19,31,'canon','deuteronomy',18,11,'free',
   E'*Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11). Deuteronomy lists the very abominations forbidden in *Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them* (Leviticus 19:31); the holy people does not traffic with the dead or the spirits.'),
  ('canon','leviticus',19,26,'canon','deuteronomy',18,10,'free',
   E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). Deuteronomy forbids the same pagan arts as *neither shall ye use enchantment, nor observe times* (Leviticus 19:26); the nations'' practices are cut off from the covenant people.'),
  ('canon','leviticus',19,31,'canon','leviticus',20,6,'free',
   E'*And the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul, and will cut him off from among his people* (Leviticus 20:6). The next chapter attaches the penalty to *Regard not them that have familiar spirits, neither seek after wizards* (Leviticus 19:31); spirit-seeking is spiritual whoredom, judged by being cut off.'),

  -- ---- Thread 7: love the stranger as one born among you (19:32-34) ----
  ('canon','leviticus',19,34,'canon','deuteronomy',10,19,'free',
   E'*Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:19). Deuteronomy gives the same command and the same reason as *thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34); Yahuah''s people, once aliens, must love the alien.'),
  ('canon','leviticus',19,33,'canon','exodus',22,21,'free',
   E'*Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21). The earlier word in Exodus founds *if a stranger sojourn with thee in your land, ye shall not vex him* (Leviticus 19:33); the memory of Egypt is the ground of mercy to the sojourner.'),
  ('canon','leviticus',19,34,'canon','ephesians',2,19,'free',
   E'*Now therefore ye are no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim (God)* (Ephesians 2:19). Sha''ul (Paul) shows the sojourner brought fully in — the very promise of *the stranger that dwelleth with you shall be unto you as one born among you* (Leviticus 19:34); those once far off are made fellowcitizens of the commonwealth of Yashar''el (Israel).'),
  ('canon','leviticus',19,34,'canon','ephesians',2,12,'free',
   E'*That at that time ye were without Messiah (Christ), being aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12). Sha''ul (Paul) names the former estate of the stranger that Torah commanded Yashar''el to love — *the stranger... shall be unto you as one born among you* (Leviticus 19:34); the alien is brought near, not a new people, but the wild branch grown back into Yashar''el.'),
  ('canon','leviticus',19,34,'canon','galatians',3,28,'free',
   E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). The one-law equality of *the stranger... as one born among you, and thou shalt love him as thyself* (Leviticus 19:34) finds its end in Messiah — the grafted-in made one with the natural seed of Abraham (Galatians 3:29).'),

  -- ---- Thread 8: just balances, just weights (19:35-36) ----
  ('canon','leviticus',19,36,'canon','deuteronomy',25,15,'free',
   E'*But thou shalt have a perfect and just weight, a perfect and just measure shalt thou have: that thy days may be lengthened in the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Deuteronomy 25:15). Deuteronomy restates *Just balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:36); honest measure is bound to long life in the land.'),
  ('canon','leviticus',19,36,'canon','deuteronomy',25,13,'free',
   E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13). The negative of *Just balances, just weights* (Leviticus 19:36) — the double weight, one to buy and one to sell, is the merchant''s fraud Torah forbids on both sides of the trade.'),
  ('canon','leviticus',19,36,'canon','proverbs',11,1,'free',
   E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). Wisdom seals the statute *Just balances, just weights, a just ephah, and a just hin, shall ye have* (Leviticus 19:36); the just weight is Yahuah''s delight, the false one His abomination.'),
  ('canon','leviticus',19,36,'canon','micah',6,11,'free',
   E'*Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11). The prophet prosecutes the broken statute of *Just balances, just weights* (Leviticus 19:36); deceitful weights are covenant-breaking, and Yahuah will not count the cheat pure.'),
  ('canon','leviticus',19,36,'canon','amos',8,5,'free',
   E'*Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit?* (Amos 8:5). Amos exposes the sin of those who despise both Sabbath and *a just ephah* (Leviticus 19:36); cheating the poor with a small measure is the very oppression that brings the judgment of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- C. cross_reference_threads
-- =========================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-ye-shall-be-holy-for-i-yahuah-am-holy',
  E'Ye shall be holy: for I Yahuah am holy',
  E'The Holiness chapter opens with the ground of all its commands: *Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). Holiness is not first a list of rules but a derivation — the people are to be holy because Yahuah is holy. The same refrain frames the dietary chapter (*ye shall be holy; for I am holy*, Leviticus 11:44) and the chapter that follows (*be ye holy: for I am Yahuah Elohaychem*, Leviticus 20:7; *ye shall be holy unto me: for I Yahuah am holy, and have severed you from other people*, Leviticus 20:26). When Kepha (Peter) writes to the scattered, he does not invent a standard; he quotes this very verse: *as he which hath called you is holy, so be ye holy in all manner of conversation; because it is written, Be ye holy; for I am holy* (1 Peter 1:15-16). The Torah''s holiness call is the apostolic holiness call — one God, one holiness, carried whole into the assembly of the set-apart.',
  sv.verse_id, ev.verse_id, 'free', 23150
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-fear-mother-and-father-keep-my-sabbaths-the-ten-words-echoed',
  E'Fear mother and father, keep my sabbaths — the Ten Words echoed',
  E'The chapter immediately re-voices the Decalogue in daily statute: *Ye shall fear every man his mother, and his father, and keep my sabbaths: I am Yahuah Elohaychem (the LORD your God). Turn ye not unto idols, nor make to yourselves molten gods* (Leviticus 19:3-4). Each clause is a word from Sinai. *Honour thy father and thy mother* (Exodus 20:12) is the fifth word; *Remember the sabbath day, to keep it holy* (Exodus 20:8) is the fourth; *Thou shalt not make unto thee any graven image* (Exodus 20:4) is the second. Moshe (Moses) speaks the same commands again in Deuteronomy — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:16). The Ten Words are not a separate code from the Holiness chapter; they are its spine, repeated in Exodus, Leviticus, and Deuteronomy as one unchanging covenant.',
  sv.verse_id, ev.verse_id, 'free', 23153
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-leave-the-corners-for-the-poor-and-the-labourers-wage',
  E'Leave the corners for the poor, and the labourer''s wage',
  E'Torah writes welfare into the harvest itself: *thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest... thou shalt leave them for the poor and stranger* (Leviticus 19:9-10). The same statute stands among the feasts (*thou shalt leave them unto the poor, and to the stranger*, Leviticus 23:22) and is spelled out in Deuteronomy — the forgotten sheaf left *for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:19). It becomes living narrative in Ruth, who *gleaned in the field after the reapers* (Ruth 2:2-3) and so is brought to Boaz the redeemer, carrying the seed of David and Messiah. The chapter joins to it the laws of honesty — *Ye shall not steal, neither deal falsely, neither lie* — and the labourer''s due: *the wages of him that is hired shall not abide with thee all night until the morning* (Leviticus 19:11-13). Deuteronomy warns the unpaid hireling will *cry against thee unto Yahuah* (Deuteronomy 24:15), and Ya''aqov (James) prosecutes the same crime in the last days: *the hire of the labourers... kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). Sha''ul (Paul) turns the prohibition into generosity — *let him labour, working with his hands the thing which is good, that he may have to give to him that needeth* (Ephesians 4:28). And Ya''aqov names the whole impulse pure religion: *To visit the fatherless and widows in their affliction* (James 1:27), for Yahuah has *chosen the poor of this world rich in faith* (James 2:5).',
  sv.verse_id, ev.verse_id, 'free', 23156
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-no-stumblingblock-no-respect-of-persons-righteous-judgment',
  E'No stumblingblock, no respect of persons — righteous judgment',
  E'The chapter guards the vulnerable and the courtroom alike: *Thou shalt not curse the deaf, nor put a stumblingblock before the blind, but shalt fear thy Elohim (God)... thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:14-15). To exploit the helpless is to provoke Yahuah, and the Ebal curse seals it: *Cursed be he that maketh the blind to wander out of the way* (Deuteronomy 27:18). Sha''ul (Paul) lifts the same principle into the law of love among brethren — *judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13). Deuteronomy''s charge to judges matches the impartial standard — *Thou shalt not wrest judgment; thou shalt not respect persons* (Deuteronomy 16:19) — and Ya''aqov (James) measures partiality by the Torah itself: *if ye have respect to persons, ye commit sin, and are convinced of the law as transgressors* (James 2:9). Justice that bends to wealth or pity alike is transgression, not freedom from the law.',
  sv.verse_id, ev.verse_id, 'free', 23159
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-thou-shalt-love-thy-neighbour-as-thyself-the-royal-law',
  E'Thou shalt love thy neighbour as thyself — the royal law',
  E'Here is the moral heart of Leviticus, the verse the whole Torah leans toward: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him. Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah* (Leviticus 19:17-18). Yahusha (Jesus) names this very verse the second great commandment — *Thou shalt love thy neighbour as thyself* — and declares *On these two commandments hang all the law and the prophets* (Matthew 22:39-40; Mark 12:31). Sha''ul (Paul) gathers all the commandments into it: it is *briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself... love is the fulfilling of the law* (Romans 13:9-10), and *all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). Ya''aqov (James) crowns it: *If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* (James 2:8). And Yahusha extends it without loosing it — the men of old had wrongly paired it with *hate thine enemy*, but He commands *Love your enemies, bless them that curse you* (Matthew 5:43-44), drawing out the fullness the Torah already held. The same chapter widens the command to the alien: *thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34). Love is the summing of the Law, never its abolition.',
  sv.verse_id, ev.verse_id, 'free', 23162
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-keep-my-statutes-no-mingling-no-pagan-practice-separation',
  E'Keep my statutes — no mingling, no pagan practice',
  E'A people set apart must keep the distinctions Yahuah set: *Ye shall keep my statutes. Thou shalt not let thy cattle gender with a diverse kind: thou shalt not sow thy field with mingled seed: neither shall a garment mingled of linen and woollen come upon thee* (Leviticus 19:19). Deuteronomy restates the triad — *Thou shalt not sow thy vineyard with divers seeds* and *Thou shalt not wear a garment of divers sorts, as of woollen and linen together* (Deuteronomy 22:9,11). The same chapter then severs the people from the practices of the nations: *neither shall ye use enchantment, nor observe times... Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them* (Leviticus 19:26,31). Deuteronomy''s great prohibition matches it word for word — no *observer of times, or an enchanter... a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:10-11) — and the next chapter attaches the penalty: the soul that *turneth after such as have familiar spirits... I will even set my face against that soul, and will cut him off* (Leviticus 20:6). To keep the statutes is to refuse the mingling and the magic of the heathen and remain a distinct, holy people unto Yahuah.',
  sv.verse_id, ev.verse_id, 'free', 23165
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-love-the-stranger-as-one-born-among-you',
  E'Love the stranger as one born among you',
  E'The love-command is not tribal; the chapter turns it outward to the sojourner: *if a stranger sojourn with thee in your land, ye shall not vex him. But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:33-34). The same word and the same reason run through the Torah — *Thou shalt neither vex a stranger, nor oppress him: for ye were strangers in the land of Egypt* (Exodus 22:21), and *Love ye therefore the stranger: for ye were strangers in the land of Egypt* (Deuteronomy 10:19). This one-law inclusion finds its fulfillment in Messiah, where the one once *aliens from the commonwealth of Yashar''el (Israel), and strangers from the covenants of promise* (Ephesians 2:12) is made *no more strangers and foreigners, but fellowcitizens with the saints, and of the household of Elohim* (Ephesians 2:19) — and *neither Yahudi (Jew) nor Greek... ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). The grafted-in are not a new people but the wild branch grown back into Yashar''el, loved as one born among the natural seed.',
  sv.verse_id, ev.verse_id, 'free', 23168
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-19-just-balances-just-weights-a-just-ephah-and-a-just-hin',
  E'Just balances, just weights, a just ephah and a just hin',
  E'The Holiness chapter closes its ethics in the marketplace: *Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure. Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:35-36). Holiness reaches the scale and the measuring-cup. Deuteronomy forbids the merchant''s double weight — *Thou shalt not have in thy bag divers weights, a great and a small* — and binds honest measure to long life: *thou shalt have a perfect and just weight... that thy days may be lengthened in the land* (Deuteronomy 25:13,15). Wisdom seals it: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). And the prophets prosecute its breach — Micah asks *Shall I count them pure with the wicked balances, and with the bag of deceitful weights?* (Micah 6:11), and Amos exposes those who despise the Sabbath and the new moon while *making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5). To cheat the poor with a short measure is covenant-breaking that calls down the judgment of Yahuah.',
  sv.verse_id, ev.verse_id, 'free', 23171
  FROM _s311_lev19_lookup sv, _s311_lev19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=19 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- D. cross_reference_thread_members
-- =========================================================================
-- Thread 1: holiness call
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('canon','1-peter',1,15,1,E'Kepha (Peter): *so be ye holy in all manner of conversation* (1 Peter 1:15) — holiness grounded, like Leviticus 19:2, in the One who called.'),
   ('canon','1-peter',1,16,2,E'Kepha (Peter): *Be ye holy; for I am holy* (1 Peter 1:16) — Leviticus 19:2 quoted as binding Scripture in the assembly.'),
   ('canon','leviticus',11,44,3,E'Leviticus 11:44 — the dietary chapter rests on the same holiness ground, *be ye holy; for I am holy*.'),
   ('canon','leviticus',20,7,4,E'Leviticus 20:7 — *be ye holy: for I am Yahuah Elohaychem*, the refrain that frames the Holiness Code.'),
   ('canon','leviticus',20,26,5,E'Leviticus 20:26 — holiness as severance: *I Yahuah am holy, and have severed you from other people*.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=2
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-ye-shall-be-holy-for-i-yahuah-am-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Ten Words echoed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('canon',19,3,'canon','exodus',20,12,1,E'Exodus 20:12 — the fifth word, *Honour thy father and thy mother*, behind Leviticus 19:3.'),
   ('canon',19,3,'canon','exodus',20,8,2,E'Exodus 20:8 — the fourth word, *Remember the sabbath day*, behind *keep my sabbaths* (Leviticus 19:3).'),
   ('canon',19,4,'canon','exodus',20,4,3,E'Exodus 20:4 — the second word against graven images, behind *Turn ye not unto idols* (Leviticus 19:4).'),
   ('canon',19,3,'canon','deuteronomy',5,16,4,E'Deuteronomy 5:16 — Moshe (Moses) repeats *Honour thy father and thy mother* in the second giving of the Law.')
  ) AS m(src_ed,src_v,xsrc,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=m.xsrc
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-fear-mother-and-father-keep-my-sabbaths-the-ten-words-echoed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: corners for the poor / labourer's wage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   (19,10,'canon','leviticus',23,22,1,E'Leviticus 23:22 — the gleaning law set among the feasts: *leave them unto the poor, and to the stranger*.'),
   (19,10,'canon','deuteronomy',24,19,2,E'Deuteronomy 24:19 — the forgotten sheaf left *for the stranger, for the fatherless, and for the widow*.'),
   (19,10,'canon','ruth',2,2,3,E'Ruth 2:2 — the gleaning law lived out: Ruth goes to *glean ears of corn after* the reapers.'),
   (19,10,'canon','ruth',2,3,4,E'Ruth 2:3 — the providence of the gleaning law brings Ruth to the field of Boaz the redeemer.'),
   (19,13,'canon','deuteronomy',24,15,5,E'Deuteronomy 24:15 — the hireling''s wage given the same day, *lest he cry against thee unto Yahuah*.'),
   (19,13,'canon','james',5,4,6,E'Ya''aqov (James) 5:4 — *the hire of the labourers... kept back by fraud, crieth* unto Yahuah of sabaoth.'),
   (19,13,'canon','ephesians',4,28,7,E'Ephesians 4:28 — Sha''ul (Paul) turns the law into honest labour *to give to him that needeth*.'),
   (19,10,'canon','james',1,27,8,E'Ya''aqov (James) 1:27 — *pure religion*: to visit the fatherless and widows in affliction.'),
   (19,10,'canon','james',2,5,9,E'Ya''aqov (James) 2:5 — Yahuah hath *chosen the poor of this world rich in faith*, heirs of the kingdom.')
  ) AS m(src_v,xsrc,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=m.xsrc
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-leave-the-corners-for-the-poor-and-the-labourers-wage'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: no stumblingblock / no respect of persons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   (19,14,'canon','romans',14,13,1,E'Romans 14:13 — Sha''ul (Paul): *no man put a stumblingblock... in his brother''s way*, carrying Leviticus 19:14 into love.'),
   (19,14,'canon','deuteronomy',27,18,2,E'Deuteronomy 27:18 — the Ebal curse on him *that maketh the blind to wander out of the way*.'),
   (19,15,'canon','james',2,9,3,E'Ya''aqov (James) 2:9 — respect of persons makes one *convinced of the law as transgressors*.'),
   (19,15,'canon','deuteronomy',16,19,4,E'Deuteronomy 16:19 — the judge''s charge: *thou shalt not respect persons, neither take a gift*.')
  ) AS m(src_v,xsrc,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=m.xsrc
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-no-stumblingblock-no-respect-of-persons-righteous-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: love thy neighbour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('canon','matthew',22,39,1,E'Matthew 22:39 — Yahusha (Jesus): *Thou shalt love thy neighbour as thyself*, the second great commandment.'),
   ('canon','mark',12,31,2,E'Mark 12:31 — *There is none other commandment greater than these* — the love-command beside the Shema.'),
   ('canon','romans',13,9,3,E'Romans 13:9 — Sha''ul (Paul): all commandments *briefly comprehended* in love of neighbour.'),
   ('canon','galatians',5,14,4,E'Galatians 5:14 — *all the law is fulfilled in one word*, love of neighbour.'),
   ('canon','james',2,8,5,E'Ya''aqov (James) 2:8 — *the royal law according to the scripture, Thou shalt love thy neighbour as thyself*.'),
   ('canon','matthew',5,44,6,E'Matthew 5:43-44 — Yahusha (Jesus) extends the love-command to *Love your enemies*, drawing out the Torah, not loosing it.'),
   ('canon','leviticus',19,34,7,E'Leviticus 19:34 — the same chapter widens the love-command to the stranger, *thou shalt love him as thyself*.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-thou-shalt-love-thy-neighbour-as-thyself-the-royal-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: keep my statutes — no mingling, no pagan practice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   (19,19,'canon','deuteronomy',22,9,1,E'Deuteronomy 22:9 — *Thou shalt not sow thy vineyard with divers seeds*, the mingling statute restated.'),
   (19,19,'canon','deuteronomy',22,11,2,E'Deuteronomy 22:11 — *Thou shalt not wear a garment of divers sorts, as of woollen and linen together*.'),
   (19,31,'canon','deuteronomy',18,11,3,E'Deuteronomy 18:11 — *a consulter with familiar spirits, or a wizard, or a necromancer* forbidden.'),
   (19,26,'canon','deuteronomy',18,10,4,E'Deuteronomy 18:10 — *divination... an observer of times, or an enchanter* cut off from the people.'),
   (19,31,'canon','leviticus',20,6,5,E'Leviticus 20:6 — the penalty: the soul that turns to familiar spirits is cut off from his people.')
  ) AS m(src_v,xsrc,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=m.xsrc
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-keep-my-statutes-no-mingling-no-pagan-practice-separation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: love the stranger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   (19,34,'canon','deuteronomy',10,19,1,E'Deuteronomy 10:19 — *Love ye therefore the stranger: for ye were strangers in the land of Egypt*.'),
   (19,33,'canon','exodus',22,21,2,E'Exodus 22:21 — *Thou shalt neither vex a stranger, nor oppress him*, the founding word.'),
   (19,34,'canon','ephesians',2,19,3,E'Ephesians 2:19 — the sojourner made *fellowcitizens with the saints*, no more a stranger.'),
   (19,34,'canon','ephesians',2,12,4,E'Ephesians 2:12 — the former estate, *aliens from the commonwealth of Yashar''el*, now brought near.'),
   (19,34,'canon','galatians',3,28,5,E'Galatians 3:28 — *ye are all one in HaMashiach Yahusha*, the grafted-in made one with the seed of Abraham.')
  ) AS m(src_v,xsrc,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=m.xsrc
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-love-the-stranger-as-one-born-among-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: just balances, just weights
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
   ('canon','deuteronomy',25,15,1,E'Deuteronomy 25:15 — *a perfect and just weight... that thy days may be lengthened in the land*.'),
   ('canon','deuteronomy',25,13,2,E'Deuteronomy 25:13 — *Thou shalt not have in thy bag divers weights*, the merchant''s fraud forbidden.'),
   ('canon','proverbs',11,1,3,E'Proverbs 11:1 — *A false balance is abomination to Yahuah: but a just weight is his delight*.'),
   ('canon','micah',6,11,4,E'Micah 6:11 — the prophet prosecutes *the bag of deceitful weights* as covenant-breaking.'),
   ('canon','amos',8,5,5,E'Amos 8:5 — *making the ephah small, and the shekel great, and falsifying the balances by deceit* against the poor.')
  ) AS m(tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s311_lev19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=19 AND sv.verse_number=36
  JOIN _s311_lev19_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='leviticus-19-just-balances-just-weights-a-just-ephah-and-a-just-hin'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_leviticus_20.sql (Leviticus 20) -----
-- Book: Leviticus  Chapter: 20  Tag: lev20  Session prefix: s311
-- Sort band base: 23175, step 3  (threads at 23175, 23178, 23181, 23184, 23187)
-- Temp view: _s311_lev20_lookup
--
-- FRAMING: Leviticus 20 is the penalty-restated companion to ch.18's holiness code,
--   sealed by the great SEPARATION charge (v.22-26). The chapter is the anti-Molech,
--   anti-necromancy, anti-abomination wall around the covenant people, and it closes by
--   naming WHY: Yahuah has SEPARATED and SEVERED Yashar'el from the nations to be His own,
--   and the clean/unclean difference (Lev 11) is the everyday sign of that severance.
--   Lens: victims-not-enemies toward people; the SYSTEMS of child-sacrifice, sorcery,
--   and abomination are dismantled, never a people attacked. The NT does NOT abolish this
--   wall — it carries it forward (a peculiar people, come out and be separate, be ye holy).
--
-- Leviticus 20 coverage:
--   v.1-5 give seed to Molech:
--        NT:     none warranted (the child-sacrifice abomination is condemned in the Tanakh witnesses)
--        Extras: none warranted (clean witness chosen from canon)
--        Tanakh: Leviticus 18:21, Jeremiah 32:35, 2 Kings 23:10, Deuteronomy 18:10  -> thread 1
--   v.6-8 familiar spirits / wizards / sanctify yourselves / be holy:
--        NT:     1 Peter 1:16, 1 Thessalonians 4:3, 4:7  -> thread 2
--        Extras: none warranted
--        Tanakh: Leviticus 19:31, Deuteronomy 18:11  -> thread 2
--   v.9 curseth father or mother put to death:
--        NT:     Matthew 15:4, Mark 7:10  -> thread 3
--        Extras: none warranted
--        Tanakh: Exodus 21:17  -> thread 3
--   v.10-21 adultery/incest/sodomy/bestiality penalties (the ch.18 sins judged):
--        NT:     1 Corinthians 6:9, Hebrews 13:4  -> thread 4
--        Extras: none warranted
--        Tanakh: Leviticus 18:6, 18:22, 18:23  -> thread 4
--   v.22-26 keep my statutes / land spue you not out / SEPARATED / SEVERED / clean-unclean difference:
--        NT:     1 Peter 2:9, Titus 2:14, 2 Corinthians 6:17, Acts 10:28  -> thread 5
--        Extras: none warranted
--        Tanakh: Leviticus 11:44, 11:47, Exodus 19:5, 19:6  -> thread 5
--
-- THREADS (slug -> target libraries):
--   1. leviticus-20-give-not-thy-seed-to-molech            (Tanakh)              free
--   2. leviticus-20-sanctify-yourselves-and-be-ye-holy     (Tanakh + NT)         free
--   3. leviticus-20-he-that-curseth-father-or-mother       (Tanakh + NT)         free
--   4. leviticus-20-the-penalties-of-the-holiness-code     (Tanakh + NT)         free
--   5. leviticus-20-separated-and-severed-unto-me          (Tanakh + NT)         free
--
-- All members canon (Tanakh + NT) -> every thread tier_required = 'free'.

CREATE TEMP VIEW _s311_lev20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: give not thy seed to Molech (v.2-5)
    ('canon','leviticus',20,2,'canon','leviticus',18,21,'free',
      E'*And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* (Leviticus 18:21) — the prohibition ch.20 now arms with the death penalty. Where ch.18 forbids, *that giveth any of his seed unto Molech; he shall surely be put to death* (Leviticus 20:2): child-sacrifice is the abomination Yahuah hates above all, defiling His sanctuary and profaning His holy name.'),
    ('canon','leviticus',20,3,'canon','jeremiah',32,35,'free',
      E'*And they built the high places of Baal, which are in the valley of the son of Hinnom, to cause their sons and their daughters to pass through the fire unto Molech; which I commanded them not, neither came it into my mind, that they should do this abomination, to cause Yahudah (Judah) to sin.* (Jeremiah 32:35) — the prophet names the very sin Leviticus 20 outlawed, done centuries later by both houses. *I will set my face against that man... because he hath given of his seed unto Molech, to defile my sanctuary* (Leviticus 20:3): the warning was scorned and the exile-judgment fell.'),
    ('canon','leviticus',20,2,'canon','2-kings',23,10,'free',
      E'*And he defiled Topheth, which is in the valley of the children of Hinnom, that no man might make his son or his daughter to pass through the fire to Molech.* (2 Kings 23:10) — Josiah''s reform tearing down the Molech altar enforces Leviticus 20 generations on. *Whosoever... giveth any of his seed unto Molech; he shall surely be put to death* (Leviticus 20:2): the king at last makes the abomination impossible in the land.'),
    ('canon','leviticus',20,2,'canon','deuteronomy',18,10,'free',
      E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10) — Moses binds child-sacrifice and sorcery together as the abominations of the nations, exactly as Leviticus 20 does (Molech in v.2, familiar spirits in v.6). *He shall surely be put to death: the people of the land shall stone him with stones* (Leviticus 20:2).'),

    -- THREAD 2: sanctify yourselves and be ye holy (v.6-8)
    ('canon','leviticus',20,6,'canon','leviticus',19,31,'free',
      E'*Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 19:31) — the twin command to ch.20''s *the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul* (Leviticus 20:6). Seeking the dead and the spirits is spiritual adultery against the living Yahuah.'),
    ('canon','leviticus',20,6,'canon','deuteronomy',18,11,'free',
      E'*Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer.* (Deuteronomy 18:11) — Moses lists the same forbidden arts Leviticus 20:6 sets Yahuah''s face against, *the soul that turneth after such as have familiar spirits, and after wizards*. The covenant people inquire of Yahuah alone, never of the dead.'),
    ('canon','leviticus',20,7,'canon','1-peter',1,16,'free',
      E'*Because it is written, Be ye holy; for I am holy.* (1 Peter 1:16) — the apostle quotes this very holiness charge straight out of the Torah and lays it on the scattered covenant people. *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God)* (Leviticus 20:7): the call to holiness is not abolished but carried forward unchanged.'),
    ('canon','leviticus',20,7,'canon','1-thessalonians',4,3,'free',
      E'*For this is the will of Elohim (God), even your sanctification, that ye should abstain from fornication* (1 Thessalonians 4:3) — Paul names sanctification, separation from the nations'' lusts, as the will of Elohim, the same will Leviticus declares: *Sanctify yourselves therefore, and be ye holy* (Leviticus 20:7). The set-apart walk runs unbroken from Torah to apostle.'),
    ('canon','leviticus',20,8,'canon','1-thessalonians',4,7,'free',
      E'*For Elohim (God) hath not called us unto uncleanness, but unto holiness.* (1 Thessalonians 4:7) — the apostolic echo of *I am Yahuah (LORD) which sanctify you* (Leviticus 20:8). It is Yahuah who sanctifies, and the people answer by keeping His statutes: *And ye shall keep my statutes, and do them* (Leviticus 20:8) — the anti-antinomian seam, holiness and obedience inseparable.'),

    -- THREAD 3: he that curseth father or mother (v.9)
    ('canon','leviticus',20,9,'canon','matthew',15,4,'free',
      E'*For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* (Matthew 15:4) — Yahusha (Jesus) quotes Leviticus 20:9 word for word to rebuke the Pharisees for voiding it by tradition. *For every one that curseth his father or his mother shall be surely put to death* (Leviticus 20:9): the Messiah upholds the Torah penalty as the binding command of Elohim.'),
    ('canon','leviticus',20,9,'canon','mark',7,10,'free',
      E'*For Moses said, Honour thy father and thy mother; and, Whoso curseth father or mother, let him die the death* (Mark 7:10) — Yahusha attributes this commandment to Moses and sets it over the Corban loophole, *Making the word of Elohim (God) of none effect through your tradition* (Mark 7:13). *He hath cursed his father or his mother; his blood shall be upon him* (Leviticus 20:9): the word of Elohim, not the tradition of men, stands.'),
    ('canon','leviticus',20,9,'canon','exodus',21,17,'free',
      E'*And he that curseth his father, or his mother, shall surely be put to death.* (Exodus 21:17) — the same judgment given at Sinai, restated here in the holiness code. *For every one that curseth his father or his mother shall be surely put to death* (Leviticus 20:9): honour of father and mother is so weighty that its open cursing is a capital breach of the covenant.'),

    -- THREAD 4: the penalties of the holiness code (v.10-21)
    ('canon','leviticus',20,11,'canon','leviticus',18,6,'free',
      E'*None of you shall approach to any that is near of kin to him, to uncover their nakedness: I am Yahuah (LORD).* (Leviticus 18:6) — ch.18 forbids the incest that ch.20 now sentences. *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death* (Leviticus 20:11): the same near-kin prohibitions, now armed with the penalty that guards the holiness of the household.'),
    ('canon','leviticus',20,13,'canon','leviticus',18,22,'free',
      E'*Thou shalt not lie with mankind, as with womankind: it is abomination.* (Leviticus 18:22) — the prohibition ch.20 restates with its judgment: *If a man also lie with mankind, as he lieth with a woman, both of them have committed an abomination* (Leviticus 20:13). The same act, the same word *abomination* — the holiness code is one continuous law against the defilements of the nations.'),
    ('canon','leviticus',20,15,'canon','leviticus',18,23,'free',
      E'*Neither shalt thou lie with any beast to defile thyself therewith: neither shall any woman stand before a beast to lie down thereto: it is confusion.* (Leviticus 18:23) — ch.18 names bestiality *confusion*; ch.20 names the penalty: *And if a man lie with a beast, he shall surely be put to death: and ye shall slay the beast* (Leviticus 20:15). The order Yahuah set in creation is not to be unmade.'),
    ('canon','leviticus',20,10,'canon','1-corinthians',6,9,'free',
      E'*Know ye not that the unrighteous shall not inherit the kingdom of Elohim (God)? Be not deceived: neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind* (1 Corinthians 6:9) — Paul''s vice-list is the holiness code carried forward: adultery (Leviticus 20:10), abomination with mankind (Leviticus 20:13). *The adulterer and the adulteress shall surely be put to death* (Leviticus 20:10): the same conduct still bars from the kingdom, though Messiah washes the repentant (1 Corinthians 6:11).'),
    ('canon','leviticus',20,10,'canon','hebrews',13,4,'free',
      E'*Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* (Hebrews 13:4) — the apostolic affirmation that the marriage-bed laws still stand under judgment. *And the man that committeth adultery with another man''s wife... the adulterer and the adulteress shall surely be put to death* (Leviticus 20:10): the holiness of marriage that Leviticus guards, the New Testament still guards.'),

    -- THREAD 5: separated and severed unto me (v.22-26)
    ('canon','leviticus',20,24,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9) — the apostle gathers the very language of the separation: *I am Yahuah Elohaychem (the LORD your God), which have separated you from other people* (Leviticus 20:24). The peculiar, set-apart people of Torah is the same peculiar people Peter writes to — Yashar''el restored, never a people replacing her.'),
    ('canon','leviticus',20,26,'canon','titus',2,14,'free',
      E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works.* (Titus 2:14) — the Messiah''s redemption produces exactly what Leviticus declares: *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). A severed, holy, His-own people — zealous to obey, not freed from obedience.'),
    ('canon','leviticus',20,26,'canon','2-corinthians',6,17,'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17) — Paul presses the Leviticus severance on the assembly. *Have severed you from other people, that ye should be mine* (Leviticus 20:26): the call to come out and be separate, and not touch the unclean, is the same wall of holiness, now spoken to the scattered covenant people.'),
    ('canon','leviticus',20,23,'canon','acts',10,28,'free',
      E'*And he said unto them, Ye know how that it is an unlawful thing for a man that is a Yahudi (Jew) to keep company, or come unto one of another nation; but Elohim (God) hath shewed me that I should not call any man common or unclean.* (Acts 10:28) — Peter testifies that the separation Leviticus commanded, *ye shall not walk in the manners of the nation, which I cast out before you* (Leviticus 20:23), was never about counting persons unclean but about not walking in the nations'' abominations; the lost sheep among the nations are to be gathered, not despised.'),
    ('canon','leviticus',20,25,'canon','leviticus',11,44,'free',
      E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth.* (Leviticus 11:44) — the dietary holiness chapter is the ground ch.20 builds on. *Ye shall therefore put difference between clean beasts and unclean* (Leviticus 20:25): the clean/unclean difference is the daily, edible sign of the severed and holy people.'),
    ('canon','leviticus',20,25,'canon','leviticus',11,47,'free',
      E'*To make a difference between the unclean and the clean, and between the beast that may be eaten and the beast that may not be eaten.* (Leviticus 11:47) — the closing charge of the dietary law, reaffirmed here. *Ye shall therefore put difference between clean beasts and unclean, and between unclean fowls and clean* (Leviticus 20:25): the same difference, tied directly to being a separated people unto Yahuah.'),
    ('canon','leviticus',20,24,'canon','exodus',19,5,'free',
      E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5) — the Sinai election Leviticus 20 enforces in the land. *Which have separated you from other people* (Leviticus 20:24): the peculiar treasure of Exodus and the separated people of Leviticus are one and the same covenant people.'),
    ('canon','leviticus',20,26,'canon','exodus',19,6,'free',
      E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* (Exodus 19:6) — the holy nation of Sinai is the holy people Leviticus seals: *And ye shall be holy unto me: for I Yahuah (LORD) am holy* (Leviticus 20:26). This is the very wording 1 Peter 2:9 will gather up — *an holy nation, a peculiar people* — Yashar''el''s unbroken vocation.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s311_lev20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s311_lev20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-20-give-not-thy-seed-to-molech',
       E'Give Not Thy Seed to Molech',
       E'Leviticus 20 opens with the most violent abomination of the nations: *Whosoever... giveth any of his seed unto Molech; he shall surely be put to death: the people of the land shall stone him with stones* (Leviticus 20:2). Yahuah names why it is so grievous: *I will set my face against that man, and will cut him off from among his people; because he hath given of his seed unto Molech, to defile my sanctuary, and to profane my holy name* (Leviticus 20:3). This is the death-law arming the plain command of the holiness code, *And thou shalt not let any of thy seed pass through the fire to Molech* (Leviticus 18:21), and Moses sets child-sacrifice at the head of the nations'' abominations alongside sorcery: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire* (Deuteronomy 18:10). The terror of it is that Yashar''el and Yahudah did it anyway — *they built the high places of Baal, which are in the valley of the son of Hinnom, to cause their sons and their daughters to pass through the fire unto Molech* (Jeremiah 32:35) — and the exile fell. Only Josiah''s reform tore the altar down: *he defiled Topheth, which is in the valley of the children of Hinnom, that no man might make his son or his daughter to pass through the fire to Molech* (2 Kings 23:10). The system of child-sacrifice is dismantled root and branch; the lost are to be reclaimed, never the children burned.',
       sv.verse_id, ev.verse_id, 'free', 23175
  FROM _s311_lev20_lookup sv, _s311_lev20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-20-sanctify-yourselves-and-be-ye-holy',
       E'Sanctify Yourselves and Be Ye Holy',
       E'Against the dead and the spirits Yahuah sets His face: *And the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul* (Leviticus 20:6) — necromancy is spiritual adultery, the same arts Moses forbids, *a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11), and the holiness code repeats, *Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them* (Leviticus 19:31). The remedy is the great charge: *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God). And ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you* (Leviticus 20:7-8) — holiness and statute-keeping inseparable, and it is Yahuah Himself who sanctifies. The apostles carry this forward unchanged: *Be ye holy; for I am holy* (1 Peter 1:16) quoting the Torah straight; *For this is the will of Elohim (God), even your sanctification* (1 Thessalonians 4:3); *For Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:7). The set-apart walk runs in one line from Sinai to the scattered covenant people.',
       sv.verse_id, ev.verse_id, 'free', 23178
  FROM _s311_lev20_lookup sv, _s311_lev20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=20 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-20-he-that-curseth-father-or-mother',
       E'He That Curseth Father or Mother',
       E'*For every one that curseth his father or his mother shall be surely put to death: he hath cursed his father or his mother; his blood shall be upon him* (Leviticus 20:9). The honour of father and mother is so weighty that its open cursing is a capital breach of the covenant — the same judgment first given at Sinai, *And he that curseth his father, or his mother, shall surely be put to death* (Exodus 21:17). Yahusha (Jesus) Himself takes up this exact command to expose the Pharisees who void it by tradition: *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death* (Matthew 15:4); *For Moses said, Honour thy father and thy mother; and, Whoso curseth father or mother, let him die the death* (Mark 7:10). The Messiah sets the word of Elohim over the Corban loophole — *Making the word of Elohim (God) of none effect through your tradition* (Mark 7:13) — upholding the Torah, never abolishing it.',
       sv.verse_id, ev.verse_id, 'free', 23181
  FROM _s311_lev20_lookup sv, _s311_lev20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=20 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-20-the-penalties-of-the-holiness-code',
       E'The Penalties of the Holiness Code',
       E'Leviticus 20:10-21 is the judgment-bearing companion to chapter 18: the same sins, now sentenced. Adultery — *And the man that committeth adultery with another man''s wife... the adulterer and the adulteress shall surely be put to death* (Leviticus 20:10); incest — *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death* (Leviticus 20:11), enforcing *None of you shall approach to any that is near of kin to him, to uncover their nakedness* (Leviticus 18:6); the abomination with mankind — *If a man also lie with mankind, as he lieth with a woman, both of them have committed an abomination* (Leviticus 20:13), the very word of *Thou shalt not lie with mankind, as with womankind: it is abomination* (Leviticus 18:22); and bestiality — *And if a man lie with a beast, he shall surely be put to death* (Leviticus 20:15), the *confusion* of *Neither shalt thou lie with any beast to defile thyself therewith* (Leviticus 18:23). The New Testament carries the same holiness forward: *neither fornicators, nor idolaters, nor adulterers, nor effeminate, nor abusers of themselves with mankind... shall inherit the kingdom of Elohim (God)* (1 Corinthians 6:9), yet the repentant are washed (1 Corinthians 6:11); and *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge* (Hebrews 13:4). The order Yahuah set in creation is guarded, the sinner called to repentance, never hated.',
       sv.verse_id, ev.verse_id, 'free', 23184
  FROM _s311_lev20_lookup sv, _s311_lev20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=20 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'leviticus-20-separated-and-severed-unto-me',
       E'Separated and Severed Unto Me',
       E'The chapter closes with the reason behind every law in it: separation. *Ye shall therefore keep all my statutes, and all my judgments, and do them: that the land, whither I bring you to dwell therein, spue you not out* (Leviticus 20:22); *I am Yahuah Elohaychem (the LORD your God), which have separated you from other people* (Leviticus 20:24); *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The everyday sign of that severance is the table: *Ye shall therefore put difference between clean beasts and unclean* (Leviticus 20:25), the closing charge of the dietary law — *To make a difference between the unclean and the clean* (Leviticus 11:47), *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy* (Leviticus 11:44). This is the Sinai election enforced in the land: *ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), *a kingdom of priests, and an holy nation* (Exodus 19:6). The New Testament does not dissolve this wall — it gathers its very words for the scattered covenant people: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9); *purify unto himself a peculiar people, zealous of good works* (Titus 2:14); *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing* (2 Corinthians 6:17). And Peter''s vision corrects only the abuse, never the law — *ye shall not walk in the manners of the nation, which I cast out before you* (Leviticus 20:23) was never license to count persons unclean: *Elohim (God) hath shewed me that I should not call any man common or unclean* (Acts 10:28) — the lost sheep among the nations are to be gathered, the holy people severed unto Yahuah and made one.',
       sv.verse_id, ev.verse_id, 'free', 23187
  FROM _s311_lev20_lookup sv, _s311_lev20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='leviticus' AND ev.chapter_number=20 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 18:21 — the plain prohibition ch.20 now arms with death: *let any of thy seed pass through the fire to Molech*.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-give-not-thy-seed-to-molech'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 32:35 — both houses did the abomination anyway, in the valley of Hinnom; the warning scorned, the exile fell.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=32 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-give-not-thy-seed-to-molech'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 23:10 — Josiah defiles Topheth to enforce Leviticus 20 generations later, making the abomination impossible.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-give-not-thy-seed-to-molech'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 18:10 — Moses heads the nations'' abominations with child-sacrifice, bound to sorcery exactly as ch.20 binds Molech to familiar spirits.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-give-not-thy-seed-to-molech'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 19:31 — the twin command: regard not familiar spirits nor wizards; necromancy is spiritual adultery.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-sanctify-yourselves-and-be-ye-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 18:11 — the same forbidden arts: familiar spirits, wizard, necromancer; inquire of Yahuah alone, never the dead.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-sanctify-yourselves-and-be-ye-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Peter 1:16 — quotes the Torah holiness charge straight onto the scattered covenant people: *Be ye holy; for I am holy*.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-sanctify-yourselves-and-be-ye-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Thessalonians 4:3 — sanctification is the will of Elohim, abstaining from the nations'' lusts; the set-apart walk continued.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-sanctify-yourselves-and-be-ye-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Thessalonians 4:7 — called unto holiness, not uncleanness; the apostolic echo of *I am Yahuah which sanctify you* (Lev 20:8).'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-sanctify-yourselves-and-be-ye-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 15:4 — Yahusha quotes Leviticus 20:9 verbatim to rebuke the Pharisees who void it by tradition.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=9
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-he-that-curseth-father-or-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Mark 7:10 — Yahusha attributes the command to Moses and sets it over the Corban loophole; the word of Elohim stands.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=9
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-he-that-curseth-father-or-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 21:17 — the same death-judgment given at Sinai; cursing father or mother is a capital covenant breach.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=9
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-he-that-curseth-father-or-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 18:6 — the near-kin prohibition ch.20:11 now sentences; guarding the holiness of the household.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-the-penalties-of-the-holiness-code'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 18:22 — the same act, the same word *abomination*; ch.20:13 adds the penalty.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-the-penalties-of-the-holiness-code'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 18:23 — bestiality named *confusion*; ch.20:15 names the death-penalty. The creation order is not unmade.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=15
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-the-penalties-of-the-holiness-code'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Corinthians 6:9 — Paul''s vice-list carries the holiness code forward; the same conduct bars the kingdom, the repentant washed.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=10
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-the-penalties-of-the-holiness-code'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 13:4 — the marriage-bed still honourable and under judgment; the holiness Leviticus guards, the NT still guards.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=10
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-the-penalties-of-the-holiness-code'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Peter 2:9 — *a peculiar people*, the very language of *separated you from other people* (Lev 20:24); Yashar''el restored, not replaced.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=24
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Titus 2:14 — redemption purifies *a peculiar people, zealous of good works*; the severed people of Lev 20:26, zealous to obey.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=26
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Corinthians 6:17 — *come out... and be ye separate... touch not the unclean thing*; the Leviticus wall pressed on the assembly.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=26
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 10:28 — the separation was never license to call persons unclean; the lost sheep among the nations are gathered, not despised.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=23
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Leviticus 11:44 — the dietary holiness ground: sanctify yourselves and be holy, for I am holy.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=25
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Leviticus 11:47 — the closing dietary charge, the clean/unclean difference; the daily, edible sign of the severed people.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=25
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Exodus 19:5 — the Sinai election: *a peculiar treasure unto me above all people*; the separated people of Lev 20 enforced in the land.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=24
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Exodus 19:6 — *a kingdom of priests, and an holy nation*; the exact wording 1 Peter 2:9 gathers up — Yashar''el''s unbroken vocation.'
  FROM cross_reference_threads t
  JOIN _s311_lev20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=20 AND sv.verse_number=26
  JOIN _s311_lev20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='leviticus-20-separated-and-severed-unto-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session311 — Leviticus cross-references complete.'
