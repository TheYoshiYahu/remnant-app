-- ----- fragment: minion_psalms_138.sql (Psalm 138) -----
-- Chapter: Psalm 138 (David's thanksgiving — "I will praise thee with my whole heart")
-- Tag: ps138   Session prefix: s302   Sort band base: 25425 (25425,25428,25431,25434)
-- Temp view: _s302_ps138_lookup   Output: minion_psalms_138.sql
--
-- Psalm 138 coverage:
--   v.1  praise with whole heart / before the gods will I sing
--        NT:     John 1:1,14 (the Word / the Formed — folded under thread 1)
--        Extras: none warranted (council motif carried canon-side by Ps 82)
--        Tanakh: Ps 82:1,6 (the gods / divine-council — Yahuah Most High above all)
--   v.2  worship toward holy temple / word above all thy name (chesed + emet)
--        NT:     John 1:1,14 (the exalted Word made flesh)
--        Extras: none warranted
--        Tanakh: Exod 34:6 (Name proclaimed — mercy + truth); Ps 119:89 (word settled in heaven)
--   v.3  in the day I cried thou answeredst me / strengthenedst me
--        NT:     none warranted (answered-prayer note carried under thread 4 Ps 57:2)
--        Extras: none warranted
--        Tanakh: Ps 57:2 (folded under thread 4)
--   vv.4-5 all the kings of the earth shall praise thee / sing in the ways of Yahuah
--        NT:     Rom 15:11 (Praise Yahuah, all ye Gentiles — the ingathering quoted)
--        Extras: none warranted
--        Tanakh: Ps 86:9 (all nations shall come and worship); Isa 2:2-3 (all nations flow to Zion)
--   v.6  Yahuah high yet respecteth the lowly / the proud he knoweth afar off
--        NT:     James 4:6 + 1 Pet 5:5 (Elohim resisteth the proud, giveth grace to the humble); Luke 1:52 (Magnificat reversal)
--        Extras: none warranted
--        Tanakh: Prov 3:34 (grace unto the lowly — the source of Jas/1Pet); Isa 57:15 (the High One dwells with the contrite)
--   vv.7-8 thou wilt revive me / Yahuah will perfect that which concerneth me / forsake not the works of thine own hands
--        NT:     Phil 1:6 (he which hath begun a good work will perform it)
--        Extras: none warranted
--        Tanakh: Ps 57:2 (Elohim that performeth all things for me)
--
-- Threads (all members canon + NT => tier 'free'):
--   psalm-138-thy-word-magnified-above-thy-name-the-exalted-word (vv.1-2) [Tanakh + NT]
--   psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering (vv.4-5) [Tanakh + NT]
--   psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off (v.6) [Tanakh + NT]
--   psalm-138-yahuah-will-perfect-that-which-concerneth-me (vv.7-8) [Tanakh + NT]
--
-- Framework notes:
--   v.1 "before the gods will I sing" — the divine-council motif (Ps 82): Elohim judges among the
--     gods/mortal-judges/heavenly host, yet Yahuah Most High is above all; David sings unashamed
--     in that assembly. NOT polytheism — the council acknowledges the One enthroned over it.
--   v.2 "thou hast magnified thy word above all thy name" — read FORWARD to the exalted Word, the
--     Formed Son (John 1:1,14: the Word with Elohim, the Word made flesh), and to Ps 119:89 (word
--     settled in heaven). chesed + emet (lovingkindness + truth) = the Name proclaimed at Exod 34:6.
--   vv.4-5 ingathering of the nations WITH Yahuah's people — Rom 15:11 quotes the Psalter directly;
--     two-house guard (Rom 11) — the nations join, never replace.
--   v.6 Prov 3:34 is the Tanakh source the apostles quote verbatim (Jas 4:6 / 1 Pet 5:5); Luke 1:52
--     sings the same reversal; Isa 57:15 the High One who dwells with the contrite.
--   v.8 "forsake not the works of thine own hands" + "will perfect that which concerneth me" — the
--     chesed-forever Hallel refrain carried FORWARD to Phil 1:6 (he will perform it).

CREATE TEMP VIEW _s302_ps138_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: vv.1-2 — the word magnified above the name; the exalted Word; before the gods
    ('canon','psalms',138,1,'canon','psalms',82,1,'free',
      E'*Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods.* (Psalm 82:1) David''s *before the gods will I sing praise unto thee* (Psalm 138:1) sings in that very assembly — the divine council where Yahuah judges among the gods, the mortal judges and the heavenly host. He sings unashamed before them, for the One enthroned over the council is his Elohim.'),
    ('canon','psalms',138,1,'canon','psalms',82,6,'free',
      E'*I have said, Ye are gods; and all of you are children of the El Elyon (most High).* (Psalm 82:6) The *gods* of Psalm 138:1 are the children of El Elyon — appointed, accountable, never sovereign. David''s whole-hearted praise *before the gods* (Psalm 138:1) confesses the Most High above every member of the council.'),
    ('canon','psalms',138,2,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6) David praises *thy name for thy lovingkindness and for thy truth* (Psalm 138:2) — the chesed and the emet that Yahuah Himself proclaimed when He passed by and declared the Name. The Name is mercy and truth.'),
    ('canon','psalms',138,2,'canon','psalms',119,89,'free',
      E'*For ever, O Yahuah (LORD), thy word is settled in heaven.* (Psalm 119:89) *Thou hast magnified thy word above all thy name* (Psalm 138:2): the word David exalts is the word fixed for ever in the heavens — the standing decree of Yahuah, lifted above every title He bears.'),
    ('canon','psalms',138,2,'canon','john',1,1,'free',
      E'*In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) *Thou hast magnified thy word above all thy name* (Psalm 138:2) is filled forward: the Word David sees exalted above the Name is the Formed Word — drawn from the Formless, with Elohim and Elohim.'),
    ('canon','psalms',138,2,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) The magnified Word of Psalm 138:2 took flesh *full of grace and truth* — the very *lovingkindness* and *truth* the psalm praises, now beheld; the Formed Son who has a Father.'),
    -- Thread 2: vv.4-5 — all the kings / nations shall praise; the ingathering
    ('canon','psalms',138,4,'canon','psalms',86,9,'free',
      E'*All nations whom thou hast made shall come and worship before thee, O Yahuah (Lord); and shall glorify thy name.* (Psalm 86:9) *All the kings of the earth shall praise thee, O Yahuah (LORD)* (Psalm 138:4): the same ingathering — every nation and its kings brought to worship, the harvest gathered WITH Yahuah''s people, not in place of them.'),
    ('canon','psalms',138,4,'canon','isaiah',2,2,'free',
      E'*And it shall come to pass in the last days, that the mountain of the LORD''S house shall be established in the top of the mountains, and shall be exalted above the hills; and all nations shall flow unto it.* (Isaiah 2:2) The kings of Psalm 138:4 who *hear the words of thy mouth* are the nations that flow to the mountain in the last days, drawn to Zion to be taught His ways.'),
    ('canon','psalms',138,5,'canon','isaiah',2,3,'free',
      E'*Come ye, and let us go up to the mountain of Yahuah (LORD)... and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem.* (Isaiah 2:3) *They shall sing in the ways of Yahuah (LORD)* (Psalm 138:5) — the nations sing because they walk in His paths; the Torah goes out of Zion and they keep it. The song and the way are one.'),
    ('canon','psalms',138,4,'canon','romans',15,11,'free',
      E'*And again, Praise Yahuah (Lord), all ye Gentiles; and laud him, all ye people.* (Romans 15:11) Paul quotes the Psalter to seal the ingathering: *all the kings of the earth shall praise thee* (Psalm 138:4) is the nations joined to the praise of Yahuah — grafted in among His people, never replacing them (Romans 11).'),
    -- Thread 3: v.6 — respect unto the lowly, the proud afar off
    ('canon','psalms',138,6,'canon','proverbs',3,34,'free',
      E'*Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34) *Though Yahuah (LORD) be high, yet hath he respect unto the lowly: but the proud he knoweth afar off* (Psalm 138:6) — the same scale exactly: grace bends to the lowly, the proud held at a distance. This is the verse the apostles will quote.'),
    ('canon','psalms',138,6,'canon','isaiah',57,15,'free',
      E'*For thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit, to revive the spirit of the humble.* (Isaiah 57:15) The High One of Psalm 138:6 who *hath respect unto the lowly* is the same who, dwelling in the high place, comes down to dwell with the contrite — height that stoops to the humble.'),
    ('canon','psalms',138,6,'canon','luke',1,52,'free',
      E'*He hath put down the mighty from their seats, and exalted them of low degree.* (Luke 1:52) Miriam''s song fills Psalm 138:6: *the proud he knoweth afar off* and the lowly He lifts — the great reversal sung when the Formed Son was carried in the womb.'),
    ('canon','psalms',138,6,'canon','james',4,6,'free',
      E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6) James quotes the principle of Psalm 138:6 (through Proverbs 3:34): the proud Yahuah *knoweth afar off* — He resists them; the humble He fills with grace.'),
    ('canon','psalms',138,6,'canon','1-peter',5,5,'free',
      E'*...be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* (1 Peter 5:5) Kepha echoes the same Tanakh word behind Psalm 138:6: *he hath respect unto the lowly: but the proud he knoweth afar off* — clothe yourself in the lowliness that draws His grace.'),
    -- Thread 4: vv.7-8 — revive me, perfect that which concerneth me, forsake not the works of thine hands
    ('canon','psalms',138,7,'canon','psalms',57,2,'free',
      E'*I will cry unto Elohim (God) most high; unto Elohim (God) that performeth all things for me.* (Psalm 57:2) *Though I walk in the midst of trouble, thou wilt revive me* (Psalm 138:7): the same trust — the El Elyon who *performeth all things for me* is the One David leans on in the midst of trouble.'),
    ('canon','psalms',138,8,'canon','philippians',1,6,'free',
      E'*Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ):* (Philippians 1:6) *Yahuah (LORD) will perfect that which concerneth me... forsake not the works of thine own hands* (Psalm 138:8) is carried forward whole: the One who began the work will perform it — He does not forsake what His own hands have made.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps138_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps138_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-138-thy-word-magnified-above-thy-name-the-exalted-word',
       E'Thy word magnified above thy name: the exalted Word, sung before the gods',
       E'David begins *I will praise thee with my whole heart: before the gods will I sing praise unto thee* (Psalm 138:1). He sings in the divine council — *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1) — where the *gods* are *children of the El Elyon (most High)* (Psalm 82:6), appointed and accountable, never sovereign. David praises unashamed before them, for the One enthroned over the council is his Elohim.\n\nThen the height of the praise: *I will worship toward thy holy temple, and praise thy name for thy lovingkindness and for thy truth: for thou hast magnified thy word above all thy name* (Psalm 138:2). The *lovingkindness* and *truth* are the chesed and emet Yahuah proclaimed when He passed by: *Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — the Name is mercy and truth. And the word He magnifies above the Name is the word *settled in heaven* for ever: *For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89).\n\nRead forward, the magnified Word is the Formed Word, drawn from the Formless: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), who *was made flesh, and dwelt among us... full of grace and truth* (John 1:14) — the very *lovingkindness* and *truth* the psalm praises, now beheld. The Formed Son who is Yahuah and has a Father.',
       sv.verse_id, ev.verse_id, 'free', 25425
  FROM _s302_ps138_lookup sv, _s302_ps138_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=138 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering',
       E'All the kings of the earth shall praise thee: the ingathering of the nations',
       E'*All the kings of the earth shall praise thee, O Yahuah (LORD), when they hear the words of thy mouth. Yea, they shall sing in the ways of Yahuah (LORD): for great is the glory of Yahuah (LORD)* (Psalm 138:4-5). This is the ingathering of the nations — the harvest gathered WITH Yahuah''s people, never in place of them.\n\nThe Psalter sings it twice over: *All nations whom thou hast made shall come and worship before thee, O Yahuah (Lord); and shall glorify thy name* (Psalm 86:9). Isaiah sees the same in the last days: *the mountain of the LORD''S house shall be established... and all nations shall flow unto it* (Isaiah 2:2), and they come saying *let us go up to the mountain of Yahuah (LORD)... and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). They *sing in the ways of Yahuah* (Psalm 138:5) because they walk in His paths — the song and the Torah-walk are one.\n\nPaul quotes the Psalter to seal it: *And again, Praise Yahuah (Lord), all ye Gentiles; and laud him, all ye people* (Romans 15:11). The nations join the praise of Yahuah — grafted in among His people, never replacing them; both branches are Yashar''el (Romans 11).',
       sv.verse_id, ev.verse_id, 'free', 25428
  FROM _s302_ps138_lookup sv, _s302_ps138_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=138 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off',
       E'He hath respect unto the lowly: but the proud he knoweth afar off',
       E'*Though Yahuah (LORD) be high, yet hath he respect unto the lowly: but the proud he knoweth afar off* (Psalm 138:6). Height that stoops to the humble and holds the proud at a distance — a scale that runs the whole library.\n\nThe wisdom of Yashar''el states it first: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Isaiah sees the High One Himself come down to the contrite: *thus saith the high and lofty One that inhabiteth eternity, whose name is Holy; I dwell in the high and holy place, with him also that is of a contrite and humble spirit* (Isaiah 57:15). Miriam sings the reversal: *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52).\n\nAnd the apostles quote the very principle: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6); *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). The proud Yahuah *knoweth afar off* — He resists them; the lowly He fills with grace. One unbroken word from Proverbs to Kepha.',
       sv.verse_id, ev.verse_id, 'free', 25431
  FROM _s302_ps138_lookup sv, _s302_ps138_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=138 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-138-yahuah-will-perfect-that-which-concerneth-me',
       E'Yahuah will perfect that which concerneth me: forsake not the works of thine own hands',
       E'*Though I walk in the midst of trouble, thou wilt revive me: thou shalt stretch forth thine hand against the wrath of mine enemies, and thy right hand shall save me* (Psalm 138:7). The same trust David sings elsewhere: *I will cry unto Elohim (God) most high; unto Elohim (God) that performeth all things for me* (Psalm 57:2) — the El Elyon who performs all things is the One he leans on in the midst of trouble.\n\nThen the closing confidence, the chesed-forever Hallel refrain: *Yahuah (LORD) will perfect that which concerneth me: thy mercy, O Yahuah (LORD), endureth for ever: forsake not the works of thine own hands* (Psalm 138:8). What His own hands have begun, His own hands will finish.\n\nPaul carries the whole confession forward: *Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). He who began the work will perform it; He does not forsake the works of His own hands.',
       sv.verse_id, ev.verse_id, 'free', 25434
  FROM _s302_ps138_lookup sv, _s302_ps138_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=138 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1 (vv.1-2)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 82:1 — *Elohim... judgeth among the gods*: the divine council David sings before.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=1
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=82 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 82:6 — *children of the El Elyon (most High)*: the gods are appointed, never sovereign.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=1
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=82 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 34:6 — the Name proclaimed: *merciful and gracious... and truth* = the chesed and emet of v.2.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=2
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 119:89 — *thy word is settled in heaven*: the word magnified above the Name.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=2
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'John 1:1 — *the Word was with Elohim, and the Word was Elohim*: the Formed Word David exalts.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=2
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'John 1:14 — *the Word was made flesh... full of grace and truth*: the magnified Word, now beheld.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=2
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-thy-word-magnified-above-thy-name-the-exalted-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 (vv.4-5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 86:9 — *All nations... shall come and worship before thee*: the same ingathering.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=4
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 2:2 — *all nations shall flow unto it*: the kings drawn to the mountain in the last days.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=4
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 2:3 — *out of Zion shall go forth the law*: they sing in His ways because they walk His paths.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=5
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 15:11 — *Praise Yahuah, all ye Gentiles*: Paul quotes the Psalter; nations joined, not replacing (Rom 11).'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=4
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=15 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-all-the-kings-of-the-earth-shall-praise-thee-the-ingathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 (v.6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 3:34 — *he giveth grace unto the lowly*: the Tanakh source the apostles quote.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 57:15 — the *high and lofty One* dwells *with... a contrite and humble spirit*: height that stoops.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Luke 1:52 — *exalted them of low degree*: Miriam''s song, the great reversal.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'James 4:6 — *Elohim resisteth the proud, but giveth grace unto the humble*: the principle quoted.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Peter 5:5 — *be clothed with humility... giveth grace to the humble*: Kepha echoes the same word.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=6
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-he-hath-respect-unto-the-lowly-but-the-proud-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 (vv.7-8)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 57:2 — *Elohim (God) that performeth all things for me*: the trust David leans on in trouble.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=7
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=57 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-yahuah-will-perfect-that-which-concerneth-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Philippians 1:6 — *he which hath begun a good work... will perform it*: v.8 carried forward whole.'
  FROM cross_reference_threads t
  JOIN _s302_ps138_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=138 AND sv.verse_number=8
  JOIN _s302_ps138_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-138-yahuah-will-perfect-that-which-concerneth-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
