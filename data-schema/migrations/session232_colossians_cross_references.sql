-- =====================================================================
-- Session 232 — Colossians FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session232_colossians_cross_references.sql
-- =====================================================================

\echo 'session232 — Colossians cross-references starting...'
BEGIN;

-- ----- fragment: minion_colossians_01.sql (S232 Colossians 1) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 1 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 1 (29 verses) — ★★ HIGH watchpoint / BLESSING: the hymn of the Formed Son
--   (1:15-20) and the mystery hid-now-manifest, Messiah in you (1:26-27).
-- Tag: co01 (temp view _s232_co01_lookup).
-- Sort band: floor 7660, step 3 (7660, 7663, 7666, 7669 used; under 7685).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Colossians = the twin of Ephesians; dense Christology + cosmic reconciliation;
-- same Yahuah, same Torah, the grafted-in nations brought into Yashar'el's one commonwealth, NOT a
-- new institution replacing Yashar'el). ★★ The load-bearing passage is the hymn 1:15-20: GUARD THE
-- CHRISTOLOGY — the Formed Son, the visible image of the invisible Father, the firstborn-Heir
-- THROUGH whom all things were made, in whom the Father was pleased to set all fulness. *Firstborn
-- of every creature* (1:15) does NOT mean first creature made — the very next verse (1:16) makes him
-- the AGENT of creation (*by him were all things created*), the pre-eminent Heir brought forth
-- (Psalm 89:27 *I will make him my firstborn, higher than the kings of the earth*). It pleased the
-- FATHER (the source) that the fulness should dwell in him (1:19); he is the image OF the invisible
-- Elohim (he images Another). This is NOT trinitarian co-equality, NOT modalist collapse, and NOT a
-- created/Arian being. Build on Genesis 1:1 / 1:26 (the image, *let us make man in our image*),
-- Proverbs 8 (Wisdom brought forth before the works, the craftsman beside Him), Psalm 89:27 (the
-- firstborn), Wisdom of Solomon 7:26 (the brightness of the everlasting light, the image of his
-- goodness — a Formed-witness, NOT a second co-equal person) and Sirach 24:9 (Wisdom *created from
-- the beginning before the world*), with the NT twins John 1:3, Hebrews 1:3, Philippians 2:6,
-- Revelation 3:14, 1 Corinthians 15:20.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-8   greeting / thanksgiving / faith, hope, love / the gospel bringing forth fruit
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--                   (the faith-hope-love triad is a single phrase, not a load-bearing thread of ch1)
--   v.9-11  filled with the knowledge of his will / walk worthy / fruitful in every good work
--           Tanakh: none warranted (carried in prose)   Extras: none warranted   NT: none warranted
--   v.12-14 the inheritance of the saints in light / delivered from the power of darkness /
--           translated into the kingdom / redemption through his blood, forgiveness of sins
--           Tanakh: Exodus 6:6 (I will redeem you with a stretched out arm — the Exodus pattern)
--           Extras: none warranted
--           NT: Acts 26:18 (turn them from darkness to light... forgiveness of sins, and inheritance
--               among them which are sanctified), Ephesians 1:7 (redemption through his blood, the
--               forgiveness of sins — the twin letter)
--   v.15-20 ★★ THE HYMN OF THE FORMED SON: the image of the invisible Elohim, the firstborn of every
--           creature, by him all things created, the head of the body, the firstborn from the dead,
--           in him all fulness, reconciling all things by the blood of his cross
--           Tanakh: Genesis 1:1 (in the beginning Elohim created), Genesis 1:26 (let us make man in
--                   our image), Proverbs 8:30 (Wisdom the one brought up beside Him, his delight),
--                   Psalm 89:27 (I will make him my firstborn, higher than the kings of the earth)
--           Extras: Wisdom of Solomon 7:26 (the brightness of the everlasting light... the image of
--                   his goodness), Sirach 24:9 (He created me from the beginning before the world)
--           NT: John 1:3 (all things were made by him), Hebrews 1:3 (the brightness of his glory,
--               and the express image of his person), Philippians 2:6 (being in the form of Elohim),
--               Revelation 3:14 (the beginning of the creation of Elohim), 1 Corinthians 15:20 (the
--               firstfruits of them that slept — behind 1:18 the firstborn from the dead)
--   v.21-25 reconciled in the body of his flesh / present you holy / Paul a minister of the gospel
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (reconciliation
--                   carried in the hymn thread at 1:20)
--   v.26-27 the mystery hid from ages and generations, now made manifest / Messiah in you among the
--           Gentiles, the hope of glory
--           Tanakh: none warranted (the mystery is the grafted-in regathering, carried in prose)
--           Extras: 1 Enoch 48:6 (chosen and hidden before Him, before the creation of the world),
--                   1 Enoch 48:7 (the wisdom of Yahuah (God) of Spirits hath revealed him)
--           NT: Ephesians 3:5-6 (the mystery... now revealed... that the Gentiles should be
--               fellowheirs, and of the same body — the twin letter)
--   v.28-29 whom we preach, that we may present every man perfect in HaMashiach Yahusha
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7660 colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6   (Tanakh + NT)
--   7663 colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8        (Tanakh + Extras + NT)  [★★ FORMED-SON HYMN]
--   7666 colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15        (Tanakh + NT)
--   7669 colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48     (Extras + NT)
-- =====================================================================

CREATE TEMP VIEW _s232_co01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6
  ('canon', 'colossians', 1, 13, 'canon', 'exodus', 6, 6, 'free', E'*Wherefore say unto the children of Yashar''el (Israel), I am Yahuah (LORD), and I will bring you out from under the burdens of the Egyptians, and I will rid you out of their bondage, and I will redeem you with a stretched out arm, and with great judgments:* (Exodus 6:6). Paul names the same deliverance pattern: *Who hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son* (Colossians 1:13). As Yahuah (LORD) brought Yashar''el (Israel) out from under the burdens of Egypt and *redeemed* them with a stretched-out arm, so the called-out ones are brought out from the power of darkness into the kingdom — the Exodus story is the shape of the redemption *through his blood, even the forgiveness of sins* (Colossians 1:14), the same Redeemer carrying the same people out of bondage into their inheritance.'),
  ('canon', 'colossians', 1, 13, 'canon', 'acts', 26, 18, 'free', E'*To open their eyes, and to turn them from darkness to light, and from the power of Satan unto Elohim (God), that they may receive forgiveness of sins, and inheritance among them which are sanctified by faith that is in me.* (Acts 26:18). The risen Messiah''s own commission to Paul speaks Colossians word for word: turned *from darkness to light, and from the power of Satan unto Elohim (God)* answers *delivered us from the power of darkness* (Colossians 1:13); *forgiveness of sins, and inheritance among them which are sanctified* answers *the inheritance of the saints in light* and *the forgiveness of sins* (Colossians 1:12,14). The commission Paul received is the very deliverance he announces to Colosse — out of the dominion of darkness into the light-inheritance of the set-apart ones.'),
  ('canon', 'colossians', 1, 14, 'canon', 'ephesians', 1, 7, 'free', E'*In whom we have redemption through his blood, the forgiveness of sins, according to the riches of his grace;* (Ephesians 1:7). The twin letter, written at the same time, carries the identical confession: *In whom we have redemption through his blood, even the forgiveness of sins* (Colossians 1:14). Ephesians and Colossians speak it almost syllable for syllable — *redemption through his blood, the forgiveness of sins* — one redemption, one ransom-price, the blood of the dear Son into whose kingdom the redeemed are translated, the inheritance secured for the saints in light.'),
  -- thread: colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8  [★★ FORMED-SON HYMN]
  ('canon', 'colossians', 1, 15, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). At creation Elohim (God) speaks of *our image* — and the Son is named *the image of the invisible Elohim (God)* (Colossians 1:15). The invisible Father cannot be seen; the Son is His visible likeness, the One after whose pattern man was formed in the image. He is not a second co-equal Elohim (God) but the image OF the invisible One — the Formed drawn out of the Formless, in whom the unseen Father is made visible.'),
  ('canon', 'colossians', 1, 16, 'canon', 'genesis', 1, 1, 'free', E'*In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1). The opening word of the Tanakh stands behind the hymn: *For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him* (Colossians 1:16). The heaven and the earth that Elohim (God) created *in the beginning* are the very *all things* created BY the Son and FOR the Son. This is why *firstborn of every creature* (1:15) cannot mean first creature made — the next breath names him the agent THROUGH whom the creating was done, not a product of it; the Father created the heaven and the earth by the hand of the Formed Son.'),
  ('canon', 'colossians', 1, 17, 'canon', 'proverbs', 8, 30, 'free', E'*Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* (Proverbs 8:30). Wisdom, *brought forth* before the depths and the mountains (Proverbs 8:24-25), was *by him, as one brought up with him* — the craftsman beside Yahuah (LORD) when he prepared the heavens. So the Son *is before all things, and by him all things consist* (Colossians 1:17). The Wisdom brought forth before the works, the delight beside the Father at the founding of the world, is the Formed Son through whom and for whom all was made and in whom all holds together — pre-eminent, brought forth, never a creature among creatures.'),
  ('canon', 'colossians', 1, 15, 'canon', 'psalms', 89, 27, 'free', E'*Also I will make him my firstborn, higher than the kings of the earth.* (Psalm 89:27). Yahuah (LORD)''s word over the anointed king defines what *firstborn* means: *I will make him my firstborn, higher than the kings of the earth* — a title of pre-eminence and inheritance, the heir set above all, not the first thing made. So the Son is *the firstborn of every creature* (Colossians 1:15) and *the firstborn from the dead; that in all things he might have the preeminence* (Colossians 1:18). Firstborn is rank and right, the pre-eminent Heir over all creation — exactly as Psalm 89 makes the firstborn the highest, not the earliest.'),
  ('canon', 'colossians', 1, 15, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26). The Hebrew library already beheld a Formed-witness: Wisdom is *the brightness of the everlasting light... and the image of his goodness* — the radiance flowing from the One who cannot be seen. So Paul names the Son *the image of the invisible Elohim (God)* (Colossians 1:15). The brightness is not a second everlasting light beside the first, and the image is not a co-equal person: it is the shining-forth and visible likeness OF the unseen One — the Formed Son who images the invisible Father, in whom the Father set all fulness to dwell.'),
  ('canon', 'colossians', 1, 16, 'apocrypha', 'ecclesiasticus', 24, 9, 'extras', E'*He created me from the beginning before the world, and I shall never fail.* (Sirach 24:9). The library''s Wisdom speaks of being *created from the beginning before the world* — brought forth before the ages, present when *the Creator of all things gave me a commandment* (Sirach 24:8). It is the same pre-creation pre-eminence the hymn ascribes to the Son: *by him were all things created... and he is before all things, and by him all things consist* (Colossians 1:16-17). Read as the Formed (not a second co-equal Elohim), this Wisdom-before-the-world is the firstborn-Heir brought forth before the works, through whom the all-things were made.'),
  ('canon', 'colossians', 1, 16, 'canon', 'john', 1, 3, 'free', E'*All things were made by him; and without him was not any thing made that was made.* (John 1:3). The Word who *was in the beginning with Elohim (God)* is the One by whom *all things were made.* Paul says the same of the Son: *by him were all things created... all things were created by him, and for him* (Colossians 1:16). The agency is identical — nothing that was made was made apart from him. The Formed Word, the visible image of the invisible Father, is the hand through whom the Father made the worlds; this is why he stands before all things as their maker, not among them as a creature.'),
  ('canon', 'colossians', 1, 15, 'canon', 'hebrews', 1, 3, 'free', E'*Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). Hebrews names the Son *the brightness of his glory, and the express image of his person... upholding all things by the word of his power* — the very things the hymn declares: *the image of the invisible Elohim (God)* (Colossians 1:15), and *by him all things consist* (Colossians 1:17). The brightness shines FROM the glory and the image is the express stamp OF the person — the Son the radiance and exact likeness of the Father, by whom the Father *made the worlds* (Hebrews 1:2), upholding all things he made.'),
  ('canon', 'colossians', 1, 15, 'canon', 'philippians', 2, 6, 'free', E'*Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6). The twin hymn of Philippians: the Son *being in the form of Elohim (God).* It is the same confession as *the image of the invisible Elohim (God)* (Colossians 1:15) — he bears the form and image of the Father, the visible expression of the One who cannot be seen. And as Philippians says he *emptied himself* and was *highly exalted* by the One who *gave him a name* (Philippians 2:7-9), so Colossians says *it pleased the Father that in him should all fulness dwell* (Colossians 1:19): the Father is the source who is pleased to give, the Son the Formed who bears the form and the fulness.'),
  ('canon', 'colossians', 1, 15, 'canon', 'revelation', 3, 14, 'free', E'*And unto the angel of the church of the Laodiceans write; These things saith the Amen, the faithful and true witness, the beginning of the creation of Elohim (God);* (Revelation 3:14). The risen Messiah names himself *the beginning of the creation of Elohim (God)* — the same word the hymn uses, *the firstborn of every creature* and *the beginning* (Colossians 1:15,18). Read rightly, *the beginning of the creation* is not the first thing created but the source and head from which the creating proceeds — the One who is *before all things* (1:17), the Formed Heir through whom the all-things came to be. The beginning, the firstborn, the pre-eminent One: titles of origin and rank, never of being a creature.'),
  -- thread: colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15
  ('canon', 'colossians', 1, 18, 'canon', '1-corinthians', 15, 20, 'free', E'*But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept.* (1 Corinthians 15:20). Messiah (Christ) risen is *the firstfruits of them that slept* — the first sheaf of the resurrection harvest, the pledge that the rest will follow. So Colossians names him *the firstborn from the dead; that in all things he might have the preeminence* (Colossians 1:18). Firstfruits and firstborn-from-the-dead say one thing: he is the head and pledge of the resurrected, the first to rise never to die again, that the whole body raised after him might share his life and he have the pre-eminence in all things.'),
  ('canon', 'colossians', 1, 18, 'canon', 'psalms', 89, 27, 'free', E'*Also I will make him my firstborn, higher than the kings of the earth.* (Psalm 89:27). The firstborn of Psalm 89 is the one Yahuah (LORD) sets *higher than the kings of the earth* — the pre-eminent heir. The hymn gives the risen Son that very rank: *the firstborn from the dead; that in all things he might have the preeminence* (Colossians 1:18). As head of the body, the assembly, and as the first to rise from the dead, he holds the firstborn''s place of highest honour — the One raised above all, that in everything he might be first.'),
  -- thread: colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48
  ('canon', 'colossians', 1, 26, 'canon', 'ephesians', 3, 5, 'free', E'*Which in other ages was not made known unto the sons of men, as it is now revealed unto his holy apostles and prophets by the Spirit;* (Ephesians 3:5). The twin letter unfolds the same mystery: what *in other ages was not made known* is *now revealed.* Colossians says it of *the mystery which hath been hid from ages and from generations, but now is made manifest to his saints* (Colossians 1:26). One mystery, hidden then disclosed — and Ephesians names its content in the next verse: *That the Gentiles should be fellowheirs, and of the same body* (Ephesians 3:6), the grafted-in nations brought into the one commonwealth, which Colossians calls *Messiah (Christ) in you, the hope of glory* among the Gentiles (Colossians 1:27).'),
  ('canon', 'colossians', 1, 26, 'enoch', '1-enoch', 48, 6, 'extras', E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6). The Hebrew library held the pattern of a Chosen One *chosen and hidden before Him, Before the creation of the world* — hidden through the ages, kept until the appointed time. Paul speaks of *the mystery which hath been hid from ages and from generations, but now is made manifest* (Colossians 1:26). The hiddenness *before the creation of the world* in Enoch answers the *hid from ages* of Colossians: the long-concealed purpose, the One hidden then disclosed, now made manifest to the saints.'),
  ('canon', 'colossians', 1, 26, 'enoch', '1-enoch', 48, 7, 'extras', E'*And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness... For in his name they are saved* (1 Enoch 48:7). The hidden One is at last *revealed... to the holy and righteous* — hidden, then made known to the set-apart. So Colossians: *now is made manifest to his saints* (Colossians 1:26). The library''s movement from hidden to revealed, disclosed to the righteous and bringing salvation in his name, is the very movement of Paul''s mystery — *Messiah (Christ) in you, the hope of glory* (Colossians 1:27), the once-concealed purpose now unveiled to the gathered saints.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6',
       E'The inheritance of the saints in light: redemption from the power of darkness (Exodus 6)',
       E'Paul gives thanks for a deliverance shaped exactly like the Exodus: *Giving thanks unto the Father, which hath made us meet to be partakers of the inheritance of the saints in light: Who hath delivered us from the power of darkness, and hath translated us into the kingdom of his dear Son: In whom we have redemption through his blood, even the forgiveness of sins* (Colossians 1:12-14). The pattern is Sinai''s own gospel. At the burning-bush deliverance Yahuah (LORD) said, *I will bring you out from under the burdens of the Egyptians, and I will rid you out of their bondage, and I will redeem you with a stretched out arm, and with great judgments* (Exodus 6:6) — brought out of bondage, redeemed, carried toward an inheritance. The risen Messiah spoke the same shape over Paul''s own commission: *to turn them from darkness to light, and from the power of Satan unto Elohim (God), that they may receive forgiveness of sins, and inheritance among them which are sanctified* (Acts 26:18) — *from darkness to light* answering *delivered us from the power of darkness,* *forgiveness of sins, and inheritance among them which are sanctified* answering *the inheritance of the saints in light* and *the forgiveness of sins.* And the twin letter confesses the redemption in nearly the same syllables: *In whom we have redemption through his blood, the forgiveness of sins* (Ephesians 1:7). One Redeemer, one ransom-price, one people brought out of the dominion of darkness into the light-inheritance of the set-apart — the Exodus story consummated in the blood of the dear Son.',
       sv.verse_id, ev.verse_id, 'free', 7660
  FROM _s232_co01_lookup sv, _s232_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8',
       E'The image of the invisible Elohim, the firstborn through whom all things were made — the Formed Son (Genesis 1, Proverbs 8)',
       E'The hymn of the Formed Son: *Who is the image of the invisible Elohim (God), the firstborn of every creature: For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him: And he is before all things, and by him all things consist... For it pleased the Father that in him should all fulness dwell* (Colossians 1:15-19). Read every line in its order. He is the image OF the invisible Elohim (God) — he images Another; the Father cannot be seen, and the Son is His visible likeness, the One after whose pattern man was formed when Elohim (God) said *Let us make man in our image, after our likeness* (Genesis 1:26). He is the *firstborn of every creature* — and this cannot mean the first creature made, for the very next breath makes him the agent THROUGH whom the creating was done: the heaven and the earth that *In the beginning Elohim (God) created* (Genesis 1:1) are the *all things* created BY him and FOR him. Firstborn is rank and inheritance, not sequence: *I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27) — the pre-eminent Heir set above all, not the earliest. He is the Wisdom brought forth before the works, *by him, as one brought up with him... daily his delight* (Proverbs 8:30), the craftsman beside the Father when he prepared the heavens, so that *he is before all things, and by him all things consist.* The Hebrew library beheld the same Formed-witness: Wisdom *the brightness of the everlasting light... and the image of his goodness* (Wisdom of Solomon 7:26) — the radiance shining FROM the unseen One, not a second everlasting light beside Him; and *He created me from the beginning before the world* (Sirach 24:9), brought forth before the ages. The New Testament speaks it plainly: *All things were made by him; and without him was not any thing made that was made* (John 1:3); he is *the brightness of his glory, and the express image of his person... by whom also he made the worlds* (Hebrews 1:3,2); he is the One *being in the form of Elohim (God)* (Philippians 2:6); and he names himself *the beginning of the creation of Elohim (God)* (Revelation 3:14) — the source and head of creation, not its first product. Mark the grammar that guards the whole hymn: he is the image OF the invisible Father; it pleased the FATHER that the fulness should dwell in him; the Father is the source who gives, the Son the Formed who bears the form and the fulness. This is not co-equal-persons grammar, not a collapse of Father and Son into one, and not a created or Arian being. The Formed Son: the visible image of the invisible Father, the firstborn-Heir through whom and for whom all things were made, in whom the Father was pleased to set all fulness to dwell.',
       sv.verse_id, ev.verse_id, 'extras', 7663
  FROM _s232_co01_lookup sv, _s232_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15',
       E'The firstborn from the dead, that in all things he might have the preeminence (Psalm 89, 1 Corinthians 15)',
       E'The hymn turns from creation to resurrection: *And he is the head of the body, the church: who is the beginning, the firstborn from the dead; that in all things he might have the preeminence* (Colossians 1:18). As he is the firstborn of every creature in the old creation, so he is *the firstborn from the dead* in the new — the first to rise, never to die again, head of the body raised after him. Paul says it of the resurrection harvest: *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (1 Corinthians 15:20) — the first sheaf, the pledge that the whole body follows. And the firstborn''s rank is Psalm 89''s: *Also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27) — the pre-eminent heir set highest of all. Firstfruits, firstborn-from-the-dead, firstborn higher than the kings: one confession that the risen Son is head and pledge of the resurrected, raised above all, *that in all things he might have the preeminence.*',
       sv.verse_id, ev.verse_id, 'free', 7666
  FROM _s232_co01_lookup sv, _s232_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48',
       E'The mystery hid from ages, now made manifest: Messiah in you, the hope of glory among the Gentiles (1 Enoch 48, Ephesians 3)',
       E'Paul names his ministry the unfolding of a long-concealed purpose: *Even the mystery which hath been hid from ages and from generations, but now is made manifest to his saints: To whom Elohim (God) would make known what is the riches of the glory of this mystery among the Gentiles; which is Messiah (Christ) in you, the hope of glory* (Colossians 1:26-27). This is not a new institution replacing Yashar''el (Israel) but the grafted-in nations brought into the one commonwealth — exactly the mystery the twin letter unfolds: what *in other ages was not made known unto the sons of men, as it is now revealed* (Ephesians 3:5), namely *That the Gentiles should be fellowheirs, and of the same body* (Ephesians 3:6). The Hebrew library held the same movement of hidden-then-revealed: the Chosen One *chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6), kept concealed through the ages until *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous... For in his name they are saved* (1 Enoch 48:7). Hidden before the world, then disclosed to the set-apart and bringing salvation in his name — the very shape of Paul''s mystery, now made manifest to the saints: *Messiah (Christ) in you, the hope of glory.*',
       sv.verse_id, ev.verse_id, 'extras', 7669
  FROM _s232_co01_lookup sv, _s232_co01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 6:6 — *I will redeem you with a stretched out arm, and with great judgments* the Exodus deliverance pattern behind *delivered us from the power of darkness... redemption through his blood* (Colossians 1:13-14).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 26:18 — *turn them from darkness to light... forgiveness of sins, and inheritance among them which are sanctified* the risen Messiah''s commission, word for word the deliverance of *the inheritance of the saints in light* (Colossians 1:12-14).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 1:7 — *In whom we have redemption through his blood, the forgiveness of sins* the twin letter''s near-identical confession of *redemption through his blood, even the forgiveness of sins* (Colossians 1:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-inheritance-of-the-saints-in-light-redemption-from-darkness-exodus-6'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the creation-image behind *the image of the invisible Elohim (God)* (Colossians 1:15); the Son the visible likeness of the unseen Father.'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth* the *all things* created BY and FOR the Son (Colossians 1:16); firstborn = agent of creation, not first creature made.'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight* Wisdom the craftsman beside the Father behind *by him all things consist* (Colossians 1:17).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 89:27 — *I will make him my firstborn, higher than the kings of the earth* firstborn = pre-eminent Heir, rank not sequence, behind *the firstborn of every creature* (Colossians 1:15).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 7:26 — *the brightness of the everlasting light... and the image of his goodness* the Formed-witness behind *the image of the invisible Elohim (God)* (Colossians 1:15); radiance OF the unseen One, not a second light.'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 24:9 — *He created me from the beginning before the world* Wisdom brought forth before the ages, behind *he is before all things, and by him all things consist* (Colossians 1:16-17); the Formed, not a second co-equal Elohim.'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made* identical agency to *by him were all things created... by him, and for him* (Colossians 1:16).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Hebrews 1:3 — *the brightness of his glory, and the express image of his person... upholding all things by the word of his power* the radiance and exact likeness OF the Father behind *the image of the invisible Elohim (God)* and *by him all things consist* (Colossians 1:15,17).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Philippians 2:6 — *being in the form of Elohim (God)* the twin hymn: the Son bears the form and image of the Father, who is pleased to set all fulness in him (Colossians 1:15,19).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Revelation 3:14 — *the beginning of the creation of Elohim (God)* the source and head of creation (not its first product) behind *the firstborn of every creature... the beginning* (Colossians 1:15,18).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-image-of-the-invisible-the-firstborn-the-formed-genesis-1-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:20 — *Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* the first sheaf of the resurrection harvest behind *the firstborn from the dead* (Colossians 1:18).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 89:27 — *I will make him my firstborn, higher than the kings of the earth* the firstborn''s rank of highest honour behind *the firstborn from the dead; that in all things he might have the preeminence* (Colossians 1:18).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-firstborn-from-the-dead-the-preeminence-psalm-89-1-corinthians-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 3:5 — *which in other ages was not made known... as it is now revealed* the twin letter''s mystery (the Gentiles fellowheirs, 3:6) behind *the mystery... hid from ages... now is made manifest* (Colossians 1:26).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:6 — *chosen and hidden before Him, Before the creation of the world* the library''s hidden-before-the-world pattern behind *the mystery which hath been hid from ages and from generations* (Colossians 1:26).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:7 — *the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous... For in his name they are saved* the hidden One disclosed to the set-apart behind *now is made manifest to his saints... Messiah (Christ) in you, the hope of glory* (Colossians 1:26-27).'
  FROM cross_reference_threads t, cross_references x, _s232_co01_lookup sv, _s232_co01_lookup tv
 WHERE t.slug='colossians-1-the-mystery-hid-now-manifest-messiah-in-you-among-the-gentiles-1-enoch-48'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_colossians_02.sql (S232 Colossians 2) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 2 (23 verses) — ★★ HIGHEST watchpoint / BLESSING chapter:
--   the handwriting-of-ordinances (2:14) + let-no-man-judge-you / shadow-of-things-to-come (2:16-17),
--   the most-abused supersession proof-text in the NT, read the framework way, NOT the antichrist way.
-- Tag: co02 (temp view _s232_co02_lookup).
-- Sort band: floor 7685, step 3 (7685, 7688, 7691, 7694, 7697, 7700 used; under 7710).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Colossians 2): Paul writes the called-out ones — Israel + the grafted-in nations —
-- against a syncretistic "philosophy" of ascetic rule-keeping, angel-worship, and calendar-policing
-- imposed by MEN (2:8,18,22). 2:9 *all the fulness of the Godhead bodily* = the Formed (twin of 1:19,
-- the Father pleased to set all fulness in the Son); 2:3 *all the treasures of wisdom and knowledge*
-- hidden in him = the pre-existent Wisdom; 2:11 *circumcision made without hands* = the circumcised
-- heart, the Torah's own inward demand (Deut 10:16/30:6, Jer 4:4, Ezek 36:26), NOT its cancellation;
-- 2:12 buried/risen in baptism = Romans 6:4. ★★ 2:14 the *handwriting of ordinances* (the cheirographon,
-- a hand-written CERTIFICATE OF DEBT) *that was against us / contrary to us* blotted out and nailed to
-- the cross = the record of debt / the indictment of guilt CANCELLED (Isaiah 43:25/44:22 *I... blot out
-- thy transgressions*, Ezekiel 18:4; the same act as Ephesians 2:15's dividing decree abolished) —
-- NOT the Torah/feasts abolished. ★★ 2:16-17 *let no MAN judge you* in meat/drink/holyday/new moon/
-- sabbath = let no ascetic-gnostic critic condemn your KEEPING of them; they are *a shadow of things
-- to COME* STILL pointing forward, the body is Messiah's (Lev 23 the feasts of Yahuah, Isaiah 66:23
-- all flesh keeping new-moon-to-new-moon and sabbath-to-sabbath in the age to come, Ezekiel 46:1-3 the
-- restored-temple new moon + sabbath, Hebrews 10:1 the law a shadow of good things to come) — KEPT,
-- NOT abolished. The man-made *touch not; taste not; handle not* of 2:20-22 are NOT the Torah's feasts;
-- they are the *philosophy* of 2:8. No replacement theology, no law-vs-grace antithesis.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the mystery of Elohim, of the Father, and of Messiah; hearts knit in love
--           Tanakh: none warranted (mystery/Messiah-in-you weight carried by ch1 minion at 1:26-27)
--           Extras: none warranted   NT: none warranted (carried in ch1)
--   v.3     in whom are hid all the treasures of wisdom and knowledge
--           Tanakh: Proverbs 2:6 (Yahuah giveth wisdom; out of his mouth cometh knowledge), Isaiah 11:2
--                   (the spirit of wisdom and understanding, of knowledge, rest upon him)
--           Extras: Sirach 24:9 (He created me from the beginning before the world), Sirach 24:23
--                   (Wisdom = the law which Moses commanded — the treasures are NOT against Torah)
--           NT: none warranted (the Christology carried at 2:9 / 1:15-19)
--   v.4-8   beware lest any man spoil you through philosophy / tradition of men / rudiments of world
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (polemic, no quote-root)
--   v.9     in him dwelleth all the fulness of the Godhead bodily [THE FORMED — twin of 1:19]
--           Tanakh: none warranted (the Formed root built in ch1 on Gen 1 / Prov 8 / Ps 89)
--           Extras: none warranted   NT: Colossians 1:15 + 1:19 (the very twin — the Father pleased
--                   to set all fulness in the Formed Son, his visible image)
--   v.10-13 complete in him; circumcision without hands; buried/risen in baptism; quickened, forgiven
--           Tanakh: Deuteronomy 10:16 / 30:6, Jeremiah 4:4, Ezekiel 36:26 (the circumcised heart, v.11)
--           Extras: none warranted   NT: Romans 6:4 (buried with him by baptism, v.12)
--   v.14    ★★ blotting out the handwriting of ordinances... nailing it to his cross [THE DEBT]
--           Tanakh: Isaiah 43:25 / 44:22 (I... blot out thy transgressions), Ezekiel 18:4 (the soul
--                   that sinneth — the debt)
--           Extras: none warranted   NT: Ephesians 2:15 (abolished... the law of commandments contained
--                   in ordinances — the sibling dividing-decree, the enmity, NOT Torah-keeping)
--   v.15    spoiled principalities and powers, triumphing over them
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.16-17 ★★ let no man judge you in meat/drink/holyday/new moon/sabbath; a shadow of things to come
--           Tanakh: Leviticus 23:2 (the feasts of Yahuah, holy convocations — MY feasts), Isaiah 66:23
--                   (from one new moon to another, and from one sabbath to another, all flesh shall
--                   come to worship), Ezekiel 46:1,3 (new moon + sabbath in the restored temple)
--           Extras: none warranted   NT: Hebrews 10:1 (the law having a shadow of good things to come)
--   v.18-23 voluntary humility / worship of angels; touch not taste not handle not; commandments of MEN
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (the man-made
--                   ascetic rules Paul REJECTS, not a Torah-root to weave)
--
-- THREADS (slug -> target libraries):
--   7685 colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24  (Tanakh + Extras)
--   7688 colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1   (NT)
--   7691 colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36  (Tanakh)
--   7694 colossians-2-buried-and-risen-with-him-in-baptism-romans-6   (NT)
--   7697 colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44  (Tanakh + NT)  [★★ BLESSING]
--   7700 colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66  (Tanakh + NT)  [★★ BLESSING]
-- =====================================================================

CREATE TEMP VIEW _s232_co02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24
  ('canon', 'colossians', 2, 3, 'canon', 'proverbs', 2, 6, 'free', E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding.* (Proverbs 2:6). Paul says of Messiah (Christ), *In whom are hid all the treasures of wisdom and knowledge* (Colossians 2:3). The very pair Proverbs names — *wisdom... knowledge and understanding* that proceed from the mouth of Yahuah (LORD) — are the treasures hidden in the Formed Son. The seeker who *criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3) is not sent to the ascetic philosophy of men (Colossians 2:8) but to him in whom the whole store is laid up; the wisdom of Yahuah (LORD) is found in the One who is his image.'),
  ('canon', 'colossians', 2, 3, 'canon', 'isaiah', 11, 2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2). Upon the shoot from the stem of Jesse rests *the spirit of wisdom and understanding... the spirit of knowledge* — the same treasures Paul says are *hid* in him: *In whom are hid all the treasures of wisdom and knowledge* (Colossians 2:3). The wisdom and knowledge the Colossians are warned not to seek in *enticing words* (Colossians 2:4) are gathered in the One on whom the sevenfold Spirit of Yahuah (LORD) rests.'),
  ('canon', 'colossians', 2, 3, 'apocrypha', 'ecclesiasticus', 24, 9, 'extras', E'*He created me from the beginning before the world, and I shall never fail.* (Sirach 24:9). The Hebrew library long held that Wisdom was brought forth *from the beginning before the world* — and Paul says all her *treasures of wisdom and knowledge* are *hid* in Messiah (Christ) (Colossians 2:3). The pre-existent Wisdom of the fathers is not a rival store to be sought in the philosophy of men (Colossians 2:8) but is gathered up in the Formed Son, the image of the invisible Elohim (God); what was *created from the beginning before the world* is laid up in him.'),
  ('canon', 'colossians', 2, 3, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Sirach 24:23). The library names Wisdom''s treasures and then identifies them — *the law which Moses commanded for an heritage to the congregations of Jacob.* So when Paul says *all the treasures of wisdom and knowledge* are *hid* in Messiah (Christ) (Colossians 2:3), the treasures are not set against the Torah but are its very heart; the wisdom hidden in him is the wisdom of the covenant Yahuah (God) gave Jacob. This is the guard the whole chapter needs: the treasures in Messiah and the Instruction of Yahuah (God) are one, not enemies.'),
  -- thread: colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1
  ('canon', 'colossians', 2, 9, 'canon', 'colossians', 1, 19, 'free', E'*For it pleased the Father that in him should all fulness dwell;* (Colossians 1:19). The hymn already said it: the Father was *pleased* that *all fulness* should dwell in the Son. Now Paul says it again of the same Formed One: *For in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9). Mark the grammar of order the two verses keep together — *it pleased the FATHER* that the fulness dwell in him; the Father is the source who gives, the Son the visible image in whom the gift is set. This is the Formed, not a co-equal second person and not a created thing: all the fulness of the Father set to dwell, *bodily,* in the One who is his image.'),
  ('canon', 'colossians', 2, 9, 'canon', 'colossians', 1, 15, 'free', E'*Who is the image of the invisible Elohim (God), the firstborn of every creature:* (Colossians 1:15). The Formed Son is *the image of the invisible Elohim (God)* — the visible likeness of the Father who cannot be seen. So when Paul says *in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9), the *bodily* fulness is the fulness of the invisible Father made visible in his image: to see the Son is to see the Father imaged. The firstborn-Heir through whom all things were made (Colossians 1:16) is the One in whom the Father was pleased to set all his fulness; the *Godhead bodily* is the Formed, not a rival deity beside the Father but the Father''s own fulness dwelling in his Son.'),
  -- thread: colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36
  ('canon', 'colossians', 2, 11, 'canon', 'deuteronomy', 10, 16, 'free', E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked.* (Deuteronomy 10:16). The Torah itself demanded the inward cutting: *Circumcise therefore the foreskin of your heart.* So Paul says the called-out are *circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ)* (Colossians 2:11). This is not the cancellation of the Torah''s command but its fulfilment — the very heart-circumcision Moses commanded, now wrought *without hands* by Messiah (Christ). The Instruction always pointed past the flesh to the heart; Colossians names where that demand is answered.'),
  ('canon', 'colossians', 2, 11, 'canon', 'deuteronomy', 30, 6, 'free', E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* (Deuteronomy 30:6). Moses promised that Yahuah (LORD) himself *will circumcise thine heart... that thou mayest live.* What the Torah promised, Colossians declares done: *the circumcision made without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11). The circumcision *without hands* is precisely the heart-circumcision Yahuah (LORD) said he would perform; the gospel does not abolish Deuteronomy''s word but fulfils it — the heart cut to love Yahuah (LORD) with all the heart and soul.'),
  ('canon', 'colossians', 2, 11, 'canon', 'jeremiah', 4, 4, 'free', E'*Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem: lest my fury come forth like fire...* (Jeremiah 4:4). Jeremiah pressed the same inward demand: *take away the foreskins of your heart.* Paul names where it is accomplished — *circumcised with the circumcision made without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11). The prophets and the Torah alike called for a circumcised heart; the *circumcision made without hands* is not a different requirement but the same one answered in Messiah (Christ), the foreskin of the heart taken away.'),
  ('canon', 'colossians', 2, 11, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). Yahuah (LORD) promised to *take away the stony heart out of your flesh.* Colossians says it is done in the *circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ)* (Colossians 2:11), and goes on, *you, being dead in your sins... hath he quickened together with him* (Colossians 2:13). The new heart of Ezekiel and the heart-circumcision of Messiah are one work: the stony heart cut away, the heart of flesh given — the Torah''s own inward demand fulfilled, not cancelled.'),
  -- thread: colossians-2-buried-and-risen-with-him-in-baptism-romans-6
  ('canon', 'colossians', 2, 12, 'canon', 'romans', 6, 4, 'free', E'*Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life.* (Romans 6:4). Paul writes the same word to Rome that he writes to Colosse: *Buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God), who hath raised him from the dead* (Colossians 2:12). The burial and the rising are one pattern — dead and buried with Messiah (Christ), raised *by the glory of the Father* to *walk in newness of life.* Mark again the order: it is the Father who raised the Son and who raises us with him; the new life is the Father''s operation in the Formed One.'),
  -- thread: colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44  [★★ BLESSING]
  ('canon', 'colossians', 2, 14, 'canon', 'isaiah', 43, 25, 'free', E'*I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins.* (Isaiah 43:25). Yahuah (LORD) is the One who *blotteth out thy transgressions* and *will not remember thy sins* — and Colossians names the cross as where that blotting was done: *Blotting out the handwriting of ordinances that was against us, which was contrary to us, and took it out of the way, nailing it to his cross* (Colossians 2:14). What is *blotted out* is what Isaiah says Yahuah (LORD) blots out: transgressions, sins — the record of guilt *against us.* The hand-written certificate nailed up is the debt of our sins, not the Instruction of Yahuah (LORD); the very same blotting-out Isaiah promised is fulfilled at the cross.'),
  ('canon', 'colossians', 2, 14, 'canon', 'isaiah', 44, 22, 'free', E'*I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee.* (Isaiah 44:22). Again Yahuah (LORD) says *I have blotted out, as a thick cloud, thy transgressions... thy sins.* This is the act Colossians sets at the cross: the *handwriting of ordinances that was against us, which was contrary to us* — the certificate of debt — *blotted out* and *nailed to his cross* (Colossians 2:14). The thing *contrary to us* is the written verdict of guilt our broken commandments held over us, the indictment; it is the debt that is cancelled, *as a thick cloud* blotted out, while the call still stands, *return unto me; for I have redeemed thee.* The Torah is not the enemy nailed up — the record of our debt under it is.'),
  ('canon', 'colossians', 2, 14, 'canon', 'ezekiel', 18, 4, 'free', E'*Behold, all souls are mine; as the soul of the father, so also the soul of the son is mine: the soul that sinneth, it shall die.* (Ezekiel 18:4). Ezekiel states the debt the broken commandment holds: *the soul that sinneth, it shall die.* That is the *handwriting... that was against us, which was contrary to us* (Colossians 2:14) — the written sentence of death our sins incurred, the bond of debt. What Colossians says is *blotted out... and took it out of the way, nailing it to his cross* is this verdict of death against the sinner, paid and cancelled in Messiah (Christ). The decree against the guilty soul is what is removed; the law that named sin as sin remains, but its death-sentence against us is nailed up and discharged.'),
  ('canon', 'colossians', 2, 14, 'canon', 'ephesians', 2, 15, 'free', E'*Having abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make in himself of twain one new man, so making peace;* (Ephesians 2:15). The twin letter speaks the same act: *abolished in his flesh the enmity... the law of commandments contained in ordinances* — the dividing decree, *the middle wall of partition* (Ephesians 2:14) that held the nations off. So the *handwriting of ordinances that was against us, which was contrary to us* (Colossians 2:14) is the same thing abolished: not the Instruction of Yahuah (LORD), but the decree of separation and the bond of debt that stood *against us* and *between us.* Both verses name a barrier and an enmity removed *to make... one new man* — the two houses and the grafted-in nations brought into one body, not the feasts and sabbaths struck down.'),
  -- thread: colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66  [★★ BLESSING]
  ('canon', 'colossians', 2, 16, 'canon', 'leviticus', 23, 2, 'free', E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). Yahuah (LORD) calls the appointed times *the feasts of Yahuah (LORD)... even these are MY feasts* — his own holy convocations, given to Yashar''el (Israel). So when Paul writes *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days* (Colossians 2:16), the warning is not *stop keeping my feasts* — it is *let no man condemn your keeping of them.* These are the feasts Yahuah (LORD) named his own; no ascetic critic of men (Colossians 2:8,18) has standing to judge the called-out for observing what Yahuah (LORD) commanded.'),
  ('canon', 'colossians', 2, 16, 'canon', 'isaiah', 66, 23, 'free', E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* (Isaiah 66:23). Isaiah sets the new moons and sabbaths in the age to come: *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me.* These are the very things Paul says no man may judge — *the new moon, or of the sabbath days* (Colossians 2:16) — *which are a shadow of things to come* (Colossians 2:17). The shadow still points forward because *all flesh* will yet keep new moon and sabbath in worship before Yahuah (LORD); they are not abolished relics but appointed rehearsals still casting their shadow toward the day they are fulfilled. Kept, not struck down.'),
  ('canon', 'colossians', 2, 16, 'canon', 'ezekiel', 46, 1, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD); The gate of the inner court that looketh toward the east shall be shut the six working days; but on the sabbath it shall be opened, and in the day of the new moon it shall be opened.* (Ezekiel 46:1). In Ezekiel''s vision of the restored temple the new moon and the sabbath are kept: the east gate is opened *on the sabbath* and *in the day of the new moon,* and *the people of the land shall worship... before Yahuah (LORD) in the sabbaths and in the new moons* (Ezekiel 46:3). These are the same observances Paul names *a shadow of things to come* (Colossians 2:17) — and the restored temple shows them still kept, still pointing forward. *Let no man therefore judge you... of the new moon, or of the sabbath days* (Colossians 2:16): the things to come are kept, not cancelled, the body of them belonging to Messiah (Christ).'),
  ('canon', 'colossians', 2, 17, 'canon', 'hebrews', 10, 1, 'free', E'*For the law having a shadow of good things to come, and not the very image of the things, can never with those sacrifices which they offered year by year continually make the comers thereunto perfect.* (Hebrews 10:1). Hebrews calls the law *a shadow of good things to come* — exactly Paul''s phrase: the feasts, new moons, and sabbaths *are a shadow of things to come; but the body is of Messiah (Christ)* (Colossians 2:17). A shadow is cast by a real body and traces its shape; it is not nothing, and it still points to what casts it. The appointed times are the shadow whose substance — whose *body* — is Messiah (Christ); they keep pointing to him. The shadow is honored, not discarded, for it shows the form of the good things to come.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24',
       E'In whom are hid all the treasures of wisdom and knowledge (Proverbs 2, Sirach 24)',
       E'Against the *philosophy and vain deceit, after the tradition of men* (Colossians 2:8), Paul sets the place where wisdom is truly stored: *In whom are hid all the treasures of wisdom and knowledge* (Colossians 2:3). The pair he names — wisdom and knowledge — is the gift of Yahuah (LORD): *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6), promised to the one who *criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3). It rests in fulness on the shoot of Jesse: *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding... the spirit of knowledge* (Isaiah 11:2). The Hebrew library long held that this Wisdom was brought forth before the world — *He created me from the beginning before the world, and I shall never fail* (Sirach 24:9) — and then named what her treasures are: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). This is the guard the chapter requires. The treasures hidden in Messiah (Christ) are not a rival store to be sought in the rudiments of men, nor are they set against the Torah; they are the wisdom of the covenant Yahuah (God) gave Jacob, gathered up in the Formed Son who is the image of the invisible Elohim (God). To seek wisdom is to seek him, and in him the Instruction and the treasure are one.',
       sv.verse_id, ev.verse_id, 'extras', 7685
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1',
       E'In him dwelleth all the fulness of the Godhead bodily — the Formed (Colossians 1)',
       E'*For in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9). This is the chapter''s Christology, and it is the twin of the hymn already sung: *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), and *it pleased the Father that in him should all fulness dwell* (Colossians 1:19). Read the two together and the grammar of order is plain: it is *the Father* who is *pleased* that the fulness dwell in the Son — the Father is the source who gives, the Son the visible image in whom the gift is set. The *Godhead bodily* is the fulness of the invisible Father made visible in his image; to see the Son is to see the Father imaged in him. This is the Formed — the Son drawn out of the invisible, Formless Father, in whom the Father set all his fulness to dwell, and dwell *bodily.* It is not a co-equal second person standing beside the Father as a rival deity, and it is not a created thing; the firstborn-Heir through whom all things were made (Colossians 1:16) is the One in whom the Father''s own fulness dwells. So the called-out are *complete in him, which is the head of all principality and power* (Colossians 2:10): full, because the fulness of the Father is in the One who is their head.',
       sv.verse_id, ev.verse_id, 'free', 7688
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36',
       E'Circumcised with the circumcision made without hands — the circumcised heart (Deuteronomy 30, Ezekiel 36)',
       E'*In whom also ye are circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ)* (Colossians 2:11). The *circumcision made without hands* is not the abolition of a commandment but the answer to the Torah''s own deepest demand. Moses commanded it: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16); and he promised Yahuah (LORD) would do it: *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live* (Deuteronomy 30:6). Jeremiah pressed the same word: *Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart* (Jeremiah 4:4); and Ezekiel held the promise: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The Instruction always pointed past the flesh to the heart. So the *circumcision made without hands... by the circumcision of Messiah (Christ)* is precisely the heart-circumcision the Torah commanded and Yahuah (LORD) promised — the stony heart cut away, the heart of flesh given — and with it, *you, being dead in your sins... hath he quickened together with him* (Colossians 2:13). The demand of the Instruction is fulfilled, not cancelled.',
       sv.verse_id, ev.verse_id, 'free', 7691
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-buried-and-risen-with-him-in-baptism-romans-6',
       E'Buried with him in baptism, risen with him (Romans 6)',
       E'*Buried with him in baptism, wherein also ye are risen with him through the faith of the operation of Elohim (God), who hath raised him from the dead* (Colossians 2:12). Paul writes the same word to Colosse that he wrote to Rome: *Therefore we are buried with him by baptism into death: that like as Messiah (Christ) was raised up from the dead by the glory of the Father, even so we also should walk in newness of life* (Romans 6:4). The pattern is one — buried with Messiah (Christ) and raised with him, that the dead-in-sins are *quickened together with him* (Colossians 2:13) and walk in newness of life. And mark the order both verses keep: it is *the operation of Elohim (God), who hath raised him from the dead,* it is *the glory of the Father* that raised the Son and raises us with him. The new life is the Father''s work in the Formed One; the believer''s burial and rising are joined to the Son''s own death and resurrection.',
       sv.verse_id, ev.verse_id, 'free', 7694
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44',
       E'Blotting out the handwriting of ordinances — the debt cancelled, not the Torah (Isaiah 43, 44, Ephesians 2)',
       E'This is the most-abused verse in the supersession argument, and the framework reads it precisely the opposite way the trained reading does. *Blotting out the handwriting of ordinances that was against us, which was contrary to us, and took it out of the way, nailing it to his cross* (Colossians 2:14). The trained reading hears "the law was nailed to the cross and abolished." But the *handwriting* — the hand-written certificate of debt — is named twice as *that was against us, which was contrary to us:* it is the record of guilt, the written verdict our broken commandments held over us, not the Instruction itself. The Instruction is not *against us;* the indictment for breaking it is. And the act of blotting-out is Yahuah (LORD)''s own promised act against sins, not against his Torah: *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25); *I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee* (Isaiah 44:22). What is blotted out is what Isaiah says Yahuah (LORD) blots out — transgressions and sins, the debt. Ezekiel names that debt: *the soul that sinneth, it shall die* (Ezekiel 18:4) — the death-sentence against the guilty soul, paid and discharged at the cross. And the twin letter speaks the very same act with the very same words: *Having abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make in himself of twain one new man, so making peace* (Ephesians 2:15) — the dividing decree, *the middle wall of partition* (Ephesians 2:14), the enmity that held the nations off, abolished to make the two into one new man. So what is *blotted out* and *nailed to his cross* is the certificate of our debt and the decree of separation — the bond against us, the wall between us — not the feasts, not the sabbaths, not the Torah of Yahuah (LORD). The debt is cancelled; the Instruction stands; and the call still sounds, *return unto me; for I have redeemed thee.*',
       sv.verse_id, ev.verse_id, 'free', 7697
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66',
       E'Let no man judge you in the feast, new moon, or sabbath — a shadow still kept (Leviticus 23, Isaiah 66, Ezekiel 46, Hebrews 10)',
       E'The sister-verse to the handwriting, and just as abused: *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days: Which are a shadow of things to come; but the body is of Messiah (Christ)* (Colossians 2:16-17). The trained reading hears "let no one make you keep the feasts and sabbaths — they are abolished shadows." But Paul says *let no MAN judge you* — the warning is against the ascetic-gnostic critic (the *philosophy* of Colossians 2:8, the *voluntary humility and worshipping of angels* of 2:18), not against the observances. He is telling the called-out: do not let any man condemn your KEEPING of them. For these are the appointed times Yahuah (LORD) claimed as his own: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). They are *a shadow of things to come* — present tense, still casting their forward shadow — and a shadow is thrown by a real body and traces its shape; it is not nothing, and it still points to what casts it: *the law having a shadow of good things to come* (Hebrews 10:1). That they are still kept, and kept into the age to come, the prophets declare: *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23); and in the restored temple, *the gate... shall be opened* on *the sabbath* and *in the day of the new moon,* and *the people of the land shall worship... before Yahuah (LORD) in the sabbaths and in the new moons* (Ezekiel 46:1,3). The new moons and sabbaths are not relics struck down at the cross; they are rehearsals still pointing forward, *the body* of them belonging to Messiah (Christ). Kept, not abolished — and no man has standing to judge the keeper.',
       sv.verse_id, ev.verse_id, 'free', 7700
  FROM _s232_co02_lookup sv, _s232_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* the wisdom-and-knowledge pair that proceeds from Yahuah (LORD), the treasures *hid* in Messiah (Christ) (Colossians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:2 — *the spirit of wisdom and understanding... the spirit of knowledge* rests on the shoot of Jesse; the same treasures *hid* in him (Colossians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 24:9 — *He created me from the beginning before the world, and I shall never fail* the pre-existent Wisdom of the fathers, gathered up in the Formed Son in whom her treasures are hid (Colossians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 24:23 — *the law which Moses commanded for an heritage to the congregations of Jacob* the library names Wisdom''s treasures as the Torah itself; the treasures hid in Messiah (Christ) are not against the Instruction but its heart (Colossians 2:3).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-treasures-of-wisdom-and-knowledge-hid-in-him-proverbs-2-sirach-24'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 1:19 — *it pleased the Father that in him should all fulness dwell* the hymn''s twin: the FATHER, the source, pleased to set all fulness in the Son; *in him dwelleth all the fulness of the Godhead bodily* (Colossians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Colossians 1:15 — *the image of the invisible Elohim (God), the firstborn of every creature* the Formed, the visible image of the unseen Father; the *Godhead bodily* is that fulness made visible in his image (Colossians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-all-the-fulness-of-the-godhead-bodily-the-formed-colossians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 10:16 — *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* the Torah''s own inward demand, answered in the *circumcision made without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:6 — *Yahuah Elohayka (the LORD thy God) will circumcise thine heart... that thou mayest live* what the Torah promised Yahuah (LORD) would do, done *without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 4:4 — *take away the foreskins of your heart* the prophet''s same inward demand, accomplished in the *circumcision made without hands* of Messiah (Christ) (Colossians 2:11).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:26 — *I will take away the stony heart out of your flesh, and I will give you an heart of flesh* the new-heart promise; one work with the heart-circumcision *by the circumcision of Messiah (Christ)* (Colossians 2:11), and the dead *quickened together with him* (Colossians 2:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-circumcision-made-without-hands-the-circumcised-heart-deuteronomy-30-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-2-buried-and-risen-with-him-in-baptism-romans-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 6:4 — *buried with him by baptism into death... raised up from the dead by the glory of the Father, even so we also should walk in newness of life* the same burial-and-rising pattern; *buried with him in baptism, wherein also ye are risen with him* (Colossians 2:12).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-buried-and-risen-with-him-in-baptism-romans-6'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:25 — *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* Yahuah (LORD) blots out sins, not his Torah; the cross *blotting out the handwriting... that was against us* — the debt (Colossians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:22 — *I have blotted out, as a thick cloud, thy transgressions, and, as a cloud, thy sins: return unto me; for I have redeemed thee* the very blotting of the debt fulfilled at the cross; the *handwriting... contrary to us* taken out of the way (Colossians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 18:4 — *the soul that sinneth, it shall die* the death-sentence the broken commandment held over us — the *handwriting... that was against us,* paid and discharged at the cross (Colossians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 2:15 — *abolished in his flesh the enmity, even the law of commandments contained in ordinances; for to make... one new man* the twin letter''s sibling act: the dividing decree / wall of partition removed, not the Torah''s feasts; the *handwriting... contrary to us* (Colossians 2:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-the-handwriting-of-ordinances-blotted-out-the-debt-not-the-torah-isaiah-44'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *the feasts of Yahuah (LORD)... even these are my feasts* the appointed times Yahuah (LORD) claims as his own; *let no man therefore judge you... of the new moon, or of the sabbath days* is *let no man condemn your keeping* of them (Colossians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:23 — *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* new moons and sabbaths kept into the age to come; the shadow *of things to come* still pointing forward (Colossians 2:16-17).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 46:1 — *the gate... shall be opened* on *the sabbath* and *in the day of the new moon* the restored temple still keeps new moon and sabbath (with v.3, the people worship in them); the shadow kept, not abolished (Colossians 2:16-17).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 10:1 — *the law having a shadow of good things to come* the same phrase Paul uses; a shadow is cast by a real body and still points to it, the *body* belonging to Messiah (Christ) (Colossians 2:17).'
  FROM cross_reference_threads t, cross_references x, _s232_co02_lookup sv, _s232_co02_lookup tv
 WHERE t.slug='colossians-2-let-no-man-judge-you-the-feasts-a-shadow-still-kept-leviticus-23-isaiah-66'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_colossians_03.sql (S232 Colossians 3) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 3 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 3 (25 verses) — risen with Messiah / things above / put off the old man,
-- put on the new man after the image / the regathered one body / the household order.
-- Tag: co03 (temp view _s232_co03_lookup).
-- Sort band: floor 7710, step 3 (7710, 7713, 7716, 7719, 7722, 7725 used; under 7735).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul charges the called-out ones — Yashar'el (Israel) and the grafted-in seed of
-- the nations — to live the resurrection life. Every "put off / put on" here is the Torah's own
-- inward demand brought to fulness, NOT a law-vs-grace antithesis: *covetousness, which is idolatry*
-- re-speaks the tenth word and the first; the *new man... renewed... after the image of him that
-- created him* is the Genesis-1 image restored and the Ezekiel-36 new heart given; *neither Greek nor
-- Yahudi (Jew)... Messiah is all, and in all* is the ONE regathered body (the two-house ingathering of
-- the Ephesians-2 one new man), NOT the erasure of Yashar'el (Israel); *forgiving one another... even
-- as Messiah forgave you* is Leviticus 19's love-thy-neighbour and the Father's own mercy of Exodus
-- 34; *children, obey your parents... well pleasing unto Yahuah (Lord)* is the fifth word AFFIRMED.
-- The household code 3:18-25 is the twin of Ephesians 5:22-6:9. No replacement theology.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-4   risen with Messiah, seek things above, Messiah on the right hand of Elohim, your life hid
--           Tanakh: Psalm 110:1 (sit thou at my right hand)
--           Extras: none warranted (2 Esdras/2 Baruch world-above not in available editions; not forced)
--           NT: none warranted (the Psalm-110 root is load-bearing; Eph 2:6 carried in prose)
--   v.5-7   mortify your members; covetousness, which is idolatry; the wrath on the children of disobedience
--           Tanakh: Exodus 20:17 / Deuteronomy 5:21 (thou shalt not covet)
--           Extras: none warranted   NT: Ephesians 5:5 (covetous man, who is an idolater) — carried in prose
--   v.8-11  put off the old man, put on the new man renewed after the image; neither Greek nor Yahudi
--           Tanakh: Genesis 1:26-27 (the image), Ezekiel 36:26 (the new heart) [v.9-10];
--                   none warranted for v.11 (the Galatians-3 NT root is the weave)
--           Extras: none warranted   NT: Ephesians 4:22-24 (put off the old man, put on the new) [v.9-10];
--                   Galatians 3:28 (neither Yahudi nor Greek... all one) [v.11]
--   v.12-14 bowels of mercies, kindness, forbearing and forgiving one another, even as Messiah forgave you
--           Tanakh: Exodus 34:6-7 (Yahuah merciful and gracious, forgiving iniquity), Leviticus 19:18
--                   (love thy neighbour, bear no grudge)
--           Extras: Sirach (Ecclesiasticus) 28:2,7 (forgive your neighbour... so shall your sins be forgiven)
--           NT: Matthew 6:14 (if ye forgive men, your Father will forgive you), Matthew 18:35
--                   (forgive every one his brother), Ephesians 4:32 (forgiving one another, as Elohim forgave you)
--   v.15-17 the peace of Elohim rule in your hearts, the word of Messiah dwell in you, psalms and hymns
--           Tanakh: none warranted (no single load-bearing quote; thanksgiving/song is diffuse)
--           Extras: none warranted   NT: Ephesians 5:19-20 (psalms and hymns and spiritual songs) — diffuse twin, not threaded
--   v.18-25 the household order: wives, husbands, children obey your parents, fathers, servants
--           Tanakh: Exodus 20:12 / Deuteronomy 5:16 (honour thy father and mother) [v.20]
--           Extras: none warranted   NT: Ephesians 6:1-3 (children, obey your parents... honour) [v.20];
--                   the wider code Eph 5:22-6:9 is the twin (carried in the v.20 thread's prose)
--
-- THREADS (slug -> target libraries):
--   7710 colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110   (Tanakh)
--   7713 colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5  (Tanakh)
--   7716 colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36  (Tanakh + NT)
--   7719 colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3  (NT)
--   7722 colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19  (Tanakh + Extras + NT)
--   7725 colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s232_co03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110
  ('canon', 'colossians', 3, 1, 'canon', 'psalms', 110, 1, 'free', E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool.* (Psalm 110:1). Paul grounds the resurrection life on David''s enthronement psalm: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1). The *right hand* the called-out ones look up to is the very place Yahuah (LORD) appointed for *my Lord* — the Formed Son seated at the Father''s right hand, given the kingdom until every enemy is made his footstool. To seek the things above is to set the affection where the enthroned Messiah is; the believer''s life is *hid with Messiah (Christ) in Elohim (God)* (Colossians 3:3) precisely because the Messiah reigns at that right hand.'),
  -- thread: colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5
  ('canon', 'colossians', 3, 5, 'canon', 'exodus', 20, 17, 'free', E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s.* (Exodus 20:17). The tenth word forbids the grasping desire of the heart, and Paul names that desire by its true root: *Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry* (Colossians 3:5). To covet is to set the heart on what is the neighbour''s as though it were a god — so the tenth word and the first word are one: covetousness *is idolatry,* the inward breaking of the commandment that draws down *the wrath of Elohim (God)* (Colossians 3:6). Paul does not abolish the word; he uncovers its weight.'),
  ('canon', 'colossians', 3, 5, 'canon', 'deuteronomy', 5, 21, 'free', E'*Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house, his field, or his manservant, or his maidservant, his ox, or his ass, or any thing that is thy neighbour''s.* (Deuteronomy 5:21). Moses repeats the tenth word at the renewal of the covenant: the heart must not *desire* nor *covet* what belongs to another. When Paul calls the called-out ones to mortify *covetousness, which is idolatry* (Colossians 3:5), he is enforcing this very word — the desiring heart is the idol-making heart, the *evil concupiscence* that must be put to death. The same Instruction that named the sin at Horeb names it still in the assembly.'),
  -- thread: colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36
  ('canon', 'colossians', 3, 10, 'canon', 'genesis', 1, 26, 'free', E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26). At creation Elohim (God) formed man *in our image, after our likeness.* The new man Paul puts on is that image restored: *And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10). Salvation is not the making of a different creature but the renewal of the original — the marred image of the Creator brought back to its first design *in knowledge,* the very thing the man lost at the fall now given again.'),
  ('canon', 'colossians', 3, 10, 'canon', 'genesis', 1, 27, 'free', E'*So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* (Genesis 1:27). The creation word repeats it for emphasis — man bears *the image of Elohim (God).* The *new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10) is the recovery of exactly this: *the image of him that created him* is the image of Genesis 1:27, defaced by sin and now renewed in the risen Messiah. The putting on of the new man is the un-doing of the fall, the divine image set right in those who are risen with him.'),
  ('canon', 'colossians', 3, 10, 'canon', 'ezekiel', 36, 26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26). Yahuah (LORD) promised the regathered house of Yashar''el (Israel) a *new heart* and a *new spirit,* the stony heart removed. This is the inward work Paul names *the new man, which is renewed in knowledge* (Colossians 3:10): the renewing is not a human resolve but the covenant gift of Ezekiel — the new heart given, the Spirit put within, so that they walk in his statutes. The old man with his deeds is *put off* (Colossians 3:9) because the stony heart is taken away; the new man is the heart of flesh.'),
  ('canon', 'colossians', 3, 9, 'canon', 'ephesians', 4, 22, 'free', E'*That ye put off concerning the former conversation the old man, which is corrupt according to the deceitful lusts;* (Ephesians 4:22). In the twin letter, written the same hour, Paul speaks the same charge in nearly the same words: *put off... the old man, which is corrupt.* Colossians answers it exactly: *Lie not one to another, seeing that ye have put off the old man with his deeds* (Colossians 3:9). The two letters are one teaching — the old man stripped off like a soiled garment, the deceitful lusts left behind with him.'),
  ('canon', 'colossians', 3, 10, 'canon', 'ephesians', 4, 24, 'free', E'*And that ye put on the new man, which after Elohim (God) is created in righteousness and true holiness.* (Ephesians 4:24). Ephesians names the new man as the one *which after Elohim (God) is created in righteousness and true holiness* — created after Elohim (God) himself. Colossians says the same: *put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10). Both letters root the renewal in the Creator''s own pattern — Genesis 1''s image — so that the new man is the restored likeness of the One who made him, righteousness and true holiness and true knowledge taking the place of the deceitful lusts.'),
  -- thread: colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3
  ('canon', 'colossians', 3, 11, 'canon', 'galatians', 3, 28, 'free', E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus).* (Galatians 3:28). Paul says it twice across the letters: in the new man *there is neither Greek nor Yahudi (Jew), circumcision nor uncircumcision, Barbarian, Scythian, bond nor free: but Messiah (Christ) is all, and in all* (Colossians 3:11). This is not the erasure of Yashar''el (Israel) nor the dissolving of her calling — it is the one regathered body, the grafted-in nations joined to the commonwealth of Yashar''el (Israel), every wall of separation gone so that *Messiah (Christ) is all, and in all.* The distinctions that divided are swallowed up in the one new man, the two houses and the nations made one in him.'),
  -- thread: colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19
  ('canon', 'colossians', 3, 13, 'canon', 'exodus', 34, 6, 'free', E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6). When Yahuah (LORD) proclaimed his own name to Moses, he proclaimed *merciful and gracious, longsuffering* — the very character Paul tells the elect to put on: *bowels of mercies, kindness, humbleness of mind, meekness, longsuffering* (Colossians 3:12). The saints are to wear the mercy of Yahuah (LORD) himself; the *longsuffering* of the assembly is the longsuffering proclaimed at Sinai, the people bearing the likeness of the Elohim (God) who forgives.'),
  ('canon', 'colossians', 3, 13, 'canon', 'exodus', 34, 7, 'free', E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers upon the children, and upon the children''s children, unto the third and to the fourth generation.* (Exodus 34:7). Yahuah (LORD) is the One *forgiving iniquity and transgression and sin.* Paul makes that divine forgiveness the measure of the assembly''s forgiveness: *Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). To forgive *even as Messiah (Christ) forgave you* is to forgive *even as* Yahuah (LORD) himself forgives — the people of the covenant extending the very mercy by which they were kept.'),
  ('canon', 'colossians', 3, 13, 'canon', 'leviticus', 19, 18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* (Leviticus 19:18). The Torah forbids the grudge and commands love of neighbour. Paul''s *Forbearing one another, and forgiving one another, if any man have a quarrel against any* (Colossians 3:13) is this commandment lived in the body: to refuse the grudge, to bear with the brother, to love the neighbour as oneself. *And above all these things put on charity, which is the bond of perfectness* (Colossians 3:14) — the love commanded in Leviticus 19 is the bond that holds the whole renewed life together.'),
  ('canon', 'colossians', 3, 13, 'apocrypha', 'ecclesiasticus', 28, 2, 'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2). The wisdom of the fathers already bound the two together — *forgive your neighbour... so shall your sins also be forgiven.* Paul speaks the same: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The one who has been forgiven cannot withhold forgiveness; the mercy received becomes the mercy given, exactly as Ben Sira taught and as the Father teaches in the gospel.'),
  ('canon', 'colossians', 3, 13, 'apocrypha', 'ecclesiasticus', 28, 7, 'extras', E'*Remember the commandments, and bear no malice to your neighbour: remember the covenant of the Highest, and wink at ignorance.* (Sirach 28:7). Ben Sira ties the forgiving of the neighbour to remembering *the commandments* and *the covenant of the Highest* — to *bear no malice to your neighbour.* So Paul, calling the assembly to put off *malice* (Colossians 3:8) and to be *Forbearing one another, and forgiving one another* (Colossians 3:13), walks the same covenant path: the one who remembers the commandments lets enmity cease and forgives the brother his quarrel.'),
  ('canon', 'colossians', 3, 13, 'canon', 'matthew', 6, 14, 'free', E'*For if ye forgive men their trespasses, your heavenly Father will also forgive you:* (Matthew 6:14). Yahusha (Jesus) taught the disciples that forgiveness given and forgiveness received are bound together: *if ye forgive men their trespasses, your heavenly Father will also forgive you.* Paul makes that same teaching the law of the body: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The standard of the assembly''s forgiveness is the forgiveness it has itself received from the Father through the Messiah.'),
  ('canon', 'colossians', 3, 13, 'canon', 'matthew', 18, 35, 'free', E'*So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses.* (Matthew 18:35). The parable of the unmerciful servant ends with the warning that the one forgiven a vast debt must forgive his fellow: *if ye from your hearts forgive not every one his brother their trespasses.* This is exactly the weight of Paul''s *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13) — the one who has been released from his own debt by the Messiah must release his brother from the quarrel. To withhold forgiveness is to refuse the very mercy by which one stands.'),
  ('canon', 'colossians', 3, 13, 'canon', 'ephesians', 4, 32, 'free', E'*And be ye kind one to another, tenderhearted, forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you.* (Ephesians 4:32). The twin letter gives the same charge in the same shape: *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you.* Colossians answers it: *forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:13). The pattern is fixed — the forgiveness already received is the measure and the motive of the forgiveness now to be given.'),
  -- thread: colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5
  ('canon', 'colossians', 3, 20, 'canon', 'exodus', 20, 12, 'free', E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12). The fifth word commands the child to honour father and mother. Paul does not set it aside but presses it home in the household: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). The obedience that is *well pleasing unto Yahuah (Lord)* is the keeping of the fifth commandment — the Instruction stands in the assembly''s homes, and the child who honours father and mother is doing the very thing Yahuah (LORD) commanded at Sinai.'),
  ('canon', 'colossians', 3, 20, 'canon', 'deuteronomy', 5, 16, 'free', E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Deuteronomy 5:16). Moses repeats the fifth word at the covenant renewal, with its promise *that it may go well with thee.* Paul''s *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20) is this word affirmed and applied; he holds the same commandment over the believing household, the honouring of parents that pleases Yahuah (LORD) and goes well with the obedient child.'),
  ('canon', 'colossians', 3, 20, 'canon', 'ephesians', 6, 1, 'free', E'*Children, obey your parents in Yahuah (Lord): for this is right.* (Ephesians 6:1). The twin letter gives the household charge word for word: *Children, obey your parents in Yahuah (Lord): for this is right* — and adds *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). Colossians says the same: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). Paul reads the fifth commandment as still binding and still promised; the household codes of Ephesians 5:22-6:9 and Colossians 3:18-25 are one teaching, the Torah''s order of the family kept in the assembly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110',
       E'Risen with Messiah, who sitteth on the right hand of Elohim (Psalm 110)',
       E'Paul lifts the eyes of the called-out ones to the enthroned Messiah: *If ye then be risen with Messiah (Christ), seek those things which are above, where Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1). The *right hand* is David''s word: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The Formed Son is seated where the Father appointed him — the place of the reigning King who waits until every enemy is made his footstool. Because the Messiah reigns at that right hand, the life of those risen with him is *hid with Messiah (Christ) in Elohim (God)* (Colossians 3:3), and they *set their affection on things above, not on things on the earth* (Colossians 3:2). The resurrection life is oriented upward to the enthroned Lord; when *Messiah (Christ), who is our life, shall appear, then shall ye also appear with him in glory* (Colossians 3:4). The whole exhortation hangs on the Psalm-110 enthronement: seek what is above because the One you are risen with reigns above.',
       sv.verse_id, ev.verse_id, 'free', 7710
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5',
       E'Covetousness, which is idolatry — the tenth word (Exodus 20, Deuteronomy 5)',
       E'Among the members to be mortified Paul names a sin and unmasks its root: *Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry* (Colossians 3:5). This is the tenth word held up to the light. At Sinai Yahuah (LORD) said, *Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife... nor any thing that is thy neighbour''s* (Exodus 20:17), and at the covenant renewal, *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* (Deuteronomy 5:21). To covet is to set the heart''s worship on what belongs to another — so the tenth word and the first word meet: covetousness *is idolatry,* the inward idol of the grasping heart. Paul does not abolish the commandment; he uncovers how deep it cuts, for it is *for which things'' sake the wrath of Elohim (God) cometh on the children of disobedience* (Colossians 3:6). The Instruction that named the sin at Horeb names it still, and the new man puts it to death.',
       sv.verse_id, ev.verse_id, 'free', 7713
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36',
       E'Put off the old man, put on the new man, renewed after the image (Genesis 1, Ezekiel 36)',
       E'The risen life is a change of garments — the old man stripped off, the new man put on: *Lie not one to another, seeing that ye have put off the old man with his deeds; And have put on the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:9-10). The new man is not a new kind of creature but the original restored: *after the image of him that created him* reaches back to *Let us make man in our image, after our likeness* (Genesis 1:26) and *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27). The image defaced at the fall is renewed *in knowledge* — the very thing lost in Eden given again. And the renewing is not a human resolve but the covenant gift Ezekiel promised the regathered house: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The old man with his deeds is put off because the stony heart is taken away; the new man is the heart of flesh. The twin letter says the same, written the same hour: *put off... the old man, which is corrupt according to the deceitful lusts* (Ephesians 4:22) and *put on the new man, which after Elohim (God) is created in righteousness and true holiness* (Ephesians 4:24). The new man is the Creator''s own image set right in those who are risen with the Messiah — Genesis 1''s likeness recovered, Ezekiel 36''s new heart given.',
       sv.verse_id, ev.verse_id, 'free', 7716
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3',
       E'Neither Greek nor Yahudi (Jew): Messiah is all, and in all — the one body (Galatians 3)',
       E'In the new man the old divisions fall away: *Where there is neither Greek nor Yahudi (Jew), circumcision nor uncircumcision, Barbarian, Scythian, bond nor free: but Messiah (Christ) is all, and in all* (Colossians 3:11). Paul says it again in the same shape to the Galatians: *There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). This is not the erasure of Yashar''el (Israel) nor the cancelling of her calling — it is the one regathered body, the grafted-in seed of the nations joined into the commonwealth of Yashar''el (Israel), every wall of separation thrown down so that *Messiah (Christ) is all, and in all.* The two houses and the nations are made one new man in him; the distinctions that once divided no longer rank or separate, because the Messiah fills all and is in all. The renewed humanity of Colossians 3:10 is a single body, and its only standing is the Messiah himself.',
       sv.verse_id, ev.verse_id, 'free', 7719
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19',
       E'Forgiving one another, even as Messiah forgave you (Exodus 34, Leviticus 19, Sirach 28)',
       E'The garment of the new man is mercy: *Put on therefore, as the elect of Elohim (God), holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering; Forbearing one another, and forgiving one another, if any man have a quarrel against any: even as Messiah (Christ) forgave you, so also do ye* (Colossians 3:12-13). The character the saints put on is the character Yahuah (LORD) proclaimed of himself: *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), the One *forgiving iniquity and transgression and sin* (Exodus 34:7). To forgive *even as Messiah (Christ) forgave you* is to forgive even as Yahuah (LORD) himself forgives. And the Torah already commanded it: *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — so *above all these things put on charity, which is the bond of perfectness* (Colossians 3:14). The fathers'' wisdom taught the same binding of forgiveness given to forgiveness received: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2), and *remember the commandments, and bear no malice to your neighbour* (Sirach 28:7). Yahusha (Jesus) sealed it: *if ye forgive men their trespasses, your heavenly Father will also forgive you* (Matthew 6:14), and the unmerciful servant who would not release his brother''s small debt was himself delivered to the tormentors — *So likewise shall my heavenly Father do also unto you, if ye from your hearts forgive not every one his brother their trespasses* (Matthew 18:35). The twin letter says it once more: *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* (Ephesians 4:32). The whole library holds one law of mercy — the forgiven heart forgives; the one released from his own debt by the Messiah cannot bind his brother in the quarrel.',
       sv.verse_id, ev.verse_id, 'extras', 7722
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5',
       E'Children, obey your parents: the fifth word affirmed (Exodus 20, Deuteronomy 5)',
       E'The household order Paul sets in the assembly is the Torah''s order kept: *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20). The obedience that is *well pleasing unto Yahuah (Lord)* is the keeping of the fifth word: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12), repeated at the covenant renewal, *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee... that it may go well with thee* (Deuteronomy 5:16). Paul does not set the commandment aside; he presses it home — and the twin letter makes the link explicit: *Children, obey your parents in Yahuah (Lord): for this is right. Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:1-2). The household codes of Colossians 3:18-25 and Ephesians 5:22-6:9 are one teaching, the Instruction''s order of wives and husbands, children and fathers, servants and masters kept in the believing home. The child who honours father and mother is doing the very thing Yahuah (LORD) commanded at Sinai, the commandment that still carries its promise.',
       sv.verse_id, ev.verse_id, 'free', 7725
  FROM _s232_co03_lookup sv, _s232_co03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=3 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 110:1 — *Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* the enthronement of the Formed Son; *Messiah (Christ) sitteth on the right hand of Elohim (God)* (Colossians 3:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-risen-with-messiah-seated-on-the-right-hand-of-elohim-psalm-110'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:17 — *Thou shalt not covet thy neighbour''s house... nor any thing that is thy neighbour''s* the tenth word; *covetousness, which is idolatry* (Colossians 3:5), the grasping heart''s idol.'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:21 — *Neither shalt thou desire thy neighbour''s wife, neither shalt thou covet thy neighbour''s house... or any thing that is thy neighbour''s* the tenth word at the covenant renewal; the *evil concupiscence... covetousness, which is idolatry* mortified (Colossians 3:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-covetousness-which-is-idolatry-the-tenth-word-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *Let us make man in our image, after our likeness* the creation image; *the new man, which is renewed in knowledge after the image of him that created him* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:27 — *in the image of Elohim (God) created he him* the image repeated; *after the image of him that created him,* the marred likeness renewed (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you... I will give you an heart of flesh* the covenant gift behind the renewing; *the new man, which is renewed in knowledge* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:22 — *put off... the old man, which is corrupt according to the deceitful lusts* the twin letter''s charge; *ye have put off the old man with his deeds* (Colossians 3:9).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 4:24 — *put on the new man, which after Elohim (God) is created in righteousness and true holiness* the twin letter''s new man; *put on the new man... after the image of him that created him* (Colossians 3:10).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-the-new-man-renewed-after-the-image-of-him-that-created-him-genesis-1-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 3:28 — *There is neither Yahudi (Jew) nor Greek... for ye are all one in HaMashiach Yahusha (Christ Jesus)* the one regathered body, not Yashar''el (Israel) erased; *Messiah (Christ) is all, and in all* (Colossians 3:11).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-neither-greek-nor-yahudi-messiah-is-all-and-in-all-the-one-body-galatians-3'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:6 — *Yahuah (LORD)... merciful and gracious, longsuffering, and abundant in goodness and truth* the character the saints put on; *bowels of mercies, kindness... longsuffering* (Colossians 3:12).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:7 — *forgiving iniquity and transgression and sin* Yahuah (LORD) the forgiver; *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* the Torah''s law of mercy; *Forbearing one another, and forgiving one another* (Colossians 3:13), *charity... the bond of perfectness* (Colossians 3:14).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* the fathers'' wisdom binding forgiveness given to forgiveness received; *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 28:7 — *Remember the commandments, and bear no malice to your neighbour: remember the covenant of the Highest* forgiveness as covenant-keeping; the assembly puts off *malice* (Colossians 3:8) and forgives (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 6:14 — *if ye forgive men their trespasses, your heavenly Father will also forgive you* Yahusha (Jesus) binding the two; the law of the body, *forgiving one another... even as Messiah (Christ) forgave you* (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 18:35 — *if ye from your hearts forgive not every one his brother their trespasses* the unmerciful servant''s warning; the one released from his debt must release his brother''s quarrel (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Ephesians 4:32 — *forgiving one another, even as Elohim (God) for Messiah''s (Christ''s) sake hath forgiven you* the twin letter''s charge; the same pattern, the forgiveness received the measure of forgiveness given (Colossians 3:13).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-forgiving-one-another-even-as-messiah-forgave-you-exodus-34-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land* the fifth word; *Children, obey your parents in all things: for this is well pleasing unto Yahuah (Lord)* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee... that it may go well with thee* the fifth word renewed; the obedience *well pleasing unto Yahuah (Lord)* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:1 — *Children, obey your parents in Yahuah (Lord): for this is right* the twin letter''s household charge, naming it *the first commandment with promise* (Ephesians 6:2); *Children, obey your parents in all things* (Colossians 3:20).'
  FROM cross_reference_threads t, cross_references x, _s232_co03_lookup sv, _s232_co03_lookup tv
 WHERE t.slug='colossians-3-children-obey-your-parents-the-fifth-word-affirmed-exodus-20-deuteronomy-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_colossians_04.sql (S232 Colossians 4) -----
-- =====================================================================
-- S232 minion — COLOSSIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: COLOSSIANS 4 (18 verses) — continue in prayer / walk in wisdom /
--          speech seasoned with salt / the greetings.
-- Tag: co04 (temp view _s232_co04_lookup).
-- Sort band: floor 7735, step 3 (7735, 7738, 7741, 7744 used; under 7760).
-- Source is ALWAYS the canon Colossians verse; targets span Tanakh + NT (no extras warranted here).
-- Tiers per-row: canon target (Tanakh + NT) = 'free'.
--
-- GOVERNING FRAME: Paul closes the letter. The household order of 3:18-25 spills into 4:1 (the
-- master who himself has a Master in heaven), then the practical charges — continue in prayer,
-- walk in wisdom toward them without, speech seasoned with salt — then the salutations. The
-- framework reads the closing charges as the Torah's own ethic carried forward, not a new ethic:
-- the just-and-equal master is the Torah's master who fears Elohim (Leviticus 25:43); the
-- salt-seasoned speech is the salt of the COVENANT (Leviticus 2:13) carried into the mouth.
--
-- ⚑ COLOSSIANS 4:11 TRAP HONORED: *And Yahusha (Jesus), which is called Justus* (4:11) is a MAN'S
--   NAME — "Jesus Justus," one of Paul's fellow-workers of the circumcision — NOT the Messiah. No
--   Messiah/Christ thread is built on 4:11 (same proper-name discipline as the apocrypha
--   "Jesus"=Joshua rule, applied in canon). The greetings 4:7-18 are a salutation list of proper
--   names with no genuine parallels; recorded "none warranted" — no threads forced on them.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     Masters, give your servants that which is just and equal; ye have a Master in heaven
--           Tanakh: Leviticus 25:43 (rule not with rigour, but fear thy Elohim), Deuteronomy 15:14
--                   (furnish him liberally, thou wast a bondman, Yahuah redeemed thee)
--           Extras: none warranted   NT: none warranted (twin Ephesians 6:9 carried in the
--                   3:18-25 household-code thread of ch3, not duplicated here)
--   v.2-4   Continue in prayer, and watch in the same with thanksgiving; pray for an open door
--           Tanakh: none warranted   Extras: none warranted
--           NT: Luke 18:1 (men ought always to pray, and not to faint)
--   v.5     Walk in wisdom toward them that are without, redeeming the time
--           Tanakh: Proverbs 13:20 (he that walketh with wise men shall be wise)
--           Extras: none warranted   NT: Ephesians 5:15-16 (walk circumspectly... as wise,
--                   redeeming the time — the twin letter, near-verbatim)
--   v.6     Let your speech be alway with grace, seasoned with salt
--           Tanakh: Leviticus 2:13 (the salt of the covenant... with all thine offerings offer salt)
--           Extras: none warranted   NT: Mark 9:50 (have salt in yourselves), Matthew 5:13 (ye are
--                   the salt of the earth), Ephesians 4:29 (no corrupt communication... minister grace)
--   v.7-18  the greetings / Tychicus, Onesimus, Aristarchus, Jesus Justus, Epaphras, Luke, the
--           epistle from Laodicea / the salutation by my hand
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--           (proper-name salutation list; ⚑ 4:11 Jesus Justus = a man, NOT the Messiah; 4:16 the
--            lost epistle from Laodicea has no canon parallel)
--
-- THREADS (slug -> target libraries):
--   7735 colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15  (Tanakh)
--   7738 colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18  (NT)
--   7741 colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5  (Tanakh + NT)
--   7744 colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s232_co04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15
  ('canon', 'colossians', 4, 1, 'canon', 'leviticus', 25, 43, 'free', E'*Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God).* (Leviticus 25:43). The Torah binds the master''s hand from the start: he is not to *rule over him with rigour,* and the reason is that he himself stands under One above him — *but shalt fear thy Elohim (God).* Paul speaks the same charge to the Colosse assembly: *Masters, give unto your servants that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1). The just-and-equal dealing Paul commands is not a new ethic but the Torah''s own: the master who himself fears Elohim (God) and answers to a Master above cannot grind those beneath him. The heavenly Master makes every earthly master a servant.'),
  ('canon', 'colossians', 4, 1, 'canon', 'deuteronomy', 15, 14, 'free', E'*Thou shalt furnish him liberally out of thy flock, and out of thy floor, and out of thy winepress: of that wherewith Yahuah Elohayka (the LORD thy God) hath blessed thee thou shalt give unto him.* (Deuteronomy 15:14). When the bondservant goes free, the Torah will not let the master send him empty: he must *furnish him liberally,* for *thou wast a bondman in the land of Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee* (Deuteronomy 15:15). The master gives generously because he was himself a redeemed servant. Paul presses the same root when he tells masters to give *that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1) — the one who was redeemed deals justly with those he holds, because his own Master in heaven redeemed him.'),
  -- thread: colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18
  ('canon', 'colossians', 4, 2, 'canon', 'luke', 18, 1, 'free', E'*And he spake a parable unto them to this end, that men ought always to pray, and not to faint;* (Luke 18:1). Yahusha (Jesus) gave the parable of the persistent widow *to this end, that men ought always to pray, and not to faint.* Paul lays the same charge on the assembly: *Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2). To *continue* and to *watch* is the not-fainting prayer the parable taught — the unwearied, persevering crying-out of the elect who *cry day and night unto him* (Luke 18:7). Paul''s charge is the practice of the Master''s own teaching.'),
  -- thread: colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5
  ('canon', 'colossians', 4, 5, 'canon', 'ephesians', 5, 15, 'free', E'*See then that ye walk circumspectly, not as fools, but as wise,* (Ephesians 5:15). The twin letter, written the same season, carries the same charge nearly word for word: *walk circumspectly, not as fools, but as wise.* Paul writes to Colosse *Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5) — the wise walk before the watching world, the careful conduct toward *them that are without.* The two letters speak with one mouth: the called-out ones are to walk as the wise, not the foolish, ordering their steps before the nations.'),
  ('canon', 'colossians', 4, 5, 'canon', 'ephesians', 5, 16, 'free', E'*Redeeming the time, because the days are evil.* (Ephesians 5:16). The Ephesian charge adds the urgency: *redeeming the time, because the days are evil.* Paul gives the Colossians the very same words — *Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5). To *redeem the time* is to buy back the fleeting opportunity, to spend the evil days wisely toward those still outside. The twin letters set the same clock before both assemblies.'),
  ('canon', 'colossians', 4, 5, 'canon', 'proverbs', 13, 20, 'free', E'*He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20). The wisdom-walk Paul commands is the wisdom-walk of the proverb: *He that walketh with wise men shall be wise.* When Paul says *Walk in wisdom toward them that are without* (Colossians 4:5), the verb is the proverb''s — wisdom is a manner of walking, a daily gait, not a stored opinion. The one whose steps are wise commends the way to those outside; the companion of fools is destroyed.'),
  -- thread: colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9
  ('canon', 'colossians', 4, 6, 'canon', 'leviticus', 2, 13, 'free', E'*And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt.* (Leviticus 2:13). Every offering brought to Yahuah (LORD) had to be salted — *the salt of the covenant of thy Elohim (God)* was never to be lacking. Salt was the sign of the covenant, the preserving bond that does not spoil. Paul carries that altar-salt into the mouth: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). The words of the covenant people are themselves an offering, and they too must bear the salt of the covenant — gracious, preserving, never insipid, fit to be set before Elohim (God).'),
  ('canon', 'colossians', 4, 6, 'canon', 'mark', 9, 50, 'free', E'*Salt is good: but if the salt have lost his saltness, wherewith will ye season it? Have salt in yourselves, and have peace one with another.* (Mark 9:50). Yahusha (Jesus) charged his own: *Have salt in yourselves, and have peace one with another.* The inward salt — the seasoning that does not lose its savour — issues in peace among the brethren. Paul gives the same salt its place at the lips: *Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). The salt the Master told them to keep in themselves is the salt that now seasons their speech, that they may answer every man with grace and not lose their savour.'),
  ('canon', 'colossians', 4, 6, 'canon', 'matthew', 5, 13, 'free', E'*Ye are the salt of the earth: but if the salt have lost his savour, wherewith shall it be salted? it is thenceforth good for nothing, but to be cast out, and to be trodden under foot of men.* (Matthew 5:13). Yahusha (Jesus) named his people *the salt of the earth* — and warned that salt which loses its savour is good for nothing. Paul applies the warning to the tongue: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). The salt that the assembly is to BE among the nations must show in the way it SPEAKS toward *them that are without* (Colossians 4:5) — gracious, savoury speech that has not gone flat, fit to answer every man.'),
  ('canon', 'colossians', 4, 6, 'canon', 'ephesians', 4, 29, 'free', E'*Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers.* (Ephesians 4:29). The twin letter gives the same rule for the tongue from the other side: let *no corrupt communication* go out, but only what is good for edifying, *that it may minister grace unto the hearers.* Paul tells Colosse the same: *Let your speech be alway with grace, seasoned with salt* (Colossians 4:6). Speech that ministers grace and speech seasoned with salt are one charge in the two letters — words that build up, preserve, and bring grace to those who hear, never corrupt, never savourless.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s232_co04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s232_co04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15',
       E'Masters, give that which is just and equal — ye also have a Master in heaven (Leviticus 25, Deuteronomy 15)',
       E'The household order that ran through chapter three spills into its first verse: *Masters, give unto your servants that which is just and equal; knowing that ye also have a Master in heaven* (Colossians 4:1). This is not a new ethic Paul invents but the Torah''s own restraint on the master''s hand. The law that governed Yashar''el (Israel) bound the master from ruling harshly: *Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God)* (Leviticus 25:43) — the reason no master may grind those beneath him is that he himself stands under One above him. And when a bondservant went free, the master could not send him empty: *Thou shalt furnish him liberally out of thy flock, and out of thy floor, and out of thy winepress* (Deuteronomy 15:14), *and thou shalt remember that thou wast a bondman in the land of Egypt, and Yahuah Elohayka (the LORD thy God) redeemed thee* (Deuteronomy 15:15). The master deals justly and generously because he was himself a redeemed servant, and because he answers to a Master above. Paul presses exactly that root: the one who has a *Master in heaven* cannot lord it over the servants in his house. The Torah''s just-and-equal dealing is carried straight into the assembly''s life — every earthly master made a servant by the heavenly One.',
       sv.verse_id, ev.verse_id, 'free', 7735
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18',
       E'Continue in prayer, and watch — men ought always to pray, and not to faint (Luke 18)',
       E'Paul''s first practical charge after the household order is to prayer: *Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2). To *continue* and to *watch* is the unwearied, persevering prayer the Master himself taught. Yahusha (Jesus) *spake a parable unto them to this end, that men ought always to pray, and not to faint* (Luke 18:1) — the parable of the widow who would not stop coming to the unjust judge, and of the Elohim (God) who *shall avenge his own elect, which cry day and night unto him* (Luke 18:7). The persevering crying-out of the elect, day and night, not fainting, is the very thing Paul commands the Colosse assembly to *continue* in. His charge is simply the practice of the Master''s own teaching — prayer that does not give up, kept with watchfulness and thanksgiving.',
       sv.verse_id, ev.verse_id, 'free', 7738
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5',
       E'Walk in wisdom toward them that are without, redeeming the time (Proverbs 13, Ephesians 5)',
       E'*Walk in wisdom toward them that are without, redeeming the time* (Colossians 4:5). The twin letter, written the same season, gives the charge nearly word for word: *See then that ye walk circumspectly, not as fools, but as wise, Redeeming the time, because the days are evil* (Ephesians 5:15-16). The two letters speak with one mouth — the called-out ones are to walk as the wise and not the foolish before the watching nations, buying back the fleeting opportunity while the evil days last. And the wisdom-walk is the proverb''s own: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed* (Proverbs 13:20). Mark the verb the proverb and Paul share — wisdom is a manner of *walking,* a daily gait, not a stored opinion. The one whose steps are wise commends the way to *them that are without;* the companion of fools is destroyed. The Torah''s wisdom and the apostle''s charge are one road.',
       sv.verse_id, ev.verse_id, 'free', 7741
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9',
       E'Let your speech be seasoned with salt — the salt of the covenant (Leviticus 2, Mark 9, Matthew 5)',
       E'*Let your speech be alway with grace, seasoned with salt, that ye may know how ye ought to answer every man* (Colossians 4:6). The salt Paul puts on the tongue is the altar-salt of the Torah. Every offering brought to Yahuah (LORD) had to be salted: *every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). Salt was the sign of the covenant — the preserving bond that does not spoil — and it was never to be lacking from what was set before Elohim (God). Paul carries that covenant-salt into the mouth of the assembly: the words of the covenant people are themselves an offering, and they too must bear the salt of the covenant. Yahusha (Jesus) had charged the same: *Have salt in yourselves, and have peace one with another* (Mark 9:50), and named his people *the salt of the earth* who must not lose their savour (Matthew 5:13). The salt the Master told them to keep in themselves and to be in the earth is the salt that now seasons their speech. And the twin letter says it from the other side: *Let no corrupt communication proceed out of your mouth, but that which is good to the use of edifying, that it may minister grace unto the hearers* (Ephesians 4:29). Gracious, savoury, covenant-salted speech — never corrupt, never gone flat — fit to answer every man and to be set before Elohim (God) as an offering.',
       sv.verse_id, ev.verse_id, 'free', 7744
  FROM _s232_co04_lookup sv, _s232_co04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='colossians' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:43 — *Thou shalt not rule over him with rigour; but shalt fear thy Elohim (God)* the master restrained because he himself answers to One above; Paul''s masters *have a Master in heaven* (Colossians 4:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:14 — *Thou shalt furnish him liberally* the redeemed master gives generously to the freed servant, *for thou wast a bondman... and Yahuah redeemed thee*; the same root as giving *that which is just and equal* (Colossians 4:1).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-masters-give-that-which-is-just-and-equal-ye-have-a-master-in-heaven-leviticus-25-deuteronomy-15'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 18:1 — *men ought always to pray, and not to faint* the Master''s parable of persevering prayer; Paul''s charge to *Continue in prayer, and watch* (Colossians 4:2).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-continue-in-prayer-and-watch-men-ought-always-to-pray-luke-18'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:15 — *walk circumspectly, not as fools, but as wise* the twin letter''s near-verbatim charge; *Walk in wisdom toward them that are without* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:16 — *Redeeming the time, because the days are evil* the twin letter''s same words; *redeeming the time* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise* wisdom as a manner of walking, the proverb''s own verb; *Walk in wisdom toward them that are without* (Colossians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-walk-in-wisdom-toward-them-without-redeeming-the-time-proverbs-13-ephesians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 2:13 — *neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering* the altar-salt of the covenant; carried into the mouth, *speech... seasoned with salt* (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 9:50 — *Have salt in yourselves, and have peace one with another* the inward salt the Master charged; the salt that now seasons their speech (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:13 — *Ye are the salt of the earth: but if the salt have lost his savour* the people who must not go flat; the salt they ARE must show in how they SPEAK (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:29 — *that which is good to the use of edifying, that it may minister grace unto the hearers* the twin letter''s rule for the tongue; *speech... alway with grace, seasoned with salt* (Colossians 4:6).'
  FROM cross_reference_threads t, cross_references x, _s232_co04_lookup sv, _s232_co04_lookup tv
 WHERE t.slug='colossians-4-speech-seasoned-with-salt-the-salt-of-the-covenant-leviticus-2-mark-9'
   AND sv.edition_slug='canon' AND sv.book_slug='colossians' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session232 — Colossians cross-references complete.'
