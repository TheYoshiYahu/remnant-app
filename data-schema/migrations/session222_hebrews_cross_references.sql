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


COMMIT;
\echo 'session222 — Hebrews cross-references complete.'
