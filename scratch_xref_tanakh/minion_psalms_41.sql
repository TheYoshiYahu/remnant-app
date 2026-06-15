-- ----- fragment: minion_psalms_41.sql (Psalm 41) -----
-- Chapter: Psalm 41 — THE CLOSE OF BOOK I OF THE PSALTER. David's psalm of the considerate man
-- betrayed in his sickness, ending in the great doxology that seals the first book of the five.
-- Four load-bearing weaves: ★ the opening beatitude *Blessed is he that considereth the poor*
-- (v.1) = the Torah-ethic of mercy to the poor (Deuteronomy 15:7-11, Proverbs 19:17), mercy
-- returned by measure (vv.1-3; Matthew 5:7, Acts 20:35); v.4 *heal my soul; for I have sinned
-- against thee* = the confession-and-healing lateral (Psalm 32, Psalm 51); ★★★ the KEYSTONE v.9
-- *mine own familiar friend... which did eat of my bread, hath lifted up his heel against me*
-- named BY the Formed Son as scripture-being-fulfilled in the betrayal of Judas (John 13:18); and
-- ★ the closing doxology v.13 *Blessed be Yahuah Elohim of Israel from everlasting, and to
-- everlasting. Amen, and Amen* = the seal of Book I, lateral to the matching doxologies that close
-- Books II–IV (Psalm 72:18-19, 89:52, 106:48).
-- Tag: ps041   Temp view: _s302_ps041_lookup
-- Sort band: base 23000, step 3 -> threads at 23000, 23003, 23006, 23009 (4 threads)
-- Source of EVERY row: 'canon','psalms',41,v
--
-- Psalm 41 coverage:
--   ★ vv.1-3 (Blessed is he that considereth the poor: Yahuah will deliver him in time of trouble...
--          Yahuah will preserve him, and keep him alive... Yahuah will strengthen him upon the bed
--          of languishing)
--        NT:     ★ Matthew 5:7 (Blessed are the merciful: for they shall obtain mercy — mercy
--                returned by measure), Acts 20:35 (It is more blessed to give than to receive) — THREAD 1
--        Extras: none warranted (Psalms run lean on extras; the poor-ethic is carried cleaner by the
--                Torah + Proverbs + the Beatitude — Sirach almsgiving weighed but not forced)
--        Tanakh: ★ Deuteronomy 15:7-11 (thou shalt not harden thine heart, nor shut thine hand from
--                thy poor brother... thou shalt open thine hand wide — the Torah-command of mercy to
--                the poor), ★ Proverbs 19:17 (He that hath pity upon the poor lendeth unto Yahuah;
--                and that which he hath given will he pay him again — mercy returned by Yahuah) — THREAD 1
--   v.4 (I said, Yahuah, be merciful unto me: heal my soul; for I have sinned against thee)
--        NT:     none warranted (the confession-and-healing weave is fully carried by the psalter)
--        Extras: none warranted
--        Tanakh: ★ Psalm 32:1-5 (Blessed is he whose transgression is forgiven... I acknowledged my
--                sin unto thee — confession met with forgiveness), Psalm 51:1-4 (Have mercy upon me...
--                For I acknowledge my transgressions... Against thee, thee only, have I sinned) — THREAD 2
--   vv.5-8 (Mine enemies speak evil of me... All that hate me whisper together against me... An evil
--          disease, say they, cleaveth fast unto him)
--        NT/Extras/Tanakh: none warranted as separate (the whispering-enemies material is the setting
--          for the betrayal of v.9; folded as lead-in to THREAD 3)
--   ★★★ v.9 (Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted
--          up his heel against me)
--        NT:     ★★★ John 13:18 (that the scripture may be fulfilled, He that eateth bread with me
--                hath lifted up his heel against me — the Formed Son quotes the verse BY the betrayal
--                of Judas), John 13:21 (one of you shall betray me — the betrayal foretold) — THREAD 3
--                (load-bearing messianic: the psalm named as scripture being fulfilled)
--        Extras: none warranted (SKIP 1 Enoch 62:5 per brief; the betrayal-type is carried by John)
--        Tanakh: none warranted (the betrayer-type lands forward in John; no clean Tanakh add forced)
--   vv.10-12 (raise me up, that I may requite them... thou upholdest me in mine integrity, and settest
--          me before thy face for ever)
--        NT/Extras/Tanakh: none warranted as separate (the vindication-and-upholding close folds into
--          THREAD 3's resolution — the betrayed One raised up and set before Yahuah's face)
--   ★ v.13 (Blessed be Yahuah Elohim of Israel from everlasting, and to everlasting. Amen, and Amen)
--        NT:     none warranted (the doxology seals the Hebrew book-structure; no NT add)
--        Extras: none warranted
--        Tanakh: ★ Psalm 72:18-19 (Blessed be Yahuah Elohim, the Elohim of Yashar'el... and let the
--                whole earth be filled with his glory; Amen, and Amen — the close of Book II),
--                ★ Psalm 89:52 (Blessed be Yahuah for evermore. Amen, and Amen — the close of Book III),
--                ★ Psalm 106:48 (Blessed be Yahuah Elohim of Yashar'el from everlasting to everlasting...
--                Amen — the close of Book IV) — THREAD 4 (the five-book doxologies)
--
-- Threads (slug — target libraries):
--   1. psalm-41-blessed-is-he-that-considereth-the-poor — NT (Matthew 5, Acts 20) + Tanakh
--      (Deuteronomy 15, Proverbs 19) [free] (★ the Torah-ethic of mercy to the poor, returned by measure)
--   2. psalm-41-heal-my-soul-for-i-have-sinned-against-thee — Tanakh (Psalm 32, Psalm 51) [free]
--      (the confession-and-healing weave — sin acknowledged, mercy sought)
--   3. psalm-41-mine-own-familiar-friend-hath-lifted-up-his-heel — NT (John 13) [free]
--      (★★★ KEYSTONE: the Formed Son quotes the verse BY the betrayal of Judas — scripture fulfilled)
--   4. psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one — Tanakh (Psalm 72, 89, 106)
--      [free] (★ the doxology sealing Book I — the five-book structure of the Psalter)
--
-- Framing notes:
--   ★ CONSIDERETH THE POOR (THREAD 1): *Blessed is he that considereth the poor: Yahuah (LORD) will
--      deliver him in time of trouble* (41:1). This opening beatitude is the Torah-ethic of mercy made
--      a blessing: the considerate man is delivered, preserved, kept alive, strengthened on his bed of
--      sickness (vv.1-3) — mercy returned to him by the measure he showed. It is the Deuteronomy command
--      embodied (*thou shalt not harden thine heart, nor shut thine hand from thy poor brother... thou
--      shalt open thine hand wide*, Deut 15:7-8), the proverb's promise (*He that hath pity upon the
--      poor lendeth unto Yahuah*, Prov 19:17), and the Beatitude forward (*Blessed are the merciful: for
--      they shall obtain mercy*, Matt 5:7). The blessing is not earned-merit but the covenant-measure:
--      the merciful obtain mercy.
--   THE CONFESSION (THREAD 2): *I said, Yahuah (LORD), be merciful unto me: heal my soul; for I have
--      sinned against thee* (41:4). The healing sought is bound to confession — David names his sin
--      against Yahuah and asks mercy and healing together, the same movement as Psalm 32 (*I acknowledged
--      my sin unto thee... and thou forgavest the iniquity of my sin*) and Psalm 51 (*Against thee, thee
--      only, have I sinned*). The broken man is healed where the sin is owned.
--   ★★★ MINE OWN FAMILIAR FRIEND (THREAD 3): *Yea, mine own familiar friend, in whom I trusted, which
--      did eat of my bread, hath lifted up his heel against me* (41:9). The Formed Son — Yahusha
--      (Jesus) — takes this verse on His own lips at the last supper and names it scripture being
--      fulfilled in the betrayal of Judas: *I speak not of you all: I know whom I have chosen: but that
--      the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me*
--      (John 13:18), troubled in spirit He testified *that one of you shall betray me* (John 13:21). The
--      One who walked Yashar'el in the Tanakh names the Tanakh as His own testimony; the betrayed-by-a-
--      table-friend type runs from David to the Son. The psalm's resolution — *raise me up* (v.10),
--      *thou upholdest me in mine integrity, and settest me before thy face for ever* (v.12) — is the
--      vindication of the betrayed, raised up and set before the Father's face.
--   ★ THE DOXOLOGY OF BOOK I (THREAD 4): *Blessed be Yahuah Elohim (the LORD God) of Yashar'el (Israel)
--      from everlasting, and to everlasting. Amen, and Amen* (41:13). This is not merely the psalm's
--      close but the seal of the FIRST of the Psalter's five books. Matching doxologies seal each book:
--      Book II ends *Blessed be Yahuah Elohim... let the whole earth be filled with his glory; Amen, and
--      Amen* (Ps 72:18-19); Book III, *Blessed be Yahuah for evermore. Amen, and Amen* (Ps 89:52); Book
--      IV, *Blessed be Yahuah Elohim of Yashar'el from everlasting to everlasting... Amen* (Ps 106:48).
--      The God blessed from everlasting to everlasting is the Elohim of Yashar'el — His covenant people,
--      the two-house inheritance — and the whole five-book Psalter is bound up in His praise.
--   VERSES WITH NO SEPARATE ADD: vv.5-8 (the whispering enemies, the evil-disease taunt) and vv.10-12
--      (the plea to be raised up, the upholding in integrity) are recorded as folded — the enemy-setting
--      as lead-in to the betrayal of THREAD 3, the vindication-close as the resolution of THREAD 3.

CREATE TEMP VIEW _s302_ps041_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Blessed is he that considereth the poor — the Torah-ethic of mercy returned by measure
    ('canon','psalms',41,1,'canon','deuteronomy',15,7,'free',
      E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). *Blessed is he that considereth the poor* (Psalm 41:1): the considerate man of the psalm is the man who keeps the Torah-command — the open hand, the unhardened heart toward the poor brother. The blessing rests on the doing of the commandment.'),
    ('canon','psalms',41,1,'canon','deuteronomy',15,11,'free',
      E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). *Blessed is he that considereth the poor* (Psalm 41:1): the Torah makes care for the poor a standing command, never abolished — the wide-open hand. The psalm sings the blessing upon the one who obeys it.'),
    ('canon','psalms',41,1,'canon','proverbs',19,17,'free',
      E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble* (Psalm 41:1): the proverb names how the blessing comes — pity to the poor is a loan to Yahuah Himself, and He repays. The deliverance of the psalm is Yahuah paying back the mercy that was shown.'),
    ('canon','psalms',41,1,'canon','matthew',5,7,'free',
      E'*Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7). *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble* (Psalm 41:1): the Formed Son sets the same covenant-measure in the Beatitude — the merciful obtain mercy. The one who considers the poor is delivered because mercy is returned to him by the measure he gave.'),
    ('canon','psalms',41,2,'canon','acts',20,35,'free',
      E'*I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). *Blessed is he that considereth the poor... Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth* (Psalm 41:1-2): the blessing of the giver is the saying of the Lord Yahusha — more blessed to give than to receive. The considerate man who supports the weak is the man preserved and kept and blessed.'),

    -- THREAD 2: Heal my soul, for I have sinned against thee — the confession met with mercy
    ('canon','psalms',41,4,'canon','psalms',32,1,'free',
      E'*Blessed is he whose transgression is forgiven, whose sin is covered* (Psalm 32:1). *I said, Yahuah (LORD), be merciful unto me: heal my soul; for I have sinned against thee* (Psalm 41:4): the healing David seeks is the forgiveness Psalm 32 blesses — the covered sin, the forgiven transgression. To be healed of soul is to have the sin owned and covered.'),
    ('canon','psalms',41,4,'canon','psalms',32,5,'free',
      E'*I acknowledged my sin unto thee, and mine iniquity have I not hid. I said, I will confess my transgressions unto Yahuah (LORD); and thou forgavest the iniquity of my sin* (Psalm 32:5). *Heal my soul; for I have sinned against thee* (Psalm 41:4): the same movement of confession — the sin acknowledged, not hidden, and met with forgiveness. The owning of the sin is the doorway to the healing.'),
    ('canon','psalms',41,4,'canon','psalms',51,1,'free',
      E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions* (Psalm 51:1). *I said, Yahuah (LORD), be merciful unto me: heal my soul; for I have sinned against thee* (Psalm 41:4): the plea for mercy is the plea of the great penitential psalm — the multitude of tender mercies sought to blot out transgression. David asks healing where he confesses sin.'),
    ('canon','psalms',41,4,'canon','psalms',51,4,'free',
      E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). *Heal my soul; for I have sinned against thee* (Psalm 41:4): the confession is identical — the sin is against Yahuah Himself. The wound of the soul is sin against God, and that is exactly what David names before he asks to be healed.'),

    -- THREAD 3 (★★★): Mine own familiar friend hath lifted up his heel — the betrayal the Formed Son names fulfilled
    ('canon','psalms',41,9,'canon','john',13,18,'free',
      E'*I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18). *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9): the Formed Son — Yahusha (Jesus) — quotes this very verse at the last supper and names it scripture being fulfilled in the betrayal of Judas. The One who walked Yashar''el (Israel) in the Tanakh names the Tanakh as His own testimony; the table-friend who eats the bread and lifts the heel is the betrayer-type running from David to the Son.'),
    ('canon','psalms',41,9,'canon','john',13,21,'free',
      E'*When Yahusha (Jesus) had thus said, he was troubled in spirit, and testified, and said, Verily, verily, I say unto you, that one of you shall betray me* (John 13:21). *Mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9): troubled in spirit at the very table, the Son foretells the betrayal the psalm describes — the trusted friend at the meal turned enemy. The grief of the betrayed in the psalm becomes the grief of the Formed Son in the upper room.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps041_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps041_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4 doxology cross_references (Tanakh-only, separate INSERT block for clarity)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',41,13,'canon','psalms',72,18,'free',
      E'*Blessed be Yahuah Elohim (the LORD God), the Elohim (God) of Yashar''el (Israel), who only doeth wondrous things* (Psalm 72:18). *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting. Amen, and Amen* (Psalm 41:13): the matching doxology seals Book II of the Psalter as 41:13 seals Book I — the same blessing upon the Elohim of Yashar''el, His covenant people. The five-book structure is bound together by these closing benedictions.'),
    ('canon','psalms',41,13,'canon','psalms',72,19,'free',
      E'*And blessed be his glorious name for ever: and let the whole earth be filled with his glory; Amen, and Amen* (Psalm 72:19). *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting. Amen, and Amen* (Psalm 41:13): the doubled *Amen, and Amen* that closes Book I is echoed exactly at the close of Book II — the name blessed for ever, the earth filled with His glory. The seals of the books speak with one voice.'),
    ('canon','psalms',41,13,'canon','psalms',89,52,'free',
      E'*Blessed be Yahuah (LORD) for evermore. Amen, and Amen* (Psalm 89:52). *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting. Amen, and Amen* (Psalm 41:13): the close of Book III carries the same doubled *Amen, and Amen* and the same everlasting blessing — Yahuah blessed for evermore. The doxology that seals Book I is the pattern repeated to seal Book III.'),
    ('canon','psalms',41,13,'canon','psalms',106,48,'free',
      E'*Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting to everlasting: and let all the people say, Amen. Praise ye Yahuah (LORD)* (Psalm 106:48). *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting. Amen, and Amen* (Psalm 41:13): the close of Book IV repeats the exact words of the close of Book I — *Yahuah Elohim of Yashar''el from everlasting to everlasting* — with all the people called to say Amen. The Psalter''s books are sealed by this one recurring blessing upon the God of His two-house people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps041_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps041_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-41-blessed-is-he-that-considereth-the-poor',
       E'Blessed is he that considereth the poor — the Torah-ethic of mercy returned by measure',
       E'The psalm opens with a beatitude that is the Torah-ethic made a blessing: *Blessed is he that considereth the poor: Yahuah (LORD) will deliver him in time of trouble. Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth... Yahuah (LORD) will strengthen him upon the bed of languishing* (Psalm 41:1-3). The considerate man is delivered, preserved, kept alive, strengthened in his own sickness — mercy returned to him by the very measure he showed. This is the Deuteronomy command embodied: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deut 15:7), *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* (Deut 15:11) — the care of the poor a standing command, never abolished. The proverb names how the blessing comes: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Prov 19:17) — pity is a loan to Yahuah, and He repays. The Formed Son sets the same measure in the Beatitude: *Blessed are the merciful: for they shall obtain mercy* (Matt 5:7); and Paul recalls His word, *It is more blessed to give than to receive* (Acts 20:35). The blessing is not earned-merit but the covenant-measure: the merciful obtain mercy.',
       sv.verse_id, ev.verse_id, 'free', 23000
  FROM _s302_ps041_lookup sv, _s302_ps041_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=41 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-41-heal-my-soul-for-i-have-sinned-against-thee',
       E'Heal my soul, for I have sinned against thee — the confession met with mercy',
       E'*I said, Yahuah (LORD), be merciful unto me: heal my soul; for I have sinned against thee* (Psalm 41:4). The healing David seeks is bound to confession — he names his sin against Yahuah and asks mercy and healing together. It is the very movement of Psalm 32: *Blessed is he whose transgression is forgiven, whose sin is covered* (Ps 32:1); *I acknowledged my sin unto thee, and mine iniquity have I not hid... and thou forgavest the iniquity of my sin* (Ps 32:5). And it is the confession of the great penitential psalm: *Have mercy upon me, O Elohim (God), according to thy lovingkindness... blot out my transgressions* (Ps 51:1); *Against thee, thee only, have I sinned, and done this evil in thy sight* (Ps 51:4). The wound of the soul is sin against Yahuah, and the broken man is healed where the sin is owned — not hidden, but confessed, and met with mercy.',
       sv.verse_id, ev.verse_id, 'free', 23003
  FROM _s302_ps041_lookup sv, _s302_ps041_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=41 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-41-mine-own-familiar-friend-hath-lifted-up-his-heel',
       E'Mine own familiar friend hath lifted up his heel against me — the betrayal the Formed Son names fulfilled',
       E'Out of the whispering of enemies — *All that hate me whisper together against me* (41:7) — rises the deepest wound: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). The Formed Son — Yahusha (Jesus) — takes this very verse upon His own lips at the last supper and names it scripture being fulfilled in the betrayal of Judas: *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18); and, troubled in spirit, He testified, *one of you shall betray me* (John 13:21). The One who walked Yashar''el (Israel) in the Tanakh names the Tanakh as His own testimony — the trusted table-friend who eats the bread and lifts the heel is the betrayer-type running from David to the Son. And the psalm''s resolution is the vindication of the betrayed: *But thou, O Yahuah (LORD), be merciful unto me, and raise me up* (v.10), *thou upholdest me in mine integrity, and settest me before thy face for ever* (v.12) — the betrayed One raised up and set before the Father''s face.',
       sv.verse_id, ev.verse_id, 'free', 23006
  FROM _s302_ps041_lookup sv, _s302_ps041_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=41 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one',
       E'Blessed be Yahuah from everlasting — the doxology sealing Book I of the Psalter',
       E'*Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting. Amen, and Amen* (Psalm 41:13). This is not merely the psalm''s close but the seal of the FIRST of the Psalter''s five books. Matching doxologies, each with the doubled *Amen*, close the books that follow: Book II — *Blessed be Yahuah Elohim (the LORD God), the Elohim (God) of Yashar''el (Israel), who only doeth wondrous things... and let the whole earth be filled with his glory; Amen, and Amen* (Ps 72:18-19); Book III — *Blessed be Yahuah (LORD) for evermore. Amen, and Amen* (Ps 89:52); Book IV — *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting to everlasting: and let all the people say, Amen* (Ps 106:48), echoing 41:13 almost word for word. The God blessed from everlasting to everlasting is the Elohim of Yashar''el — His covenant people, the two-house inheritance — and the whole five-book Psalter is bound together in His praise.',
       sv.verse_id, ev.verse_id, 'free', 23009
  FROM _s302_ps041_lookup sv, _s302_ps041_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=41 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — the considerate man of 41:1 keeps the Torah-command: the open hand to the poor.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=1
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-is-he-that-considereth-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* (Deuteronomy 15:11) — the care of the poor a standing command (41:1), never abolished.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=1
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-is-he-that-considereth-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17) — pity to the poor (41:1) is a loan to Yahuah, and He repays.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=1
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-is-he-that-considereth-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Blessed are the merciful: for they shall obtain mercy* (Matthew 5:7) — the Formed Son sets the same covenant-measure: the one who considers the poor (41:1) is shown mercy by measure.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=1
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-is-he-that-considereth-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*It is more blessed to give than to receive* (Acts 20:35) — Paul recalls the saying of the Lord Yahusha; the giver who is preserved and kept (41:1-2) is the blessed one.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=2
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-is-he-that-considereth-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Blessed is he whose transgression is forgiven, whose sin is covered* (Psalm 32:1) — the healing of 41:4 is the forgiveness Psalm 32 blesses: the covered sin.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=4
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-heal-my-soul-for-i-have-sinned-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I acknowledged my sin unto thee... and thou forgavest the iniquity of my sin* (Psalm 32:5) — the same movement as 41:4: the sin owned, not hidden, met with forgiveness.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=4
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-heal-my-soul-for-i-have-sinned-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Have mercy upon me, O Elohim (God)... blot out my transgressions* (Psalm 51:1) — the plea for mercy of 41:4 is the plea of the great penitential psalm.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=4
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-heal-my-soul-for-i-have-sinned-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Against thee, thee only, have I sinned* (Psalm 51:4) — the confession is identical to 41:4: the wound of the soul is sin against Yahuah Himself.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=4
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-heal-my-soul-for-i-have-sinned-against-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18) — the Formed Son quotes 41:9 BY the betrayal of Judas; the psalm named as His own testimony fulfilled.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=9
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-mine-own-familiar-friend-hath-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*one of you shall betray me* (John 13:21) — troubled in spirit at the table, the Son foretells the betrayal the trusted bread-friend of 41:9 enacts.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=9
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-mine-own-familiar-friend-hath-lifted-up-his-heel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Blessed be Yahuah Elohim... the Elohim of Yashar''el (Israel), who only doeth wondrous things* (Psalm 72:18) — the doxology sealing Book II, matching 41:13''s seal of Book I.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=13
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *let the whole earth be filled with his glory; Amen, and Amen* (Psalm 72:19) — the doubled *Amen, and Amen* of 41:13 echoed exactly at the close of Book II.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=13
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Blessed be Yahuah (LORD) for evermore. Amen, and Amen* (Psalm 89:52) — the close of Book III, the same everlasting blessing and doubled Amen as 41:13.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=13
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Blessed be Yahuah Elohim of Yashar''el (Israel) from everlasting to everlasting: and let all the people say, Amen* (Psalm 106:48) — the close of Book IV repeats 41:13 almost word for word.'
  FROM cross_reference_threads t
  JOIN _s302_ps041_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=41 AND sv.verse_number=13
  JOIN _s302_ps041_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-41-blessed-be-yahuah-from-everlasting-the-doxology-of-book-one'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
