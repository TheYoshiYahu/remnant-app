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
