-- =====================================================================
-- Session 222 — Hebrews FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session222_hebrews_cross_references.sql
-- =====================================================================

\echo 'session222 — Hebrews cross-references starting...'
BEGIN;

-- ----- fragment: minion_hebrews_01.sql (S222 Hebrews 1) -----
-- =====================================================================
-- S222 minion — HEBREWS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 1.  Tag: h01 (temp view _s222_h01_lookup).  Sort band: 7900, step 1 (<=7906).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Christology — Checklist 10): Hebrews 1 is the Son-above-the-angels chapter:
-- the Son is *the brightness of his glory, and the express image of his person* (1:3) — the
-- Formed drawn from the Formless, the One who *upholding all things by the word of his power*
-- sat down *on the right hand of the Majesty on high.* He is Elohim enthroned (*Thy throne, O
-- Elohim (God), is for ever and ever*, 1:8) and yet he HAS a Father (*I will be to him a Father,
-- and he shall be to me a Son*, 1:5; *therefore Elohim (God), even thy Elohim (God), hath
-- anointed thee*, 1:9). He is not a co-equal second person, and he is not the Father himself —
-- he is the Son who came in flesh, the God of the OT interactions, exalted above the angels.
-- The chapter proves this from SEVEN Tanakh quotations, and each thread is built on the actual
-- verse quoted, pulled in full. NT-Lord rule applied at 1:10: the pull renders *Thou, Yahuah
-- (Lord)* because the underlying Psalm 102 addresses YHWH the Creator.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   the Son the express image, heir, upholder, sat down on the right hand, above angels
--           Tanakh: none warranted as a quotation (no OT verse quoted here; the catena begins v.5)  Extras: Wisdom of Solomon 7:25-26 (the brightness/image of the everlasting light — radiance vocabulary)  NT: none added (John 1 / Colossians 1 already carry the Word-image weave in their own threads)
--   v.5     Thou art my Son, this day have I begotten thee / I will be to him a Father
--           Tanakh: Psalm 2:7 (begotten Son), 2 Samuel 7:14 (I will be his father)  Extras: none warranted  NT: none added (Acts 13:33 begetting carried in its own Acts thread)
--   v.6     let all the angels of Elohim worship him (the firstbegotten brought into the world)
--           Tanakh: Deuteronomy 32:43 (rejoice O ye nations with his people — the song Hebrews draws the worship-clause from)  Extras: Ascension of Isaiah 9:28-29 (all the angels worshipped Him), 10:14-15 (sit on My right hand, the powers worship Thee)  NT: none warranted
--   v.7     Who maketh his angels spirits, and his ministers a flame of fire
--           Tanakh: Psalm 104:4 (maketh his angels spirits, his ministers a flaming fire)  Extras: none warranted  NT: none warranted
--   v.8-9   Thy throne, O Elohim, is for ever / Elohim, thy Elohim, hath anointed thee
--           Tanakh: Psalm 45:6 (Thy throne O Elohim), Psalm 45:7 (Elohim thy Elohim hath anointed thee)  Extras: none warranted  NT: none warranted
--   v.10-12 Thou, Lord, hast laid the foundation / they perish but thou remainest / changed
--           Tanakh: Psalm 102:25 (of old hast thou laid the foundation), Psalm 102:26 (they perish but thou endurest), Psalm 102:27 (thou art the same)  Extras: none warranted  NT: none warranted
--   v.13    Sit on my right hand, until I make thine enemies thy footstool
--           Tanakh: Psalm 110:1 (Yahuah said unto my Lord, Sit thou at my right hand)  Extras: none warranted  NT: none warranted
--   v.14    ministering spirits sent forth for them who shall be heirs of salvation
--           Tanakh: none warranted (the angel-ministry point is carried in the v.7 thread)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7900 hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person                       (Tanakh? none; Extras: Wisdom of Solomon)
--   7901 hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2                              (Tanakh)
--   7902 hebrews-1-let-all-the-angels-of-elohim-worship-him                                           (Tanakh + Extras: Ascension of Isaiah)
--   7903 hebrews-1-who-maketh-his-angels-spirits-psalm-104                                            (Tanakh)
--   7904 hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45                                  (Tanakh)
--   7905 hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102                          (Tanakh)
--   7906 hebrews-1-sit-on-my-right-hand-until-i-make-thine-enemies-thy-footstool-psalm-110            (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person
  ('canon', 'hebrews', 1, 3, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26). The wisdom-writer reached for the very words Hebrews lays on the Son: *the brightness of his glory, and the express image of his person* (Hebrews 1:3). What the older book sang of the radiance proceeding from the Most High, Hebrews names outright — the Formed drawn from the Formless, the brightness of the everlasting light who is no abstraction but the Son who *by himself purged our sins* and *sat down on the right hand of the Majesty on high.* The image is not a copy at a distance; he is the very shining-out of the One he images.'),
  ('canon', 'hebrews', 1, 3, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom of Solomon 7:25). *A pure influence flowing from the glory of the Almighty* — the older book describes what flows out from the glory without diminishing it, and Hebrews fastens that same picture to a person: *the brightness of his glory, and the express image of his person* (Hebrews 1:3). The Son proceeds from the Father as brightness proceeds from light, the same in substance, distinct in standing — Elohim who has a Father, the Formed who shines out the Formless.'),
  -- thread: hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2
  ('canon', 'hebrews', 1, 5, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). Hebrews asks *unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee?* (Hebrews 1:5) and answers from the psalm: this word was never spoken to an angel but to the anointed king set on the holy hill. The decree names the Son as Son — begotten, not made an angel, not one ministering spirit among many. The One who declares the decree is the Father; the One declared is the Son enthroned above them all.'),
  ('canon', 'hebrews', 1, 5, 'canon', '2-samuel', 7, 14, 'free', E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men:* (2 Samuel 7:14). The second half of Hebrews 1:5 — *And again, I will be to him a Father, and he shall be to me a Son?* — is the word of Yahuah (LORD) to David through Nathan, the promise of the seed whose throne is *established for ever* (2 Samuel 7:13). The Father-and-Son language is not a late invention; it stands in the covenant with David, pointing past Solomon to the everlasting Son whose kingdom does not end. He has a Father who says *I will be his father* — the relation Hebrews 1 holds fast.'),
  -- thread: hebrews-1-let-all-the-angels-of-elohim-worship-him
  ('canon', 'hebrews', 1, 6, 'canon', 'deuteronomy', 32, 43, 'free', E'*Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people.* (Deuteronomy 32:43). Hebrews draws the worship-clause of the Song of Moses — *when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him* (Hebrews 1:6) — from the close of the song where heaven and the nations are summoned to rejoice before the Avenger. The firstbegotten brought into the world is not a creature to be ranked among the host; the host is commanded to bow before him. The One the angels worship is Elohim, not an exalted angel.'),
  ('canon', 'hebrews', 1, 6, 'ascension-isaiah', 'ascension-isaiah', 9, 28, 'extras', E'*And after I had seen Him, all the righteous whom I had seen and also the angels whom I had seen came to Him. And Adam and Abel and Seth and all the righteous first drew near and worshipped Him, and they all praised Him with one voice, and I myself also gave praise with them, and my giving of praise was as theirs.* (Ascension of Isaiah 9:28). The seer is shown the very scene Hebrews announces — *let all the angels of Elohim (God) worship him* (Hebrews 1:6). The Glorious One whose glory surpassed all is worshipped by Adam and the righteous and by the angelic host together; the worship Hebrews commands for the firstbegotten is the worship the seer beheld in the seventh heaven, given to the Son alone.'),
  ('canon', 'hebrews', 1, 6, 'ascension-isaiah', 'ascension-isaiah', 9, 29, 'extras', E'*And then all the angels drew nigh and worshipped and gave praise.* (Ascension of Isaiah 9:29). The angels themselves — not ranked beside the Son but bowed before him — *drew nigh and worshipped.* This is the answer Hebrews presses: *unto which of the angels said he at any time...* (Hebrews 1:5,13). To no angel is worship rendered; the angels are the ones who render it. The firstbegotten receives what belongs to Elohim alone.'),
  ('canon', 'hebrews', 1, 6, 'ascension-isaiah', 'ascension-isaiah', 10, 14, 'extras', E'*And afterwards from the angels of death Thou wilt ascend to Thy place. And Thou wilt not be transformed in each heaven, but in glory wilt Thou ascend and sit on My right hand.* (Ascension of Isaiah 10:14). The Father''s own word to the Son in the vision sets the whole shape of Hebrews 1: the Son descends, conquers death, and *in glory* ascends to *sit on My right hand* — the very session Hebrews names, *sat down on the right hand of the Majesty on high* (Hebrews 1:3) and *Sit on my right hand* (Hebrews 1:13). The Formed who took flesh remains who he was; the Father seats him at the right hand and the powers are made to worship.'),
  ('canon', 'hebrews', 1, 6, 'ascension-isaiah', 'ascension-isaiah', 10, 15, 'extras', E'*And thereupon the princes and powers of that world will worship Thee.* (Ascension of Isaiah 10:15). The enthronement and the worship come as one motion — exactly the order of Hebrews 1, where the firstbegotten brought into the world is worshipped by all the angels (Hebrews 1:6) and seated at the right hand above them (Hebrews 1:13). The princes and powers bow to the Son; the worship belongs to him because he is Elohim enthroned, not a creature elevated.'),
  -- thread: hebrews-1-who-maketh-his-angels-spirits-psalm-104
  ('canon', 'hebrews', 1, 7, 'canon', 'psalms', 104, 4, 'free', E'*Who maketh his angels spirits; his ministers a flaming fire:* (Psalm 104:4). Hebrews quotes the psalm to fix the angels in their place: *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7). The angels are made — spirits and flame, servants sent at the maker''s word. They are creatures of the Creator, set in contrast to the Son to whom he says *Thy throne, O Elohim (God), is for ever and ever* (Hebrews 1:8). The made cannot be the maker; the ministering spirits serve the One they worship.'),
  -- thread: hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45
  ('canon', 'hebrews', 1, 8, 'canon', 'psalms', 45, 6, 'free', E'*Thy throne, O Elohim (God), is for ever and ever: the sceptre of thy kingdom is a right sceptre.* (Psalm 45:6). This is the verse Hebrews lays directly on the Son: *But unto the Son he saith, Thy throne, O Elohim (God), is for ever and ever: a sceptre of righteousness is the sceptre of thy kingdom* (Hebrews 1:8). The Father addresses the Son as Elohim, enthroned for ever — the plainest word in the catena that the Son is God. Yet the next verse keeps the relation intact: he is Elohim who has a God and a Father. The Formed enthroned, addressed as Elohim, is not the Father and is no second co-equal person — he is the Son the Father calls Elohim.'),
  ('canon', 'hebrews', 1, 9, 'canon', 'psalms', 45, 7, 'free', E'*Thou lovest righteousness, and hatest wickedness: therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows.* (Psalm 45:7). Hebrews carries the next line of the psalm: *Thou hast loved righteousness, and hated iniquity; therefore Elohim (God), even thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* (Hebrews 1:9). The same Son addressed as Elohim in the verse before is here said to have an Elohim — *Elohim, thy Elohim, hath anointed thee.* Both stand together without contradiction: the Son is Elohim, and the Son has a Father who anoints him. This is the framework''s whole Christology held in two adjoining lines.'),
  -- thread: hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102
  ('canon', 'hebrews', 1, 10, 'canon', 'psalms', 102, 25, 'free', E'*Of old hast thou laid the foundation of the earth: and the heavens are the work of thy hands.* (Psalm 102:25). Hebrews addresses this to the Son: *And, Thou, Yahuah (Lord), in the beginning hast laid the foundation of the earth; and the heavens are the works of thine hands* (Hebrews 1:10). The psalm speaks to Yahuah (LORD) the Creator; Hebrews names the Son as that Creator — *by whom also he made the worlds* (Hebrews 1:2). The Formed is the One who laid the foundation of the earth, the hands that made the heavens. The maker of all is the Son the Father set above the angels.'),
  ('canon', 'hebrews', 1, 11, 'canon', 'psalms', 102, 26, 'free', E'*They shall perish, but thou shalt endure: yea, all of them shall wax old like a garment; as a vesture shalt thou change them, and they shall be changed:* (Psalm 102:26). *They shall perish; but thou remainest; and they all shall wax old as doth a garment* (Hebrews 1:11). The heavens and the earth the Son made will perish and wear out like a garment, but the maker endures. The creation is mutable; its maker is not. The Son who laid the foundation outlasts the foundation — the unchanging Creator over the changing creation.'),
  ('canon', 'hebrews', 1, 12, 'canon', 'psalms', 102, 27, 'free', E'*But thou art the same, and thy years shall have no end.* (Psalm 102:27). *And as a vesture shalt thou fold them up, and they shall be changed: but thou art the same, and thy years shall not fail* (Hebrews 1:12). The psalm''s closing word — *thou art the same, and thy years shall have no end* — is laid on the Son. He folds up the heavens like a worn garment and remains unchanged. The everlasting sameness of Yahuah (LORD) the Creator is the Son''s own; *Yahusha (Jesus) the same yesterday, and to day, and for ever* is already sounded here.'),
  -- thread: hebrews-1-sit-on-my-right-hand-until-i-make-thine-enemies-thy-footstool-psalm-110
  ('canon', 'hebrews', 1, 13, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). Hebrews closes the catena with the psalm: *But to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13). To no angel was this said; it was Yahuah (LORD) speaking to David''s Lord. The Father seats the Son at his right hand — two distinct, Yahuah and the Lord he addresses — and yet the One seated is the Creator addressed as Elohim. The Son enthroned at the right hand, who has a Father, reigns until every enemy is made his footstool.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person',
       E'The brightness of his glory, the express image of his person',
       E'Hebrews opens by naming who the Son is: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3). He is the heir of all things *by whom also he made the worlds* (Hebrews 1:2) — the Formed drawn from the Formless, the One who shines out the Father he images. The older wisdom-writer had already reached for this very language, singing of the radiance that proceeds from the Most High: *she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25), *for she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26). What that book sang of the radiance flowing from the glory without diminishing it, Hebrews fastens to a person — the Son who is the very shining-out of the One he images, the same in substance, distinct in standing. He is not a copy at a distance and not the Father himself; he is Elohim who has a Father, the brightness of the everlasting light come in flesh, who *by himself purged our sins* and sat down at the right hand on high.',
       sv.verse_id, ev.verse_id, 'extras', 7900
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2',
       E'Thou art my Son, this day have I begotten thee — Psalm 2',
       E'The catena that proves the Son above the angels begins with a question: *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). Both halves are quotations. The first is the royal decree of the second psalm: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — a word spoken not to an angel but to the anointed king set on the holy hill of Zion, the Son begotten, not one ministering spirit among many. The second is the covenant with David through Nathan: *I will be his father, and he shall be my son* (2 Samuel 7:14), the promise of the seed whose throne is *established for ever* (2 Samuel 7:13) — pointing past Solomon to the everlasting Son whose kingdom has no end. The Father-and-Son relation is no late invention; it stands written in the psalm and in the covenant. The One who declares the decree is the Father; the One declared, begotten, and given the everlasting throne is the Son. He is Elohim who has a Father who says of him, *I will be his father.*',
       sv.verse_id, ev.verse_id, 'free', 7901
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-let-all-the-angels-of-elohim-worship-him',
       E'Let all the angels of Elohim worship him',
       E'*And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him* (Hebrews 1:6). The worship-clause is drawn from the close of the Song of Moses, where heaven and the nations are summoned before the Avenger: *Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people* (Deuteronomy 32:43). The firstbegotten brought into the world is no creature to be ranked among the host — the host is commanded to bow before him. And the seer of the ascension was shown that very scene in the seventh heaven: a Glorious One whose glory surpassed all, before whom *Adam and Abel and Seth and all the righteous first drew near and worshipped Him, and they all praised Him with one voice* (Ascension of Isaiah 9:28), and then *all the angels drew nigh and worshipped and gave praise* (Ascension of Isaiah 9:29). The Father''s own word to the Son in that vision sets the shape of the whole chapter: *in glory wilt Thou ascend and sit on My right hand* (Ascension of Isaiah 10:14), *and thereupon the princes and powers of that world will worship Thee* (Ascension of Isaiah 10:15). To no angel is worship ever rendered; the angels are the ones who render it. The firstbegotten receives what belongs to Elohim alone — for he is Elohim, the Son, not an exalted angel.',
       sv.verse_id, ev.verse_id, 'extras', 7902
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-who-maketh-his-angels-spirits-psalm-104',
       E'Who maketh his angels spirits — Psalm 104',
       E'Between the worship of the angels and the throne of the Son, Hebrews fixes the angels in their place with a line from the psalm of creation: *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7), quoting *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4). The angels are made — spirits and flame, servants sent at the maker''s word. They are creatures of the Creator, glorious but mutable, set in deliberate contrast to the Son of the next verse to whom the Father says *Thy throne, O Elohim (God), is for ever and ever* (Hebrews 1:8). The made cannot be the maker. The ministering spirits — the same that at the chapter''s end are *sent forth to minister for them who shall be heirs of salvation* (Hebrews 1:14) — serve the very One they worship. The contrast is the argument: angels are servants; the Son is Elohim enthroned.',
       sv.verse_id, ev.verse_id, 'free', 7903
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45',
       E'Thy throne, O Elohim, is for ever and ever — Psalm 45',
       E'Here is the plainest word in the catena that the Son is God. *But unto the Son he saith, Thy throne, O Elohim (God), is for ever and ever: a sceptre of righteousness is the sceptre of thy kingdom* (Hebrews 1:8), quoting the wedding-psalm of the king: *Thy throne, O Elohim (God), is for ever and ever: the sceptre of thy kingdom is a right sceptre* (Psalm 45:6). The Father addresses the Son as Elohim, enthroned for ever. And the very next line keeps the relation intact rather than collapsing it: *Thou hast loved righteousness, and hated iniquity; therefore Elohim (God), even thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* (Hebrews 1:9), from *therefore Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* (Psalm 45:7). The same Son addressed as Elohim in the one line is said in the next to have an Elohim — *Elohim, thy Elohim, hath anointed thee.* Both stand together without contradiction, and the framework''s whole Christology is held in these two adjoining lines: the Son is Elohim, and the Son has a Father who anoints him. He is the Formed enthroned, addressed as Elohim — not the Father himself, and no second co-equal person, but the Son the Father calls Elohim and over whom the Father remains his Elohim.',
       sv.verse_id, ev.verse_id, 'free', 7904
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102',
       E'Thou, Lord, hast laid the foundation of the earth — Psalm 102',
       E'The catena now takes a psalm addressed to Yahuah (LORD) the Creator and lays it on the Son: *And, Thou, Yahuah (Lord), in the beginning hast laid the foundation of the earth; and the heavens are the works of thine hands* (Hebrews 1:10), from *Of old hast thou laid the foundation of the earth: and the heavens are the work of thy hands* (Psalm 102:25). The psalmist cried to Yahuah the everlasting Creator; Hebrews names the Son as that Creator — for he is the One *by whom also he made the worlds* (Hebrews 1:2). The Formed is the maker who laid the foundation of the earth. And the maker outlasts the made: *They shall perish; but thou remainest; and they all shall wax old as doth a garment* (Hebrews 1:11 / Psalm 102:26); *And as a vesture shalt thou fold them up, and they shall be changed: but thou art the same, and thy years shall not fail* (Hebrews 1:12 / Psalm 102:27, *thou art the same, and thy years shall have no end*). The heavens and earth the Son made will wear out like a worn garment and be folded up; their maker is unchanged. The everlasting sameness of Yahuah the Creator is the Son''s own — *Yahusha (Jesus) the same yesterday, and to day, and for ever* is already sounding here.',
       sv.verse_id, ev.verse_id, 'free', 7905
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-1-sit-on-my-right-hand-until-i-make-thine-enemies-thy-footstool-psalm-110',
       E'Sit on my right hand, until I make thine enemies thy footstool — Psalm 110',
       E'The catena closes where it began, with a question only the Son can answer: *But to which of the angels said he at any time, Sit on my right hand, until I make thine enemies thy footstool?* (Hebrews 1:13), quoting *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). To no angel was this ever said. It was Yahuah (LORD) speaking to David''s Lord — two distinct, the One who speaks and the Lord he addresses — and yet the One seated at the right hand is the Creator addressed as Elohim earlier in the chapter (Hebrews 1:8,10). The Father seats the Son at his right hand, the very session named at the chapter''s opening: *when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3). The Son enthroned at the right hand, who has a Father, reigns until every enemy is made his footstool — while the angels remain what the chapter has shown them to be: *ministering spirits, sent forth to minister for them who shall be heirs of salvation* (Hebrews 1:14).',
       sv.verse_id, ev.verse_id, 'free', 7906
  FROM _s222_h01_lookup sv, _s222_h01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:26 — *the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* the radiance vocabulary Hebrews fastens to the Son, *the brightness of his glory, and the express image of his person* (Hebrews 1:3).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 7:25 — *a pure influence flowing from the glory of the Almighty* what flows out from the glory without diminishing it, named in a person at Hebrews 1:3.'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-the-brightness-of-his-glory-the-express-image-of-his-person'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* the decree spoken to no angel but to the begotten Son (Hebrews 1:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 7:14 — *I will be his father, and he shall be my son* the Davidic covenant pointing past Solomon to the everlasting Son who has a Father (Hebrews 1:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thou-art-my-son-this-day-have-i-begotten-thee-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-let-all-the-angels-of-elohim-worship-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:43 — *Rejoice, O ye nations, with his people* the close of the Song of Moses, from which Hebrews draws the command to worship the firstbegotten (Hebrews 1:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-let-all-the-angels-of-elohim-worship-him'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ascension of Isaiah 9:28 — *all the righteous first drew near and worshipped Him* the seer beholds the worship of the Glorious One Hebrews commands (Hebrews 1:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-let-all-the-angels-of-elohim-worship-him'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ascension of Isaiah 9:29 — *all the angels drew nigh and worshipped and gave praise* the angels render worship, never receive it (Hebrews 1:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-let-all-the-angels-of-elohim-worship-him'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=9 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ascension of Isaiah 10:14 — *in glory wilt Thou ascend and sit on My right hand* the Father''s word setting the descent-ascent-session shape of the whole chapter (Hebrews 1:3).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-let-all-the-angels-of-elohim-worship-him'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ascension of Isaiah 10:15 — *the princes and powers of that world will worship Thee* enthronement and worship as one motion, the order of Hebrews 1 (Hebrews 1:6,13).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-let-all-the-angels-of-elohim-worship-him'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-who-maketh-his-angels-spirits-psalm-104
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire* the angels are made creatures, set in contrast to the Son addressed as Elohim (Hebrews 1:7-8).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-who-maketh-his-angels-spirits-psalm-104'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 45:6 — *Thy throne, O Elohim (God), is for ever and ever* the Father addresses the Son as Elohim enthroned (Hebrews 1:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 45:7 — *Elohim (God), thy Elohim (God), hath anointed thee with the oil of gladness above thy fellows* the Son who is Elohim also has an Elohim — both held without contradiction (Hebrews 1:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thy-throne-o-elohim-is-for-ever-and-ever-psalm-45'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=45 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 102:25 — *Of old hast thou laid the foundation of the earth* a psalm to Yahuah the Creator laid on the Son, by whom he made the worlds (Hebrews 1:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 102:26 — *They shall perish, but thou shalt endure* the creation wears out like a garment; its maker the Son endures (Hebrews 1:11).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 102:27 — *thou art the same, and thy years shall have no end* the everlasting sameness of the Creator is the Son''s own (Hebrews 1:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-thou-lord-hast-laid-the-foundation-of-the-earth-psalm-102'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-1-sit-on-my-right-hand-until-i-make-thine-enemies-thy-footstool-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* spoken to no angel but to David''s Lord, the Son seated by the Father who has a Father (Hebrews 1:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h01_lookup sv, _s222_h01_lookup tv
 WHERE t.slug='hebrews-1-sit-on-my-right-hand-until-i-make-thine-enemies-thy-footstool-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_02.sql (S222 Hebrews 2) -----
-- =====================================================================
-- S222 minion — HEBREWS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 2.  Tag: h02 (temp view _s222_h02_lookup).  Sort band: 7907..7913, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 2 is the incarnation chapter — the Formed truly took flesh. Yahusha
-- (Jesus) *was made a little lower than the angels for the suffering of death* (2:9), *took part*
-- of *flesh and blood* (2:14), *took on him the seed of Abraham* (2:16), and so became *a merciful
-- and faithful high priest* (2:17). The Christology watchpoint: the Son who tasted death and was
-- *made perfect through sufferings* (2:10) has a Father — *he is not ashamed to call them brethren*
-- and says *I will put my trust in him* (2:13) — he is the Formed drawn from the Formless, who came
-- in flesh, not a co-equal second person, and not the Father himself. The chapter's three Tanakh
-- quotations carry the weave: Psalm 8 (the son of Adam crowned with glory), Psalm 22 (declaring
-- the name unto the brethren), Isaiah 8 (behold I and the children). Son-of-Adam note: 2:6 quotes
-- Psalm 8 *son of Adam* — a plain son-of-Adam restoration, NOT the Daniel 7 kaph carve-out.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   so great salvation, spoken by Yahuah, confirmed with signs
--           Tanakh: none warranted (the warning is internal to the catena's argument)  Extras: none warranted  NT: none warranted
--   v.5-9   made a little lower than the angels / crowned with glory / all things under his feet
--           Tanakh: Psalm 8:4 (what is man / son of Adam), 8:5 (lower than the angels, crowned), 8:6 (all things under his feet)  Extras: none warranted  NT: none warranted (Phil 2 carried at the incarnation thread, v.14-18)
--   v.10-11 captain of salvation perfect through sufferings / he that sanctifieth and they sanctified all of one
--           Tanakh: none added (carried into the Psalm 22 thread at v.12)  Extras: none warranted  NT: none warranted
--   v.12    I will declare thy name unto my brethren / in the midst of the church sing praise
--           Tanakh: Psalm 22:22 (declare thy name / midst of the congregation), 22:23 (all ye seed of Jacob praise him)  Extras: none warranted  NT: none warranted
--   v.13    I will put my trust in him / Behold I and the children which Elohim hath given me
--           Tanakh: Isaiah 8:17 (I will wait upon Yahuah), 8:18 (behold I and the children given me)  Extras: none warranted  NT: none warranted
--   v.14-18 partakers of flesh and blood / took on him the seed of Abraham / merciful faithful high priest
--           Tanakh: Genesis 22:17 (multiply thy seed — the seed of Abraham he took on him)  Extras: none warranted  NT: Philippians 2:7 (took the form of a servant, made in the likeness of men), 2:8 (obedient unto death)
--
--   Extras across the whole chapter: NONE WARRANTED. The Melchizedek priest-king tradition
--   (Genesis 14 / Jubilees / 2 Enoch) belongs to Hebrews 5 and 7; the faith-cloud extras
--   (1 Enoch, Jubilees, Sirach, 2 Maccabees) belong to Hebrews 11. Chapter 2 carries no
--   load-bearing unique extra-canonical witness; the weave is Tanakh + NT. Curated, not a dump.
--
-- THREADS (slug -> target libraries):
--   7907 hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8          (Tanakh)
--   7908 hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22               (Tanakh)
--   7909 hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8   (Tanakh)
--   7910 hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest    (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8
  ('canon', 'hebrews', 2, 6, 'canon', 'psalms', 8, 4, 'free', E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). The writer says *one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6) — quoting the psalm word for word. The psalm marvels that the Most High should be mindful of the *son of Adam,* the seed drawn from the first formed man; Hebrews takes up that very wonder and bends it toward the One who fulfils it.'),
  ('canon', 'hebrews', 2, 7, 'canon', 'psalms', 8, 5, 'free', E'*For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* (Psalm 8:5). Hebrews quotes it directly: *Thou madest him a little lower than the angels; thou crownedst him with glory and honour* (Hebrews 2:7). The lowering and the crowning are read of the Son who *was made a little lower than the angels for the suffering of death, crowned with glory and honour* (Hebrews 2:9) — the path of the son of Adam from humiliation to glory walked out in the flesh of Yahusha (Jesus).'),
  ('canon', 'hebrews', 2, 8, 'canon', 'psalms', 8, 6, 'free', E'*Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* (Psalm 8:6). *Thou hast put all things in subjection under his feet. For in that he put all in subjection under him, he left nothing that is not put under him. But now we see not yet all things put under him* (Hebrews 2:8). The dominion granted to the son of Adam at creation is restored and exceeded in the crowned Son — all things put under his feet, though the consummation is *not yet* seen. The first Adam''s forfeited dominion is taken up by the One who tasted death for every man.'),
  -- thread: hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22
  ('canon', 'hebrews', 2, 12, 'canon', 'psalms', 22, 22, 'free', E'*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee.* (Psalm 22:22). Hebrews puts these words in the mouth of the Son: *Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12). The psalm of the forsaken one — *my Elohim (God), my Elohim (God), why hast thou forsaken me?* (Psalm 22:1) — turns at its end to praise; the One who suffered and is *not ashamed to call them brethren* (Hebrews 2:11) names the Father''s name among his own and leads their praise.'),
  ('canon', 'hebrews', 2, 12, 'canon', 'psalms', 22, 23, 'free', E'*Ye that fear Yahuah (LORD), praise him; all ye the seed of Jacob, glorify him; and fear him, all ye the seed of Yashar''el (Israel).* (Psalm 22:23). The brethren in whose midst the Son sings praise — *in the midst of the church will I sing praise unto thee* (Hebrews 2:12) — are named in the psalm''s next breath: *all ye the seed of Jacob,* *all ye the seed of Yashar''el (Israel).* The congregation he gathers to declare the Father''s name is the seed itself, called to glorify the One who delivered the afflicted.'),
  -- thread: hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8
  ('canon', 'hebrews', 2, 13, 'canon', 'isaiah', 8, 17, 'free', E'*And I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him.* (Isaiah 8:17). Hebrews quotes the prophet''s trust as the Son''s own: *And again, I will put my trust in him* (Hebrews 2:13). The One *made perfect through sufferings* (Hebrews 2:10) speaks the language of dependence — *I will wait upon Yahuah (LORD)* — the Formed who took flesh putting his trust in the Father whose face was hidden, looking for him through the suffering.'),
  ('canon', 'hebrews', 2, 13, 'canon', 'isaiah', 8, 18, 'free', E'*Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel) from Yahuah Tseva''ot (LORD of hosts), which dwelleth in mount Zion.* (Isaiah 8:18). The second clause Hebrews quotes — *And again, Behold I and the children which Elohim (God) hath given me* (Hebrews 2:13) — is the prophet''s word taken up by the Son. The children are *given* him by the Father; he stands with them as their elder brother, *for which cause he is not ashamed to call them brethren* (Hebrews 2:11), the gathered seed who are for signs and wonders in Yashar''el (Israel).'),
  -- thread: hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest
  ('canon', 'hebrews', 2, 16, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). Hebrews says of the Son, *For verily he took not on him the nature of angels; but he took on him the seed of Abraham* (Hebrews 2:16). The seed Yahuah (LORD) swore to multiply on the mount of the binding is the seed the Son joined himself to in the flesh — taking on him not angels but *the seed of Abraham,* entering the very line of promise to redeem it from within.'),
  ('canon', 'hebrews', 2, 14, 'canon', 'philippians', 2, 7, 'free', E'*But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same* (Hebrews 2:14). The two say one thing: the One *being in the form of Elohim (God)* (Philippians 2:6) *took part* of flesh and blood, *made in the likeness of men.* The Formed drawn from the Formless truly entered the flesh of the children he came to deliver — real incarnation, not appearance.'),
  ('canon', 'hebrews', 2, 17, 'canon', 'philippians', 2, 8, 'free', E'*And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* (Philippians 2:8). *Wherefore in all things it behoved him to be made like unto his brethren, that he might be a merciful and faithful high priest in things pertaining to Elohim (God), to make reconciliation for the sins of the people* (Hebrews 2:17). Made *like unto his brethren* in all things, *obedient unto death,* the Son became the high priest who makes reconciliation — having *suffered being tempted, he is able to succour them that are tempted* (Hebrews 2:18). The humbling unto death is the qualifying of the merciful priest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8',
       E'What is man, the son of Adam, crowned with glory — Psalm 8',
       E'The writer reaches for a psalm of wonder and reads it of the Son. *But one in a certain place testified, saying, What is man, that thou art mindful of him? or the son of Adam, that thou visitest him?* (Hebrews 2:6) is Psalm 8 word for word: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). The psalm marvels that the Most High should be mindful of the *son of Adam* — the seed drawn from the first formed man — and trace his appointed glory: *thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalm 8:5), *thou hast put all things under his feet* (Psalm 8:6). Hebrews takes each line up: *Thou madest him a little lower than the angels; thou crownedst him with glory and honour* (Hebrews 2:7); *Thou hast put all things in subjection under his feet … he left nothing that is not put under him* (Hebrews 2:8). The dominion Adam forfeited is restored and exceeded — yet *now we see not yet all things put under him* (Hebrews 2:8). The resolution is the Person: *But we see Yahusha (Jesus), who was made a little lower than the angels for the suffering of death, crowned with glory and honour; that he by the grace of Elohim (God) should taste death for every man* (Hebrews 2:9). The path of the son of Adam — lowered, then crowned — is walked out in the flesh of the One who tasted death, the Formed who took up the line of Adam to bring many sons unto glory.',
       sv.verse_id, ev.verse_id, 'free', 7907
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22',
       E'I will declare thy name unto my brethren — Psalm 22',
       E'The Son is *not ashamed to call them brethren* (Hebrews 2:11), and the writer proves it from the psalm of the forsaken one. *Saying, I will declare thy name unto my brethren, in the midst of the church will I sing praise unto thee* (Hebrews 2:12) is Psalm 22:22 on his lips: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). That psalm opens in the depths — *my Elohim (God), my Elohim (God), why hast thou forsaken me?* (Psalm 22:1) — and turns at its hinge to praise: the One who suffered, who *sanctifieth* those who are *sanctified,* *all of one* (Hebrews 2:11), names the Father''s name among his own and leads their song. And the brethren are named in the psalm''s very next breath: *Ye that fear Yahuah (LORD), praise him; all ye the seed of Jacob, glorify him; and fear him, all ye the seed of Yashar''el (Israel)* (Psalm 22:23). The congregation in whose midst he sings is the seed itself — the gathered children of Jacob and Yashar''el (Israel), called to glorify the One who *hath not despised nor abhorred the affliction of the afflicted* (Psalm 22:24).',
       sv.verse_id, ev.verse_id, 'free', 7908
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8',
       E'Behold I and the children which Elohim hath given me — Isaiah 8',
       E'Twice over Hebrews puts the prophet Isaiah''s words into the mouth of the Son. *And again, I will put my trust in him. And again, Behold I and the children which Elohim (God) hath given me* (Hebrews 2:13) draws on the prophet who waited through the hiding of the Father''s face: *And I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him* (Isaiah 8:17), and *Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel) from Yahuah Tseva''ot (LORD of hosts), which dwelleth in mount Zion* (Isaiah 8:18). The Son who was *made perfect through sufferings* (Hebrews 2:10) speaks the language of dependence — *I will put my trust in him* — the Formed who took flesh trusting the Father through the suffering, looking for him while the face is hidden. And the children are *given* him by that Father; he stands with them, *not ashamed to call them brethren* (Hebrews 2:11), the gathered seed who are for signs and wonders in Yashar''el (Israel). The Christology is exact: the One who trusts and is given children is the Son, who has a Father — not the Father himself, and not a co-equal apart from him.',
       sv.verse_id, ev.verse_id, 'free', 7909
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest',
       E'Flesh and blood, the seed of Abraham, the merciful high priest',
       E'Here the incarnation is named without flinching. *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same* (Hebrews 2:14) — the Son truly entered the flesh of those he came to deliver, *that through death he might destroy him that had the power of death, that is, the devil* (Hebrews 2:14), and *deliver them who through fear of death were all their lifetime subject to bondage* (Hebrews 2:15). It is the same descent Paul sang: the One *being in the form of Elohim (God)* (Philippians 2:6) *made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7), *and being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). And the flesh he took was no generic flesh: *For verily he took not on him the nature of angels; but he took on him the seed of Abraham* (Hebrews 2:16) — the very line Yahuah (LORD) swore to multiply on the mount of the binding, *in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* (Genesis 22:17). Entering the seed of promise from within, *in all things it behoved him to be made like unto his brethren, that he might be a merciful and faithful high priest in things pertaining to Elohim (God), to make reconciliation for the sins of the people* (Hebrews 2:17). The humbling unto death qualifies the priest: *for in that he himself hath suffered being tempted, he is able to succour them that are tempted* (Hebrews 2:18). The Formed who took on real flesh and tasted death has a Father in whose things he ministers as priest — he is not a co-equal second person, nor the Father, but the Son made like his brethren to bring them home.',
       sv.verse_id, ev.verse_id, 'free', 7910
  FROM _s222_h02_lookup sv, _s222_h02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 8:4 — *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* the very words Hebrews quotes; the wonder of the Most High mindful of the son of Adam (Hebrews 2:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 8:5 — *thou hast made him a little lower than the angels, and hast crowned him with glory and honour* the lowering and crowning read of the Son made lower for the suffering of death (Hebrews 2:7,9).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 8:6 — *thou hast put all things under his feet* the dominion of the son of Adam restored and exceeded in the crowned Son, though not yet seen in full (Hebrews 2:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-what-is-man-the-son-of-adam-crowned-with-glory-psalm-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:22 — *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* the forsaken one''s turn to praise, spoken by the Son not ashamed to call them brethren (Hebrews 2:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:23 — *all ye the seed of Jacob, glorify him … all ye the seed of Yashar''el (Israel)* the brethren in whose midst he sings are the gathered seed (Hebrews 2:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-i-will-declare-thy-name-unto-my-brethren-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 8:17 — *I will wait upon Yahuah (LORD), that hideth his face from the house of Jacob, and I will look for him* the Son''s own trust through the suffering, the Formed who took flesh depending on the Father (Hebrews 2:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 8:18 — *Behold, I and the children whom Yahuah (LORD) hath given me are for signs and for wonders in Yashar''el (Israel)* the children given the Son by the Father, the gathered seed he calls brethren (Hebrews 2:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-behold-i-and-the-children-which-elohim-hath-given-me-isaiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *took upon him the form of a servant, and was made in the likeness of men* the One in the form of Elohim took part of flesh and blood, real incarnation (Hebrews 2:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *in multiplying I will multiply thy seed as the stars of the heaven* the seed of Abraham sworn on the mount is the seed the Son took on him (Hebrews 2:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:8 — *he humbled himself, and became obedient unto death, even the death of the cross* the humbling unto death qualifies the merciful and faithful high priest (Hebrews 2:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h02_lookup sv, _s222_h02_lookup tv
 WHERE t.slug='hebrews-2-flesh-and-blood-the-seed-of-abraham-the-merciful-high-priest'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_03.sql (S222 Hebrews 3) -----
-- =====================================================================
-- S222 minion — HEBREWS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 3.  Tag: h03 (temp view _s222_h03_lookup).  Sort band: floor 7914, ceiling 7920, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (watchpoint): Moses is NOT denigrated and the Torah is NOT inferior. The chapter
-- holds Yahusha (Jesus) and Moses BOTH as faithful — *Who was faithful to him that appointed him,
-- as also Moses was faithful in all his house* (3:2) — and the contrast at 3:5-6 is servant-in-the-
-- house (Moses, faithful, *for a testimony of those things which were to be spoken after*) vs
-- son-over-the-house (Messiah, *a son over his own house*), NOT true-vs-false, NOT law-abolished.
-- The praise quotes Numbers 12:7 verbatim: *My servant Moses is not so, who is faithful in all mine
-- house* — Yahuah's own commendation of Moses against Miriam and Aaron's reproach. Then the
-- wilderness warning: 3:7-11 quotes Psalm 95:7-11 in full (*To day if ye will hear his voice,
-- harden not your hearts*), and 3:15 re-quotes it. The failure is unbelief = faithlessness: an
-- *evil heart of unbelief, in departing from the living Elohim (God)* (3:12) that *could not enter
-- in because of unbelief* (3:19). The rest forfeited is the same rest the prophet sang and the
-- generation lost when their *carcases fell in the wilderness* (3:17 / Numbers 14:29-32; the
-- covenant-refusal traced in Psalm 78:10, *they kept not the covenant … and refused to walk in his
-- law*). The continuation into Hebrews 4 (the rest *remaineth*, the Sabbath affirmed) is carried in
-- prose; the Psalm-95 thread anchors here at chapter 3 where the citation lands.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-6   Apostle and High Priest; Yahusha and Moses both faithful; servant-in-house / son-over-house
--           Tanakh: Numbers 12:7 (My servant Moses is faithful in all mine house — PRAISE)  Extras: none warranted  NT: none added (carried at Heb 4:14-16 in prose)
--   v.7-11  the Ruach HaKodesh saith: To day if ye will hear his voice, harden not your hearts (quoted in full)
--           Tanakh: Psalm 95:7, 95:8, 95:11 (the verbatim citation)  Extras: none warranted  NT: none warranted
--   v.12-15 evil heart of unbelief, departing from the living Elohim; exhort one another To day
--           Tanakh: none added (Psalm 95 re-quoted at 3:15, carried in the Psalm-95 thread)  Extras: none warranted  NT: 1 Corinthians 10:11 (ensamples), 1 Corinthians 10:12 (take heed lest he fall)
--   v.16-19 some provoked; carcases fell; could not enter in because of unbelief
--           Tanakh: Numbers 14:29 / 14:32 (carcases shall fall in this wilderness), Psalm 78:10 (refused to walk in his law)  Extras: none warranted  NT: none added (1 Cor 10 carried at v.12-15)
--
-- EXTRAS: none warranted for Hebrews 3. The wilderness-rebellion memory exists in the Hebrew library
-- (Wisdom, Sirach), but the writer of Hebrews has the canon texts explicitly in hand — Numbers 12:7,
-- Psalm 95:7-11 quoted verbatim, the Numbers 14 / Psalm 78 rebellion — and those are the load-bearing
-- witnesses. No extras pull adds framework weight the canon does not already carry here.
--
-- THREADS (slug -> target libraries):
--   7914 hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12        (Tanakh)
--   7915 hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95     (Tanakh)
--   7916 hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim           (NT)
--   7917 hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief   (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12
  ('canon', 'hebrews', 3, 2, 'canon', 'numbers', 12, 7, 'free', E'*My servant Moses is not so, who is faithful in all mine house.* (Numbers 12:7). When Miriam and Aaron spake against Moses, Yahuah (LORD) himself stood in the door of the tabernacle and commended him: of all to whom he speaks in vision and dream, *my servant Moses is not so, who is faithful in all mine house.* The writer takes that very commendation as his measure for the Messiah: *Who was faithful to him that appointed him, as also Moses was faithful in all his house* (Hebrews 3:2). Moses is not the foil — he is the praised pattern of faithfulness, and Yahusha (Jesus) stands beside him as faithful in the same way.'),
  ('canon', 'hebrews', 3, 5, 'canon', 'numbers', 12, 7, 'free', E'*My servant Moses is not so, who is faithful in all mine house.* (Numbers 12:7). The honour Yahuah (LORD) gave Moses — *faithful in all mine house* — is exactly the honour the writer repeats: *And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5). The contrast that follows — *Messiah (Christ) as a son over his own house* (Hebrews 3:6) — is servant-in-the-house against son-over-the-house, not faithful against unfaithful. Moses the faithful servant testified beforehand of the things the Son would speak; both are faithful, each in his place.')
,
  -- thread: hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
  ('canon', 'hebrews', 3, 7, 'canon', 'psalms', 95, 7, 'free', E'*For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice,* (Psalm 95:7). The writer hears the psalm as the living voice of the Ruach HaKodesh (Holy Spirit) still speaking: *Wherefore (as the Ruach HaKodesh (Holy Spirit) saith, To day if ye will hear his voice* (Hebrews 3:7). The summons is not a closed chapter of history but a word that lands on every generation of the sheep of his hand — *To day* — calling for the hearing that is faithfulness, the hearing the wilderness generation refused.'),
  ('canon', 'hebrews', 3, 8, 'canon', 'psalms', 95, 8, 'free', E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness:* (Psalm 95:8). The Hebrews citation runs the psalm word for word: *Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:8). The hardened heart is the heart that hears the voice and will not bend to it — the very failure the wilderness generation enacted at Meribah and Massah. The warning stands over the hearers now: the danger is not the law but the hardened, unbelieving heart that refuses the voice.'),
  ('canon', 'hebrews', 3, 11, 'canon', 'psalms', 95, 11, 'free', E'*Unto whom I sware in my wrath that they should not enter into my rest.* (Psalm 95:11). The psalm ends on the oath, and so does the Hebrews citation: *So I sware in my wrath, They shall not enter into my rest* (Hebrews 3:11). The rest forfeited is the inheritance the faithless generation lost — and the writer presses it as a present peril, for the same oath warns the same way against the same unbelief. The faithlessness that hardens the heart shuts the door to the rest; the hearing that is faithfulness enters in.')
,
  -- thread: hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim
  ('canon', 'hebrews', 3, 12, 'canon', '1-corinthians', 10, 11, 'free', E'*Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come.* (1 Corinthians 10:11). The wilderness generation''s fall is no dead history; it is written for the living. *Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living Elohim (God)* (Hebrews 3:12). Both writers read the wilderness the same way: the carcases that fell are an admonition to those who now hear the voice — the evil heart of unbelief, the departing, is the very thing the ensample warns against.'),
  ('canon', 'hebrews', 3, 14, 'canon', '1-corinthians', 10, 12, 'free', E'*Wherefore let him that thinketh he standeth take heed lest he fall.* (1 Corinthians 10:12). *For we are made partakers of Messiah (Christ), if we hold the beginning of our confidence stedfast unto the end* (Hebrews 3:14). The partaking is held by the steadfast, and the steadfast is the one who heeds the warning. *Let him that thinketh he standeth take heed lest he fall* — the same caution Hebrews presses with its *if we hold … stedfast unto the end.* Faithfulness held to the end is the mark of the partaker; presumption is the road back into the wilderness.')
,
  -- thread: hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief
  ('canon', 'hebrews', 3, 17, 'canon', 'numbers', 14, 29, 'free', E'*Your carcases shall fall in this wilderness; and all that were numbered of you, according to your whole number, from twenty years old and upward, which have murmured against me,* (Numbers 14:29). The writer asks *with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:17) — and the answer is written plainly in the wilderness sentence itself: *your carcases shall fall in this wilderness … which have murmured against me.* The fallen are the murmurers, those who would not believe the One who had carried them out of Egypt.'),
  ('canon', 'hebrews', 3, 18, 'canon', 'numbers', 14, 32, 'free', E'*But as for you, your carcases, they shall fall in this wilderness.* (Numbers 14:32). *And to whom sware he that they should not enter into his rest, but to them that believed not?* (Hebrews 3:18). The oath barring the rest fell on the generation whose *carcases … shall fall in this wilderness* — those who, after all the signs, *believed not.* The writer reads it exactly as Numbers wrote it: the rest was lost not for keeping the covenant but for refusing to trust the Elohim (God) who kept them.'),
  ('canon', 'hebrews', 3, 19, 'canon', 'psalms', 78, 10, 'free', E'*They kept not the covenant of Elohim (God), and refused to walk in his law;* (Psalm 78:10). *So we see that they could not enter in because of unbelief* (Hebrews 3:19). The psalmist names the unbelief from the inside: the wilderness generation *kept not the covenant of Elohim (God), and refused to walk in his law.* The unbelief that shut the door to the rest was not a bare lapse of feeling but a refusal of the covenant and a refusal to walk in the law — faithlessness shown in turning away from his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12',
       E'The Apostle and High Priest — faithful, as Moses was faithful (Numbers 12)',
       E'This opening is read as if it demoted Moses; it does the opposite. The writer calls the reader to *consider the Apostle and High Priest of our profession, HaMashiach Yahusha (Christ Jesus)* (Hebrews 3:1), and his measure of the Messiah''s faithfulness is Moses'' own: *Who was faithful to him that appointed him, as also Moses was faithful in all his house* (Hebrews 3:2). That phrase is lifted straight from the moment Yahuah (LORD) defended Moses against the reproach of Miriam and Aaron — coming down in the pillar of the cloud to declare, *My servant Moses is not so, who is faithful in all mine house* (Numbers 12:7). It is the highest commendation: Moses the faithful servant, spoken to mouth to mouth. The writer keeps that praise intact: *And Moses verily was faithful in all his house, as a servant, for a testimony of those things which were to be spoken after* (Hebrews 3:5). The contrast that follows — *But Messiah (Christ) as a son over his own house; whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end* (Hebrews 3:6) — is servant-in-the-house against son-over-the-house, not faithful against unfaithful, not true against false. Moses the servant testified beforehand of the things the Son would speak and bring; both are faithful, each in his appointed place. The builder has more honour than the house, *but he that built all things is Elohim (God)* (Hebrews 3:4) — and the faithful servant is honoured within the house he was faithful in.',
       sv.verse_id, ev.verse_id, 'free', 7914
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95',
       E'To day if ye will hear his voice, harden not your hearts (Psalm 95)',
       E'The writer quotes Psalm 95 at length and hears it as the living voice of the Ruach HaKodesh (Holy Spirit) still speaking: *Wherefore (as the Ruach HaKodesh (Holy Spirit) saith, To day if ye will hear his voice, Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:7-8). The psalm sets the summons against the people it addresses — *we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice* (Psalm 95:7) — and warns them by the wilderness failure: *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8). The hardened heart is the heart that hears the voice and will not bend to it; that is the wilderness generation''s sin, played out at Meribah and Massah. The psalm closes on the oath, and so does the citation: *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11) — *So I sware in my wrath, They shall not enter into my rest* (Hebrews 3:11). The rest barred from the faithless is pressed on the present hearer as a live peril: the same Spirit who spoke through the psalm speaks the same *To day,* and the same oath warns the same way. The danger is never the law — it is the hardened, unbelieving heart that refuses the voice. The hearing that is faithfulness enters the rest; the hardening that is faithlessness forfeits it.',
       sv.verse_id, ev.verse_id, 'free', 7915
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim',
       E'An evil heart of unbelief, departing from the living Elohim',
       E'The wilderness warning turns to the hearer: *Take heed, brethren, lest there be in any of you an evil heart of unbelief, in departing from the living Elohim (God)* (Hebrews 3:12); *But exhort one another daily, while it is called To day; lest any of you be hardened through the deceitfulness of sin* (Hebrews 3:13); *For we are made partakers of Messiah (Christ), if we hold the beginning of our confidence stedfast unto the end* (Hebrews 3:14). Paul reads the same wilderness the same way for the assembly: *Now all these things happened unto them for ensamples: and they are written for our admonition, upon whom the ends of the world are come* (1 Corinthians 10:11). The carcases that fell are not dead history but a written admonition to those who now hear the voice; the evil heart of unbelief, the departing, is the very thing the ensample warns against. And the steadfastness Hebrews requires — *if we hold … stedfast unto the end* — is the caution Paul presses: *Wherefore let him that thinketh he standeth take heed lest he fall* (1 Corinthians 10:12). The partaking of Messiah is held by the faithful who heed the warning; presumption is the road back into the wilderness. Faithfulness held to the end is the mark of the partaker — not a confidence that lets the heart harden, but a confidence held fast.',
       sv.verse_id, ev.verse_id, 'free', 7916
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief',
       E'Their carcases fell in the wilderness — could not enter for unbelief',
       E'The chapter closes by naming who fell and why. *For some, when they had heard, did provoke: howbeit not all that came out of Egypt by Moses. But with whom was he grieved forty years? was it not with them that had sinned, whose carcases fell in the wilderness?* (Hebrews 3:16-17). The sentence is written plainly in Numbers: *Your carcases shall fall in this wilderness; and all that were numbered of you … which have murmured against me* (Numbers 14:29), *But as for you, your carcases, they shall fall in this wilderness* (Numbers 14:32). The fallen are the murmurers — those who, after the cloud and the sea and the manna, would not trust the Elohim (God) who carried them. *And to whom sware he that they should not enter into his rest, but to them that believed not? So we see that they could not enter in because of unbelief* (Hebrews 3:18-19). The psalmist names that unbelief from the inside: *They kept not the covenant of Elohim (God), and refused to walk in his law* (Psalm 78:10). The unbelief that shut the door was no bare lapse of feeling — it was a refusal of the covenant and a refusal to walk in the law, faithlessness shown in turning from his ways. The rest was lost not for keeping the covenant but for breaking faith with the One who kept them; and the warning stands over every hearer who is called *To day.*',
       sv.verse_id, ev.verse_id, 'free', 7917
  FROM _s222_h03_lookup sv, _s222_h03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 12:7 — *My servant Moses is not so, who is faithful in all mine house* Yahuah''s own commendation of Moses; the writer makes it the measure of the Messiah''s faithfulness (Hebrews 3:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 12:7 — *faithful in all mine house* the contrast at Hebrews 3:5-6 is servant-in-the-house against son-over-the-house, not faithful against unfaithful (Hebrews 3:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-the-apostle-and-high-priest-faithful-as-was-moses-numbers-12'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 95:7 — *we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice* the writer hears it as the Ruach HaKodesh (Holy Spirit) still speaking the summons to the sheep (Hebrews 3:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 95:8 — *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* the hardened heart hears the voice and will not bend; the wilderness sin enacted (Hebrews 3:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 95:11 — *Unto whom I sware in my wrath that they should not enter into my rest* the oath barring the rest, pressed on the present hearer as a live peril (Hebrews 3:11).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 10:11 — *all these things happened unto them for ensamples … written for our admonition* the wilderness fall is written for the living; the evil heart of unbelief is what it warns against (Hebrews 3:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 10:12 — *let him that thinketh he standeth take heed lest he fall* the partaking is held by the steadfast who heed the warning; presumption is the road back to the wilderness (Hebrews 3:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-an-evil-heart-of-unbelief-departing-from-the-living-elohim'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 14:29 — *Your carcases shall fall in this wilderness … which have murmured against me* the fallen are the murmurers who would not believe (Hebrews 3:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 14:32 — *your carcases, they shall fall in this wilderness* the oath barring the rest fell on those who believed not (Hebrews 3:18).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 78:10 — *They kept not the covenant of Elohim (God), and refused to walk in his law* the unbelief that shut the door was a refusal of the covenant and the law — faithlessness, not feeling (Hebrews 3:19).'
  FROM cross_reference_threads t, cross_references x, _s222_h03_lookup sv, _s222_h03_lookup tv
 WHERE t.slug='hebrews-3-their-carcases-fell-in-the-wilderness-could-not-enter-for-unbelief'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_04.sql (S222 Hebrews 4) -----
-- =====================================================================
-- S222 minion — HEBREWS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 4.  Tag: h04 (temp view _s222_h04_lookup).  Sort band: 7921..7927, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME — THE SABBATH-REST WATCHPOINT: Hebrews 4 AFFIRMS the Sabbath; it does NOT
-- abolish it. *There remaineth therefore a rest to the people of Elohim (God)* (4:9) — the word
-- is a keeping-of-sabbath, a sabbatismos. *For he that is entered into his rest, he also hath
-- ceased from his own works, as Elohim (God) did from his* (4:10), pointing straight back to
-- *And Elohim (God) did rest the seventh day from all his works* (4:4 / Genesis 2:2-3). The
-- weekly Sabbath that Elohim blessed and sanctified at creation is the sign and foretaste of the
-- eternal rest — the rest the Sabbath has always pointed to, never the commandment annulled. The
-- chapter continues the Psalm 95 *to day... harden not your hearts* warning from chapter 3
-- (4:3,5,7 / Psalm 95:7-11): the wilderness generation forfeited the rest through unbelief, so
-- the promise stands open still. Then the discerning word (4:12-13) and the great high priest
-- *touched with the feeling of our infirmities... yet without sin* (4:14-15) at the throne of
-- grace (4:16). Note on 4:8: the canon pull renders Yehoshua/Joshua as *Yahusha (Jesus)*; in
-- context it is Joshua son of Nun who led into the land but did not give the true rest — the prose
-- here does NOT make the Sabbath-rest thread turn on 4:8, and the quoted text is preserved exactly
-- as the pull returns it.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   let us fear lest we come short / we who believe enter into rest / as I have sworn in my wrath
--           Tanakh: Psalm 95:11 (I sware in my wrath they should not enter my rest)  Extras: none warranted  NT: none warranted (carried in the Psalm 95 thread)
--   v.4     he spake of the seventh day / Elohim did rest the seventh day from all his works
--           Tanakh: Genesis 2:2 (rested the seventh day), 2:3 (blessed and sanctified it)  Extras: Jubilees 2:1 (kept Sabbath and hallowed it for all ages, a sign)  NT: none warranted
--   v.5-9   it remaineth that some must enter / to day in David / there remaineth a rest (sabbath-keeping) to the people of Elohim
--           Tanakh: Genesis 2:3 (sanctified the seventh day — carried in the rest thread); Psalm 95:7-8 (to day, harden not — carried in the Psalm 95 thread)  Extras: Jubilees 2:19 (a people who keep the Sabbath sanctified to Himself), 2:30 (we kept Sabbath in the heavens)  NT: none warranted
--   v.10    he that is entered into his rest hath ceased from his own works, as Elohim did from his
--           Tanakh: Genesis 2:2 (rested from all his work)  Extras: Jubilees 2:1 (finished His works and kept Sabbath)  NT: none warranted (carried in the rest thread)
--   v.11    let us labour to enter that rest, lest any fall after the same example of unbelief
--           Tanakh: Psalm 95:11 (the forfeited rest — carried in the Psalm 95 thread)  Extras: none warranted  NT: none warranted
--   v.12-13 the word of Elohim is quick and powerful, sharper than a twoedged sword / all things naked and opened
--           Tanakh: Isaiah 49:2 (mouth like a sharp sword), Isaiah 55:11 (my word shall not return void)  Extras: none warranted  NT: none warranted
--   v.14-16 a great high priest passed into the heavens / touched with the feeling of our infirmities / throne of grace
--           Tanakh: Isaiah 53:3 (despised, acquainted with grief), 53:4 (he hath borne our griefs)  Extras: none warranted  NT: none warranted
--
--   Extras across the chapter: Jubilees 2 is the one load-bearing extra-canonical witness — the
--   seventh-day Sabbath sanctified at creation, hallowed for all ages, kept in the heavens before
--   it was made known to flesh, woven into the Sabbath-rest thread alongside Genesis 2. The
--   faith-cloud extras (1 Enoch, Sirach, 2 Maccabees) belong to Hebrews 11; the Melchizedek
--   tradition to chapters 5 and 7. Curated, not a dump.
--
-- THREADS (slug -> target libraries):
--   7921 hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2  (Tanakh + Extras)
--   7922 hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95              (Tanakh)
--   7923 hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword         (Tanakh)
--   7924 hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2
  ('canon', 'hebrews', 4, 4, 'canon', 'genesis', 2, 2, 'free', E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). The writer reaches back to creation for his proof: *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). The rest Hebrews holds out is no new thing — it is the rest Elohim (God) himself entered on the seventh day at the foundation of the world, the pattern set into creation before ever a commandment was written on stone.'),
  ('canon', 'hebrews', 4, 4, 'canon', 'genesis', 2, 3, 'free', E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* (Genesis 2:3). Elohim (God) did not merely cease on the seventh day; he *blessed* it and *sanctified* it — set it apart. So when Hebrews says *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), the rest that remains is bound to the day Elohim hallowed at creation: the weekly Sabbath is the sign and foretaste of the eternal rest, not a shadow discarded.'),
  ('canon', 'hebrews', 4, 4, 'jubilees', 'jubilees', 2, 1, 'extras', E'*Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works.* (Jubilees 2:1). The same creation Sabbath Hebrews appeals to — *Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4) — is here named *hallowed for all ages* and *a sign for all His works.* The seventh-day rest was woven into creation as a perpetual sign, the very rest into which *he that is entered... hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10).'),
  ('canon', 'hebrews', 4, 10, 'canon', 'genesis', 2, 2, 'free', E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* (Genesis 2:2). *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The believer''s entering rest is measured by the creation pattern itself — to cease from one''s own works *as Elohim (God) did* on the seventh day. The Sabbath rest of Genesis is the template; the eternal rest is its fulfilment, the day kept pointing to the rest that remains.'),
  ('canon', 'hebrews', 4, 9, 'jubilees', 'jubilees', 2, 19, 'extras', E'*Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them; as I have sanctified the Sabbath day and do sanctify (it) to Myself, even so shall I bless them, and they will be My people and I shall be their Elohim (God).* (Jubilees 2:19). Hebrews says *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — and here that very people is named as the people who *keep the Sabbath day,* sanctified to Elohim as his own. The keeping-of-sabbath and the people of Elohim are bound together: the Sabbath marks the people for whom the rest remains.'),
  ('canon', 'hebrews', 4, 9, 'jubilees', 'jubilees', 2, 30, 'extras', E'*for that day is more holy and blessed than any jubilee day of the jubilees: on this we kept Sabbath in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth.* (Jubilees 2:30). The Sabbath was kept *in the heavens* before it was given to flesh on earth — a heavenly rest of which the earthly day is the appointed echo. So Hebrews can say *there remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9): the weekly Sabbath was always the sign of a rest that reaches into the heavens, the eternal rest into which the believer enters.'),
  -- thread: hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
  ('canon', 'hebrews', 4, 3, 'canon', 'psalms', 95, 11, 'free', E'*Unto whom I sware in my wrath that they should not enter into my rest.* (Psalm 95:11). Hebrews quotes the oath directly: *For we which have believed do enter into rest, as he said, As I have sworn in my wrath, if they shall enter into my rest* (Hebrews 4:3). The wilderness generation was shut out of the rest by the oath of Elohim''s wrath — yet *the works were finished from the foundation of the world* (Hebrews 4:3), so the rest itself stood ready. The forfeit was theirs, not the rest''s; the promise remains open.'),
  ('canon', 'hebrews', 4, 7, 'canon', 'psalms', 95, 7, 'free', E'*For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice,* (Psalm 95:7). *Again, he limiteth a certain day, saying in David, To day, after so long a time; as it is said, To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7). The psalm''s *to day* is still sounding — long after David spoke it, the day of hearing stands open. The sheep of his hand are summoned now, while it is called *to day,* before the heart hardens.'),
  ('canon', 'hebrews', 4, 7, 'canon', 'psalms', 95, 8, 'free', E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness:* (Psalm 95:8). The warning Hebrews carries from chapter 3 into chapter 4 — *To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7) — is the psalm''s own charge against the wilderness hardening. The same unbelief that barred the fathers from the land threatens still: *let us labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).'),
  -- thread: hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword
  ('canon', 'hebrews', 4, 12, 'canon', 'isaiah', 49, 2, 'free', E'*And he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft; in his quiver hath he hid me;* (Isaiah 49:2). *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12). The servant''s mouth made *like a sharp sword* is the word that cuts; in Hebrews the word of Elohim is that very blade, *piercing even to the dividing asunder of soul and spirit* — the speech of Elohim is not dull or dead but a living edge.'),
  ('canon', 'hebrews', 4, 12, 'canon', 'isaiah', 55, 11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11). The word that *goeth forth* and accomplishes is the word Hebrews calls *quick, and powerful* (Hebrews 4:12). It does its work without fail — and that work reaches the inmost man, *a discerner of the thoughts and intents of the heart,* so that *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13).'),
  -- thread: hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace
  ('canon', 'hebrews', 4, 15, 'canon', 'isaiah', 53, 3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* (Isaiah 53:3). *For we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin* (Hebrews 4:15). The priest who can be *touched with the feeling of our infirmities* is the servant who was *a man of sorrows, and acquainted with grief* — he knows the weakness of the flesh from within, having borne it himself, and so can succour those who carry it.'),
  ('canon', 'hebrews', 4, 15, 'canon', 'isaiah', 53, 4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). The high priest *touched with the feeling of our infirmities* (Hebrews 4:15) is the one who *hath borne our griefs, and carried our sorrows.* Because he carried them, the call goes out: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16) — the priest who bore our sorrows opens the way to the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2',
       E'There remaineth a rest — the keeping of sabbath to the people of Elohim — Genesis 2',
       E'This is the chapter the pulpit has used to retire the Sabbath; read plainly, it does the opposite. *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the word is a keeping-of-sabbath, a sabbatismos — and the writer grounds it in creation itself: *For he spake in a certain place of the seventh day on this wise, And Elohim (God) did rest the seventh day from all his works* (Hebrews 4:4). That is Genesis word for word: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). And Elohim did not merely cease — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The rest Hebrews holds out is the rest Elohim himself entered and hallowed at the foundation of the world. The measure of entering it is the creation pattern: *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The witness of Jubilees says the same — the Sabbath was *hallowed for all ages, and appointed... a sign for all His works* (Jubilees 2:1); the people who *keep the Sabbath day* are the people Elohim *sanctified to Myself as My people* (Jubilees 2:19); and the day was kept *in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth* (Jubilees 2:30). The weekly Sabbath is the sign and foretaste of the eternal rest — the rest the day has always pointed to. Hebrews does not annul the commandment; it tells the people of Elohim that the rest the Sabbath signs is still open, and bids them *labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).',
       sv.verse_id, ev.verse_id, 'extras', 7921
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95',
       E'To day if ye will hear his voice, harden not your hearts — Psalm 95',
       E'The warning of Psalm 95 carries straight from chapter 3 into chapter 4, and the writer presses its urgency. The oath that shut the wilderness generation out is quoted first: *For we which have believed do enter into rest, as he said, As I have sworn in my wrath, if they shall enter into my rest: although the works were finished from the foundation of the world* (Hebrews 4:3), which is the psalm''s close — *Unto whom I sware in my wrath that they should not enter into my rest* (Psalm 95:11). The rest itself stood ready from creation; the fathers forfeited it not because the rest failed but because *the word preached did not profit them, not being mixed with faith* (Hebrews 4:2). So the *to day* still sounds: *Again, he limiteth a certain day, saying in David, To day, after so long a time; as it is said, To day if ye will hear his voice, harden not your hearts* (Hebrews 4:7) — the very words of the psalm, *For he is our Elohim (God); and we are the people of his pasture, and the sheep of his hand. To day if ye will hear his voice, Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:7-8). Long after David spoke it, the day of hearing stands open, and the same unbelief that barred the fathers threatens still. The summons is now, while it is called *to day,* before the heart hardens: *Let us labour therefore to enter into that rest, lest any man fall after the same example of unbelief* (Hebrews 4:11).',
       sv.verse_id, ev.verse_id, 'free', 7922
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword',
       E'The word of Elohim is quick and powerful, sharper than a twoedged sword',
       E'The word that calls *to day* is no dead letter. *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The prophets had already shown the word as a living blade: the servant says *he hath made my mouth like a sharp sword; in the shadow of his hand hath he hid me, and made me a polished shaft* (Isaiah 49:2) — the speech of Elohim cuts. And it never fails of its work: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). That accomplishing word reaches the inmost man, so that *neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The same word that pierces and divides is the word that summons to the rest — and it discerns whether the hearing is mixed with faith or hardened in unbelief.',
       sv.verse_id, ev.verse_id, 'free', 7923
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace',
       E'A great high priest touched with the feeling of our infirmities — the throne of grace',
       E'The chapter ends at the throne of grace, and the priest who stands there is the suffering servant of Isaiah. *Seeing then that we have a great high priest, that is passed into the heavens, Yahusha (Jesus) the Son of Elohim (God), let us hold fast our profession* (Hebrews 4:14). He is no remote priest: *For we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin* (Hebrews 4:15). The one who can be touched with our infirmities is the servant who was *despised and rejected of men; a man of sorrows, and acquainted with grief* (Isaiah 53:3) — he knows the weakness of the flesh from within, having borne it. More than that, *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). Because he carried our griefs and was tempted in all points yet without sin, the way to the throne is opened: *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need* (Hebrews 4:16). The merciful priest who bore the sorrows is the one through whom mercy and timely grace are found.',
       sv.verse_id, ev.verse_id, 'free', 7924
  FROM _s222_h04_lookup sv, _s222_h04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:2 — *he rested on the seventh day from all his work which he had made* the creation rest Hebrews quotes as proof, Elohim resting the seventh day (Hebrews 4:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:3 — *Elohim (God) blessed the seventh day, and sanctified it* the day was hallowed and set apart, the sign of the rest that remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 2:1 — *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* the creation Sabbath named a perpetual sign (Hebrews 4:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:19 — *these will keep the Sabbath day, and I will sanctify them to Myself as My people* the people of Elohim are the Sabbath-keeping people for whom the rest remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 2:30 — *on this we kept Sabbath in the heavens before it was made known to any flesh* the heavenly rest the earthly day echoes, the rest that remains (Hebrews 4:9).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Genesis 2:2 — *he rested on the seventh day from all his work* the creation pattern measures the entering rest, to cease as Elohim did (Hebrews 4:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-there-remaineth-a-rest-the-sabbath-keeping-of-the-people-of-elohim-genesis-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 95:11 — *I sware in my wrath that they should not enter into my rest* the oath that shut out the wilderness generation, quoted by Hebrews (Hebrews 4:3).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 95:7 — *To day if ye will hear his voice* the day of hearing still open, the sheep of his hand summoned now (Hebrews 4:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 95:8 — *Harden not your heart, as in the provocation* the wilderness hardening that barred the fathers, the warning carried into chapter 4 (Hebrews 4:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-to-day-if-ye-will-hear-his-voice-harden-not-your-hearts-psalm-95'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:2 — *he hath made my mouth like a sharp sword* the word as a living blade, sharper than any twoedged sword (Hebrews 4:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:11 — *my word... shall not return unto me void, but it shall accomplish that which I please* the word quick and powerful that does its work and discerns the heart (Hebrews 4:12-13).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-the-word-of-elohim-is-quick-and-powerful-sharper-than-a-twoedged-sword'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *a man of sorrows, and acquainted with grief* the priest touched with the feeling of our infirmities knows the flesh from within (Hebrews 4:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* because he carried our sorrows the way to the throne of grace is opened (Hebrews 4:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h04_lookup sv, _s222_h04_lookup tv
 WHERE t.slug='hebrews-4-a-great-high-priest-touched-with-the-feeling-of-our-infirmities-the-throne-of-grace'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_05.sql (S222 Hebrews 5) -----
-- =====================================================================
-- S222 minion — HEBREWS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 5.  Tag: h05 (temp view _s222_h05_lookup).  Sort band: 7928, step 1 (<= 7934).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 5 introduces the high-priesthood of Messiah. Every high priest is
-- *taken from among men* and *called of Elohim (God), as was Aaron* (5:4) — the office is given,
-- never seized. So *Messiah (Christ) glorified not himself to be made an high priest; but he that
-- said unto him, Thou art my Son, to day have I begotten thee* (5:5) — the Father called and
-- installed the Son. And the order is named: *Thou art a priest for ever after the order of Melek
-- Tsadiq (Melchizedek)* (5:6,10). CHRISTOLOGY WATCHPOINT: the Son who *in the days of his flesh*
-- *offered up prayers and supplications with strong crying and tears* (5:7) and *though he were a
-- Son, yet learned he obedience by the things which he suffered* (5:8) is the Formed who took
-- flesh truly — he has a Father who called him, perfected him, and heard him; he is not a co-equal
-- second person and not the Father himself. MELEK TSADIQ WATCHPOINT: this chapter SETS UP chapter
-- 7; the full Genesis 14 tithe-and-blessing weave belongs to ch7. Here the thread introduces the
-- Psalm 110:4 priest-king order Hebrews actually quotes (5:6,10), with the Genesis 14:18 priest of
-- El Elyon as its root only — the centerpiece Melchizedek weave is reserved for ch7.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   every high priest taken from among men, called of Elohim as was Aaron
--           Tanakh: Psalm 2:7 (carried at v.5, the call)  Extras: none warranted  NT: none warranted
--   v.5     Messiah glorified not himself; Thou art my Son, to day have I begotten thee
--           Tanakh: Psalm 2:7 (quoted)  Extras: none warranted  NT: none warranted (Heb 1:5 same hand, carried in prose)
--   v.6,10  Thou art a priest for ever after the order of Melek Tsadiq
--           Tanakh: Psalm 110:4 (quoted), Genesis 14:18 (priest of El Elyon, root only)  Extras: deferred to ch7 (2 Enoch / Melchizedek tradition)  NT: none warranted (Heb 7 re-walks)
--   v.7-8   in the days of his flesh, strong crying and tears; learned obedience by suffering
--           Tanakh: none warranted  Extras: none warranted  NT: Luke 22:42-44 (the cup, the agony), Matthew 26:39 (not as I will)
--   v.9     being made perfect, the author of eternal salvation to them that obey him
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (carried at v.7-8)
--   v.11-14 milk vs strong meat, unskilful in the word of righteousness, the babe
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (no load-bearing pairing; left unwoven by design — see return note)
--
-- THREADS (slug -> target libraries):
--   7928 hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2          (Tanakh)
--   7929 hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110     (Tanakh)
--   7930 hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience  (NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2
  ('canon', 'hebrews', 5, 5, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). The high priest does not appoint himself — *no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). So the Son did not grasp the office: *Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The very word that installs him is the Father''s decree of Psalm 2 — the Father speaks, *Thou art my Son,* and the Son is the One spoken to. The Son has a Father who calls and installs him; he is the Formed answering the voice of the Formless, never the One who speaks the decree.'),
  ('canon', 'hebrews', 5, 4, 'canon', 'psalms', 2, 7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7). *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). The priesthood is a thing given, not seized — Aaron was called, and so was the Son, by the same decreeing voice: *Yahuah (LORD) hath said unto me, Thou art my Son.* The calling that makes the priest is the Father''s word over him; the office rests on being chosen, not on self-exaltation.'),
  -- thread: hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110
  ('canon', 'hebrews', 5, 6, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). Hebrews names the order plainly: *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6). This is no Levitical office, bound by descent and ended by death; it is the priesthood Yahuah swore by oath and *will not repent* — a priesthood *for ever.* The Son called *Thou art my Son* (Psalm 2:7) is the same One named *a priest for ever,* king and priest in one, after the order older than Aaron.'),
  ('canon', 'hebrews', 5, 10, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10). The calling and the order are repeated together: the Father called him, and called him to a priesthood not of Levi but *after the order of Melek Tsadiq.* The sworn, unrepented oath of the psalm stands behind the title — a priest *for ever,* whose office no death cuts off.'),
  ('canon', 'hebrews', 5, 6, 'canon', 'genesis', 14, 18, 'free', E'*And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* (Genesis 14:18). The order Hebrews names — *after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6) — reaches back to the priest-king who met Abram in the days of the patriarchs: king of Salem and *priest of the El Elyon (most high God),* a priesthood that stood before Aaron and outside Levi. Here the root is only named; the meeting in the valley, the bread and wine, the tithe and the blessing are unfolded where Hebrews takes them up at length.'),
  -- thread: hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience
  ('canon', 'hebrews', 5, 7, 'canon', 'luke', 22, 42, 'free', E'*Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done.* (Luke 22:42). *Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared* (Hebrews 5:7). The prayer Hebrews remembers is the one heard in the garden: the Son on his knees before the Father, asking that the cup pass, and yielding — *not my will, but thine, be done.* He prays *unto him that was able to save him from death;* he has a Father to whom he cries, and the cry is the surrender of his own will to the Father''s. This is the Formed who took flesh truly, not a will co-equal and identical to the Father''s but a Son submitting to the One who sent him.'),
  ('canon', 'hebrews', 5, 7, 'canon', 'luke', 22, 44, 'free', E'*And being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground.* (Luke 22:44). The *strong crying and tears* of Hebrews 5:7 are not figures of speech — Luke saw them: *being in an agony he prayed more earnestly,* his sweat *as it were great drops of blood.* The Son in the days of his flesh wept and bled in prayer before the Father who *was able to save him from death.* The high priest who intercedes for us first cried out himself, in real flesh, in real anguish.'),
  ('canon', 'hebrews', 5, 7, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). Hebrews says he *offered up prayers and supplications with strong crying and tears unto him that was able to save him from death* (Hebrews 5:7); Matthew shows him fallen on his face, crying *O my Father.* The Son addresses a Father distinct from himself and bends his own will to that Father''s — *not as I will, but as thou wilt.* It is by this very road — *though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8) — that he was *made perfect* and *became the author of eternal salvation* (Hebrews 5:9).'),
  ('canon', 'hebrews', 5, 8, 'canon', 'matthew', 26, 39, 'free', E'*And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* (Matthew 26:39). *Though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8). The learning of obedience is exactly this moment: the Son with a cup before him he would rather not drink, yielding it — *not as I will, but as thou wilt.* Obedience learned by suffering is no pretence in one who could not have done otherwise; it is the real submission of the Formed, in flesh, to the will of the Father who sent him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2',
       E'Called of Elohim, as was Aaron — Thou art my Son (Psalm 2)',
       E'The priesthood is a thing given, never seized. *And no man taketh this honour unto himself, but he that is called of Elohim (God), as was Aaron* (Hebrews 5:4). So too the Son did not grasp the office: *Messiah (Christ) glorified not himself to be made an high priest; but he that said unto him, Thou art my Son, to day have I begotten thee* (Hebrews 5:5). The word that installs him as priest is the Father''s decree from the second psalm: *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The Father speaks, *Thou art my Son,* and the Son is the One spoken to and called. This is the framework''s Christology in a single verse: the Son has a Father who calls and installs him — the Formed answering the voice of the Formless, never the One who speaks the decree, and never a self-appointed rival to the Father who appoints him.',
       sv.verse_id, ev.verse_id, 'free', 7928
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110',
       E'A priest for ever after the order of Melek Tsadiq (Psalm 110)',
       E'Twice in this chapter Hebrews names the order of Messiah''s priesthood: *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6), and again, *Called of Elohim (God) an high priest after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:10). The line is lifted whole from the psalm: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). This is no Levitical office bound by descent and cut off by death — it is a priesthood Yahuah established by sworn oath and *will not repent,* a priesthood *for ever.* And the order reaches back past Aaron to the priest-king who met Abram: *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18) — king and priest in one, standing before Levi and outside it. Here the chapter only names this order and lets the oath stand; the meeting in the king''s dale, the tithe, and the blessing are unfolded where Hebrews takes the priest-king up at length.',
       sv.verse_id, ev.verse_id, 'free', 7929
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience',
       E'In the days of his flesh — strong crying and tears, obedience learned',
       E'*Who in the days of his flesh, when he had offered up prayers and supplications with strong crying and tears unto him that was able to save him from death, and was heard in that he feared* (Hebrews 5:7); *though he were a Son, yet learned he obedience by the things which he suffered* (Hebrews 5:8); *and being made perfect, he became the author of eternal salvation unto all them that obey him* (Hebrews 5:9). The prayer Hebrews remembers is the one prayed in the garden. *Saying, Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42); *and being in an agony he prayed more earnestly: and his sweat was as it were great drops of blood falling down to the ground* (Luke 22:44); *and he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt* (Matthew 26:39). The *strong crying and tears* were real — sweat like blood, a face to the ground, a cup he would rather not drink. And the One he cries to is *him that was able to save him from death,* a Father distinct from himself, whose will he bends his own will to receive. This is the Formed who took flesh truly: not a will co-equal and identical to the Father''s, but a Son who *learned obedience by the things which he suffered,* and so was made perfect — the author of eternal salvation, who first cried out himself before he became the high priest who intercedes for us.',
       sv.verse_id, ev.verse_id, 'free', 7930
  FROM _s222_h05_lookup sv, _s222_h05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* the Father''s decree is the word that installs the Son as high priest (Hebrews 5:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:7 — *Yahuah (LORD) hath said unto me, Thou art my Son* the priesthood is called, not seized; the Son is called as Aaron was (Hebrews 5:4).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-called-of-elohim-as-was-aaron-thou-art-my-son-psalm-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the sworn, unrepented oath behind the order Hebrews quotes (Hebrews 5:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent* the calling and the order repeated: an high priest for ever, not of Levi (Hebrews 5:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:18 — *Melek Tsadiq (Melchizedek) king of Salem … the priest of the El Elyon (most high God)* the priest-king root of the order, before Aaron and outside Levi (Hebrews 5:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-a-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 22:42 — *Father … not my will, but thine, be done* the garden prayer Hebrews remembers, the Son yielding to the Father (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 22:44 — *being in an agony … his sweat was as it were great drops of blood* the strong crying and tears were real, in real flesh (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 26:39 — *O my Father … not as I will, but as thou wilt* the Son addresses a Father distinct from himself and bends his will to his (Hebrews 5:7).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:39 — *not as I will, but as thou wilt* the very road by which *he learned obedience by the things which he suffered* (Hebrews 5:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h05_lookup sv, _s222_h05_lookup tv
 WHERE t.slug='hebrews-5-in-the-days-of-his-flesh-strong-crying-and-tears-learned-obedience'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_06.sql (S222 Hebrews 6) -----
-- =====================================================================
-- S222 minion — HEBREWS 6 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 6.  Tag: h06 (temp view _s222_h06_lookup).  Sort band: 7935, step 1 (<=7941).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 6 turns on the solemn warning against falling away after enlightenment
-- (6:4-6) and the ground-bearing-thorns parable (6:7-8). Read in the framework: this is the real
-- peril of covenant-abandonment for the enlightened — faithfulness held to the end, not a
-- once-saved-always-saved prooftext nor cheap grace. *They that through faith and patience inherit
-- the promises* (6:12) is emunah — faith that endures and bears fruit. The ground that *bringeth
-- forth herbs* receives blessing; the ground that *beareth thorns and briers is rejected, and is
-- nigh unto cursing* (6:7-8) — the cursed ground of Eden (Genesis 3:17-18) and the vineyard that
-- yielded wild grapes (Isaiah 5), the same tree-by-fruit test Yahusha (Jesus) gives (Matthew 7:19).
-- The better things turn on the oath to Abraham (6:13-15 / Genesis 22:16-17), the two immutable
-- things, the hope as *an anchor of the soul* entering *within the veil* where the forerunner has
-- gone (6:19-20), the *high priest for ever after the order of Melek Tsadiq (Melchizedek)* (6:20 /
-- Psalm 110:4), which Hebrews itself re-walks at 5:6 and 7:17.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   leaving first principles, going on unto perfection; baptisms, laying on of hands, resurrection, judgment
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (catechetical list, no single load-bearing pull)
--   v.4-6   the falling-away warning; crucify the Son afresh
--           Tanakh: none warranted  Extras: none warranted  NT: Hebrews 10:26-27 (sin wilfully, no more sacrifice — Heb-internal re-walk of the same peril)
--   v.7-8   the ground bearing herbs vs thorns; nigh unto cursing, end to be burned
--           Tanakh: Genesis 3:17 + 3:18 (cursed ground, thorns), Isaiah 5:7 (vineyard yielded wild grapes)  Extras: none warranted  NT: Matthew 7:19 (every tree not bearing good fruit hewn down and cast into fire)
--   v.9-12  better things; Elohim not unrighteous to forget your work and labour of love; through faith and patience inherit the promises
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (woven into v.13-15 endurance prose)
--   v.13-15 the oath to Abraham, surely blessing I will bless thee; patiently endured, obtained the promise
--           Tanakh: Genesis 22:16 + 22:17 (the oath at the binding)  Extras: none warranted (clean witness preferred; Jasher/Jubilees parallels carry editorial framing)  NT: none warranted
--   v.16-18 men swear by the greater; two immutable things; impossible for Elohim to lie; strong consolation
--           Tanakh: none warranted (carried at v.13-15)  Extras: none warranted  NT: none warranted
--   v.19-20 the hope as an anchor of the soul, within the veil; the forerunner entered, high priest for ever after the order of Melek Tsadiq
--           Tanakh: Psalm 110:4 (priest for ever after the order of Melek Tsadiq)  Extras: none warranted  NT: Hebrews 9:24 (entered heaven itself for us), Hebrews 5:6 + 7:17 (Heb-internal re-walk of Psalm 110:4)
--
-- THREADS (slug -> target libraries):
--   7935 hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing                       (Tanakh + NT)
--   7936 hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22          (Tanakh)
--   7937 hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered      (NT)
--   7938 hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110          (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing
  ('canon', 'hebrews', 6, 8, 'canon', 'genesis', 3, 17, 'free', E'*And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17). The ground that *beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:8). The writer reaches straight back to the garden: the curse that bound the ground to thorn was spoken over disobedience, *cursed is the ground for thy sake.* The enlightened soul that bears no fruit after the rain of the heavenly gift stands under that same sentence — not blessed earth, but cursed ground.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'genesis', 3, 18, 'free', E'*Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* (Genesis 3:18). Hebrews sets the herb-bearing ground that *receiveth blessing from Elohim (God)* (6:7) against the ground that *beareth thorns and briers* (6:8) — the very thorns and thistles the cursed ground brought forth after the fall. The same rain falls on both grounds; what each yields reveals what it is. The thorn-bearer is *nigh unto cursing,* the fruit of a heart that drank the rain and rendered nothing back.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'isaiah', 5, 7, 'free', E'*For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* (Isaiah 5:7). The prophet sang of the vineyard tended with every care that yet *brought forth wild grapes,* and named it the house of Yashar''el (Israel). Hebrews presses the same picture onto the enlightened who fall away: ground watered by the rain that *bringeth forth herbs* is blessed; ground that returns thorns is *rejected, and is nigh unto cursing* (Hebrews 6:8). The tending was not in question; the fruit was.'),
  ('canon', 'hebrews', 6, 8, 'canon', 'matthew', 7, 19, 'free', E'*Every tree that bringeth not forth good fruit is hewn down, and cast into the fire.* (Matthew 7:19). The ground that *beareth thorns and briers* has an end: *whose end is to be burned* (Hebrews 6:8). Yahusha (Jesus) gave the same verdict — the test is the fruit, and the tree that bears none is hewn down and *cast into the fire.* This is the peril Hebrews names for the enlightened: not a snatched-away security, but the real possibility that one who tasted the heavenly gift bears thorns and comes to the fire.'),
  -- thread: hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22
  ('canon', 'hebrews', 6, 14, 'canon', 'genesis', 22, 16, 'free', E'*And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son:* (Genesis 22:16). *When Elohim (God) made promise to Abraham, because he could swear by no greater, he sware by himself* (Hebrews 6:13). The writer quotes the oath sworn at the binding on the mountain: *By myself have I sworn.* There is none greater for Yahuah (LORD) to swear by, so he swears by himself — the immutable ground of the promise, given because Abraham *hast not withheld thy son.*'),
  ('canon', 'hebrews', 6, 14, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). Hebrews quotes the oath nearly word for word: *Surely blessing I will bless thee, and multiplying I will multiply thee* (Hebrews 6:14). The promise sworn at the binding is the seed multiplied as the stars and the sand — the covenant lineage of the twelve tribes carried forward. *And so, after he had patiently endured, he obtained the promise* (6:15): the oath is sure, and the heir inherits it through the same faith and patience.'),
  -- thread: hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 9, 24, 'free', E'*For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us:* (Hebrews 9:24). The hope is *an anchor of the soul, both sure and stedfast, and which entereth into that within the veil; whither the forerunner is for us entered, even Yahusha (Jesus)* (Hebrews 6:19-20). What *within the veil* means the writer says plainly a few chapters on: not the earthly holy place but *heaven itself,* where the forerunner appears *in the presence of Elohim (God) for us.* The anchor of the soul is fixed not in this world but in the heavenly sanctuary where Yahusha has already gone in.'),
  -- thread: hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110
  ('canon', 'hebrews', 6, 20, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). The forerunner entered within the veil, *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). The writer is quoting the psalm''s oath directly — and the oath stands alongside the oath to Abraham earlier in the chapter, for *Yahuah (LORD) hath sworn, and will not repent.* The priesthood after the order of Melek Tsadiq is not Levitical and not temporary; it is sworn by oath, *for ever,* the eternal priest-king the psalm foretold.'),
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 5, 6, 'free', E'*As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Hebrews 5:6). The same psalm-oath the writer cited at the close of chapter five he sounds again here: the forerunner *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). Hebrews keeps returning to the one text, building toward the full exposition of the Melek Tsadiq priesthood — the priest-king who arises not by carnal descent but by the power of an endless life.'),
  ('canon', 'hebrews', 6, 20, 'canon', 'hebrews', 7, 17, 'free', E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Hebrews 7:17). The high priest *for ever after the order of Melek Tsadiq (Melchizedek)* named at 6:20 is the thread the writer takes up fully in chapter seven: *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The forerunner who entered within the veil and the eternal priest expounded from Genesis 14 and Psalm 110 are one — the same Yahusha (Jesus), priest by oath and *for ever.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing',
       E'The ground that beareth thorns is nigh unto cursing',
       E'After the solemn warning against falling away — that it is *impossible for those who were once enlightened, and have tasted of the heavenly gift … if they shall fall away, to renew them again unto repentance* (Hebrews 6:4-6) — the writer draws a parable from the soil. *For the earth which drinketh in the rain that cometh oft upon it, and bringeth forth herbs meet for them by whom it is dressed, receiveth blessing from Elohim (God): but that which beareth thorns and briers is rejected, and is nigh unto cursing; whose end is to be burned* (Hebrews 6:7-8). The same rain falls on both grounds; the fruit reveals what each one is. This is not a once-saved-always-saved security and it is not cheap grace — it is the real peril of covenant-abandonment for the enlightened, faithfulness tested by what it bears. The picture reaches straight back to Eden, where the curse first bound the ground to thorn: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17), *thorns also and thistles shall it bring forth to thee* (Genesis 3:18). The prophet sang the same warning over the covenant people themselves — a vineyard tended with every care that yet yielded wild grapes: *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression* (Isaiah 5:7). And Yahusha (Jesus) gave the verdict in plainest words: *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 7:19). The tending was never in question. The fruit was. The thorn-bearer comes to the fire.',
       sv.verse_id, ev.verse_id, 'free', 7935
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22',
       E'Surely blessing I will bless thee — the oath to Abraham',
       E'Against the slothful and the fallen the writer sets *them who through faith and patience inherit the promises* (Hebrews 6:12), and the great pattern is Abraham. *For when Elohim (God) made promise to Abraham, because he could swear by no greater, he sware by himself, saying, Surely blessing I will bless thee, and multiplying I will multiply thee* (Hebrews 6:13-14). The words are quoted from the oath sworn on the mountain at the binding of Isaac, after Abraham had not withheld his son: *By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son: that in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:16-17). There is none greater for Yahuah (LORD) to swear by, so he swears by himself — the promise made immutable. The seed multiplied as the stars and the sand is the covenant lineage carried forward through the twelve tribes, not a metaphor for any who believe. *And so, after he had patiently endured, he obtained the promise* (Hebrews 6:15): the oath is sure, and the heir inherits it through the same faith that endures and obeys — emunah that does not let go.',
       sv.verse_id, ev.verse_id, 'free', 7936
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered',
       E'An anchor of the soul within the veil, whither the forerunner entered',
       E'By the oath and the promise — *two immutable things, in which it was impossible for Elohim (God) to lie* (Hebrews 6:18) — the heirs have a strong consolation, and the writer names its fixity: *which hope we have as an anchor of the soul, both sure and stedfast, and which entereth into that within the veil; whither the forerunner is for us entered, even Yahusha (Jesus)* (Hebrews 6:19-20). The anchor does not hold to anything in this world; it reaches *within the veil,* into the inner sanctuary itself, where Yahusha has already gone as the forerunner who opens the way. What that veil hides the writer says plainly a few chapters on: *For Messiah (Christ) is not entered into the holy places made with hands, which are the figures of the true; but into heaven itself, now to appear in the presence of Elohim (God) for us* (Hebrews 9:24). The earthly holy place was the figure; the true is heaven, and there the Formed-one who took on flesh stands in the presence of the Father on behalf of his own. The soul''s anchor is fixed in the heavenly sanctuary where the forerunner has already entered in.',
       sv.verse_id, ev.verse_id, 'free', 7937
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110',
       E'An high priest for ever after the order of Melek Tsadiq (Melchizedek)',
       E'The chapter closes on the title that governs the whole epistle: the forerunner entered within the veil, *made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). The words are the oath of the psalm, quoted directly: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The oath stands beside the oath to Abraham earlier in the same chapter — Yahuah (LORD) swearing and not repenting, the immutable word made the ground of the priesthood. This is not the Levitical priesthood, bound by carnal descent and ended by death; it is the priesthood of the priest-king of Salem, eternal and sworn by oath, *for ever.* Hebrews keeps returning to this one text: at the close of chapter five — *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 5:6) — and again in the full exposition of chapter seven — *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The forerunner who entered the heavenly sanctuary and the eternal priest the psalm foretold are one: the same Yahusha (Jesus), priest by oath and for ever.',
       sv.verse_id, ev.verse_id, 'free', 7938
  FROM _s222_h06_lookup sv, _s222_h06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *cursed is the ground for thy sake; in sorrow shalt thou eat of it* the Eden curse that bound the ground to thorn is the sentence over the thorn-bearing soul (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:18 — *thorns also and thistles shall it bring forth to thee* the thorns the cursed ground brings forth are what the unfruitful heart returns for the rain it drank (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 5:7 — *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* the tended vineyard that yielded wild grapes is the same warning to the covenant people (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:19 — *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* Yahusha''s (Jesus''s) verdict: the fruitless tree comes to the fire, the end of the thorn-bearing ground (Hebrews 6:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-the-ground-that-beareth-thorns-is-nigh-unto-cursing'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:16 — *By myself have I sworn, saith Yahuah (LORD) … thou hast not withheld thy son* the oath at the binding: Yahuah swears by himself because there is none greater (Hebrews 6:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* the oath Hebrews quotes; the seed-promise carried through the twelve tribes (Hebrews 6:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-surely-blessing-i-will-bless-thee-the-oath-to-abraham-genesis-22'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 9:24 — *but into heaven itself, now to appear in the presence of Elohim (God) for us* what is within the veil is heaven itself, where the forerunner appears for us (Hebrews 6:19-20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-anchor-of-the-soul-within-the-veil-whither-the-forerunner-entered'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the psalm-oath Hebrews quotes; the priesthood sworn for ever (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 5:6 — *As he saith also in another place, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the same psalm-oath sounded at the close of chapter five (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:17 — *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the title taken up in the full exposition of chapter seven (Hebrews 6:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h06_lookup sv, _s222_h06_lookup tv
 WHERE t.slug='hebrews-6-an-high-priest-for-ever-after-the-order-of-melchizedek-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_07.sql (S222 Hebrews 7) -----
-- =====================================================================
-- S222 minion — HEBREWS 7 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 7 (the Melek Tsadiq chapter).  Tag: h07 (temp view _s222_h07_lookup).
-- Sort band: floor 7942, ceiling 7949, step 1 (7942..7945 used).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (HIGH CARE — Red Lines #4/#5/#7; the priesthood-change watchpoint):
-- Hebrews 7 does NOT abolish the Torah. It announces the change of the PRIESTLY administration
-- — which tribe may serve, the requirement of Levitical/Aaronic carnal descent — because the
-- priest now arises out of Yahudah (Judah) after the order of Melek Tsadiq (Melchizedek). When
-- 7:12 says *the priesthood being changed, there is made of necessity a change also of the law,*
-- the law in view is the ordinance regulating the priesthood and the altar (7:13-14, *of which
-- tribe Moses spake nothing concerning priesthood*), NOT the moral Torah, the Sabbath, the
-- feasts, or the dietary law. The *commandment going before* that is *disannulled* (7:18) is the
-- specific *law of a carnal commandment* (7:16) establishing the Aaronic line by descent; the
-- *better hope* (7:19) is *brought in* and by it *we draw nigh unto Elohim (God).* The eternal
-- priest is confirmed by the oath (*Yahuah (Lord) sware and will not repent,* 7:21 / Psalm 110:4),
-- *ever liveth to make intercession* (7:25), is *holy, harmless, undefiled, separate from
-- sinners* (7:26), and offered *once, when he offered up himself* (7:27). Christology: Yahusha
-- is the Formed priest-king, *made like unto the Son of Elohim (God)* (7:3), who has a Father and
-- is *consecrated for evermore* by the word of the oath (7:28). The default trained reading —
-- "Hebrews 7 does away with the old priesthood and its law" as license against the Torah — is the
-- replacement reading and is held out.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   Melek Tsadiq, king of Salem, priest of El Elyon, blessed Abraham, tithes of all
--           Tanakh: Genesis 14:18 (priest of El Elyon, bread and wine), 14:19 (blessed Abram),
--                   14:20 (gave him tithes of all)  Extras: Jasher 16:11 (king of Jerusalem,
--                   bread and wine), Jasher 16:12 (blessed Abram, gave a tenth, priest before
--                   Elohim)  NT: none added (Hebrews 5:6,10 carried in prose; same hand)
--   v.4-10  Abraham (and Levi in his loins) paid tithes to the greater priest
--           Tanakh: Genesis 14:20 (carried at v.1-3)  Extras: Jasher 16:12 (carried at v.1-3)
--           NT: none warranted
--   v.11-19 the priesthood changed → a change of the (priestly/altar) law; priest from Judah;
--           the disannulling of the carnal commandment; the better hope brings us nigh
--           Tanakh: Psalm 110:4 (a priest for ever after the order of Melek Tsadiq, the oath),
--                   Zechariah 6:12 (the BRANCH grows out of his place), Zechariah 6:13 (a priest
--                   upon his throne, the counsel of peace) — the priest-king from outside the
--                   Aaronic line  Extras: none warranted  NT: none warranted
--   v.20-25 the oath that the Levitical priests never had; surety of a better testament;
--           unchangeable priesthood; ever liveth to make intercession; able to save to the uttermost
--           Tanakh: Psalm 110:4 (the oath, *Yahuah sware and will not repent*), Psalm 110:1 (sit
--                   at my right hand)  Extras: none warranted  NT: none warranted
--   v.26-28 holy, harmless, undefiled, separate from sinners; offered once, himself; the Son
--           consecrated for evermore by the word of the oath
--           Tanakh: Psalm 110:4 (the word of the oath that maketh the Son)  Extras: none warranted
--           NT: none warranted (the once-for-all offering re-walked at Hebrews 9-10; same hand)
--
-- THREADS (slug -> target libraries):
--   7942 hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14   (Tanakh + Extras)
--   7943 hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek  (Tanakh)
--   7944 hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110 (Tanakh)
--   7945 hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once                          (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14
  ('canon', 'hebrews', 7, 1, 'canon', 'genesis', 14, 18, 'free', E'*And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* (Genesis 14:18). The whole argument of the chapter rests on this one verse. *For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The writer is reading Genesis word by word: the king of Salem, the priest of the El Elyon — a priesthood older than Aaron, older than Levi, standing before Yahuah (LORD) when Abraham was still a wanderer in the land.'),
  ('canon', 'hebrews', 7, 1, 'canon', 'genesis', 14, 19, 'free', E'*And he blessed him, and said, Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* (Genesis 14:19). *Who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The blessing flows downward, from the greater to the lesser — *and without all contradiction the less is blessed of the better* (Hebrews 7:7). Abraham, the father of the faithful and the bearer of the promises, bows to receive a blessing from the priest of the El Elyon.'),
  ('canon', 'hebrews', 7, 2, 'canon', 'genesis', 14, 20, 'free', E'*And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* (Genesis 14:20). *To whom also Abraham gave a tenth part of all* (Hebrews 7:2). The patriarch himself paid the tithe to this priest — *first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:2). The king of righteousness and the king of peace receives the tenth from the man who held the promises, marking him the greater priest.'),
  ('canon', 'hebrews', 7, 1, 'jasher', 'jasher', 16, 11, 'extras', E'*And Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram and his people, with bread and wine, and they remained together in the valley of Melech.* (Jasher 16:11). The Hebrew library remembers the same meeting Hebrews builds upon: the king of Salem — Jerusalem — coming out with bread and wine to the returning Abram. *For this Melek Tsadiq (Melchizedek), king of Salem... who met Abraham returning from the slaughter of the kings, and blessed him* (Hebrews 7:1). The encounter at the king''s dale is no allegory; it stands witnessed in the record of the patriarchs.'),
  ('canon', 'hebrews', 7, 2, 'jasher', 'jasher', 16, 12, 'extras', E'*And Adonizedek blessed Abram, and Abram gave him a tenth from all that he had brought from the spoil of his enemies, for Adonizedek was a priest before Elohim (God).* (Jasher 16:12). *To whom also Abraham gave a tenth part of all* (Hebrews 7:2). The Hebrew record names the very thing the writer of Hebrews presses: this king of Salem *was a priest before Elohim (God),* and Abraham gave him the tenth. The priesthood that stands before Yahuah (LORD) is older than the sons of Levi, and Abraham himself acknowledged it.'),
  -- thread: hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek
  ('canon', 'hebrews', 7, 17, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The whole change turns on this sworn word. Because the promised priest rises *after the order of Melek Tsadiq (Melchizedek)* and not *after the order of Aaron* (Hebrews 7:11), the ordinance that bound the priesthood to the sons of Levi gives way — the priestly administration changes, not the righteous instruction of Yahuah (LORD).'),
  ('canon', 'hebrews', 7, 14, 'canon', 'zechariah', 6, 12, 'free', E'*And speak unto him, saying, Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:14). The prophet had already seen a priest who would not come of Aaron''s line — the BRANCH who *shall grow up out of his place,* the kingly stock of Yahudah (Judah), arising to build the house of Yahuah (LORD). The priest from Judah was no contradiction of the prophets but their fulfilment.'),
  ('canon', 'hebrews', 7, 15, 'canon', 'zechariah', 6, 13, 'free', E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both.* (Zechariah 6:13). *And it is yet far more evident: for that after the similitude of Melek Tsadiq (Melchizedek) there ariseth another priest* (Hebrews 7:15). The prophet joined the two offices the Aaronic order kept apart: a king who is *a priest upon his throne.* This is the order of Melek Tsadiq (Melchizedek) himself — king of Salem and priest of the El Elyon at once — the priest-king in whom *the counsel of peace* is established.'),
  -- thread: hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110
  ('canon', 'hebrews', 7, 21, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *But this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:21). The Levitical priests were made without an oath; this priest is established by the sworn word of Yahuah (LORD) himself — a word that *will not repent.* The oath is what makes the testament better and sure: *by so much was Yahusha (Jesus) made a surety of a better testament* (Hebrews 7:22).'),
  ('canon', 'hebrews', 7, 25, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). *Wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him, seeing he ever liveth to make intercession for them* (Hebrews 7:25). The same psalm that swore the eternal priesthood seated this Lord at the right hand of Yahuah (LORD). Enthroned and undying, he *ever liveth* — and from that throne he makes intercession, able to save to the uttermost all who come to Elohim (God) through him.'),
  -- thread: hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once
  ('canon', 'hebrews', 7, 28, 'canon', 'psalms', 110, 4, 'free', E'*Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* (Psalm 110:4). *For the law maketh men high priests which have infirmity; but the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* (Hebrews 7:28). The contrast is between men of infirmity made priests by ordinance, and the Son made priest by the sworn word — *the word of the oath.* That word *consecrates* him *for evermore,* the priest who needs no succession because he does not die.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14',
       E'Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon — Genesis 14',
       E'The chapter is built on a single passage of Genesis, read word by word. *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). *And he blessed him, and said, Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* (Genesis 14:19). *And he gave him tithes of all* (Genesis 14:20). The writer of Hebrews takes up each line: *For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God), who met Abraham returning from the slaughter of the kings, and blessed him; to whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace* (Hebrews 7:1-2). The point is the greatness of this priest. He stands *without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3) — the priest-king pattern in whom the eternal priest after the order of Melek Tsadiq (Melchizedek) is foreshown, the Formed one who has a Father and abides continually. And the proof of his greatness is that Abraham himself, who held the promises, paid him the tenth and received his blessing: *and without all contradiction the less is blessed of the better* (Hebrews 7:7). Even Levi, *yet in the loins of his father, when Melek Tsadiq (Melchizedek) met him* (Hebrews 7:10), paid tithes through Abraham — the Aaronic order acknowledging a priesthood older and greater than its own. The Hebrew library remembers the same meeting: *And Adonizedek king of Jerusalem... went out with his men to meet Abram and his people, with bread and wine... And Adonizedek blessed Abram, and Abram gave him a tenth from all... for Adonizedek was a priest before Elohim (God)* (Jasher 16:11-12). The encounter at the king''s dale is no allegory; it stands witnessed, and on it the whole argument of the eternal priesthood is raised.',
       sv.verse_id, ev.verse_id, 'extras', 7942
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek',
       E'The priesthood changed — a priest from Judah after the order of Melek Tsadiq (Melchizedek)',
       E'This is the verse the inherited reading turns into a weapon against the Torah, and the turning misreads what is being changed. *For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12). Read the next breath, and the writer himself tells which law: *For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar. For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:13-14). The law that changes is the ordinance regulating who may serve at the altar — the requirement of Aaronic, Levitical descent — for the promised priest arises out of Yahudah (Judah), *after the order of Melek Tsadiq (Melchizedek), and not... after the order of Aaron* (Hebrews 7:11). He *is made, not after the law of a carnal commandment, but after the power of an endless life* (Hebrews 7:16); and *there is verily a disannulling of the commandment going before for the weakness and unprofitableness thereof. For the law made nothing perfect, but the bringing in of a better hope did; by the which we draw nigh unto Elohim (God)* (Hebrews 7:18-19). The *commandment going before* that is set aside is the carnal-descent ordinance establishing the Aaronic line; the priestly system that *could make nothing perfect* on its own gives way to the priest who can — the moral instruction of Yahuah (LORD), his Sabbath, his feasts, his ways, stand untouched. And the prophets had already seen it: the sworn word, *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4), and Zechariah''s vision of a priest not of Aaron''s line — *Behold the man whose name is The BRANCH; and he shall grow up out of his place* (Zechariah 6:12), who *shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The two offices Aaron''s order kept apart — king and priest — are joined in the order of Melek Tsadiq (Melchizedek), exactly as Genesis named him king of Salem and priest of the El Elyon at once. The administration changes; the better hope is brought in; we draw nigh.',
       sv.verse_id, ev.verse_id, 'free', 7943
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110',
       E'Yahuah (LORD) sware and will not repent — the oath and the better testament (Psalm 110)',
       E'The Levitical priests held their office by ordinance and by birth; this priest holds his by the sworn word of Yahuah (LORD). *And inasmuch as not without an oath he was made priest: (for those priests were made without an oath; but this with an oath by him that said unto him, Yahuah (Lord) sware and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek):)* (Hebrews 7:20-21). The word is the psalm''s own: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). An oath that will not repent makes the testament sure: *by so much was Yahusha (Jesus) made a surety of a better testament* (Hebrews 7:22). And where the many Levitical priests *were not suffered to continue by reason of death* (Hebrews 7:23), this one *continueth ever, hath an unchangeable priesthood* (Hebrews 7:24). The same psalm that swore the priesthood had seated this Lord on high: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). Enthroned and undying, *he ever liveth to make intercession* — *wherefore he is able also to save them to the uttermost that come unto Elohim (God) by him* (Hebrews 7:25). The oath is the guarantee; the endless life is the power; the throne is the seat from which he pleads for his own.',
       sv.verse_id, ev.verse_id, 'free', 7944
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once',
       E'Holy, harmless, undefiled — who offered up himself once',
       E'The chapter closes on the kind of priest who befits the eternal order. *For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26). Unlike the high priests who had first to offer for their own sins, this one had none: *who needeth not daily, as those high priests, to offer up sacrifice, first for his own sins, and then for the people''s: for this he did once, when he offered up himself* (Hebrews 7:27). The daily, repeated offerings of the Levitical order are gathered up and finished in a single offering — not the Torah annulled, but the sacrificial administration brought to its fulfilment in the priest who offered himself once for all. And the final word is the word of the oath: *for the law maketh men high priests which have infirmity; but the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* (Hebrews 7:28) — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4). The law made men of infirmity priests; the sworn word makes the Son, consecrated for evermore — the Formed one who has a Father, the priest who does not die and so does not need to be replaced.',
       sv.verse_id, ev.verse_id, 'free', 7945
  FROM _s222_h07_lookup sv, _s222_h07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:18 — *Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* the priesthood older than Aaron, on which the whole chapter is built (Hebrews 7:1).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:19 — *Blessed be Abram of the El Elyon (most high God), possessor of heaven and earth* the blessing flows from the greater priest to Abraham, *the less is blessed of the better* (Hebrews 7:1,7).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:20 — *And he gave him tithes of all* Abraham, holder of the promises, paid the tenth to the King of righteousness and King of peace (Hebrews 7:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 16:11 — *Adonizedek king of Jerusalem... went out... with bread and wine* the Hebrew record of the same meeting at the valley of Melech (Hebrews 7:1).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 16:12 — *Adonizedek blessed Abram, and Abram gave him a tenth... for Adonizedek was a priest before Elohim (God)* the Hebrew record names the priesthood older than Levi that Abraham acknowledged (Hebrews 7:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-melchizedek-king-of-salem-priest-of-el-elyon-blessed-abraham-genesis-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=16 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* the sworn word on which the change of priestly order turns (Hebrews 7:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 6:12 — *Behold the man whose name is The BRANCH; and he shall grow up out of his place* the prophet saw a priest from outside Aaron''s line, *our Lord sprang out of Juda* (Hebrews 7:14).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 6:13 — *he shall be a priest upon his throne: and the counsel of peace shall be between them both* king and priest joined in one, the order of Melek Tsadiq (Melchizedek) (Hebrews 7:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-the-priesthood-changed-a-priest-from-judah-after-the-order-of-melchizedek'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent* the oath the Levitical priests never had, making the testament sure (Hebrews 7:21).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 110:1 — *Sit thou at my right hand* the enthroned, undying Lord who *ever liveth to make intercession* (Hebrews 7:25).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-yahuah-sware-and-will-not-repent-the-oath-and-the-better-testament-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:4 — *the word of the oath, which was since the law, maketh the Son, who is consecrated for evermore* the sworn word makes the priest who offered himself once (Hebrews 7:28).'
  FROM cross_reference_threads t, cross_references x, _s222_h07_lookup sv, _s222_h07_lookup tv
 WHERE t.slug='hebrews-7-holy-harmless-undefiled-who-offered-up-himself-once'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_08.sql (S222 Hebrews 8) -----
-- =====================================================================
-- S222 minion — HEBREWS 8 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 8.  Tag: h08 (temp view _s222_h08_lookup).  Sort band: 7950, step 1 (<= 7956).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the new-covenant chapter — handled with high care):
-- Hebrews 8 announces the superiority and finality of Messiah's priesthood and the covenant
-- RENEWED in him — NOT the abolition of the Torah. The earthly priests *serve unto the example
-- and shadow of heavenly things* (8:5); the sanctuary is the God-given copy of the heavenly
-- reality, made *according to the pattern shewed to thee in the mount* (8:5 / Exodus 25:40) —
-- real and pointing to its fulfilment, not a mistake corrected. The *better covenant* of *better
-- promises* (8:6) is defined word for word by Jeremiah 31:31-34, quoted in full at 8:8-12:
-- *I will put my laws into their mind, and write them in their hearts* (8:10). This is the SAME
-- Torah — now written on the mind and heart instead of on tablets of stone — with full
-- forgiveness and inward knowing; the change is INTERNALIZATION, not a different or abolished law.
-- It is the heart-circumcision the prophets foretold (Ezekiel 36:26-27; Deuteronomy 30:6), made
-- with the house of Yashar'el (Israel) AND the house of Yahudah (Judah) — the two houses, the
-- gathering. And 8:13 — *that which decayeth and waxeth old is ready to vanish away* — names the
-- old PRIESTLY and SACRIFICIAL administration (the Levitical mediation that could not perfect),
-- vanishing as the priesthood is changed (Hebrews 7:11-12) and the animal-sacrifice system is
-- taken away (Hebrews 10:9); the moral law/Torah is never annulled — its ordinances *depart not*
-- (Jeremiah 31:35-36).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   high priest, minister of the true tabernacle which Yahuah pitched
--           Tanakh: none added (carried at v.5)  Extras: none warranted  NT: none warranted
--   v.3-5   serve the example and shadow / make all things according to the pattern in the mount
--           Tanakh: Exodus 25:40 (the pattern in the mount), Exodus 25:9 (after the pattern of the tabernacle)
--           Extras: Wisdom of Solomon 9:8 (a resemblance of the holy tabernacle prepared from the beginning)
--           NT: Acts 7:44 (the tabernacle made according to the fashion Moses had seen)
--   v.6-7   mediator of a better covenant, established upon better promises / the first faulty
--           Tanakh: none added (the covenant defined at v.8-12)  Extras: none warranted  NT: none added (carried at v.8-12)
--   v.8-12  Jeremiah 31:31-34 quoted in full — the new covenant, laws written on mind and heart
--           Tanakh: Jeremiah 31:31, 31:33, 31:34 (the source text); Ezekiel 36:26, 36:27 (new heart, Spirit causes walking); Deuteronomy 30:6 (circumcise thine heart)
--           Extras: none warranted  NT: Hebrews 10:16 (the same covenant re-quoted — laws in hearts and minds)
--   v.13    a new covenant hath made the first old; that which waxeth old is ready to vanish away
--           Tanakh: Jeremiah 31:35 (the ordinances depart not from before me)
--           Extras: none warranted  NT: Hebrews 7:11, 7:12 (priesthood changed -> the law regulating it changed); Hebrews 10:9 (he taketh away the first -> the animal-sacrifice system)
--
-- THREADS (slug -> target libraries):
--   7950 hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25  (Tanakh + Extras + NT)
--   7951 hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31                          (Tanakh + NT)
--   7952 hebrews-8-the-first-made-old-ready-to-vanish-away                                   (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25
  ('canon', 'hebrews', 8, 5, 'canon', 'exodus', 25, 40, 'free', E'*And look that thou make them after their pattern, which was shewed thee in the mount.* (Exodus 25:40). The Hebrews writer quotes this charge word for word: the priests *serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The earthly sanctuary is not a human invention nor a mistake to be discarded; it is the God-given copy of a heavenly reality, made by direct command after a pattern Moses was shown. The shadow is real and it points — to the heavenly things it was drawn from.'),
  ('canon', 'hebrews', 8, 5, 'canon', 'exodus', 25, 9, 'free', E'*According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it.* (Exodus 25:9). Before the single charge of the mount, Yahuah (LORD) gives the whole principle: every part of the sanctuary is built *after the pattern* he shews. So when Hebrews calls the priests servants of *the example and shadow of heavenly things* (Hebrews 8:5), it is naming what Exodus already declared — the tabernacle and all its instruments are the copy of a heavenly original, framed by Yahuah''s (LORD''s) own shewing, that he might dwell among his people.'),
  ('canon', 'hebrews', 8, 5, 'canon', 'acts', 7, 44, 'free', E'*Our fathers had the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen.* (Acts 7:44). Stephen, standing before the council, names the same heavenly pattern Hebrews names: the tabernacle was made *according to the fashion that he had seen* — shown, appointed, copied from above. Where Hebrews says *make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5), Stephen says the fathers built it by the fashion Moses *had seen.* Two witnesses to one truth: the sanctuary is the God-appointed copy of the heavenly reality.'),
  ('canon', 'hebrews', 8, 5, 'apocrypha', 'the-wisdom-of-solomon', 9, 8, 'extras', E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning.* (Wisdom of Solomon 9:8). The temple itself is confessed to be *a resemblance of the holy tabernacle, which you have prepared from the beginning* — a heavenly original prepared before the earthly copy was ever framed. This is precisely what Hebrews means by *the example and shadow of heavenly things* (Hebrews 8:5): the earthly sanctuary resembles a holy tabernacle that already stood in heaven, real and prior, the pattern the builder was commanded to follow.'),
  -- thread: hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31
  ('canon', 'hebrews', 8, 8, 'canon', 'jeremiah', 31, 31, 'free', E'*Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah):* (Jeremiah 31:31). Hebrews quotes the prophet directly: *Behold, the days come, saith Yahuah (Lord), when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8). The covenant is *new,* and it is made with the two houses named together — Yashar''el (Israel) and Yahudah (Judah), the northern and the southern house — the gathering of the whole covenant people the prophet foretold, not the founding of a different people.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). This is the defining clause, and Hebrews quotes it: *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). The new covenant is the SAME law — *my law,* *my laws* — now moved from tablets of stone into the mind and the heart. The change is the place of the writing, not the content of the law: internalization, not abolition. Torah written within is still Torah.'),
  ('canon', 'hebrews', 8, 11, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). Hebrews carries the promise whole: *they shall all know me, from the least to the greatest. For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:11-12). The new covenant brings two gifts the old administration could not finally give: an inward knowing of Yahuah (LORD) in every heart, and full forgiveness — the sin remembered no more. This is mercy completing the law written within, not mercy replacing the law.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). To *write* the laws *in their hearts* (Hebrews 8:10) the heart must first be remade. Ezekiel names the very gift: the stony heart taken away, a heart of flesh given. The new covenant''s writing of the Torah within is this new heart at work — the surface that can hold the law inscribed, the heart-circumcision the prophets foretold.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'ezekiel', 36, 27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27). The companion promise to the law written in the heart (Hebrews 8:10) is the Spirit put within who *causes* the walking: *cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The new covenant does not lift the statutes off the people; it puts the Spirit within so that the statutes are at last kept and done. Law written within, Spirit working it out — one promise, the same Torah brought to its doing.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). The promise to *write* the law *in their hearts* (Hebrews 8:10) was already spoken by Moses as a circumcision of the heart — Yahuah Elohayka (the LORD thy God) himself cutting away what resists, that the people would love him and live. The new covenant is the keeping of this ancient promise: the heart made able to love and obey from within, the same Torah the heart is circumcised to keep.'),
  ('canon', 'hebrews', 8, 10, 'canon', 'hebrews', 10, 16, 'free', E'*This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them;* (Hebrews 10:16). The writer quotes the same Jeremiah clause a second time, sealing the reading: the covenant''s heart is *I will put my laws into their hearts, and in their minds will I write them.* What 8:10 announces, 10:16 confirms — the new covenant is the law written within, said twice so it cannot be missed. The laws are kept; only the tablet has changed, from stone to the mind and heart.'),
  -- thread: hebrews-8-the-first-made-old-ready-to-vanish-away
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 7, 11, 'free', E'*If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11). When 8:13 says *he hath made the first old,* the first is what chapter 7 has just named: the Levitical priesthood that could not bring perfection. The thing made old and ready to vanish is the priestly mediation through Aaron''s line — superseded by the priest after the order of Melek Tsadiq (Melchizedek) — not the moral law given to the people.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 7, 12, 'free', E'*For the priesthood being changed, there is made of necessity a change also of the law.* (Hebrews 7:12). The change behind 8:13''s *waxeth old* is named here: *the priesthood being changed.* And the law that changes with it is the law regulating the priesthood and the altar — which tribe may serve — for the priest now arises out of Yahudah (Judah) after the order of Melek Tsadiq (Melchizedek). It is the administration of the priesthood that is altered and made old, never the Torah of righteousness written on the heart.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'hebrews', 10, 9, 'free', E'*Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second.* (Hebrews 10:9). What 8:13 calls *the first* made old, chapter 10 says he *taketh away* — and names exactly what it is: the system of animal sacrifice that *can never take away sins* (Hebrews 10:11), taken away so that the once-for-all offering of the body of Messiah (Christ) may be established in its place. The vanishing is the sacrificial administration fulfilled and superseded, not the law annulled.'),
  ('canon', 'hebrews', 8, 13, 'canon', 'jeremiah', 31, 35, 'free', E'*Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* (Jeremiah 31:35). The same prophet whose new-covenant promise Hebrews quotes guards it against any reading that the law could be cast off. In the very next breath Jeremiah binds Yahuah''s (LORD''s) ordinances to the fixed order of sun, moon, and stars: *if those ordinances depart from before me … then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever* (Jeremiah 31:36). The covenant''s *first* made old in Hebrews 8:13 is the priestly administration; the prophet who gave the new covenant swears its ordinances do not depart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25',
       E'Make all things according to the pattern shewed thee in the mount',
       E'The high priest of Hebrews is *a minister of the sanctuary, and of the true tabernacle, which Yahuah (Lord) pitched, and not man* (Hebrews 8:2); the earthly priests *serve unto the example and shadow of heavenly things, as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The writer is quoting Yahuah''s (LORD''s) own charge at Sinai word for word: *And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40), the charge that crowns the whole instruction given *after the pattern of the tabernacle, and the pattern of all the instruments thereof* (Exodus 25:9). The sanctuary is no human contrivance and no error to be discarded; it is the God-given copy of a heavenly reality, framed by direct command after a pattern Moses was shown. Stephen confessed the same before the council — the fathers had *the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen* (Acts 7:44) — and Solomon''s prayer over the temple confessed it too: it was *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). A holy tabernacle stood in heaven first; the earthly one is its faithful copy, real and pointing to the heavenly things it was drawn from — fulfilled, not corrected, in the minister of the true tabernacle which Yahuah (Lord) pitched.',
       sv.verse_id, ev.verse_id, 'extras', 7950
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31',
       E'I will write my laws in their hearts — the new covenant of Jeremiah 31',
       E'This is the chapter the inherited reading turns into a proof that the law was set aside, and the turning rests on the words *new covenant* and *better.* Read the text and the opposite stands. The mediator of *a better covenant, which was established upon better promises* (Hebrews 8:6) defines that covenant by quoting Jeremiah in full: *Behold, the days come, saith Yahuah (Lord), when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8) — the two houses named together, the northern and the southern house gathered, exactly as the prophet said: *Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31). And the defining clause is not the abolition of the law but its relocation: *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10), word for word from *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). It is *my law,* *my laws* — the SAME Torah, moved from tablets of stone into the mind and the heart. The change is the place of the writing, not the content of the law. This is the heart-circumcision the prophets foretold: a heart remade to hold it — *a new heart also will I give you, and a new spirit will I put within you … and I will give you an heart of flesh* (Ezekiel 36:26) — and a Spirit put within to keep it — *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the very circumcision Moses promised: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). With it come the inward knowing and the full forgiveness the old administration could not finally give: *they shall all know me, from the least to the greatest. For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:11-12; Jeremiah 31:34). And the writer quotes the clause a second time to seal it — *I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16) — so it cannot be mistaken. The new covenant is the law written within, mercy completing it, the same Torah brought home to the heart.',
       sv.verse_id, ev.verse_id, 'free', 7951
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-8-the-first-made-old-ready-to-vanish-away',
       E'The first made old, ready to vanish away — what waxeth old is the priestly administration',
       E'*In that he saith, A new covenant, he hath made the first old. Now that which decayeth and waxeth old is ready to vanish away* (Hebrews 8:13). Read alone and against the framework, this verse is made to say the Torah itself decayed and vanished. Read with the argument the writer has been building, it says nothing of the kind. The *first* made old is what chapter 7 has just named: *If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11) — the priestly mediation through Aaron''s line that could not bring perfection. And the law that changes with it is named precisely: *For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12) — the law regulating who may serve at the altar, for the priest now arises out of Yahudah (Judah). Chapter 10 says the same of the sacrificial side: *He taketh away the first, that he may establish the second* (Hebrews 10:9) — the system of animal sacrifice that *can never take away sins,* taken away so the once-for-all offering of the body of Messiah (Christ) may stand in its place. What waxeth old and vanishes is the old priestly and sacrificial administration, fulfilled and superseded in the priest after the order of Melek Tsadiq (Melchizedek). It is never the moral law annulled — for the very prophet who gave the new covenant swore its ordinances do not depart: Yahuah (LORD) *which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night* (Jeremiah 31:35) declares that only if *those ordinances depart from before me … then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever* (Jeremiah 31:36). The administration of mediation is made old; the covenant is renewed with the law written on the heart, and its ordinances stand.',
       sv.verse_id, ev.verse_id, 'free', 7952
  FROM _s222_h08_lookup sv, _s222_h08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:40 — *thou make them after their pattern, which was shewed thee in the mount* the charge Hebrews quotes word for word; the sanctuary is the copy of a heavenly original (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 25:9 — *after the pattern of the tabernacle, and the pattern of all the instruments thereof* the whole sanctuary built after the heavenly pattern, the *example and shadow of heavenly things* (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:44 — *according to the fashion that he had seen* Stephen''s witness to the same heavenly pattern Hebrews names (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 9:8 — *a resemblance of the holy tabernacle, which you have prepared from the beginning* the heavenly tabernacle stood first; the earthly is its resemblance (Hebrews 8:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-make-all-things-according-to-the-pattern-shewed-in-the-mount-exodus-25'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:31 — *a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* the two houses named together; the source text Hebrews quotes (Hebrews 8:8).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the defining clause: the SAME Torah, moved to the heart, not abolished (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *a new heart also will I give you … I will give you an heart of flesh* the heart remade to hold the law written within (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* the Spirit put within to keep the statutes; the law written within brought to its doing (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart* the heart-circumcision Moses promised; the same gift the new covenant fulfils (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jeremiah 31:34 — *they shall all know me, from the least … their sin no more* the inward knowing and full forgiveness the new covenant brings (Hebrews 8:11-12).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Hebrews 10:16 — *I will put my laws into their hearts, and in their minds will I write them* the same Jeremiah clause re-quoted, sealing the reading (Hebrews 8:10).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-i-will-write-my-laws-in-their-hearts-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-8-the-first-made-old-ready-to-vanish-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 7:11 — *if perfection were by the Levitical priesthood* the *first* made old is the Aaronic priestly mediation that could not perfect (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:12 — *the priesthood being changed, there is made … a change also of the law* the law that changes is the one regulating who serves at the altar (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 10:9 — *He taketh away the first, that he may establish the second* the *first* taken away is the animal-sacrifice system, not the Torah (Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:35 — *the ordinances of the moon and of the stars* the prophet who gave the new covenant swears its ordinances do not depart (Jeremiah 31:36; Hebrews 8:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h08_lookup sv, _s222_h08_lookup tv
 WHERE t.slug='hebrews-8-the-first-made-old-ready-to-vanish-away'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_hebrews_10.sql (S222 Hebrews 10) -----
-- =====================================================================
-- S222 minion — HEBREWS 10 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 10.  Tag: h10 (temp view _s222_h10_lookup).  Sort band: floor 7964, ceiling 7970, step 1.
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (the watchpoint): Hebrews 10 announces the finality of the once-for-all
-- offering — NOT the abolition of the Torah. *He taketh away the first, that he may establish
-- the second* (10:9): what is TAKEN AWAY is the system of animal sacrifice (which *can never
-- take away sins*, 10:11); what is ESTABLISHED is the once-for-all offering of the body of
-- Messiah (10:10). The covenant is RENEWED with the SAME law: *I will put my laws into their
-- hearts, and in their minds will I write them* (10:16, re-quoting Jeremiah 31:33) — the heart-
-- internalized Torah, not a discarded law. The ongoing call to obedience STANDS: the warning
-- against wilful sin (10:26), the *sorer punishment* set against the death without mercy under
-- Moses' law (10:28-29 / Deuteronomy 17:6), *Vengeance belongeth unto me* (10:30 / Deuteronomy
-- 32:35-36), and *the just shall live by faith* (10:38 / Habakkuk 2:3-4 — the same verse Romans
-- 1:17 quotes; faith = faithfulness/emunah).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST:
--   v.1-4   the shadow of good things, the blood of bulls and goats cannot take away sins
--           Tanakh: Psalm 40:6 (carried in the Psalm-40 thread)  Extras: none warranted  NT: none warranted
--   v.5-8   Psalm 40 quoted: sacrifice thou wouldest not, but a body prepared; lo I come to do thy will
--           Tanakh: Psalm 40:6, 40:7, 40:8  Extras: none warranted  NT: none warranted
--   v.9-10  he taketh away the first, that he may establish the second; the body offered once for all
--           Tanakh: Psalm 40:6, 40:8 (the will-doing root)  Extras: none warranted  NT: John 19:30 (it is finished)
--   v.11-15 every priest standeth daily / this man one sacrifice for ever / perfected for ever
--           Tanakh: Psalm 110:1 (sat down, enemies the footstool) — carried in prose, woven elsewhere in Hebrews 1; none added here  Extras: none warranted  NT: none warranted
--   v.16-18 re-quote of Jeremiah 31: I will put my laws into their hearts; their sins remember no more
--           Tanakh: Jeremiah 31:33, 31:34  Extras: none warranted  NT: none warranted
--   v.19-25 boldness to enter by the new and living way; draw near; hold fast; assemble
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted (John 4:24 thread already lives at john-4-...; not re-built here)
--   v.26-31 if we sin wilfully no more sacrifice; sorer punishment; vengeance belongeth unto me
--           Tanakh: Deuteronomy 17:6 (two or three witnesses), Deuteronomy 32:35, 32:36 (vengeance / Yahuah shall judge his people), Isaiah 26:11 (fire devour the adversaries)  Extras: none warranted  NT: none warranted
--   v.32-36 call to remembrance the former days; the better and enduring substance; patience
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.37-39 he that shall come will come; the just shall live by faith; not them who draw back
--           Tanakh: Habakkuk 2:3, 2:4  Extras: none warranted  NT: Romans 1:17 (the same Habakkuk citation)
--
-- THREADS (slug -> target libraries):
--   7964 hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40        (Tanakh)
--   7965 hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body        (Tanakh + NT)
--   7966 hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31                       (Tanakh)
--   7967 hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17         (Tanakh)
--   7968 hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32  (Tanakh)
--   7969 hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back     (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s222_h10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40
  ('canon', 'hebrews', 10, 5, 'canon', 'psalms', 40, 6, 'free', E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required.* (Psalm 40:6). When Messiah *cometh into the world, he saith, Sacrifice and offering thou wouldest not, but a body hast thou prepared me* (Hebrews 10:5). The writer reaches straight back to the psalm of David: Yahuah (LORD) *didst not desire* the sacrifice and offering as the end in themselves — what he sought was the opened ear, the obedient body. The animal offerings were never the thing wanted; they pointed past themselves to the One who would come to do the will.'),
  ('canon', 'hebrews', 10, 7, 'canon', 'psalms', 40, 7, 'free', E'*Then said I, Lo, I come: in the volume of the book it is written of me,* (Psalm 40:7). *Then said I, Lo, I come (in the volume of the book it is written of me,) to do thy will, O Elohim (God)* (Hebrews 10:7). The Son speaks the psalmist''s very words: *Lo, I come,* and *in the volume of the book it is written of me.* The whole scroll was written toward this coming — the obedient One who steps into the world to render the will the offerings could only foreshadow.'),
  ('canon', 'hebrews', 10, 7, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). The Son comes *to do thy will, O Elohim (God)* (Hebrews 10:7), and the psalm names what doing that will looks like: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* The will of Elohim and the law within the heart are one and the same — the very internalized Torah the new covenant promises. The obedience the sacrifices pointed toward is the law treasured in the heart and lived out, not the law set aside.'),
  -- thread: hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body
  ('canon', 'hebrews', 10, 9, 'canon', 'psalms', 40, 6, 'free', E'*Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required.* (Psalm 40:6). *Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9). The *first* taken away is named in the verse before by the psalm itself: *sacrifice and offering* and *burnt offering and sin offering* — the system of animal offering that Yahuah (LORD) *didst not desire.* The *second* established is the will-doing of the obedient One. What is removed is the bull-and-goat administration, never the law it served.'),
  ('canon', 'hebrews', 10, 9, 'canon', 'psalms', 40, 8, 'free', E'*I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* (Psalm 40:8). When the Son says *Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9), the *second* he establishes is exactly the psalm''s posture: *I delight to do thy will... yea, thy law is within my heart.* The thing established is heart-obedience to the will of Elohim with his law treasured within — the establishing of the law in the heart, not its abolition. The animal-offering shadow gives way to the substance: the obedient body that does the will.'),
  ('canon', 'hebrews', 10, 10, 'canon', 'john', 19, 30, 'free', E'*When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost.* (John 19:30). *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10). The offering of the body *once for all* is the moment the will was finished: *It is finished.* The daily priests stood and offered the same sacrifices that *can never take away sins* (Hebrews 10:11); the obedient Son offered his own body one time and sat down. What the bulls and goats year by year could not do, the once-for-all offering of the body accomplished — and the work was finished.'),
  -- thread: hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31
  ('canon', 'hebrews', 10, 16, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The writer cites the prophet as the very witness of the Ruach HaKodesh (Holy Spirit): *This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16). The new covenant is the SAME law — *my law,* *my laws* — now written within. The change is internalization, the law moved from tables of stone into the inward parts. Nothing here annuls the Torah; it engraves it on the heart.'),
  ('canon', 'hebrews', 10, 17, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). *And their sins and iniquities will I remember no more* (Hebrews 10:17). The writer quotes the prophet''s closing clause word for word. The remembrance of sins *every year* by the old offerings (Hebrews 10:3) gives way to the covenant promise of full pardon: *I will remember their sin no more.* Where this remission is reached, *there is no more offering for sin* (Hebrews 10:18) — not because the law is gone, but because the forgiveness the law''s sacrifices reached toward is now complete.'),
  -- thread: hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17
  ('canon', 'hebrews', 10, 28, 'canon', 'deuteronomy', 17, 6, 'free', E'*At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death; but at the mouth of one witness he shall not be put to death.* (Deuteronomy 17:6). *He that despised Moses’ law died without mercy under two or three witnesses* (Hebrews 10:28). The writer leans the whole weight of his warning on the standing authority of the Torah: the law of Moses still defines what despising covenant looks like, still names the *two or three witnesses* by which death is established. He does not set Moses'' law aside — he argues FROM it: if breaking it brought death without mercy, how much sorer the punishment for trampling the Son and the blood of the covenant.'),
  ('canon', 'hebrews', 10, 27, 'canon', 'isaiah', 26, 11, 'free', E'*Yahuah (LORD), when thy hand is lifted up, they will not see: but they shall see, and be ashamed for their envy at the people; yea, the fire of thine enemies shall devour them.* (Isaiah 26:11). The wilful sinner has only *a certain fearful looking for of judgment and fiery indignation, which shall devour the adversaries* (Hebrews 10:27). The prophet had already named that fire: *the fire of thine enemies shall devour them.* The judgment the writer warns of is no new severity but the long-promised consuming of the adversaries who would not see when the hand of Yahuah (LORD) was lifted up.'),
  -- thread: hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32
  ('canon', 'hebrews', 10, 30, 'canon', 'deuteronomy', 32, 35, 'free', E'*To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* (Deuteronomy 32:35). *For we know him that hath said, Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord)* (Hebrews 10:30). The writer quotes the Song of Moses: *To me belongeth vengeance, and recompence.* The settling of accounts is Yahuah''s (LORD''s) own — not abandoned, not abolished by the new covenant, but reserved in his hand. The warning to the wilful sinner is grounded in the same word Moses sang over Yashar''el (Israel).'),
  ('canon', 'hebrews', 10, 30, 'canon', 'deuteronomy', 32, 36, 'free', E'*For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone, and there is none shut up, or left.* (Deuteronomy 32:36). *And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30). The writer adds the next line of the same song: *Yahuah (LORD) shall judge his people.* That Yahuah judges his own people is mercy and severity in one motion — he judges, and he *repent himself for his servants.* The living Elohim into whose hands it is a fearful thing to fall (Hebrews 10:31) is the same Yahuah who judges and vindicates his people in the Song of Moses.'),
  -- thread: hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back
  ('canon', 'hebrews', 10, 37, 'canon', 'habakkuk', 2, 3, 'free', E'*For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.* (Habakkuk 2:3). *For yet a little while, and he that shall come will come, and will not tarry* (Hebrews 10:37). The writer takes up the prophet''s own promise of the appointed time: *though it tarry, wait for it; because it will surely come, it will not tarry.* The coming One is sure; the call is to wait in faithfulness for what *will surely come.*'),
  ('canon', 'hebrews', 10, 38, 'canon', 'habakkuk', 2, 4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.* (Habakkuk 2:4). *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38). The prophet sets the two souls side by side: the one *lifted up,* not upright, against the just who *shall live by his faith.* This is faithfulness — the enduring trust that does not draw back. The writer presses the contrast: the just live by faith, while the one who draws back is the proud soul in whom Elohim has no pleasure.'),
  ('canon', 'hebrews', 10, 38, 'canon', 'romans', 1, 17, 'free', E'*For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith.* (Romans 1:17). *Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:38). Paul and the writer to the Hebrews quote the same word of Habakkuk — *The just shall live by faith.* In both it is faithfulness, the trust that endures and does not draw back. The righteous one lives by clinging, by walking on in emunah toward the One who *will surely come* — the same faith that justifies and the same faith that perseveres.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40',
       E'A body hast thou prepared me — Lo, I come to do thy will (Psalm 40)',
       E'When Messiah *cometh into the world, he saith, Sacrifice and offering thou wouldest not, but a body hast thou prepared me: In burnt offerings and sacrifices for sin thou hast had no pleasure. Then said I, Lo, I come (in the volume of the book it is written of me,) to do thy will, O Elohim (God)* (Hebrews 10:5-7). The writer is quoting David''s psalm, and it carries the whole frame. *Sacrifice and offering thou didst not desire; mine ears hast thou opened: burnt offering and sin offering hast thou not required* (Psalm 40:6) — the animal offerings were never the thing Yahuah (LORD) sought; he sought the opened ear, the obedient body. *Then said I, Lo, I come: in the volume of the book it is written of me* (Psalm 40:7) — the whole scroll was written toward this coming. And the psalm names exactly what doing the will means: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). The will of Elohim and the law within the heart are one. The obedience the sacrifices foreshadowed is the law treasured in the heart and lived out — the very internalized Torah of the new covenant, not the law set aside.',
       sv.verse_id, ev.verse_id, 'free', 7964
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body',
       E'He taketh away the first — the once-for-all offering of the body',
       E'*Then said he, Lo, I come to do thy will, O Elohim (God). He taketh away the first, that he may establish the second* (Hebrews 10:9). Read inside the psalm the writer is quoting, the *first* is named plainly: *Sacrifice and offering thou didst not desire... burnt offering and sin offering hast thou not required* (Psalm 40:6) — the bull-and-goat administration, the offerings that *can never take away sins* (Hebrews 10:11). That is what is taken away. The *second* established is the will-doing of the obedient One, and the psalm names it as heart-obedience with the law treasured within: *I delight to do thy will, O my Elohim (God): yea, thy law is within my heart* (Psalm 40:8). What is removed is the animal-sacrifice system; what is established is the law in the heart and the obedience it produces — never the abolition of the Torah. And the offering that fulfils it is given once: *By the which will we are sanctified through the offering of the body of Yahusha HaMashiach (Jesus Christ) once for all* (Hebrews 10:10). The daily priests stood and offered repeatedly what could not take away sin; the obedient Son offered his own body one time and the work was finished: *When Yahusha (Jesus) therefore had received the vinegar, he said, It is finished: and he bowed his head, and gave up the ghost* (John 19:30). What the offerings year by year could not do, the once-for-all offering of the body accomplished. The shadow gave way to the substance — the body that did the will.',
       sv.verse_id, ev.verse_id, 'free', 7965
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31',
       E'I will put my laws into their hearts (Jeremiah 31)',
       E'The writer brings forward the Ruach HaKodesh (Holy Spirit) as witness and quotes the prophet a second time in the epistle: *This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them; And their sins and iniquities will I remember no more* (Hebrews 10:16-17). This is Jeremiah''s new covenant, word for word: *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The covenant is the SAME law — *my law,* *my laws* — now moved from tables of stone into the inward parts. The change is internalization, not annulment; the Torah engraved on the heart, not discarded. And it comes with full pardon: *for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34). The old offerings made *a remembrance again of sins every year* (Hebrews 10:3); the new covenant reaches the forgiveness those offerings pointed toward — *their sins and iniquities will I remember no more.* Where this remission is reached, *there is no more offering for sin* (Hebrews 10:18). The sacrificial administration is finished because the forgiveness is complete — and the law it served is now written where it always belonged, on the heart.',
       sv.verse_id, ev.verse_id, 'free', 7966
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17',
       E'He that despised Moses'' law — the sorer punishment (Deuteronomy 17)',
       E'The once-for-all offering does not loosen the call to obedience — it sharpens it. *For if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins, But a certain fearful looking for of judgment and fiery indignation, which shall devour the adversaries* (Hebrews 10:26-27). The prophet had already named that fire: *Yahuah (LORD), when thy hand is lifted up, they will not see: but they shall see, and be ashamed for their envy at the people; yea, the fire of thine enemies shall devour them* (Isaiah 26:11). Then the writer argues from the standing authority of the Torah itself: *He that despised Moses’ law died without mercy under two or three witnesses* (Hebrews 10:28) — leaning on the very statute of Moses, *At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death; but at the mouth of one witness he shall not be put to death* (Deuteronomy 17:6). He does not set Moses'' law aside; he argues FROM it. If despising the law brought death without mercy, *of how much sorer punishment, suppose ye, shall he be thought worthy, who hath trodden under foot the Son of Elohim (God), and hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing* (Hebrews 10:29). The law of Moses still stands as the measure; the trampling of the Son is the sorer offense.',
       sv.verse_id, ev.verse_id, 'free', 7967
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32',
       E'Vengeance belongeth unto me — Yahuah shall judge his people (Deuteronomy 32)',
       E'The warning rests on the Song of Moses. *For we know him that hath said, Vengeance belongeth unto me, I will recompense, saith Yahuah (Lord). And again, Yahuah (Lord) shall judge his people* (Hebrews 10:30). Both lines come from the song Moses sang over Yashar''el (Israel): *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand* (Deuteronomy 32:35), and *For Yahuah (LORD) shall judge his people, and repent himself for his servants, when he seeth that their power is gone* (Deuteronomy 32:36). The settling of accounts is Yahuah''s (LORD''s) own, reserved in his hand — not abandoned, not abolished by the new covenant. And that Yahuah judges his own people is mercy and severity in one motion: he judges, and he *repent himself for his servants.* So *it is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31) — the same living Yahuah of the Song of Moses, who judges and vindicates his people. The new covenant does not retire his judgment; it leaves the recompence exactly where Moses sang it belonged.',
       sv.verse_id, ev.verse_id, 'free', 7968
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back',
       E'The just shall live by faith — the faithful draw not back (Habakkuk 2)',
       E'The chapter closes on the prophet Habakkuk. *For yet a little while, and he that shall come will come, and will not tarry. Now the just shall live by faith: but if any man draw back, my soul shall have no pleasure in him* (Hebrews 10:37-38). Both lines are Habakkuk''s. The coming is sure: *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* (Habakkuk 2:3). And the two souls stand side by side: *Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). This faith is faithfulness — the enduring trust that waits for what will surely come and does not draw back. It is the very word Paul takes up: *For therein is the righteousness of Elohim (God) revealed from faith to faith: as it is written, The just shall live by faith* (Romans 1:17). Paul and the writer to the Hebrews quote the same line of the same prophet, and in both it is emunah — the trust that justifies and the trust that perseveres. So the writer ends: *we are not of them who draw back unto perdition; but of them that believe to the saving of the soul* (Hebrews 10:39). The just live by clinging, walking on in faithfulness toward the One who will surely come.',
       sv.verse_id, ev.verse_id, 'free', 7969
  FROM _s222_h10_lookup sv, _s222_h10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=10 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=10 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
  -- thread: hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,5, 'canon','psalms',40,6, 1, E'Psalm 40:6 — *Sacrifice and offering thou didst not desire; mine ears hast thou opened* — the offerings were never the thing wanted; the opened ear and obedient body were.'),
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,7, 'canon','psalms',40,7, 2, E'Psalm 40:7 — *Lo, I come: in the volume of the book it is written of me* — the Son speaks the psalmist''s words; the whole scroll was written toward this coming.'),
  ('hebrews-10-a-body-hast-thou-prepared-me-lo-i-come-to-do-thy-will-psalm-40', 'canon','hebrews',10,7, 'canon','psalms',40,8, 3, E'Psalm 40:8 — *I delight to do thy will... yea, thy law is within my heart* — the will of Elohim and the law in the heart are one; the obedience the sacrifices pointed toward.'),
  -- thread: hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,9, 'canon','psalms',40,6, 1, E'Psalm 40:6 — *Sacrifice and offering thou didst not desire... burnt offering and sin offering hast thou not required* — the *first* taken away is the animal-offering system, named in the psalm itself.'),
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,9, 'canon','psalms',40,8, 2, E'Psalm 40:8 — *I delight to do thy will... yea, thy law is within my heart* — the *second* established is heart-obedience with the law treasured within, not the law abolished.'),
  ('hebrews-10-he-taketh-away-the-first-the-once-for-all-offering-of-the-body', 'canon','hebrews',10,10, 'canon','john',19,30, 3, E'John 19:30 — *It is finished: and he bowed his head, and gave up the ghost* — the once-for-all offering of the body was the moment the will was finished.'),
  -- thread: hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31
  ('hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31', 'canon','hebrews',10,16, 'canon','jeremiah',31,33, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* — the new covenant is the SAME law, now internalized, not annulled.'),
  ('hebrews-10-i-will-put-my-laws-into-their-hearts-jeremiah-31', 'canon','hebrews',10,17, 'canon','jeremiah',31,34, 2, E'Jeremiah 31:34 — *I will forgive their iniquity, and I will remember their sin no more* — the full pardon the old yearly offerings could only point toward.'),
  -- thread: hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17
  ('hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17', 'canon','hebrews',10,28, 'canon','deuteronomy',17,6, 1, E'Deuteronomy 17:6 — *At the mouth of two witnesses, or three witnesses, shall he that is worthy of death be put to death* — the writer argues FROM Moses'' standing law, not against it.'),
  ('hebrews-10-he-that-despised-moses-law-the-sorer-punishment-deuteronomy-17', 'canon','hebrews',10,27, 'canon','isaiah',26,11, 2, E'Isaiah 26:11 — *the fire of thine enemies shall devour them* — the *fiery indignation, which shall devour the adversaries* is the long-promised consuming of those who would not see.'),
  -- thread: hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32
  ('hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32', 'canon','hebrews',10,30, 'canon','deuteronomy',32,35, 1, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence* — the recompence is Yahuah''s own, reserved in his hand, sung in the Song of Moses.'),
  ('hebrews-10-vengeance-belongeth-unto-me-yahuah-shall-judge-his-people-deuteronomy-32', 'canon','hebrews',10,30, 'canon','deuteronomy',32,36, 2, E'Deuteronomy 32:36 — *Yahuah (LORD) shall judge his people, and repent himself for his servants* — judgment and vindication of his own people in one motion.'),
  -- thread: hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,37, 'canon','habakkuk',2,3, 1, E'Habakkuk 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed coming is sure; the call is to wait in faithfulness.'),
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,38, 'canon','habakkuk',2,4, 2, E'Habakkuk 2:4 — *the just shall live by his faith* — faithfulness, the enduring trust set against the proud soul that draws back.'),
  ('hebrews-10-the-just-shall-live-by-faith-habakkuk-2-the-faithful-draw-not-back', 'canon','hebrews',10,38, 'canon','romans',1,17, 3, E'Romans 1:17 — *as it is written, The just shall live by faith* — Paul quotes the same line of Habakkuk; the same emunah that justifies and perseveres.')
) AS m(slug, src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.slug
  JOIN _s222_h10_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s222_h10_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_11.sql (S222 Hebrews 11) -----
-- =====================================================================
-- S222 minion — HEBREWS 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 11.  Tag: h11 (temp view _s222_h11_lookup).  Sort band: 7971, step 1 (<=7979).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 11 is the faith/faithfulness (emunah) cloud — faith demonstrated by
-- obedient action, never mere mental assent. *Now faith is the substance of things hoped for, the
-- evidence of things not seen* (11:1): each witness is named for what faith MOVED him to DO — Abel
-- offered, Enoch walked and pleased Elohim, Noah prepared an ark, Abraham obeyed and went out and
-- offered Isaac, Moses refused Pharaoh's house and esteemed the reproach of Messiah, the prophets
-- subdued kingdoms and stopped lions' mouths, the martyrs were tortured and would not accept
-- deliverance that they might obtain a better resurrection. The extras layer is essential here: the
-- Enoch translation tradition (1 Enoch, Jubilees 4, Sirach 44:16) and the Maccabean martyrs
-- (2 Maccabees 7) carry witnesses the canon names only in summary. *These all died in faith, not
-- having received the promises... Elohim having provided some better thing for us* (11:13, 39-40) —
-- the faithful of every age wait together for the one resurrection.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1,3   faith the substance / the worlds framed by the word of Elohim
--           Tanakh: Genesis 1:1, Genesis 1:3 (the worlds framed by his word)  Extras: none warranted  NT: none added (carried in prose)
--   v.4     Abel's more excellent sacrifice
--           Tanakh: Genesis 4:4, Genesis 4:10 (the blood crieth)  Extras: Jubilees 4:2-3 (the offering accepted; the blood cried from the ground)  NT: none warranted
--   v.5-6   Enoch translated that he should not see death; pleased Elohim
--           Tanakh: Genesis 5:24 (walked with Elohim; was not, Elohim took him)  Extras: 1 Enoch 71:1,5 (spirit translated, ascended into the heavens), Jubilees 4:23 (taken from amongst the children of men, conducted into the Garden), Ecclesiasticus 44:16 (Enoch pleased Yahuah and was translated)  NT: none warranted
--   v.7     Noah warned of things not seen, prepared an ark
--           Tanakh: Genesis 6:13-14 (the end of all flesh; make thee an ark), Genesis 6:22 (so did Noah)  Extras: Ecclesiasticus 44:17 (Noah found perfect; left as a remnant)  NT: none warranted
--   v.8-19  Abraham called out, looked for a city, Sarah received strength, offered Isaac
--           Tanakh: Genesis 12:1 (get thee out), Genesis 15:5 (seed as the stars), Genesis 18:14 (is anything too hard), Genesis 21:2 (Sarah conceived), Genesis 22:2 (offer up Isaac), Genesis 22:17 (in blessing I will bless)  Extras: Ecclesiasticus 44:20-21 (proved and found faithful; the oath, the seed as the stars)  NT: none warranted
--   v.20-22 Isaac, Jacob, Joseph blessing; the bones of Joseph
--           Tanakh: Genesis 27:27-29 (Isaac blessed Jacob), Genesis 48:15-16 (Jacob blessed Joseph's sons), Genesis 50:24-25 (Joseph: carry up my bones)  Extras: none warranted  NT: none warranted
--   v.23-31 Moses refused Pharaoh's house, the passover/Red Sea, Jericho, Rahab
--           Tanakh: Exodus 2:2 (hid three months), Exodus 2:11 (looked on his brethren), Joshua 6:20 (the wall fell down flat), Joshua 2:11 (Rahab's confession), Joshua 6:25 (Rahab saved)  Extras: none warranted  NT: none warranted
--   v.32-35a prophets subdued kingdoms, stopped lions' mouths, quenched fire; women's dead raised
--           Tanakh: Daniel 6:22 (the lions' mouths shut), Daniel 3:27 (the fire had no power), 1 Kings 17:22 (the child's soul came again), 2 Kings 4:35 (the child sneezed and opened his eyes)  Extras: none warranted  NT: none warranted
--   v.35b-40 others tortured, not accepting deliverance, for a better resurrection
--           Tanakh: none warranted (the canon names the martyrs only in summary)  Extras: 2 Maccabees 7:9, 7:11, 7:14, 7:23, 7:29 (the mother and seven sons; raised up to everlasting life; receive them again)  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7971 hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1       (Tanakh)
--   7972 hebrews-11-abel-a-more-excellent-sacrifice-genesis-4                                  (Tanakh + extras: Jubilees)
--   7973 hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5                    (Tanakh + extras: 1 Enoch, Jubilees, Sirach)
--   7974 hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6                   (Tanakh + extras: Sirach)
--   7975 hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22                  (Tanakh + extras: Sirach)
--   7976 hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50          (Tanakh)
--   7977 hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6  (Tanakh)
--   7978 hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6   (Tanakh)
--   7979 hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees   (extras: 2 Maccabees)
-- =====================================================================

CREATE TEMP VIEW _s222_h11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1
  ('canon', 'hebrews', 11, 3, 'canon', 'genesis', 1, 1, 'free', E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1). *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3). The very first line of the Torah is the first act of faith the writer names: the worlds had no maker but the word of Elohim, and no material but his speaking. *Faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1) — and the unseen word that framed the seen creation is the ground of all that follows.'),
  ('canon', 'hebrews', 11, 3, 'canon', 'genesis', 1, 3, 'free', E'*And Elohim (God) said, Let there be light: and there was light.* (Genesis 1:3). *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3). The pattern of the whole chapter is set here: Elohim speaks, and what was not seen becomes seen. *Let there be light: and there was light* is the word framing the world out of no prior thing — exactly the unseen-becoming-evidence that faith lays hold of.'),
  -- thread: hebrews-11-abel-a-more-excellent-sacrifice-genesis-4
  ('canon', 'hebrews', 11, 4, 'canon', 'genesis', 4, 4, 'free', E'*And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* (Genesis 4:4). *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts* (Hebrews 11:4). The first man of faith brought the firstlings and the fat — the best, given in trust — and Yahuah had respect unto it. The respect Yahuah showed the offering is the very witness Hebrews names: Elohim *testifying of his gifts* that Abel was righteous.'),
  ('canon', 'hebrews', 11, 4, 'canon', 'genesis', 4, 10, 'free', E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10). *By faith Abel offered... and by it he being dead yet speaketh* (Hebrews 11:4). Abel is dead, and yet he speaks — the writer hears the same voice Yahuah heard: *the voice of thy brother''s blood crieth unto me from the ground.* The righteous man slain is not silenced; his blood still cries, and his faith still witnesses to every generation that comes after.'),
  ('canon', 'hebrews', 11, 4, 'jubilees', 'jubilees', 4, 2, 'extras', E'*And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* (Jubilees 4:2). *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain* (Hebrews 11:4). Jubilees names plainly what Genesis shows and Hebrews weighs: Elohim *accepted the sacrifice of Abel, and did not accept the offering of Cain.* The acceptance is the witness; the rejected brother''s murder follows the accepted brother''s faith.'),
  ('canon', 'hebrews', 11, 4, 'jubilees', 'jubilees', 4, 3, 'extras', E'*And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him.* (Jubilees 4:3). *By faith Abel offered... and by it he being dead yet speaketh* (Hebrews 11:4). Jubilees hears the same crying blood the writer of Hebrews hears: *his blood cried from the ground to heaven.* The dead man speaks still — the blood of the first faithful witness lifting its voice to heaven, the pattern of every righteous one slain for his offering after him.'),
  -- thread: hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5
  ('canon', 'hebrews', 11, 5, 'canon', 'genesis', 5, 24, 'free', E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The Torah''s spare line — *he was not; for Elohim took him* — is the translation Hebrews names. Enoch alone in the genealogy of death does not die; the man who *walked with Elohim* is taken by Elohim, the testimony of a life that pleased him.'),
  ('canon', 'hebrews', 11, 5, 'enoch', '1-enoch', 71, 1, 'extras', E'*And it came to pass after this that my spirit was carried off and it ascended into the heavens: And I saw the holy sons of Elohim (God).* (1 Enoch 71:1). *By faith Enoch was translated that he should not see death... because Elohim (God) had translated him* (Hebrews 11:5). The Torah says only that Elohim took him; the Enoch tradition shows the taking from the inside — *my spirit was carried off and it ascended into the heavens.* The man who pleased Elohim is brought up among *the holy sons of Elohim,* translated rather than buried.'),
  ('canon', 'hebrews', 11, 5, 'enoch', '1-enoch', 71, 5, 'extras', E'*And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire.* (1 Enoch 71:5). *By faith Enoch was translated that he should not see death* (Hebrews 11:5). The word Hebrews uses for Enoch — *translated* — is the word the vision uses: *he translated my spirit into the heaven of heavens.* The witness who would not see death is carried into the very dwelling-place of Elohim, among the first fathers and the righteous who dwell there from the beginning of the world.'),
  ('canon', 'hebrews', 11, 5, 'jubilees', 'jubilees', 4, 23, 'extras', E'*And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* (Jubilees 4:23). *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). Jubilees fills out the *was not found* of the Torah: Enoch *was taken from amongst the children of men,* conducted *in majesty and honour* into the Garden. The man who pleased Elohim is removed from the company of the dying and set in the place of the living.'),
  ('canon', 'hebrews', 11, 5, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'*Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* (Ecclesiasticus 44:16). *By faith Enoch was translated that he should not see death... for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). Ben Sira and the writer of Hebrews use the same two words of the same man: he *pleased* Elohim, and he *was translated.* The testimony that he pleased Elohim is the cause; the translation is its seal.'),
  ('canon', 'hebrews', 11, 6, 'canon', 'genesis', 5, 24, 'free', E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him* (Hebrews 11:6). Enoch is the proof of the principle the writer draws out: a man who *walked with Elohim* is a man who believed *that he is* and sought him diligently — and the reward of that seeking was to be taken to him rather than left to death.'),
  -- thread: hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6
  ('canon', 'hebrews', 11, 7, 'canon', 'genesis', 6, 13, 'free', E'*And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* (Genesis 6:13). *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house* (Hebrews 11:7). The warning of *things not seen as yet* is this word: a flood not yet come, an end of all flesh announced before a drop had fallen. Noah believed the unseen word and built — faith laying hold of the evidence of what could not yet be seen.'),
  ('canon', 'hebrews', 11, 7, 'canon', 'genesis', 6, 14, 'free', E'*Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* (Genesis 6:14). *By faith Noah... moved with fear, prepared an ark to the saving of his house* (Hebrews 11:7). The command to *make thee an ark* is the obedient action faith produced. Noah did not see the water; he heard the word and took up the gopher wood. The ark itself is faith made visible — the substance of a thing hoped for, framed plank by plank against an unseen judgment.'),
  ('canon', 'hebrews', 11, 7, 'canon', 'genesis', 6, 22, 'free', E'*Thus did Noah; according to all that Elohim (God) commanded him, so did he.* (Genesis 6:22). *By faith Noah... prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). *According to all that Elohim commanded him, so did he* is the whole of Noah''s faith in one line — not assent but obedience, the doing of all that was commanded. The righteousness which is by faith is the righteousness of the man who *did* the word he could not yet see fulfilled.'),
  ('canon', 'hebrews', 11, 7, 'apocrypha', 'ecclesiasticus', 44, 17, 'extras', E'*Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came.* (Ecclesiasticus 44:17). *By faith Noah... became heir of the righteousness which is by faith* (Hebrews 11:7). Ben Sira names the same righteousness Hebrews names — Noah *found perfect and righteous* — and adds the office it carried: *left as a remnant to the earth.* The faithful builder is the seed through whom the world goes on, the heir of righteousness preserved through the wrath.'),
  -- thread: hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22
  ('canon', 'hebrews', 11, 8, 'canon', 'genesis', 12, 1, 'free', E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* (Genesis 12:1). *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8). The call is exactly *get thee out... unto a land that I will shew thee* — a destination withheld, an inheritance promised but unseen. Abraham *obeyed; and he went out, not knowing whither he went* — faith walking on the bare word of Yahuah.'),
  ('canon', 'hebrews', 11, 11, 'canon', 'genesis', 18, 14, 'free', E'*Is any thing too hard for Yahuah (LORD)? At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son.* (Genesis 18:14). *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). The promise that drew Sarah''s faith is this word at the tent door: *is anything too hard for Yahuah?* She *judged him faithful who had promised,* and the One who cannot fail in his word gave the strength to conceive past age.'),
  ('canon', 'hebrews', 11, 11, 'canon', 'genesis', 21, 2, 'free', E'*For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* (Genesis 21:2). *Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised* (Hebrews 11:11). The faith is vindicated in the birth: *Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim had spoken.* The set time kept proves the One who promised faithful — the substance of a thing hoped for made flesh in Isaac.'),
  ('canon', 'hebrews', 11, 12, 'canon', 'genesis', 15, 5, 'free', E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The seed *as the stars of the sky* is the very promise of the night Yahuah brought Abraham forth: *tell the stars... so shall thy seed be.* From one man *as good as dead* came the innumerable seed, because he believed the star-promise of the unseen.'),
  ('canon', 'hebrews', 11, 17, 'canon', 'genesis', 22, 2, 'free', E'*And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of.* (Genesis 22:2). *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son* (Hebrews 11:17). The trial Hebrews names is this command — *take now thy son, thine only son Isaac... and offer him.* The man who held the promise of seed through Isaac was asked to lay Isaac on the altar, and by faith he obeyed.'),
  ('canon', 'hebrews', 11, 18, 'canon', 'genesis', 22, 17, 'free', E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies;* (Genesis 22:17). *Of whom it was said, That in Isaac shall thy seed be called: Accounting that Elohim (God) was able to raise him up, even from the dead* (Hebrews 11:18-19). The oath sworn on the mount Abraham climbed with his son — *in blessing I will bless thee, and in multiplying I will multiply thy seed* — is why he could lift the knife: the seed was promised through Isaac, so Elohim must be *able to raise him up, even from the dead.* Faith reasoned to resurrection from the unbreakable promise.'),
  ('canon', 'hebrews', 11, 17, 'apocrypha', 'ecclesiasticus', 44, 20, 'extras', E'*Who kept the law of the Most High, and was in covenant with him: he established the covenant in his flesh; and when he was proved, he was found faithful.* (Ecclesiasticus 44:20). *By faith Abraham, when he was tried, offered up Isaac* (Hebrews 11:17). Ben Sira and Hebrews name the same testing of the same man: *when he was proved, he was found faithful.* The faith that is faithfulness — kept law, covenant in the flesh, the proving on Moriah — is the obedient trust Hebrews crowns. Abraham was *tried* and *found faithful.*'),
  ('canon', 'hebrews', 11, 12, 'apocrypha', 'ecclesiasticus', 44, 21, 'extras', E'*Therefore he assured him by an oath, that he would bless the nations in his seed, and that he would multiply him as the dust of the earth, and exalt his seed as the stars, and cause them to inherit from sea to sea, and from the river to the utmost part of the land.* (Ecclesiasticus 44:21). *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude* (Hebrews 11:12). The oath Ben Sira recalls — *exalt his seed as the stars* — is the ground of the innumerable multitude Hebrews counts. From the one man came the seed as the stars because Yahuah *assured him by an oath,* and the faithful one believed the oath.'),
  -- thread: hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50
  ('canon', 'hebrews', 11, 20, 'canon', 'genesis', 27, 27, 'free', E'*And he came near, and kissed him: and he smelled the smell of his raiment, and blessed him, and said, See, the smell of my son is as the smell of a field which Yahuah (LORD) hath blessed:* (Genesis 27:27). *By faith Isaac blessed Jacob and Esau concerning things to come* (Hebrews 11:20). The blessing Isaac pronounced over Jacob — dew of heaven, fatness of the earth, dominion — was faith reaching into *things to come,* speaking over an unseen future as though already given. The aged, dim-eyed patriarch blessed by faith, and the word held.'),
  ('canon', 'hebrews', 11, 21, 'canon', 'genesis', 48, 15, 'free', E'*And he blessed Joseph, and said, Elohim (God), before whom my fathers Abraham and Isaac did walk, the Elohim (God) which fed me all my life long unto this day,* (Genesis 48:15). *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff* (Hebrews 11:21). The dying Jacob blessed Ephraim and Manasseh by faith, naming *the Elohim before whom my fathers Abraham and Isaac did walk* — binding the generation to come into the covenant of the fathers, and worshipping as he leaned upon his staff.'),
  ('canon', 'hebrews', 11, 21, 'canon', 'genesis', 48, 16, 'free', E'*The Angel which redeemed me from all evil, bless the lads; and let my name be named on them, and the name of my fathers Abraham and Isaac; and let them grow into a multitude in the midst of the earth.* (Genesis 48:16). *By faith Jacob, when he was a dying, blessed both the sons of Joseph* (Hebrews 11:21). The blessing crosses his hands over Joseph''s sons and calls on *the Angel which redeemed me from all evil* — the dying man''s faith setting the covenant name on the lads, that they *grow into a multitude in the midst of the earth.* Faith blessed the unseen multitude into being.'),
  ('canon', 'hebrews', 11, 22, 'canon', 'genesis', 50, 24, 'free', E'*And Joseph said unto his brethren, I die: and Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob.* (Genesis 50:24). *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). The departing Joseph foretold is this dying word: *Elohim will surely visit you, and bring you out of this land unto the land which he sware.* Faith saw the exodus generations before it came, certain of the oath to the fathers.'),
  ('canon', 'hebrews', 11, 22, 'canon', 'genesis', 50, 25, 'free', E'*And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence.* (Genesis 50:25). *By faith Joseph, when he died... gave commandment concerning his bones* (Hebrews 11:22). The commandment concerning his bones is this oath: *ye shall carry up my bones from hence.* So sure was Joseph of the visitation and the land that he bound the people to carry his bones home — faith staking even his burial on a promise not yet seen.'),
  -- thread: hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6
  ('canon', 'hebrews', 11, 23, 'canon', 'exodus', 2, 2, 'free', E'*And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* (Exodus 2:2). *By faith Moses, when he was born, was hid three months of his parents, because they saw he was a proper child; and they were not afraid of the king''s commandment* (Hebrews 11:23). The hiding Hebrews names is this — *she hid him three months* — set against Pharaoh''s edict to drown the sons. The parents'' faith was the first act of the deliverer''s story: they feared Elohim and not *the king''s commandment.*'),
  ('canon', 'hebrews', 11, 24, 'canon', 'exodus', 2, 11, 'free', E'*And it came to pass in those days, when Moses was grown, that he went out unto his brethren, and looked on their burdens: and he spied an Egyptian smiting an Hebrew, one of his brethren.* (Exodus 2:11). *By faith Moses, when he was come to years, refused to be called the son of Pharaoh''s daughter; Choosing rather to suffer affliction with the people of Elohim (God)* (Hebrews 11:24-25). Moses *come to years* went out to *his brethren* and owned their burdens as his own — the refusal of Pharaoh''s house enacted. He esteemed *the reproach of Messiah greater riches than the treasures in Egypt* (Hebrews 11:26), choosing the afflicted people of Elohim over the court that raised him.'),
  ('canon', 'hebrews', 11, 29, 'canon', 'exodus', 14, 22, 'free', E'*And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* (Exodus 14:22). *By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The passage Hebrews names is this crossing — *into the midst of the sea upon the dry ground,* the waters a wall on either hand. The same path that saved the believing drowned the pursuers; faith walked the dry land between the standing waters.'),
  ('canon', 'hebrews', 11, 30, 'canon', 'joshua', 6, 20, 'free', E'*So the people shouted when the priests blew with the trumpets... that the wall fell down flat, so that the people went up into the city, every man straight before him, and they took the city.* (Joshua 6:20). *By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30). The falling wall Hebrews names is this — *the wall fell down flat* at the trumpet and the shout, after the seven days'' compassing. No ram, no siege; only the obedience of faith circling the city until Yahuah threw down the stones.'),
  ('canon', 'hebrews', 11, 31, 'canon', 'joshua', 2, 11, 'free', E'*And as soon as we had heard these things, our hearts did melt, neither did there remain any more courage in any man, because of you: for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath.* (Joshua 2:11). *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31). Rahab''s faith is this confession in the doomed city: *Yahuah your Elohim, he is Elohim in heaven above, and in earth beneath.* While the city *believed not,* she believed, and received the spies with peace — and was saved out of Jericho''s fall.'),
  ('canon', 'hebrews', 11, 31, 'canon', 'joshua', 6, 25, 'free', E'*And Joshua saved Rahab the harlot alive, and her father''s household, and all that she had; and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers, which Joshua sent to spy out Jericho.* (Joshua 6:25). *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31). The saving Hebrews names is this — *Joshua saved Rahab the harlot alive... and she dwelleth in Yashar''el even unto this day.* The foreign woman who believed is absorbed into the covenant people and her faith made her dwelling there; the rest of the city perished.'),
  -- thread: hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6
  ('canon', 'hebrews', 11, 33, 'canon', 'daniel', 6, 22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33). The stopping of the lions'' mouths Hebrews names is this night in the den: *my Elohim hath sent his angel, and hath shut the lions'' mouths.* Daniel would not cease his prayer at the king''s decree, and his faith kept him whole among the lions.'),
  ('canon', 'hebrews', 11, 34, 'canon', 'daniel', 3, 27, 'free', E'*And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* (Daniel 3:27). *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong* (Hebrews 11:34). The quenched violence of fire Hebrews names is this furnace: men *upon whose bodies the fire had no power.* They would not bow to the image, and a fourth *like the Son of Elohim* walked with them in the flames — faith that quenched the fire by refusing to deny their Elohim.'),
  ('canon', 'hebrews', 11, 35, 'canon', '1-kings', 17, 22, 'free', E'*And Yahuah (LORD) heard the voice of Elijah; and the soul of the child came into him again, and he revived.* (1 Kings 17:22). *Women received their dead raised to life again* (Hebrews 11:35). The first of the dead raised and restored to a woman is this child of the widow of Zarephath: *the soul of the child came into him again, and he revived.* The prophet stretched himself upon the child and Yahuah heard — the dead son given back alive to his mother.'),
  ('canon', 'hebrews', 11, 35, 'canon', '2-kings', 4, 35, 'free', E'*Then he returned, and walked in the house to and fro; and went up, and stretched himself upon him: and the child sneezed seven times, and the child opened his eyes.* (2 Kings 4:35). *Women received their dead raised to life again* (Hebrews 11:35). The Shunammite''s son is the second woman''s dead raised: *the child sneezed seven times, and the child opened his eyes.* Elisha shut the door and prayed and lay upon the dead boy, and the child was given back living — the raised dead Hebrews sets at the head of the witnesses'' afflictions.'),
  -- thread: hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees
  ('canon', 'hebrews', 11, 35, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'*And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9). *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). Here is the witness the canon names only in summary, made flesh: the second of seven brothers, dying under torture rather than transgress, declaring *the King of the world shall raise us up, who have died for his laws, to everlasting life.* This is the *better resurrection* — chosen over the deliverance that would have cost them the law.'),
  ('canon', 'hebrews', 11, 35, 'apocrypha', '2-maccabees', 7, 11, 'extras', E'*And said courageously, These I had from heaven; and for his laws I despise them; and from him I hope to receive them again.* (2 Maccabees 7:11). *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The third brother stretches out his tongue and his hands to be cut off, certain of the resurrection: *from him I hope to receive them again.* The torn body is surrendered in the hope of being raised whole — the very faith Hebrews crowns in the witnesses *not accepting deliverance.*'),
  ('canon', 'hebrews', 11, 35, 'apocrypha', '2-maccabees', 7, 14, 'extras', E'*So when he was ready to die he said thus, It is good, being put to death by men, to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life.* (2 Maccabees 7:14). *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The fourth brother names the two resurrections the framework holds — the faithful *raised up again,* the persecutor with *no resurrection to life.* He would rather be *put to death by men* and *look for hope from Yahuah* than escape; this is the better resurrection chosen over a bought deliverance.'),
  ('canon', 'hebrews', 11, 35, 'apocrypha', '2-maccabees', 7, 23, 'extras', E'*But doubtless the Creator of the world, who formed the generation of man, and found out the beginning of all things, will also of his own mercy give you breath and life again, as you now regard not your own selves for his laws'' sake.* (2 Maccabees 7:23). *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The mother urges her sons to die by the same faith: the *Creator of the world... will also of his own mercy give you breath and life again.* She reasons from creation to resurrection — the One who first gave breath can give it again — and spends her seven sons on that hope rather than the law.'),
  ('canon', 'hebrews', 11, 35, 'apocrypha', '2-maccabees', 7, 29, 'extras', E'*Fear not this tormentor, but, being worthy of your brothers, take your death that I may receive you again in mercy with your brothers.* (2 Maccabees 7:29). *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The mother''s last word to her youngest is the better resurrection in a sentence: *take your death that I may receive you again in mercy with your brothers.* Death accepted, deliverance refused, the reunion looked for past the grave — the faith of those of whom *the world was not worthy* (Hebrews 11:38).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT th.slug, th.title, th.summary_md, sv.verse_id, ev.verse_id, th.tier_required::content_tier, th.sort_order
  FROM (VALUES
  ('hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1',
   E'Faith the Substance of Things Hoped For — the Worlds Framed by His Word (Genesis 1)',
   E'The chapter opens with the definition that governs every witness that follows: *Now faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1). The first thing faith lays hold of is the creation itself — *Through faith we understand that the worlds were framed by the word of Elohim (God), so that things which are seen were not made of things which do appear* (Hebrews 11:3). The Torah''s opening line is the first unseen-becoming-seen: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1), and *And Elohim (God) said, Let there be light: and there was light* (Genesis 1:3). The worlds had no maker but the word and no material but the speaking — the visible framed out of what does not appear. This is the ground of the whole cloud of witnesses: the unseen word of Elohim is the most substantial thing there is.',
   'free', 7971, 'hebrews', 11, 1, 3),
  ('hebrews-11-abel-a-more-excellent-sacrifice-genesis-4',
   E'Abel — a More Excellent Sacrifice, and Dead Yet Speaketh (Genesis 4)',
   E'The first named witness is the first man slain for his faith. *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). The Torah shows the offering and the respect: *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4). Jubilees names it plainly — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2). And the dead man still speaks: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10), which Jubilees hears as *his blood cried from the ground to heaven* (Jubilees 4:3). The righteous one slain for his offering is not silenced; his faith witnesses to every generation after him.',
   'extras', 7972, 'hebrews', 11, 4, 4),
  ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5',
   E'Enoch Translated That He Should Not See Death (Genesis 5; 1 Enoch; Jubilees; Sirach 44)',
   E'In a genealogy where every man ends *and he died,* one man does not. *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The Torah''s spare line is the seed: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The restored library shows the taking from inside the vision — *my spirit was carried off and it ascended into the heavens: And I saw the holy sons of Elohim (God)* (1 Enoch 71:1), *he translated my spirit into the heaven of heavens* (1 Enoch 71:5) — and Jubilees names the removal: *he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). Ben Sira binds the two words Hebrews uses: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations* (Ecclesiasticus 44:16). And the writer draws the principle out: *without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him* (Hebrews 11:6). Enoch sought, and the reward of his seeking was to be taken to the One he sought, rather than left to death.',
   'extras', 7973, 'hebrews', 11, 5, 6),
  ('hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6',
   E'Noah — Warned of Things Not Seen, Prepared an Ark (Genesis 6; Sirach 44)',
   E'Faith acts on a word about a thing that has not yet appeared. *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). The warning was the announced flood — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth* (Genesis 6:13) — and the obedient action was the building: *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch* (Genesis 6:14). The whole of Noah''s faith is one line of doing: *Thus did Noah; according to all that Elohim (God) commanded him, so did he* (Genesis 6:22). Ben Sira names the same righteousness and the office it carried: *Noah was found perfect and righteous; in the time of wrath he was taken in exchange for the world; therefore was he left as a remnant to the earth, when the flood came* (Ecclesiasticus 44:17). The ark is faith made visible — the substance of a thing hoped for, framed plank by plank against an unseen judgment.',
   'extras', 7974, 'hebrews', 11, 7, 7),
  ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22',
   E'Abraham Obeyed and Looked for a City — Sarah Received Strength — Isaac Offered (Genesis 12, 15, 18, 21, 22; Sirach 44)',
   E'The longest witness in the cloud is the friend of Elohim, whose whole life was faith walked out. *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8) — the call was *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1), a destination withheld and an inheritance unseen. He *looked for a city which hath foundations, whose builder and maker is Elohim (God)* (Hebrews 11:10). Sarah too: *Through faith also Sara herself received strength to conceive seed... because she judged him faithful who had promised* (Hebrews 11:11), believing the word at the tent door — *Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14) — vindicated when *Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken* (Genesis 21:2). From the one man *as good as dead* sprang seed *as the stars of the sky in multitude* (Hebrews 11:12), the very star-promise of the night Yahuah brought him forth — *tell the stars... So shall thy seed be* (Genesis 15:5). And the trial: *By faith Abraham, when he was tried, offered up Isaac* (Hebrews 11:17), commanded *Take now thy son, thine only son Isaac, whom thou lovest... and offer him* (Genesis 22:2). Because the seed was promised through Isaac — and the oath stood, *in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven* (Genesis 22:17) — he reckoned *that Elohim (God) was able to raise him up, even from the dead* (Hebrews 11:19). Ben Sira names the proving: *when he was proved, he was found faithful* (Ecclesiasticus 44:20); and the oath: *exalt his seed as the stars* (Ecclesiasticus 44:21). Faith that is faithfulness reasoned its way to resurrection from an unbreakable promise.',
   'extras', 7975, 'hebrews', 11, 8, 19),
  ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50',
   E'The Patriarchs'' Blessing and the Bones of Joseph (Genesis 27, 48, 50)',
   E'Faith speaks over an unseen future and stakes even a burial on a promise. *By faith Isaac blessed Jacob and Esau concerning things to come* (Hebrews 11:20) — the dim-eyed patriarch reaching forward, *See, the smell of my son is as the smell of a field which Yahuah (LORD) hath blessed* (Genesis 27:27). *By faith Jacob, when he was a dying, blessed both the sons of Joseph; and worshipped, leaning upon the top of his staff* (Hebrews 11:21), naming over them *the Elohim (God), before whom my fathers Abraham and Isaac did walk* (Genesis 48:15) and *the Angel which redeemed me from all evil, bless the lads; and let my name be named on them* (Genesis 48:16) — the covenant set on the generation to come. *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22): so sure of the visitation — *Elohim (God) will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob* (Genesis 50:24) — that he bound the people by oath, *ye shall carry up my bones from hence* (Genesis 50:25). Each blessed and commanded as though the unseen were already given.',
   'free', 7976, 'hebrews', 11, 20, 22),
  ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6',
   E'Moses Esteemed the Reproach of Messiah — the Passover, the Red Sea, Jericho, and Rahab (Exodus 2, 14; Joshua 2, 6)',
   E'Faith chooses the afflicted people of Elohim over the treasures of the world, and walks through walls of water and walls of stone. Moses was first kept by his parents'' faith — *when she saw him that he was a goodly child, she hid him three months* (Exodus 2:2) — *and they were not afraid of the king''s commandment* (Hebrews 11:23). Grown, *By faith Moses... refused to be called the son of Pharaoh''s daughter; Choosing rather to suffer affliction with the people of Elohim (God)* (Hebrews 11:24-25): *he went out unto his brethren, and looked on their burdens* (Exodus 2:11), *Esteeming the reproach of Messiah (Christ) greater riches than the treasures in Egypt* (Hebrews 11:26). *By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29) — *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). *By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30) — *the wall fell down flat, so that the people went up into the city* (Joshua 6:20). And the foreign woman who believed when her city would not: *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31), confessing *Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11), so that *Joshua saved Rahab the harlot alive... and she dwelleth in Yashar''el (Israel) even unto this day* (Joshua 6:25) — taken into the covenant people by her faith while the city perished.',
   'free', 7977, 'hebrews', 11, 23, 31),
  ('hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6',
   E'Stopped the Mouths of Lions and Quenched the Violence of Fire (Daniel 3, 6; 1 Kings 17; 2 Kings 4)',
   E'The summary of the prophets and the faithful is filled out by the deliverances the writer gestures at. *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33) — Daniel in the den: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22), because he would not cease his prayer at the king''s decree. *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong* (Hebrews 11:34) — the three in the furnace, *upon whose bodies the fire had no power, nor was an hair of their head singed* (Daniel 3:27), who would not bow to the image and walked unharmed with a fourth *like the Son of Elohim (God).* And the dead raised: *Women received their dead raised to life again* (Hebrews 11:35) — the widow of Zarephath''s son, *the soul of the child came into him again, and he revived* (1 Kings 17:22), and the Shunammite''s son, *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35). Faith subdued the lion, quenched the fire, and received back the dead.',
   'free', 7978, 'hebrews', 11, 32, 35),
  ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees',
   E'Tortured, Not Accepting Deliverance, That They Might Obtain a Better Resurrection — the Mother and Seven Sons (2 Maccabees 7)',
   E'The cloud darkens into the witnesses who were not delivered, and the restored library names them where the canon only summarizes: *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). These are the mother and her seven sons, who would die rather than transgress the law. The second declares, *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9); the third stretches out his hands to be cut off — *from him I hope to receive them again* (2 Maccabees 7:11); the fourth names the two resurrections the framework holds, *to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life* (2 Maccabees 7:14). The mother reasons from creation to resurrection: *the Creator of the world, who formed the generation of man... will also of his own mercy give you breath and life again* (2 Maccabees 7:23), and sends her youngest to die — *take your death that I may receive you again in mercy with your brothers* (2 Maccabees 7:29). They refused the deliverance that would have cost them the law, and looked for the better resurrection past the grave. These are they *of whom the world was not worthy* (Hebrews 11:38), who *received not the promise* in their lifetime because *Elohim (God) having provided some better thing for us, that they without us should not be made perfect* (Hebrews 11:40) — the faithful of every age waiting together for the one resurrection.',
   'extras', 7979, 'hebrews', 11, 35, 40)
  ) AS th(slug, title, summary_md, tier_required, sort_order, anchor_book, anchor_chapter, anchor_verse_start, anchor_verse_end)
  JOIN _s222_h11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug=th.anchor_book AND sv.chapter_number=th.anchor_chapter AND sv.verse_number=th.anchor_verse_start
  JOIN _s222_h11_lookup ev ON ev.edition_slug='canon' AND ev.book_slug=th.anchor_book AND ev.chapter_number=th.anchor_chapter AND ev.verse_number=th.anchor_verse_end
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1
    ('hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1', 'canon','hebrews',11,3, 'canon','genesis',1,1, 1, E'*In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1) — the worlds *framed by the word of Elohim* (Hebrews 11:3), the first unseen made seen.'),
    ('hebrews-11-faith-the-substance-of-things-hoped-for-the-worlds-framed-genesis-1', 'canon','hebrews',11,3, 'canon','genesis',1,3, 2, E'*Let there be light: and there was light* (Genesis 1:3) — Elohim speaks and the unseen becomes evidence, the pattern faith lays hold of (Hebrews 11:1,3).'),
    -- hebrews-11-abel-a-more-excellent-sacrifice-genesis-4
    ('hebrews-11-abel-a-more-excellent-sacrifice-genesis-4', 'canon','hebrews',11,4, 'canon','genesis',4,4, 1, E'*Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4) — the respect is the *witness that he was righteous* (Hebrews 11:4).'),
    ('hebrews-11-abel-a-more-excellent-sacrifice-genesis-4', 'canon','hebrews',11,4, 'canon','genesis',4,10, 2, E'*The voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10) — the dead man who *yet speaketh* (Hebrews 11:4).'),
    ('hebrews-11-abel-a-more-excellent-sacrifice-genesis-4', 'canon','hebrews',11,4, 'jubilees','jubilees',4,2, 3, E'*Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2) — the *more excellent sacrifice* named plainly (Hebrews 11:4).'),
    ('hebrews-11-abel-a-more-excellent-sacrifice-genesis-4', 'canon','hebrews',11,4, 'jubilees','jubilees',4,3, 4, E'*His blood cried from the ground to heaven* (Jubilees 4:3) — the slain witness still crying, *being dead yet speaketh* (Hebrews 11:4).'),
    -- hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,5, 'canon','genesis',5,24, 1, E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — *translated that he should not see death* (Hebrews 11:5).'),
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,5, 'enoch','1-enoch',71,1, 2, E'*My spirit was carried off and it ascended into the heavens* (1 Enoch 71:1) — the taking shown from within, among *the holy sons of Elohim* (Hebrews 11:5).'),
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,5, 'enoch','1-enoch',71,5, 3, E'*He translated my spirit into the heaven of heavens* (1 Enoch 71:5) — the very word Hebrews uses, *translated* (Hebrews 11:5).'),
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,5, 'jubilees','jubilees',4,23, 4, E'*He was taken from amongst the children of men... in majesty and honour* (Jubilees 4:23) — the *was not found* of the Torah filled out (Hebrews 11:5).'),
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,5, 'apocrypha','ecclesiasticus',44,16, 5, E'*Enoch pleased Yahuah (God), and was translated* (Ecclesiasticus 44:16) — the same two words, *pleased* and *translated* (Hebrews 11:5).'),
    ('hebrews-11-enoch-translated-that-he-should-not-see-death-genesis-5', 'canon','hebrews',11,6, 'canon','genesis',5,24, 6, E'*Enoch walked with Elohim (God)* (Genesis 5:24) — the proof that *without faith it is impossible to please him* (Hebrews 11:6).'),
    -- hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6
    ('hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6', 'canon','hebrews',11,7, 'canon','genesis',6,13, 1, E'*The end of all flesh is come before me* (Genesis 6:13) — the warning of *things not seen as yet* (Hebrews 11:7).'),
    ('hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6', 'canon','hebrews',11,7, 'canon','genesis',6,14, 2, E'*Make thee an ark of gopher wood* (Genesis 6:14) — the obedient action, the ark *prepared to the saving of his house* (Hebrews 11:7).'),
    ('hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6', 'canon','hebrews',11,7, 'canon','genesis',6,22, 3, E'*According to all that Elohim (God) commanded him, so did he* (Genesis 6:22) — the *righteousness which is by faith* (Hebrews 11:7).'),
    ('hebrews-11-noah-warned-of-things-not-seen-prepared-an-ark-genesis-6', 'canon','hebrews',11,7, 'apocrypha','ecclesiasticus',44,17, 4, E'*Noah was found perfect and righteous... left as a remnant to the earth* (Ecclesiasticus 44:17) — the heir of righteousness preserved through the wrath (Hebrews 11:7).'),
    -- hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,8, 'canon','genesis',12,1, 1, E'*Get thee out of thy country... unto a land that I will shew thee* (Genesis 12:1) — Abraham *obeyed; and he went out, not knowing whither he went* (Hebrews 11:8).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,11, 'canon','genesis',18,14, 2, E'*Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14) — the promise Sarah *judged him faithful who had promised* (Hebrews 11:11).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,11, 'canon','genesis',21,2, 3, E'*Sarah conceived, and bare Abraham a son in his old age, at the set time* (Genesis 21:2) — the faith vindicated, strength *to conceive seed* (Hebrews 11:11).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,12, 'canon','genesis',15,5, 4, E'*Tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5) — the seed *as the stars of the sky in multitude* (Hebrews 11:12).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,17, 'canon','genesis',22,2, 5, E'*Take now thy son, thine only son Isaac... and offer him* (Genesis 22:2) — the trial in which Abraham *offered up Isaac* (Hebrews 11:17).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,18, 'canon','genesis',22,17, 6, E'*In blessing I will bless thee, and in multiplying I will multiply thy seed* (Genesis 22:17) — the oath behind *that in Isaac shall thy seed be called* (Hebrews 11:18).'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,17, 'apocrypha','ecclesiasticus',44,20, 7, E'*When he was proved, he was found faithful* (Ecclesiasticus 44:20) — Abraham *when he was tried* (Hebrews 11:17), faith that is faithfulness.'),
    ('hebrews-11-abraham-looked-for-a-city-and-offered-isaac-genesis-12-22', 'canon','hebrews',11,12, 'apocrypha','ecclesiasticus',44,21, 8, E'*Exalt his seed as the stars* (Ecclesiasticus 44:21) — the oath behind the seed *so many as the stars of the sky* (Hebrews 11:12).'),
    -- hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50
    ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50', 'canon','hebrews',11,20, 'canon','genesis',27,27, 1, E'*The smell of my son is as the smell of a field which Yahuah (LORD) hath blessed* (Genesis 27:27) — Isaac *blessed Jacob and Esau concerning things to come* (Hebrews 11:20).'),
    ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50', 'canon','hebrews',11,21, 'canon','genesis',48,15, 2, E'*Elohim (God), before whom my fathers Abraham and Isaac did walk* (Genesis 48:15) — the dying Jacob *blessed both the sons of Joseph* (Hebrews 11:21).'),
    ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50', 'canon','hebrews',11,21, 'canon','genesis',48,16, 3, E'*Let my name be named on them, and the name of my fathers Abraham and Isaac* (Genesis 48:16) — the covenant set on the lads by faith (Hebrews 11:21).'),
    ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50', 'canon','hebrews',11,22, 'canon','genesis',50,24, 4, E'*Elohim (God) will surely visit you, and bring you out of this land* (Genesis 50:24) — Joseph''s *mention of the departing of the children of Yashar''el* (Hebrews 11:22).'),
    ('hebrews-11-the-patriarchs-blessing-and-the-bones-of-joseph-genesis-27-48-50', 'canon','hebrews',11,22, 'canon','genesis',50,25, 5, E'*Ye shall carry up my bones from hence* (Genesis 50:25) — the *commandment concerning his bones* (Hebrews 11:22), faith staking his burial on the oath.'),
    -- hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,23, 'canon','exodus',2,2, 1, E'*She hid him three months* (Exodus 2:2) — Moses *hid three months of his parents... not afraid of the king''s commandment* (Hebrews 11:23).'),
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,24, 'canon','exodus',2,11, 2, E'*He went out unto his brethren, and looked on their burdens* (Exodus 2:11) — Moses *refused to be called the son of Pharaoh''s daughter* (Hebrews 11:24).'),
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,29, 'canon','exodus',14,22, 3, E'*The waters were a wall unto them on their right hand, and on their left* (Exodus 14:22) — they *passed through the Red sea as by dry land* (Hebrews 11:29).'),
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,30, 'canon','joshua',6,20, 4, E'*The wall fell down flat* (Joshua 6:20) — *the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30).'),
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,31, 'canon','joshua',2,11, 5, E'*Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11) — Rahab''s faith while the city *believed not* (Hebrews 11:31).'),
    ('hebrews-11-moses-the-reproach-of-messiah-the-passover-jericho-and-rahab-exodus-2-joshua-2-6', 'canon','hebrews',11,31, 'canon','joshua',6,25, 6, E'*Joshua saved Rahab the harlot alive... she dwelleth in Yashar''el (Israel) even unto this day* (Joshua 6:25) — she *perished not with them that believed not* (Hebrews 11:31).'),
    -- hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6
    ('hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6', 'canon','hebrews',11,33, 'canon','daniel',6,22, 1, E'*My Elohim (God) hath sent his angel, and hath shut the lions'' mouths* (Daniel 6:22) — through faith they *stopped the mouths of lions* (Hebrews 11:33).'),
    ('hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6', 'canon','hebrews',11,34, 'canon','daniel',3,27, 2, E'*The fire had no power, nor was an hair of their head singed* (Daniel 3:27) — they *quenched the violence of fire* (Hebrews 11:34).'),
    ('hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6', 'canon','hebrews',11,35, 'canon','1-kings',17,22, 3, E'*The soul of the child came into him again, and he revived* (1 Kings 17:22) — *women received their dead raised to life again* (Hebrews 11:35).'),
    ('hebrews-11-stopped-the-mouths-of-lions-and-quenched-the-violence-of-fire-daniel-3-6', 'canon','hebrews',11,35, 'canon','2-kings',4,35, 4, E'*The child sneezed seven times, and the child opened his eyes* (2 Kings 4:35) — the Shunammite''s dead son raised (Hebrews 11:35).'),
    -- hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees
    ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees', 'canon','hebrews',11,35, 'apocrypha','2-maccabees',7,9, 1, E'*The King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9) — the *better resurrection* chosen over deliverance (Hebrews 11:35).'),
    ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees', 'canon','hebrews',11,35, 'apocrypha','2-maccabees',7,11, 2, E'*From him I hope to receive them again* (2 Maccabees 7:11) — the torn body surrendered in the hope of being raised whole (Hebrews 11:35).'),
    ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees', 'canon','hebrews',11,35, 'apocrypha','2-maccabees',7,14, 3, E'*Raised up again by him: as for you, you shall have no resurrection to life* (2 Maccabees 7:14) — the two resurrections named, the *better* one looked for (Hebrews 11:35).'),
    ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees', 'canon','hebrews',11,35, 'apocrypha','2-maccabees',7,23, 4, E'*The Creator of the world... will also of his own mercy give you breath and life again* (2 Maccabees 7:23) — the mother reasons from creation to resurrection (Hebrews 11:35).'),
    ('hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees', 'canon','hebrews',11,35, 'apocrypha','2-maccabees',7,29, 5, E'*Take your death that I may receive you again in mercy with your brothers* (2 Maccabees 7:29) — the reunion past the grave, *not accepting deliverance* (Hebrews 11:35).')
  ) AS m(thread_slug, src_edition, src_slug, src_ch, src_v, tgt_edition, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug = m.thread_slug
  JOIN _s222_h11_lookup sv ON sv.edition_slug=m.src_edition AND sv.book_slug=m.src_slug AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s222_h11_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_12.sql (S222 Hebrews 12) -----
-- =====================================================================
-- S222 minion — HEBREWS 12 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 12.  Tag: h12 (temp view _s222_h12_lookup).  Sort band: 7980, step 1 (<=7986).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Hebrews 12 sets the run of the race surrounded by the cloud of witnesses
-- (ch.11) against the terror of approach under the old mediation and the access opened in
-- Messiah. The Sinai/Zion contrast is NOT Sinai or the Torah denigrated as evil — Sinai's
-- holiness is real, and the chapter QUOTES Deuteronomy approvingly at the close (*our Elohim is
-- a consuming fire*, 12:29 / Deuteronomy 4:24). The fire that burned on the mount is the same
-- fire that guards the holiness of the unshakable kingdom; what changed is the mediation by
-- which one approaches it. The chastening is the Father dealing with sons (Proverbs 3:11-12,
-- quoted in full at 12:5-6); the warnings (Esau, the root of bitterness, refuse not him that
-- speaketh) all press toward enduring obedience, not licence.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   cloud of witnesses / looking unto Yahusha author and finisher / set down at the right hand
--           Tanakh: Psalm 110:1 (sit at my right hand)  Extras: none warranted (the witness-cloud is Hebrews 11 internal; extras carried there)  NT: none added (the witnesses are ch.11, same hand)
--   v.4-11  the chastening of sons — whom Yahuah loveth he chasteneth
--           Tanakh: Proverbs 3:11 + 3:12 (quoted in full at 12:5-6)  Extras: none warranted  NT: none warranted
--   v.12-13 lift up the hands which hang down / make straight paths for your feet
--           Tanakh: Isaiah 35:3 (strengthen the weak hands, confirm the feeble knees), Proverbs 4:26 (ponder the path of thy feet)  Extras: none warranted  NT: none warranted
--   v.14-15 follow peace and holiness / lest any root of bitterness springing up
--           Tanakh: Deuteronomy 29:18 (a root that beareth gall and wormwood)  Extras: none warranted  NT: none warranted
--   v.16-17 Esau who for one morsel of meat sold his birthright / found no place of repentance
--           Tanakh: Genesis 25:33 + 25:34 (sold and despised his birthright), Genesis 27:34 + 27:38 (the bitter cry, no blessing left)  Extras: none warranted  NT: none warranted
--   v.18-24 the mount that burned vs Mount Sion / the blood of sprinkling better than Abel
--           Tanakh: Exodus 19:12 + 19:13 + 19:18 (the bounded burning mount), Deuteronomy 9:19 (I exceedingly fear), Genesis 4:10 (the blood crying from the ground)  Extras: none warranted  NT: none warranted
--   v.25-29 Yet once more I shake heaven / the unshakable kingdom / a consuming fire
--           Tanakh: Haggai 2:6 (yet once, I will shake the heavens), Deuteronomy 4:24 (the LORD thy God is a consuming fire)  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7980 hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110          (Tanakh)
--   7981 hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3     (Tanakh)
--   7982 hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35     (Tanakh)
--   7983 hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29            (Tanakh)
--   7984 hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27           (Tanakh)
--   7985 hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19      (Tanakh)
--   7986 hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2      (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110
  ('canon', 'hebrews', 12, 2, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). The runner is told to look away to the goal: *Looking unto Yahusha (Jesus) the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of Elohim (God)* (Hebrews 12:2). The enthronement at the close of his endurance is the very seat David saw — the Formed bidden by Yahuah (LORD) to *Sit thou at my right hand.* He ran the race first, despised the shame, and sat down at the right hand; the cloud of witnesses and the runners behind him follow the one who has already finished and is enthroned.'),
  -- thread: hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3
  ('canon', 'hebrews', 12, 5, 'canon', 'proverbs', 3, 11, 'free', E'*My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* (Proverbs 3:11). The exhortation Hebrews says they had forgotten is this proverb, quoted nearly word for word: *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him* (Hebrews 12:5). The wisdom spoken to a son in the proverbs is read as the Father''s living word to the assembly — the chastening is not wrath but fatherly correction, not to be despised and not to be fainted under.'),
  ('canon', 'hebrews', 12, 6, 'canon', 'proverbs', 3, 12, 'free', E'*For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* (Proverbs 3:12). *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6). The proverb supplies the very ground of the argument that follows — *what son is he whom the father chasteneth not?* (Hebrews 12:7). Correction is the mark of a received son, the token of the Father''s delight, not of his rejection; the love and the chastening are one motion, *even as a father the son in whom he delighteth.*'),
  -- thread: hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35
  ('canon', 'hebrews', 12, 12, 'canon', 'isaiah', 35, 3, 'free', E'*Strengthen ye the weak hands, and confirm the feeble knees.* (Isaiah 35:3). *Wherefore lift up the hands which hang down, and the feeble knees;* (Hebrews 12:12). Hebrews takes up the prophet''s charge almost in his own words. Isaiah spoke it to the fearful-hearted on the way of holiness, the highway home where *the ransomed of Yahuah (LORD) shall return … to Zion with songs and everlasting joy* (Isaiah 35:10) — and Hebrews sets it on the lips of the assembly that has come *unto mount Sion* (Hebrews 12:22). The drooping hands and feeble knees of the weary runner are lifted by the same word that strengthened the returning remnant.'),
  ('canon', 'hebrews', 12, 13, 'canon', 'proverbs', 4, 26, 'free', E'*Ponder the path of thy feet, and let all thy ways be established.* (Proverbs 4:26). *And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:13). The making of straight paths is the proverb''s counsel to weigh and steady the path of the feet, the chapter that promises *the path of the just is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18). The runner straightens his way so the lame limb is healed rather than turned out — the established path of the wise, walked under correction toward the goal.'),
  -- thread: hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29
  ('canon', 'hebrews', 12, 15, 'canon', 'deuteronomy', 29, 18, 'free', E'*Lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood;* (Deuteronomy 29:18). *Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The warning of the root is Moses'' own, spoken as the people stood to enter the covenant: a heart turning away becomes *a root that beareth gall and wormwood* — and the one poisoned root defiles the many. Hebrews sets the covenant assembly the same watch, to look diligently lest such a root spring up among them.'),
  -- thread: hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27
  ('canon', 'hebrews', 12, 16, 'canon', 'genesis', 25, 33, 'free', E'*And Jacob said, Swear to me this day; and he sware unto him: and he sold his birthright unto Jacob.* (Genesis 25:33). *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The profane despiser is named from the narrative itself: Esau came faint from the field, and for a bowl of pottage *sold his birthright unto Jacob* under oath. The inheritance of the firstborn — the covenant line of Abraham and Isaac — was bartered for a single meal; this is the profanity Hebrews holds up as the warning.'),
  ('canon', 'hebrews', 12, 16, 'canon', 'genesis', 25, 34, 'free', E'*Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright.* (Genesis 25:34). *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). The verdict of the narrative is the word Hebrews leans on: *thus Esau despised his birthright.* He ate and drank and went his way, counting the inheritance as nothing — the *one morsel of meat* of Hebrews is the *bread and pottage of lentiles* of the account. To despise the birthright is the profanity warned against in the running of the race.'),
  ('canon', 'hebrews', 12, 17, 'canon', 'genesis', 27, 34, 'free', E'*And when Esau heard the words of his father, he cried with a great and exceeding bitter cry, and said unto his father, Bless me, even me also, O my father.* (Genesis 27:34). *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). The tears Hebrews names are the *great and exceeding bitter cry* of Esau when the blessing had already gone to Jacob. He sought the blessing he had bartered away, but the thing was done; the bitter weeping could not undo the despising. What was sold for a morsel could not be wept back.'),
  ('canon', 'hebrews', 12, 17, 'canon', 'genesis', 27, 38, 'free', E'*And Esau said unto his father, Hast thou but one blessing, my father? bless me, even me also, O my father. And Esau lifted up his voice, and wept.* (Genesis 27:38). *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). Esau *lifted up his voice, and wept,* pleading *bless me, even me also* — but the blessing was spoken and would stand. Hebrews reads this as finding *no place of repentance:* the careful tears could not recover the inheritance the profane man had already despised and sold.'),
  -- thread: hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19
  ('canon', 'hebrews', 12, 18, 'canon', 'exodus', 19, 18, 'free', E'*And mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly.* (Exodus 19:18). *For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). The mount that *burned with fire* is Sinai, *altogether on a smoke, because Yahuah (LORD) descended upon it in fire.* The burning and the quaking were real and holy — Yahuah (LORD) himself came down upon it; Hebrews sets that terror of approach against the access now opened, not against the holiness of the mount.'),
  ('canon', 'hebrews', 12, 20, 'canon', 'exodus', 19, 12, 'free', E'*And thou shalt set bounds unto the people round about, saying, Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death:* (Exodus 19:12). *(For they could not endure that which was commanded, And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart:* (Hebrews 12:20). The commandment they could not endure is this charge to set bounds: *whosoever toucheth the mount shall be surely put to death.* The fence around the burning mount marked how unapproachable the holy fire was under that mediation — the very weight Hebrews recalls to magnify the nearness now given.'),
  ('canon', 'hebrews', 12, 20, 'canon', 'exodus', 19, 13, 'free', E'*There shall not an hand touch it, but he shall surely be stoned, or shot through; whether it be beast or man, it shall not live: when the trumpet soundeth long, they shall come up to the mount.* (Exodus 19:13). *(For they could not endure that which was commanded, And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart:* (Hebrews 12:20). Hebrews quotes the charge closely — *if so much as a beast touch the mountain, it shall be stoned, or thrust through* — straight from the command that *whether it be beast or man, it shall not live.* Even the brute that strayed across the border died; such was the guarded holiness of the mount that burned.'),
  ('canon', 'hebrews', 12, 21, 'canon', 'deuteronomy', 9, 19, 'free', E'*For I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth against you to destroy you. But Yahuah (LORD) hearkened unto me at that time also.* (Deuteronomy 9:19). *And so terrible was the sight, that Moses said, I exceedingly fear and quake:* (Hebrews 12:21). Even Moses, the mediator on the mount, confessed his dread: *I was afraid of the anger and hot displeasure* of Yahuah (LORD). Hebrews gathers that fear into a single line — *I exceedingly fear and quake* — to set the trembling of the old approach beside the joy of those now come unto mount Sion.'),
  ('canon', 'hebrews', 12, 24, 'canon', 'genesis', 4, 10, 'free', E'*And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* (Genesis 4:10). *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Abel''s blood *crieth unto me from the ground* — a cry for justice against the one who shed it. The blood of sprinkling speaks *better things:* not vengeance crying up from the earth, but the blood of the mediator that brings the worshipper near. The two bloods both speak; the better blood speaks reconciliation where Abel''s cried for recompense.'),
  -- thread: hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2
  ('canon', 'hebrews', 12, 26, 'canon', 'haggai', 2, 6, 'free', E'*For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land;* (Haggai 2:6). *Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). The promise Hebrews cites is Haggai''s — *Yet once … I will shake the heavens, and the earth.* The voice that once shook the earth at Sinai will shake heaven too, *the removing of those things that are shaken … that those things which cannot be shaken may remain* (Hebrews 12:27). What remains is the kingdom which cannot be moved.'),
  ('canon', 'hebrews', 12, 29, 'canon', 'deuteronomy', 4, 24, 'free', E'*For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God).* (Deuteronomy 4:24). *For our Elohim (God) is a consuming fire* (Hebrews 12:29). Hebrews closes by quoting Moses straight: *Yahuah Elohayka (the LORD thy God) is a consuming fire.* The fire that burned on Sinai is not left behind as a discarded terror — it is named approvingly as the unchanged character of the Elohim (God) whose unshakable kingdom we receive. We serve *with reverence and godly fear* (Hebrews 12:28) precisely because our Elohim is still the consuming fire of the mount.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110',
       E'Looking unto Yahusha, set down at the right hand — Psalm 110',
       E'The cloud of witnesses of chapter 11 surrounds the runner, and the charge is to *lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us* (Hebrews 12:1). The eyes do not turn to the witnesses but past them to the goal: *Looking unto Yahusha (Jesus) the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of Elohim (God)* (Hebrews 12:2). The seat at the close of his race is the throne David saw: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). He is the one who ran first and finished — the Formed who endured the cross and was bidden by Yahuah (LORD) to sit at the right hand. The runner behind him fixes his eyes on the one already enthroned, and so does not grow *wearied and faint in his mind* (Hebrews 12:3).',
       sv.verse_id, ev.verse_id, 'free', 7980
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3',
       E'Whom Yahuah loveth he chasteneth — the sons corrected (Proverbs 3)',
       E'Hebrews says the assembly had forgotten *the exhortation which speaketh unto you as unto children* (Hebrews 12:5), and then quotes it nearly word for word: *My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him: For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:5-6). The exhortation is the proverb: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The wisdom a father speaks to a son becomes the living word of the Father to the whole house. The argument turns on it: *If ye endure chastening, Elohim (God) dealeth with you as with sons; for what son is he whom the father chasteneth not?* (Hebrews 12:7). Correction is the token of a received son and the proof of the Father''s delight, not the sign of his wrath — and it *yieldeth the peaceable fruit of righteousness unto them which are exercised thereby* (Hebrews 12:11).',
       sv.verse_id, ev.verse_id, 'free', 7981
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35',
       E'Lift up the hands which hang down, make straight paths — Isaiah 35',
       E'The weary runner is roused with the prophet''s own words: *Wherefore lift up the hands which hang down, and the feeble knees; And make straight paths for your feet, lest that which is lame be turned out of the way; but let it rather be healed* (Hebrews 12:12-13). Isaiah had spoken the charge to the fearful-hearted on the highway home: *Strengthen ye the weak hands, and confirm the feeble knees* (Isaiah 35:3) — the way of holiness on which *the ransomed of Yahuah (LORD) shall return, and come to Zion with songs and everlasting joy upon their heads* (Isaiah 35:10). And the making of straight paths is the counsel of the wise: *Ponder the path of thy feet, and let all thy ways be established* (Proverbs 4:26), the chapter whose just man walks the path that *is as the shining light, that shineth more and more unto the perfect day* (Proverbs 4:18). The drooping hands are lifted, the feeble knees confirmed, the path made straight — so the lame limb is healed rather than turned out, and the runner comes with the returning remnant unto mount Sion.',
       sv.verse_id, ev.verse_id, 'free', 7982
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29',
       E'Lest any root of bitterness springing up — Deuteronomy 29',
       E'The charge to *Follow peace with all men, and holiness, without which no man shall see Yahuah (Lord)* (Hebrews 12:14) carries a watch against one poisoned root: *Looking diligently lest any man fail of the grace of Elohim (God); lest any root of bitterness springing up trouble you, and thereby many be defiled* (Hebrews 12:15). The image is Moses'', spoken as Yashar''el (Israel) stood to enter the covenant: the warning *lest there should be among you man, or woman, or family, or tribe, whose heart turneth away this day from Yahuah Eloheinu (the LORD our God), to go and serve the gods of these nations; lest there should be among you a root that beareth gall and wormwood* (Deuteronomy 29:18). A heart turned away from the covenant becomes a bitter root, and the one root defiles the many. Hebrews sets the same watch on the assembly that has come unto mount Sion — to look diligently lest such a root spring up and trouble the whole.',
       sv.verse_id, ev.verse_id, 'free', 7983
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27',
       E'Esau who sold his birthright for one morsel — Genesis 25 and 27',
       E'The warning against the profane is named from the patriarchal account: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright* (Hebrews 12:16). Esau came faint from the field, and *Jacob said, Swear to me this day; and he sware unto him: and he sold his birthright unto Jacob* (Genesis 25:33). The verdict of the narrative is the word Hebrews leans on: *Then Jacob gave Esau bread and pottage of lentiles; and he did eat and drink, and rose up, and went his way: thus Esau despised his birthright* (Genesis 25:34). The inheritance of the firstborn — the covenant line of Abraham and Isaac — was counted as nothing and bartered for a single meal. And the end of it was bitter: *For ye know how that afterward, when he would have inherited the blessing, he was rejected: for he found no place of repentance, though he sought it carefully with tears* (Hebrews 12:17). When the blessing had gone to Jacob, *Esau heard the words of his father, he cried with a great and exceeding bitter cry* (Genesis 27:34), and *lifted up his voice, and wept* (Genesis 27:38) — but the thing was done and would stand. The careful tears could not weep back what the profane man had already despised and sold. This is the warning held over the runner: do not, for a present appetite, despise the inheritance.',
       sv.verse_id, ev.verse_id, 'free', 7984
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19',
       E'The mount that burned and the blood better than Abel — Exodus 19, Genesis 4',
       E'Hebrews sets the terror of the old approach against the access now opened: *For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). That mount is Sinai, *altogether on a smoke, because Yahuah (LORD) descended upon it in fire: and the smoke thereof ascended as the smoke of a furnace, and the whole mount quaked greatly* (Exodus 19:18). The bounds set around it marked how unapproachable the holy fire was: *Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death* (Exodus 19:12) — *whether it be beast or man, it shall not live* (Exodus 19:13), which Hebrews echoes: *if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart* (Hebrews 12:20). Even Moses the mediator trembled: *I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth* (Deuteronomy 9:19), gathered into the one line *I exceedingly fear and quake* (Hebrews 12:21). The burning and the quaking were real and holy — Yahuah (LORD) himself came down upon the mount; what Hebrews contrasts is the mediation, not the holiness. For now *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22), *and to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). Abel''s blood *crieth unto me from the ground* (Genesis 4:10) for justice against the one who shed it; the blood of the mediator speaks better — not vengeance crying up from the earth, but reconciliation that brings the worshipper near.',
       sv.verse_id, ev.verse_id, 'free', 7985
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2',
       E'Yet once more I shake, and our Elohim a consuming fire — Haggai 2, Deuteronomy 4',
       E'The same voice that thundered at the mount has not fallen silent: *See that ye refuse not him that speaketh … if we turn away from him that speaketh from heaven* (Hebrews 12:25). *Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) — the promise of Haggai: *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6). The shaking is *the removing of those things that are shaken, as of things that are made, that those things which cannot be shaken may remain* (Hebrews 12:27), and what remains is *a kingdom which cannot be moved* (Hebrews 12:28). The chapter closes by quoting Moses straight: *For our Elohim (God) is a consuming fire* (Hebrews 12:29) — *For Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* (Deuteronomy 4:24). The fire that burned on Sinai is not a discarded terror but the unchanged character of the Elohim (God) whose unshakable kingdom we receive. We *serve Elohim (God) acceptably with reverence and godly fear* precisely because our Elohim is still the consuming fire of the mount.',
       sv.verse_id, ev.verse_id, 'free', 7986
  FROM _s222_h12_lookup sv, _s222_h12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=12 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Sit thou at my right hand, until I make thine enemies thy footstool* the seat at the close of his race is the throne David saw; Yahusha endured the cross and is *set down at the right hand* (Hebrews 12:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-looking-unto-yahusha-set-down-at-the-right-hand-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction* the forgotten exhortation, quoted nearly word for word (Hebrews 12:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:12 — *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* correction is the token of a received son, the Father''s delight not his wrath (Hebrews 12:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-whom-yahuah-loveth-he-chasteneth-the-sons-corrected-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:3 — *Strengthen ye the weak hands, and confirm the feeble knees* the prophet''s charge to the fearful on the way home, taken up for the weary runner (Hebrews 12:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:26 — *Ponder the path of thy feet, and let all thy ways be established* the making of straight paths is the wise man''s established way, so the lame is healed (Hebrews 12:13).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lift-up-the-hands-which-hang-down-make-straight-paths-isaiah-35'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:18 — *lest there should be among you a root that beareth gall and wormwood* a heart turned from the covenant becomes a bitter root that defiles the many (Hebrews 12:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-lest-any-root-of-bitterness-springing-up-deuteronomy-29'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:33 — *he sware unto him: and he sold his birthright unto Jacob* the inheritance of the firstborn bartered under oath for a single meal (Hebrews 12:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:34 — *he did eat and drink, and rose up, and went his way: thus Esau despised his birthright* the verdict of the narrative Hebrews leans on — he counted the inheritance as nothing (Hebrews 12:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:34 — *he cried with a great and exceeding bitter cry* the tears Hebrews names — sought the blessing already given to Jacob (Hebrews 12:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 27:38 — *Esau lifted up his voice, and wept* the careful tears could not recover the inheritance the profane man had despised and sold — no place of repentance (Hebrews 12:17).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-esau-who-sold-his-birthright-for-one-morsel-genesis-25-27'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:18 — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* the mount that *burned with fire* — real and holy, Yahuah himself came down (Hebrews 12:18).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:12 — *whosoever toucheth the mount shall be surely put to death* the commandment they could not endure; the fence marked the unapproachable holy fire (Hebrews 12:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 19:13 — *whether it be beast or man, it shall not live* Hebrews quotes it closely: *if so much as a beast touch the mountain, it shall be stoned, or thrust through* (Hebrews 12:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 9:19 — *I was afraid of the anger and hot displeasure, wherewith Yahuah (LORD) was wroth* even Moses the mediator trembled; Hebrews gathers it into *I exceedingly fear and quake* (Hebrews 12:21).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 4:10 — *the voice of thy brother''s blood crieth unto me from the ground* Abel''s blood cries for justice; the blood of sprinkling speaks better — reconciliation, not vengeance (Hebrews 12:24).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-the-mount-that-burned-and-the-blood-better-than-abel-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth* the promise Hebrews cites: the voice that shook the earth will shake heaven, removing the shakable (Hebrews 12:26).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:24 — *Yahuah Elohayka (the LORD thy God) is a consuming fire, even a jealous Elohim (God)* quoted approvingly: the fire of Sinai is the unchanged character of the Elohim of the unshakable kingdom (Hebrews 12:29).'
  FROM cross_reference_threads t, cross_references x, _s222_h12_lookup sv, _s222_h12_lookup tv
 WHERE t.slug='hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hebrews_13.sql (S222 Hebrews 13) -----
-- =====================================================================
-- S222 minion — HEBREWS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 13 (the closing exhortations).  Tag: h13 (temp view _s222_h13_lookup).
-- Sort band: floor 7987, ceiling 7993, step 1 (sequential 7987..7991 used).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: chapter 13 is the writer's closing string of exhortations, and each is
-- rooted in the Tanakh he has argued from all along. Brotherly love, hospitality, the marriage
-- bed, contentment, courage, praise — none of these is a new ethic; each is the old covenant
-- instruction now carried in a heart established by grace. WATCHPOINT v.9: *the heart be
-- established with grace; not with meats, which have not profited them that have been occupied
-- therein* — this is the false ascetic / sacrificial food-rules of the gainsayers (the
-- ceremonial-meat scruple that *cannot* establish the heart), NOT the clean-food Torah; Hebrews
-- never abolishes the dietary law. v.10-13: *we have an altar … the bodies of those beasts …
-- are burned without the camp* is the Day-of-Atonement pattern (Leviticus 16:27) read forward to
-- Yahusha who *suffered without the gate* — the sacrificial administration fulfilled in him, the
-- pattern honoured, not erased. v.15-16 the sacrifice of praise is the prophets' own *calves of
-- our lips* (Hosea 14:2). v.20 the *great shepherd … the blood of the everlasting covenant* is the
-- Shepherd brought up from the sea (Isaiah 63:11), the blood of the covenant (Zechariah 9:11), the
-- everlasting covenant of peace (Ezekiel 37:26). And v.8 holds the Christology: *Yahusha
-- HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* — the Formed who does
-- not change, the I-AM who took flesh and has a Father.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     brotherly love continue
--           Tanakh: none added (carried in prose of the hospitality thread)  Extras: none warranted  NT: none warranted
--   v.2     entertain strangers / entertained angels unawares
--           Tanakh: Genesis 18:1-2 (Abraham at Mamre), Genesis 19:1-2 (Lot at the gate)  Extras: none warranted (Jasher/Jubilees parallels carry editorial noise; clean witness preferred)  NT: none warranted
--   v.3     remember them in bonds
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.4     marriage honourable, the bed undefiled, Elohim will judge
--           Tanakh: none warranted (no single load-bearing quote)  Extras: none warranted  NT: none warranted
--   v.5-6   I will never leave thee / Yahuah is my helper, I will not fear
--           Tanakh: Deuteronomy 31:6, Joshua 1:5 (he will not fail nor forsake), Psalm 118:6 (Yahuah is on my side, I will not fear)  Extras: none warranted  NT: none warranted
--   v.7     remember them which have the rule, whose faith follow
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.8     Yahusha the same yesterday and to day and for ever
--           Tanakh: none added (the unchanging-One; carried in prose of the shepherd thread)  Extras: none warranted  NT: none warranted
--   v.9     heart established with grace, not with meats
--           Tanakh: none warranted (WATCHPOINT — the false ascetic food-scruple, not the clean-food Torah)  Extras: none warranted  NT: none warranted
--   v.10-13 we have an altar / burned without the camp / suffered without the gate / go forth unto him
--           Tanakh: Leviticus 16:27 (the sin-offering carried forth and burned without the camp)  Extras: none warranted  NT: none warranted
--   v.14    here have we no continuing city, we seek one to come
--           Tanakh: none warranted (carried in prose of the without-the-camp thread)  Extras: none warranted  NT: none warranted
--   v.15-16 sacrifice of praise, the fruit of our lips / do good and communicate
--           Tanakh: Hosea 14:2 (calves of our lips), Psalm 50:14 (offer thanksgiving), Psalm 50:23 (whoso offereth praise glorifieth me)  Extras: none warranted  NT: none warranted
--   v.17-19 obey them that have the rule / pray for us
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.20-21 the Elohim of peace, the great shepherd, the blood of the everlasting covenant
--           Tanakh: Isaiah 63:11 (brought up from the sea with the shepherd), Zechariah 9:11 (by the blood of thy covenant), Ezekiel 37:26 (an everlasting covenant of peace)  Extras: none warranted  NT: none warranted
--   v.22-25 closing salutation, Timothy, Italy, grace be with you
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7987 hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18          (Tanakh)
--   7988 hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31              (Tanakh)
--   7989 hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16                   (Tanakh)
--   7990 hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14              (Tanakh)
--   7991 hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 18, 1, 'free', E'*And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* (Genesis 18:1). When the writer says *be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2), this is the scene he has in hand. Abraham sat in the tent door and Yahuah (LORD) himself appeared in the plains of Mamre — the Formed One, come as a traveller. The hospitality of the covenant is no small courtesy; it received the visitation of Yahuah and his messengers, unawares.'),
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 18, 2, 'free', E'*And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* (Genesis 18:2). Abraham *ran to meet them* and *bowed himself toward the ground* — he did not yet know whom he served. *Some have entertained angels unawares* (Hebrews 13:2): the three who stood by Abraham were no ordinary wayfarers, and the welcome he gave the stranger was, all unknowing, a welcome given to heaven''s own.'),
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 19, 1, 'free', E'*And there came two angels to Sodom at even; and Lot sat in the gate of Sodom: and Lot seeing them rose up to meet them; and he bowed himself with his face toward the ground;* (Genesis 19:1). The two who turned from Mamre came on to Sodom, and Lot too *rose up to meet them* at the gate. *Be not forgetful to entertain strangers* (Hebrews 13:2): twice in one account the welcome of strangers proved to be the welcome of angels, and the open door of the righteous became the door of their deliverance.'),
  -- thread: hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31
  ('canon', 'hebrews', 13, 5, 'canon', 'deuteronomy', 31, 6, 'free', E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* (Deuteronomy 31:6). The writer grounds contentment on a promise older than the epistle: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). It is the very word Moses spoke to all Yashar''el (Israel) at the edge of the land — *he will not fail thee, nor forsake thee.* The covetous heart grasps because it fears abandonment; the contented heart rests on the One who said he would never leave.'),
  ('canon', 'hebrews', 13, 5, 'canon', 'joshua', 1, 5, 'free', E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee.* (Joshua 1:5). The same pledge Moses gave the people, Yahuah (LORD) gave again to Joshua at the crossing: *I will not fail thee, nor forsake thee.* When Hebrews says *he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5), it draws on a word spoken and re-spoken across the generations — the abiding presence that frees the heart from covetous fear.'),
  ('canon', 'hebrews', 13, 6, 'canon', 'psalms', 118, 6, 'free', E'*Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). Because the promise stands, the writer draws the psalmist''s own conclusion: *so that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6). The One who will never forsake is the One on my side; with him as helper, the fear of man falls away. The bold confession of Hebrews is the psalm sung forward.'),
  -- thread: hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16
  ('canon', 'hebrews', 13, 11, 'canon', 'leviticus', 16, 27, 'free', E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung.* (Leviticus 16:27). The writer reads the Day of Atonement exactly: *the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). The blood went into the holy place; the bodies went outside to be consumed. This is the ordained pattern Yahuah (LORD) gave, and the writer does not discard it — he reads it forward to its fulfilment.'),
  ('canon', 'hebrews', 13, 12, 'canon', 'leviticus', 16, 27, 'free', E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung.* (Leviticus 16:27). As the sin-offering was carried *without the camp,* so *Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The pattern is not abolished but fulfilled: the body offered outside, the blood that sanctifies — Yahusha is both the high priest and the offering the atonement-day rite foreshadowed.'),
  -- thread: hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14
  ('canon', 'hebrews', 13, 15, 'canon', 'hosea', 14, 2, 'free', E'*Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips.* (Hosea 14:2). *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The fruit of the lips is the prophet''s *calves of our lips* — the offering of words and thanksgiving Hosea called the returning people to bring. The praise that ascends is the prophets'' own appointed sacrifice, now offered through the Mediator.'),
  ('canon', 'hebrews', 13, 15, 'canon', 'psalms', 50, 14, 'free', E'*Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High):* (Psalm 50:14). The *sacrifice of praise … the fruit of our lips giving thanks to his name* (Hebrews 13:15) is the very offering the psalm sets above slain beasts: *offer unto Elohim (God) thanksgiving.* What pleases the Most High is not the blood of bulls but the thankful heart and the paid vow — the sacrifice Hebrews calls the people to offer continually.'),
  ('canon', 'hebrews', 13, 16, 'canon', 'psalms', 50, 23, 'free', E'*Whoso offereth praise glorifieth me: and to him that ordereth his conversation aright will I shew the salvation of Elohim (God).* (Psalm 50:23). *But to do good and to communicate forget not: for with such sacrifices Elohim (God) is well pleased* (Hebrews 13:16). The psalm joins the two the writer joins: the praise that glorifies, and the ordered walk that does good. Such are the sacrifices that please — the lips that thank and the hands that share.'),
  -- thread: hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63
  ('canon', 'hebrews', 13, 20, 'canon', 'isaiah', 63, 11, 'free', E'*Then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11). *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep* (Hebrews 13:20). The prophet asked after the One who *brought them up out of the sea with the shepherd of his flock;* the writer answers with the greater bringing-up — the Shepherd himself brought again from the dead. The Elohim of peace who raised the great shepherd is the same who once led the flock through the sea.'),
  ('canon', 'hebrews', 13, 20, 'canon', 'zechariah', 9, 11, 'free', E'*As for thee also, by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is no water.* (Zechariah 9:11). The *great shepherd of the sheep* was brought again from the dead *through the blood of the everlasting covenant* (Hebrews 13:20). The prophet had named that blood: *by the blood of thy covenant I have sent forth thy prisoners out of the pit.* The covenant-blood that frees the prisoner from the waterless pit is the same blood by which the Shepherd was raised — deliverance and resurrection sealed in one covenant.'),
  ('canon', 'hebrews', 13, 20, 'canon', 'ezekiel', 37, 26, 'free', E'*Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* (Ezekiel 37:26). The *blood of the everlasting covenant* (Hebrews 13:20) is the blood of the covenant the prophet promised: *an everlasting covenant … a covenant of peace.* And it is the Elohim *of peace* who raises the Shepherd — the everlasting covenant of peace, sealed in his blood, the sanctuary set in the midst of the gathered flock for evermore.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18',
       E'Entertain strangers — some have entertained angels unawares',
       E'*Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2). The writer is not coining a new courtesy; he is pointing the reader back to a scene every covenant child knew. *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1) — and *lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:2). Abraham did not yet know whom he served; he ran, he bowed, he set bread before strangers in the heat of the day, and the strangers were Yahuah (LORD) and his messengers. The same wayfarers turned on to Sodom: *and there came two angels to Sodom at even; and Lot sat in the gate of Sodom: and Lot seeing them rose up to meet them; and he bowed himself with his face toward the ground* (Genesis 19:1), and the open door of the righteous became the door of his deliverance. Twice in one account the welcome of the stranger proved to be the welcome of angels. So *be not forgetful* — the brotherly love that *continue[s]* (Hebrews 13:1) opens its door not knowing whom it receives, and heaven itself has walked through such doors before.',
       sv.verse_id, ev.verse_id, 'free', 7987
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31',
       E'I will never leave thee, nor forsake thee — Yahuah is my helper',
       E'The writer grounds contentment on a word older than the epistle. *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). That word was spoken by Moses to all Yashar''el (Israel) at the edge of the land: *be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — and given again to Joshua at the crossing: *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The covetous heart grasps because it fears abandonment; the contented heart rests on the One who pledged he would never leave. And because that promise stands, the bold confession follows, drawn straight from the psalm: *so that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6) — *Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). The One who will never forsake is the One on my side; with him as helper, the fear of man falls away.',
       sv.verse_id, ev.verse_id, 'free', 7988
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16',
       E'Without the camp, bearing his reproach — the sin-offering burned outside',
       E'*We have an altar, whereof they have no right to eat which serve the tabernacle* (Hebrews 13:10). The writer is reading the Day of Atonement, and he reads it exactly. *For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11) — which is precisely the ordinance: *the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27). The blood went into the holy place; the body went outside to be consumed. This ordained pattern the writer does not discard — he reads it forward to its fulfilment: *wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The sin-offering carried outside the camp is the Messiah crucified outside the gate, both high priest and offering at once. And so the call: *let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13), *for here have we no continuing city, but we seek one to come* (Hebrews 13:14). The shadow is not erased; it is filled full, and the people follow the Offering outside the gate.',
       sv.verse_id, ev.verse_id, 'free', 7989
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14',
       E'The sacrifice of praise, the fruit of our lips — the calves of our lips',
       E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The *fruit of our lips* is the prophet''s own phrase for the offering the returning people bring: *take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips* (Hosea 14:2). And it is the offering the psalm sets above slain beasts: *offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* (Psalm 50:14); *whoso offereth praise glorifieth me: and to him that ordereth his conversation aright will I shew the salvation of Elohim (God)* (Psalm 50:23). The psalm binds the two the writer binds — the lips that thank and the walk that does good: *but to do good and to communicate forget not: for with such sacrifices Elohim (God) is well pleased* (Hebrews 13:16). This is no new worship. The thankful heart, the paid vow, the ordered walk, the open hand — these were always the sacrifices that please, and now they ascend continually through the Mediator.',
       sv.verse_id, ev.verse_id, 'free', 7990
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63',
       E'The great shepherd, the blood of the everlasting covenant',
       E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). Every clause of the benediction is the prophets'' own. The prophet had asked after the Shepherd led through the waters: *then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11) — and the writer answers with the greater bringing-up, the Shepherd himself brought again from the dead. The covenant-blood was named by the prophet too: *as for thee also, by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is no water* (Zechariah 9:11) — the blood that frees the prisoner from the waterless pit is the blood by which the Shepherd was raised. And it is an *everlasting* covenant, as the prophet foretold: *moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26). The Elohim *of peace* raises the great shepherd by the blood of the everlasting covenant of peace — and the same Shepherd is *Yahusha HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* (Hebrews 13:8), the unchanging One who led the flock through the sea and was brought up again from the dead to lead it home.',
       sv.verse_id, ev.verse_id, 'free', 7991
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:1 — *Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* Abraham''s welcome of strangers received the visitation of Yahuah himself (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:2 — *he ran to meet them from the tent door, and bowed himself toward the ground* he entertained angels unawares (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:1 — *there came two angels to Sodom at even; and Lot sat in the gate of Sodom … and he bowed himself* the same strangers, the same welcome, the door of deliverance (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:6 — *he will not fail thee, nor forsake thee* Moses'' word to all Yashar''el (Israel) is the promise that frees the heart from covetous fear (Hebrews 13:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:5 — *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* the same pledge re-spoken at the crossing (Hebrews 13:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 118:6 — *Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* the bold confession Hebrews sings forward (Hebrews 13:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:27 — *whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp* the Day-of-Atonement pattern the writer reads exactly (Hebrews 13:11).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:27 — *shall one carry forth without the camp* so Yahusha *suffered without the gate,* the offering carried outside fulfilled (Hebrews 13:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 14:2 — *so will we render the calves of our lips* the fruit of the lips is the prophet''s appointed offering of words and thanksgiving (Hebrews 13:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 50:14 — *offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* the thank-offering set above slain beasts (Hebrews 13:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 50:23 — *whoso offereth praise glorifieth me: and to him that ordereth his conversation aright* the praise and the ordered walk Hebrews binds together (Hebrews 13:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 63:11 — *Where is he that brought them up out of the sea with the shepherd of his flock?* the Shepherd led through the waters, now brought again from the dead (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 9:11 — *by the blood of thy covenant I have sent forth thy prisoners out of the pit* the covenant-blood by which the Shepherd was raised (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:26 — *it shall be an everlasting covenant with them … a covenant of peace* the everlasting covenant of peace the Elohim of peace seals in the Shepherd''s blood (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session222 — Hebrews cross-references complete.'
