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
